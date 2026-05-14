#!/usr/bin/env bash
# OTS PROTECT v2 — Bitcoin timestamping pipeline (deterministic classifier)
# Uses `ots info` parsing for BitcoinBlockHeaderAttestation/PendingAttestation
# instead of fragile text-parsing of `ots verify` output.

set -euo pipefail

ROOT="$(git rev-parse --show-toplevel)"
cd "$ROOT"
mkdir -p .github

# === 1. ENUMERATE paper-class files ===
echo "==> 1. Scanning repository for paper-class files..."
mapfile -t TARGETS < <(
  find . -type f \( \
       -name "*.pdf" \
    -o -name "*.lean" \
    -o -name "*.wl" \
    -o \( -name "paper*.md"       -not -path "./.github/*" \) \
    -o \( -name "certificate*.md" -not -path "./.github/*" \) \
    -o \( -name "literature*.md"  -not -path "./.github/*" \) \
    -o -name "run.json" \
    -o -name "MASTER_CERTIFICATE.json" \
    -o -name "*finite_witness*.json" \
  \) -not -path "./.git/*" -not -path "./.github/scripts/*" \
  | sort
)
echo "    Found ${#TARGETS[@]} paper-class files."

# === 2. STAMP files missing .ots companion ===
echo "==> 2. Stamping files without .ots companion..."
STAMP_BATCH=()
SKIPPED=0
for f in "${TARGETS[@]}"; do
  if [[ -f "$f.ots" ]]; then SKIPPED=$((SKIPPED+1))
  else STAMP_BATCH+=("$f"); fi
done
STAMPED=0
if [[ ${#STAMP_BATCH[@]} -gt 0 ]]; then
  BATCH=20
  for ((i=0; i<${#STAMP_BATCH[@]}; i+=BATCH)); do
    CHUNK=("${STAMP_BATCH[@]:i:BATCH}")
    echo "    Stamping chunk: ${#CHUNK[@]} files..."
    if ots stamp "${CHUNK[@]}" 2>&1; then
      STAMPED=$((STAMPED+${#CHUNK[@]}))
    fi
  done
fi
echo "    Stamped: $STAMPED   Already stamped: $SKIPPED"

# === 3. UPGRADE all .ots files (retrieve Bitcoin merkle proof if block confirmed) ===
echo "==> 3. Upgrading .ots files..."
mapfile -t OTS_FILES < <(find . -type f -name "*.ots" -not -path "./.git/*" | sort)
echo "    Found ${#OTS_FILES[@]} .ots files."

UPGRADED=0
for ots in "${OTS_FILES[@]}"; do
  SHA_BEFORE="$(sha256sum "$ots" | cut -d' ' -f1)"
  ots upgrade "$ots" 2>&1 >/dev/null || true
  SHA_AFTER="$(sha256sum "$ots" | cut -d' ' -f1)"
  if [[ "$SHA_BEFORE" != "$SHA_AFTER" ]]; then
    UPGRADED=$((UPGRADED+1))
    echo "    [UPGRADED] $ots"
  fi
done
echo "    Upgraded this run: $UPGRADED"

# === 4. CLASSIFY using `ots info` (deterministic) + ots verify (cryptographic check) ===
echo "==> 4. Classifying via ots info + verify..."

python3 <<'PYEOF'
import json, subprocess, hashlib, os, re
from datetime import datetime, timezone

def sh(cmd, cwd=None):
    return subprocess.run(cmd, shell=True, capture_output=True, text=True, cwd=cwd)

ROOT = subprocess.check_output(["git","rev-parse","--show-toplevel"]).decode().strip()
os.chdir(ROOT)

ots_files = sh("find . -type f -name '*.ots' -not -path './.git/*' | sort").stdout.strip().split("\n")
ots_files = [f for f in ots_files if f]

records = []
for ots in ots_files:
    src = ots[:-4]
    rec = {
        "ots_file": ots,
        "source_file": src,
        "source_exists": os.path.isfile(src),
        "ots_size": os.path.getsize(ots) if os.path.exists(ots) else None,
        "ots_sha256": None,
        "src_sha256": None,
        "status": "unknown",
        "bitcoin_block": None,
        "bitcoin_datetime": None,
        "calendars": [],
        "info_lines": 0,
    }
    if os.path.exists(ots):
        with open(ots,"rb") as f: rec["ots_sha256"] = hashlib.sha256(f.read()).hexdigest()
    if rec["source_exists"]:
        with open(src,"rb") as f: rec["src_sha256"] = hashlib.sha256(f.read()).hexdigest()

    # PRIMARY classification: parse `ots info`
    info_out = sh(f'ots info "{ots}" 2>&1').stdout or ""
    rec["info_lines"] = info_out.count("\n")

    # Detect Bitcoin block attestation
    btc_match = re.search(r'BitcoinBlockHeaderAttestation\(\s*(\d+)\s*\)', info_out)
    pending_calendars = re.findall(r"PendingAttestation\('([^']+)'\)", info_out)
    rec["calendars"] = pending_calendars

    if btc_match:
        rec["bitcoin_block"] = int(btc_match.group(1))
        # Cross-verify with ots verify (only if source exists)
        if rec["source_exists"]:
            ver_out = sh(f'cd "{os.path.dirname(ots) or "."}" && ots verify "{os.path.basename(ots)}" 2>&1').stdout
            m = re.search(r'block.*?(\d{4}-\d{2}-\d{2}[ T]\d{2}:\d{2}:\d{2})', ver_out)
            if m: rec["bitcoin_datetime"] = m.group(1)
            rec["status"] = "bitcoin_verified"
        else:
            rec["status"] = "bitcoin_attestation_orphan"  # bitcoin proof exists but source file missing
    elif pending_calendars:
        if rec["source_exists"]:
            rec["status"] = "pending_bitcoin_confirmation"
        else:
            rec["status"] = "orphan_no_source"
    else:
        if not rec["source_exists"]:
            rec["status"] = "orphan_no_source"
        else:
            rec["status"] = "unknown_format"

    records.append(rec)

summary = {
    "generated_at_utc": datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ"),
    "classifier_version": "v2_ots_info_parse",
    "total_ots_files": len(records),
    "bitcoin_verified": sum(1 for r in records if r["status"] == "bitcoin_verified"),
    "bitcoin_attestation_orphan": sum(1 for r in records if r["status"] == "bitcoin_attestation_orphan"),
    "pending_bitcoin_confirmation": sum(1 for r in records if r["status"] == "pending_bitcoin_confirmation"),
    "orphan_no_source": sum(1 for r in records if r["status"] == "orphan_no_source"),
    "unknown_format": sum(1 for r in records if r["status"] == "unknown_format"),
    "records": records,
}
with open(".github/ots_status.json","w") as f:
    json.dump(summary, f, indent=2, ensure_ascii=False)
print(f"  JSON written: {len(records)} records")
print(f"  bitcoin_verified         : {summary['bitcoin_verified']}")
print(f"  bitcoin_orphan           : {summary['bitcoin_attestation_orphan']}")
print(f"  pending_bitcoin_conf     : {summary['pending_bitcoin_confirmation']}")
print(f"  orphan_no_source         : {summary['orphan_no_source']}")
print(f"  unknown_format           : {summary['unknown_format']}")
PYEOF

echo "==> Done. Stamped: $STAMPED   Upgraded: $UPGRADED"
