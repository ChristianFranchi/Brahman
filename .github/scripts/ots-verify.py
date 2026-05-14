#!/usr/bin/env python3
"""ots-verify.py v2 — Render STATUS_OTS.md from ots_status.json (v2 classifier)."""

import json, os, sys

STATUS_JSON = ".github/ots_status.json"
OUTPUT_MD = "STATUS_OTS.md"

if not os.path.exists(STATUS_JSON):
    print(f"ERROR: {STATUS_JSON} not found.")
    sys.exit(1)

with open(STATUS_JSON) as f:
    s = json.load(f)

status_order = {
    "bitcoin_verified": 0,
    "bitcoin_attestation_orphan": 1,
    "pending_bitcoin_confirmation": 2,
    "orphan_no_source": 3,
    "unknown_format": 4,
    "unknown": 5,
}
status_emoji = {
    "bitcoin_verified": "✅",
    "bitcoin_attestation_orphan": "⚠️",
    "pending_bitcoin_confirmation": "⏳",
    "orphan_no_source": "🗑️",
    "unknown_format": "❌",
    "unknown": "❓",
}
status_label = {
    "bitcoin_verified": "Bitcoin-anchored",
    "bitcoin_attestation_orphan": "Bitcoin attestation, source missing",
    "pending_bitcoin_confirmation": "Pending Bitcoin block",
    "orphan_no_source": "Orphan .ots (no source)",
    "unknown_format": "Unrecognized OTS format",
    "unknown": "Unclassified",
}

records = s.get("records", [])
records.sort(key=lambda r: (status_order.get(r["status"], 99), r["ots_file"]))

L = []
L.append("# 🛡️ OTS Bitcoin Protection — Status Report")
L.append("")
L.append(f"**Generated:** {s.get('generated_at_utc','?')} (UTC) — auto-updated every 6h by `.github/workflows/ots-protect.yml`")
L.append(f"**Classifier:** `{s.get('classifier_version','unknown')}` — deterministic parse of `ots info` output")
L.append("")
L.append("---")
L.append("")
L.append("## Summary")
L.append("")
L.append("| Status | Count | Meaning |")
L.append("|--------|------:|---------|")
L.append(f"| ✅ Bitcoin-anchored                | {s.get('bitcoin_verified',0):>4} | Stamp confirmed in a specific Bitcoin block (cryptographic chain-of-custody proof complete) |")
L.append(f"| ⚠️ Bitcoin attestation, no source  | {s.get('bitcoin_attestation_orphan',0):>4} | .ots is anchored to Bitcoin but companion source file is missing from the repo |")
L.append(f"| ⏳ Pending Bitcoin block           | {s.get('pending_bitcoin_confirmation',0):>4} | Calendar receipt received, awaiting Bitcoin block (~1-6h typical) |")
L.append(f"| 🗑️ Orphan .ots (no source)         | {s.get('orphan_no_source',0):>4} | .ots has no matching source file — schedule deletion or restore source |")
L.append(f"| ❌ Unrecognized format             | {s.get('unknown_format',0):>4} | Stamp file unparseable; restamp required |")
L.append(f"| **Total .ots files**              | **{s.get('total_ots_files',0):>4}** | |")
L.append("")

total = s.get('total_ots_files', 0)
anchored = s.get('bitcoin_verified', 0)
if total > 0 and anchored == total:
    L.append("> **All .ots files are Bitcoin-anchored.** Cryptographic provenance is complete and independently verifiable.")
elif s.get("pending_bitcoin_confirmation", 0) > 0:
    L.append(f"> **{anchored}/{total} Bitcoin-anchored.** The remaining .ots files have valid calendar receipts and will be upgraded automatically by the next 6h cron cycle once the Bitcoin block confirms.")
L.append("")
L.append("---")
L.append("")
L.append("## Detail")
L.append("")
L.append("| Status | File | Source SHA-256 | OTS Size | BTC Block | BTC Time (UTC) | Calendars |")
L.append("|:------:|:-----|:---------------|---------:|:---------:|:----------------|:----------|")

for r in records:
    em = status_emoji.get(r["status"], "❓")
    label = status_label.get(r["status"], r["status"])
    src_sha = (r.get("src_sha256") or "")[:12] + "…" if r.get("src_sha256") else "—"
    ots_size = f"{r.get('ots_size', 0)} B" if r.get("ots_size") else "—"
    block = str(r.get("bitcoin_block")) if r.get("bitcoin_block") else "—"
    bt = r.get("bitcoin_datetime") or "—"
    src_short = r["source_file"].lstrip("./")
    if len(src_short) > 56:
        src_short = "…" + src_short[-54:]
    cals = r.get("calendars") or []
    cal_short = ""
    if cals:
        # Display only the short hostname (e.g. "bob.btc")
        shorts = []
        for c in cals:
            import re
            m = re.search(r'//([^./]+)', c)
            if m: shorts.append(m.group(1))
        cal_short = ", ".join(shorts[:3])
    L.append(f"| {em} {label} | `{src_short}` | `{src_sha}` | {ots_size} | {block} | {bt} | {cal_short} |")

L.append("")
L.append("---")
L.append("")
L.append("## How to verify yourself")
L.append("")
L.append("```bash")
L.append("pip install opentimestamps-client")
L.append('ots verify "path/to/file.pdf.ots"')
L.append("# ✅ output: 'Success! Bitcoin block N attests data existed as of YYYY-MM-DD HH:MM:SS UTC'")
L.append("```")
L.append("")
L.append("**Trust chain:** ots verify checks the .ots against the Bitcoin blockchain directly (no centralized authority required). Trust requires only this repo (.ots + source) + access to any honest Bitcoin node.")
L.append("")
L.append("---")
L.append("")
L.append("**Pipeline:** `.github/workflows/ots-protect.yml` · **Schedule:** `17 */6 * * *` + push triggers + manual  ")
L.append("**License of .ots files:** [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)")
L.append("")

content = "\n".join(L) + "\n"
with open(OUTPUT_MD,"w") as f:
    f.write(content)
print(f"Wrote {OUTPUT_MD}: {len(content)} chars")
