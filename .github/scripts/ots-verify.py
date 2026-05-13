#!/usr/bin/env python3
"""ots-verify.py — Render human-readable STATUS_OTS.md from ots_status.json."""

import json, os, sys
from datetime import datetime

STATUS_JSON = ".github/ots_status.json"
OUTPUT_MD = "STATUS_OTS.md"

if not os.path.exists(STATUS_JSON):
    print(f"ERROR: {STATUS_JSON} not found. Run ots-protect.sh first.")
    sys.exit(1)

with open(STATUS_JSON) as f:
    s = json.load(f)

# Status symbols + ordering
status_order = {
    "bitcoin_verified": 0,
    "pending_bitcoin_confirmation": 1,
    "calendar_receipt_only": 2,
    "verify_failed": 3,
    "orphan_no_source": 4,
    "unknown": 5,
}
status_emoji = {
    "bitcoin_verified": "✅",
    "pending_bitcoin_confirmation": "⏳",
    "calendar_receipt_only": "📨",
    "verify_failed": "⚠️",
    "orphan_no_source": "🗑️",
    "unknown": "❓",
}
status_label = {
    "bitcoin_verified": "Bitcoin-anchored",
    "pending_bitcoin_confirmation": "Pending confirmation",
    "calendar_receipt_only": "Calendar receipt",
    "verify_failed": "Verify failed",
    "orphan_no_source": "Orphan (source deleted)",
    "unknown": "Unknown",
}

records = s.get("records", [])
records.sort(key=lambda r: (status_order.get(r["status"], 99), r["ots_file"]))

lines = []
lines.append("# 🛡️ OTS Bitcoin Protection — Status Report")
lines.append("")
lines.append(f"**Generated:** {s.get('generated_at_utc', '?')} (UTC) — auto-updated every 6h by `.github/workflows/ots-protect.yml`")
lines.append("")
lines.append("---")
lines.append("")
lines.append("## Summary")
lines.append("")
lines.append("| Status | Count |")
lines.append("|--------|------:|")
lines.append(f"| ✅ Bitcoin-anchored          | {s['bitcoin_verified']:>4} |")
lines.append(f"| ⏳ Pending block confirmation | {s['pending_bitcoin_confirmation']:>4} |")
lines.append(f"| 📨 Calendar receipt only      | {s['calendar_receipt_only']:>4} |")
lines.append(f"| ⚠️ Verify failed              | {s['verify_failed']:>4} |")
lines.append(f"| 🗑️ Orphan (source deleted)    | {s['orphan_no_source']:>4} |")
lines.append(f"| **Total .ots files**         | **{s['total_ots_files']:>4}** |")
lines.append("")

if s["bitcoin_verified"] == s["total_ots_files"] and s["total_ots_files"] > 0:
    lines.append("> **All .ots files are Bitcoin-anchored.** Cryptographic provenance is complete.")
elif s["pending_bitcoin_confirmation"] > 0 or s["calendar_receipt_only"] > 0:
    lines.append("> **Some .ots files await Bitcoin block confirmation.** This is normal for stamps created within the last 1–6 hours. The next scheduled run will retry the upgrade.")
lines.append("")
lines.append("---")
lines.append("")
lines.append("## Detail")
lines.append("")
lines.append("| Status | File | Source SHA-256 | OTS Size | Bitcoin Block | Bitcoin Time (UTC) |")
lines.append("|:------:|:-----|:---------------|---------:|--------------:|:--------------------|")

for r in records:
    em = status_emoji.get(r["status"], "❓")
    label = status_label.get(r["status"], r["status"])
    src = r["source_file"]
    src_sha = (r.get("src_sha256") or "")[:12] + "…" if r.get("src_sha256") else "—"
    ots_size = f"{r.get('ots_size', 0)} B" if r.get("ots_size") else "—"
    block = str(r.get("bitcoin_block", "—"))
    bt = r.get("bitcoin_datetime", "—")
    # Shorten path for readability
    src_short = src.lstrip("./")
    if len(src_short) > 60:
        src_short = "…" + src_short[-58:]
    lines.append(f"| {em} {label} | `{src_short}` | `{src_sha}` | {ots_size} | {block} | {bt} |")

lines.append("")
lines.append("---")
lines.append("")
lines.append("## How to verify yourself")
lines.append("")
lines.append("```bash")
lines.append("# Install OpenTimestamps client (one-time)")
lines.append("pip install opentimestamps-client")
lines.append("")
lines.append("# Verify any single file against its .ots proof")
lines.append('ots verify "path/to/file.pdf.ots"')
lines.append("")
lines.append("# Output for a Bitcoin-anchored file (✅):")
lines.append("#   Success! Bitcoin block 893421 attests data existed as of 2026-05-13 22:02:00 UTC")
lines.append("```")
lines.append("")
lines.append("**Verification trust chain:**  ")
lines.append("Your local `ots verify` checks the .ots proof against the Bitcoin blockchain headers directly (via electrumx-style lite client included in opentimestamps-client). Trust requires only:")
lines.append("- a copy of the .ots file from this repo, AND")
lines.append("- a copy of the original file from this repo, AND")
lines.append("- access to any honest Bitcoin node.")
lines.append("")
lines.append("No trust in Zenodo, GitHub, this repository owner, or any centralized authority is required to verify that the source file existed at or before the claimed Bitcoin block timestamp.")
lines.append("")
lines.append("---")
lines.append("")
lines.append("**Pipeline:** `.github/workflows/ots-protect.yml` → `.github/scripts/ots-protect.sh` → `.github/scripts/ots-verify.py`  ")
lines.append("**Schedule:** every 6h (cron `17 */6 * * *`) + on push of paper-class files + manual trigger  ")
lines.append("**License of .ots files:** [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) (cryptographic proofs)  ")
lines.append("")

content = "\n".join(lines) + "\n"
with open(OUTPUT_MD,"w") as f:
    f.write(content)
print(f"Wrote {OUTPUT_MD}: {len(content)} chars")
