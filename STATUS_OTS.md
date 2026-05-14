# 🛡️ OTS Bitcoin Protection — Status Report

**Generated:** 2026-05-14T04:14:10Z (UTC) — auto-updated every 6h by `.github/workflows/ots-protect.yml`

---

## Summary

| Status | Count |
|--------|------:|
| ✅ Bitcoin-anchored          |    0 |
| ⏳ Pending block confirmation |    0 |
| 📨 Calendar receipt only      |    0 |
| ⚠️ Verify failed              |   26 |
| 🗑️ Orphan (source deleted)    |    1 |
| **Total .ots files**         | **  27** |


---

## Detail

| Status | File | Source SHA-256 | OTS Size | Bitcoin Block | Bitcoin Time (UTC) |
|:------:|:-----|:---------------|---------:|--------------:|:--------------------|
| ⚠️ Verify failed | `Electrons/Dark_Energy/DarkEnergy_v916_Cert.lean` | `bbc597708acd…` | 2774 B | — | — |
| ⚠️ Verify failed | `Electrons/Dark_Energy/DarkEnergy_v916_Numerical.wl` | `014c43dd07a3…` | 2774 B | — | — |
| ⚠️ Verify failed | `Electrons/Dark_Energy/v9.1.7.pdf` | `ec269ec88a76…` | 3810 B | — | — |
| ⚠️ Verify failed | `Electrons/Majorana/majorana_v6.1-FINAL.pdf` | `94f539c49b4e…` | 2774 B | — | — |
| ⚠️ Verify failed | `Mathematics/Grothendieck-Defect/paper.md` | `e93f70926aff…` | 2774 B | — | — |
| ⚠️ Verify failed | `Mathematics/Grothendieck-Defect/paper.pdf` | `821d860519f7…` | 2774 B | — | — |
| ⚠️ Verify failed | `…uivalence/certificate | Bell-Godel Lean4 verification.lean` | `454f6d6be22e…` | 2774 B | — | — |
| ⚠️ Verify failed | `…uivalence/certificate | Bell-Godel Wolfram verification.wl` | `dc368869991d…` | 2774 B | — | — |
| ⚠️ Verify failed | `Mathematics/RH=Riemann_Hypothesis/169_HR_RH_v6.5.pdf` | `3dba135a902d…` | 4987 B | — | — |
| ⚠️ Verify failed | `Mathematics/RH=Riemann_Hypothesis/wolfram_verification.wl` | `ffc89d9e53cc…` | 2774 B | — | — |
| ⚠️ Verify failed | `Muons/Grothendieck-Defect/paper.md` | `e93f70926aff…` | 2774 B | — | — |
| ⚠️ Verify failed | `Muons/Grothendieck-Defect/paper.pdf` | `821d860519f7…` | 2774 B | — | — |
| ⚠️ Verify failed | `Muons/Gödel-Bell_equivalence/MASTER_CERTIFICATE.json` | `a1712f5d75bc…` | 2774 B | — | — |
| ⚠️ Verify failed | `Muons/Gödel-Bell_equivalence/Verify.lean` | `ddfe0aecca69…` | 2774 B | — | — |
| ⚠️ Verify failed | `…uivalence/certificate | Bell-Godel Lean4 verification.lean` | `454f6d6be22e…` | 2774 B | — | — |
| ⚠️ Verify failed | `…uivalence/certificate | Bell-Godel Wolfram verification.wl` | `dc368869991d…` | 2774 B | — | — |
| ⚠️ Verify failed | `…uivalence/certificate | ConjD Lean4 atomic resolution.lean` | `b8f97eb425b2…` | 2774 B | — | — |
| ⚠️ Verify failed | `…uivalence/certificate | ConjE Lean4 atomic resolution.lean` | `716045cc75fc…` | 2774 B | — | — |
| ⚠️ Verify failed | `…quivalence/certificate | Section 10 Wolfram Mathematica.wl` | `ef852516b735…` | 2704 B | — | — |
| ⚠️ Verify failed | `…l_equivalence/literature | ConjD deep search compendium.md` | `f8b4d0653c49…` | 2704 B | — | — |
| ⚠️ Verify failed | `…l_equivalence/literature | ConjE deep search compendium.md` | `b34b073b234c…` | 2704 B | — | — |
| ⚠️ Verify failed | `Muons/Gödel-Bell_equivalence/paper | Godel Bell KS v5.3.md` | `b81737f0c71e…` | 2704 B | — | — |
| ⚠️ Verify failed | `…el-Bell_equivalence/python_finite_witness_certificate.json` | `6ad7a77e6a56…` | 2459 B | — | — |
| ⚠️ Verify failed | `Muons/Gödel-Bell_equivalence/run.json` | `d027008d8ed2…` | 2459 B | — | — |
| ⚠️ Verify failed | `Muons/RH=Riemann_Hypothesis/169_HR_RH_v6.5.pdf` | `3dba135a902d…` | 4987 B | — | — |
| ⚠️ Verify failed | `Muons/RH=Riemann_Hypothesis/wolfram_verification.wl` | `ffc89d9e53cc…` | 2424 B | — | — |
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

