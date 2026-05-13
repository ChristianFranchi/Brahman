# 🛡️ OTS Bitcoin Protection — Status Report

**Generated:** 2026-05-13T23:40:11Z (UTC) — auto-updated every 6h by `.github/workflows/ots-protect.yml`

---

## Summary

| Status | Count |
|--------|------:|
| ✅ Bitcoin-anchored          |    0 |
| ⏳ Pending block confirmation |   23 |
| 📨 Calendar receipt only      |    0 |
| ⚠️ Verify failed              |    3 |
| 🗑️ Orphan (source deleted)    |    1 |
| **Total .ots files**         | **  27** |

> **Some .ots files await Bitcoin block confirmation.** This is normal for stamps created within the last 1–6 hours. The next scheduled run will retry the upgrade.

---

## Detail

| Status | File | Source SHA-256 | OTS Size | Bitcoin Block | Bitcoin Time (UTC) |
|:------:|:-----|:---------------|---------:|--------------:|:--------------------|
| ⏳ Pending confirmation | `Electrons/Dark_Energy/DarkEnergy_v916_Cert.lean` | `bbc597708acd…` | 945 B | — | — |
| ⏳ Pending confirmation | `Electrons/Dark_Energy/DarkEnergy_v916_Numerical.wl` | `014c43dd07a3…` | 945 B | — | — |
| ⏳ Pending confirmation | `Electrons/Majorana/majorana_v6.1-FINAL.pdf` | `94f539c49b4e…` | 945 B | — | — |
| ⏳ Pending confirmation | `Mathematics/Grothendieck-Defect/paper.md` | `e93f70926aff…` | 945 B | — | — |
| ⏳ Pending confirmation | `Mathematics/Grothendieck-Defect/paper.pdf` | `821d860519f7…` | 945 B | — | — |
| ⏳ Pending confirmation | `…uivalence/certificate | Bell-Godel Lean4 verification.lean` | `454f6d6be22e…` | 945 B | — | — |
| ⏳ Pending confirmation | `…uivalence/certificate | Bell-Godel Wolfram verification.wl` | `dc368869991d…` | 945 B | — | — |
| ⏳ Pending confirmation | `Mathematics/RH=Riemann_Hypothesis/wolfram_verification.wl` | `ffc89d9e53cc…` | 945 B | — | — |
| ⏳ Pending confirmation | `Muons/Grothendieck-Defect/paper.md` | `e93f70926aff…` | 945 B | — | — |
| ⏳ Pending confirmation | `Muons/Grothendieck-Defect/paper.pdf` | `821d860519f7…` | 945 B | — | — |
| ⏳ Pending confirmation | `Muons/Gödel-Bell_equivalence/MASTER_CERTIFICATE.json` | `a1712f5d75bc…` | 945 B | — | — |
| ⏳ Pending confirmation | `Muons/Gödel-Bell_equivalence/Verify.lean` | `ddfe0aecca69…` | 945 B | — | — |
| ⏳ Pending confirmation | `…uivalence/certificate | Bell-Godel Lean4 verification.lean` | `454f6d6be22e…` | 945 B | — | — |
| ⏳ Pending confirmation | `…uivalence/certificate | Bell-Godel Wolfram verification.wl` | `dc368869991d…` | 945 B | — | — |
| ⏳ Pending confirmation | `…uivalence/certificate | ConjD Lean4 atomic resolution.lean` | `b8f97eb425b2…` | 945 B | — | — |
| ⏳ Pending confirmation | `…uivalence/certificate | ConjE Lean4 atomic resolution.lean` | `716045cc75fc…` | 945 B | — | — |
| ⏳ Pending confirmation | `…quivalence/certificate | Section 10 Wolfram Mathematica.wl` | `ef852516b735…` | 875 B | — | — |
| ⏳ Pending confirmation | `…l_equivalence/literature | ConjD deep search compendium.md` | `f8b4d0653c49…` | 875 B | — | — |
| ⏳ Pending confirmation | `…l_equivalence/literature | ConjE deep search compendium.md` | `b34b073b234c…` | 875 B | — | — |
| ⏳ Pending confirmation | `Muons/Gödel-Bell_equivalence/paper | Godel Bell KS v5.3.md` | `b81737f0c71e…` | 875 B | — | — |
| ⏳ Pending confirmation | `…el-Bell_equivalence/python_finite_witness_certificate.json` | `6ad7a77e6a56…` | 630 B | — | — |
| ⏳ Pending confirmation | `Muons/Gödel-Bell_equivalence/run.json` | `d027008d8ed2…` | 630 B | — | — |
| ⏳ Pending confirmation | `Muons/RH=Riemann_Hypothesis/wolfram_verification.wl` | `ffc89d9e53cc…` | 595 B | — | — |
| ⚠️ Verify failed | `Electrons/Dark_Energy/v9.1.7.pdf` | `ec269ec88a76…` | 3810 B | — | — |
| ⚠️ Verify failed | `Mathematics/RH=Riemann_Hypothesis/169_HR_RH_v6.5.pdf` | `3dba135a902d…` | 4987 B | — | — |
| ⚠️ Verify failed | `Muons/RH=Riemann_Hypothesis/169_HR_RH_v6.5.pdf` | `3dba135a902d…` | 4987 B | — | — |
| 🗑️ Orphan (source deleted) | `Electrons/Majorana/majorana_v6_1-FINAL.pdf` | `—` | 3880 B | — | — |

---

## How to verify yourself

```bash
# Install OpenTimestamps client (one-time)
pip install opentimestamps-client

# Verify any single file against its .ots proof
ots verify "path/to/file.pdf.ots"

# Output for a Bitcoin-anchored file (✅):
#   Success! Bitcoin block 893421 attests data existed as of 2026-05-13 22:02:00 UTC
```

**Verification trust chain:**  
Your local `ots verify` checks the .ots proof against the Bitcoin blockchain headers directly (via electrumx-style lite client included in opentimestamps-client). Trust requires only:
- a copy of the .ots file from this repo, AND
- a copy of the original file from this repo, AND
- access to any honest Bitcoin node.

No trust in Zenodo, GitHub, this repository owner, or any centralized authority is required to verify that the source file existed at or before the claimed Bitcoin block timestamp.

---

**Pipeline:** `.github/workflows/ots-protect.yml` → `.github/scripts/ots-protect.sh` → `.github/scripts/ots-verify.py`  
**Schedule:** every 6h (cron `17 */6 * * *`) + on push of paper-class files + manual trigger  
**License of .ots files:** [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) (cryptographic proofs)  

