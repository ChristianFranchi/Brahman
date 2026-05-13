#!/usr/bin/env bash
# OTS PROTECT — Bitcoin timestamping pipeline (deterministic, idempotent)
# Scans repo, stamps missing files (retroactive), upgrades existing .ots.
# Output: .github/ots_status.json (consumed by ots-verify.py)

set -euo pipefail

ROOT="$(git rev-parse --show-toplevel)"
cd "$ROOT"

STATUS_JSON=".github/ots_status.json"
TMP_LOG="$(mktemp)"
mkdir -p .github

# === 1. ENUMERATE paper-class files (retroactive — works for ALL papers in repo) ===
echo "==> 1. Scanning repository for paper-class files..."

# Find paper-class files by pattern
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

STAMPED=0
SKIPPED=0
STAMP_BATCH=()
for f in "${TARGETS[@]}"; do
  if [[ -f "$f.ots" ]]; then
    SKIPPED=$((SKIPPED+1))
  else
    STAMP_BATCH+=("$f")
  fi
done

if [[ ${#STAMP_BATCH[@]} -gt 0 ]]; then
  # ots stamp accepts multiple files in one call (saves 1 calendar round-trip each)
  # Batch in groups of 20 to avoid command-line length limits
  BATCH=20
  for ((i=0; i<${#STAMP_BATCH[@]}; i+=BATCH)); do
    CHUNK=("${STAMP_BATCH[@]:i:BATCH}")
    echo "    Stamping chunk: ${#CHUNK[@]} files..."
    if ots stamp "${CHUNK[@]}" 2>&1 | tee -a "$TMP_LOG"; then
      STAMPED=$((STAMPED+${#CHUNK[@]}))
    fi
  done
fi
echo "    Stamped: $STAMPED   Already stamped: $SKIPPED"

# === 3. UPGRADE all existing .ots files (Bitcoin block confirmation, 1-6h after stamp) ===
echo "==> 3. Upgrading existing .ots files (Bitcoin merkle proof retrieval)..."

mapfile -t OTS_FILES < <(find . -type f -name "*.ots" -not -path "./.git/*" | sort)
echo "    Found ${#OTS_FILES[@]} .ots files."

UPGRADED=0
PENDING=0
ALREADY=0
ERRORS=0

for ots in "${OTS_FILES[@]}"; do
  # Capture state before upgrade (sha + size)
  SHA_BEFORE="$(sha256sum "$ots" | cut -d' ' -f1)"
  SIZE_BEFORE="$(wc -c < "$ots")"

  # Run upgrade (non-fatal on failure)
  OUTPUT="$(ots upgrade "$ots" 2>&1 || true)"
  echo "$OUTPUT" >> "$TMP_LOG"

  SHA_AFTER="$(sha256sum "$ots" | cut -d' ' -f1)"
  SIZE_AFTER="$(wc -c < "$ots")"

  if [[ "$OUTPUT" == *"Success"* ]] || [[ "$SHA_BEFORE" != "$SHA_AFTER" ]]; then
    UPGRADED=$((UPGRADED+1))
    echo "    [UPGRADED] $ots  ($SIZE_BEFORE → $SIZE_AFTER B)"
  elif [[ "$OUTPUT" == *"Pending"* ]] || [[ "$OUTPUT" == *"pending"* ]] || [[ "$OUTPUT" == *"not enough confirmations"* ]]; then
    PENDING=$((PENDING+1))
  elif [[ "$OUTPUT" == *"Timestamp is complete"* ]] || [[ "$OUTPUT" == *"already complete"* ]]; then
    ALREADY=$((ALREADY+1))
  else
    ERRORS=$((ERRORS+1))
  fi
done

echo "    Upgrade results: upgraded=$UPGRADED  pending=$PENDING  already-complete=$ALREADY  errors=$ERRORS"

# === 4. WRITE machine-readable status JSON ===
echo "==> 4. Writing .github/ots_status.json..."

python3 <<PYEOF
import json, subprocess, hashlib, os, re
from datetime import datetime, timezone

def sh(cmd):
    return subprocess.run(cmd, shell=True, capture_output=True, text=True)

ROOT = subprocess.check_output(["git","rev-parse","--show-toplevel"]).decode().strip()
os.chdir(ROOT)

ots_files = sh("find . -type f -name '*.ots' -not -path './.git/*' | sort").stdout.strip().split("\n")
ots_files = [f for f in ots_files if f]

records = []
for ots in ots_files:
    src = ots[:-4]  # strip .ots
    rec = {
        "ots_file": ots,
        "source_file": src,
        "source_exists": os.path.isfile(src),
        "ots_size": os.path.getsize(ots) if os.path.exists(ots) else None,
        "ots_sha256": None,
        "src_sha256": None,
        "status": "unknown",
        "verify_output": "",
    }
    if os.path.exists(ots):
        with open(ots,"rb") as f: rec["ots_sha256"] = hashlib.sha256(f.read()).hexdigest()
    if rec["source_exists"]:
        with open(src,"rb") as f: rec["src_sha256"] = hashlib.sha256(f.read()).hexdigest()
        # Run verify
        out = sh(f'ots verify "{ots}" 2>&1')
        verify_text = (out.stdout or "") + (out.stderr or "")
        rec["verify_output"] = verify_text.strip()[:1500]
        low = verify_text.lower()
        if "success" in low and "bitcoin" in low:
            rec["status"] = "bitcoin_verified"
            # Extract block + datetime
            m = re.search(r'block (\d+).*?(\d{4}-\d{2}-\d{2}[T ]\d{2}:\d{2}:\d{2})', verify_text, re.S)
            if m:
                rec["bitcoin_block"] = int(m.group(1))
                rec["bitcoin_datetime"] = m.group(2)
        elif "pending" in low or "not enough confirmations" in low or "no attestation" in low:
            rec["status"] = "pending_bitcoin_confirmation"
        elif "calendar" in low:
            rec["status"] = "calendar_receipt_only"
        else:
            rec["status"] = "verify_failed"
    else:
        rec["status"] = "orphan_no_source"
    records.append(rec)

summary = {
    "generated_at_utc": datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ"),
    "total_ots_files": len(records),
    "bitcoin_verified": sum(1 for r in records if r["status"] == "bitcoin_verified"),
    "pending_bitcoin_confirmation": sum(1 for r in records if r["status"] == "pending_bitcoin_confirmation"),
    "calendar_receipt_only": sum(1 for r in records if r["status"] == "calendar_receipt_only"),
    "orphan_no_source": sum(1 for r in records if r["status"] == "orphan_no_source"),
    "verify_failed": sum(1 for r in records if r["status"] == "verify_failed"),
    "records": records,
}
with open(".github/ots_status.json","w") as f:
    json.dump(summary, f, indent=2, ensure_ascii=False)
print(f"  JSON written: {len(records)} records")
print(f"  Bitcoin-verified: {summary['bitcoin_verified']}")
print(f"  Pending: {summary['pending_bitcoin_confirmation']}")
print(f"  Calendar-only: {summary['calendar_receipt_only']}")
print(f"  Orphan: {summary['orphan_no_source']}")
PYEOF

# === 5. SUMMARY ===
echo "==> Pipeline complete."
echo "    Stamped this run: $STAMPED"
echo "    Upgraded this run: $UPGRADED"
echo "    Status JSON: .github/ots_status.json"
echo "    Log: $TMP_LOG"
