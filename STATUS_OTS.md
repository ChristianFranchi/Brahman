# 🛡️ OTS Bitcoin Protection — Status Report

**Generated:** 2026-06-23T10:03:51Z (UTC) — auto-updated every 6h by `.github/workflows/ots-protect.yml`
**Classifier:** `v2_ots_info_parse` — deterministic parse of `ots info` output

---

## Summary

| Status | Count | Meaning |
|--------|------:|---------|
| ✅ Bitcoin-anchored                |   26 | Stamp confirmed in a specific Bitcoin block (cryptographic chain-of-custody proof complete) |
| ⚠️ Bitcoin attestation, no source  |    0 | .ots is anchored to Bitcoin but companion source file is missing from the repo |
| ⏳ Pending Bitcoin block           |    0 | Calendar receipt received, awaiting Bitcoin block (~1-6h typical) |
| 🗑️ Orphan .ots (no source)         |    0 | .ots has no matching source file — schedule deletion or restore source |
| ❌ Unrecognized format             |    0 | Stamp file unparseable; restamp required |
| **Total .ots files**              | **  26** | |

> **All .ots files are Bitcoin-anchored.** Cryptographic provenance is complete and independently verifiable.

---

## Detail

| Status | File | Source SHA-256 | OTS Size | BTC Block | BTC Time (UTC) | Calendars |
|:------:|:-----|:---------------|---------:|:---------:|:----------------|:----------|
| ✅ Bitcoin-anchored | `Electrons/Dark_Energy/DarkEnergy_v916_Cert.lean` | `bbc597708acd…` | 2774 B | 949283 | — | btc, alice, finney |
| ✅ Bitcoin-anchored | `Electrons/Dark_Energy/DarkEnergy_v916_Numerical.wl` | `014c43dd07a3…` | 2774 B | 949283 | — | btc, alice, finney |
| ✅ Bitcoin-anchored | `Electrons/Dark_Energy/v9.1.7.pdf` | `ec269ec88a76…` | 3810 B | 948703 | — | bob, btc, finney |
| ✅ Bitcoin-anchored | `Electrons/Majorana/majorana_v6.1-FINAL.pdf` | `94f539c49b4e…` | 3880 B | 945793 | — | finney, bob, alice |
| ✅ Bitcoin-anchored | `Mathematics/Grothendieck-Defect/paper.md` | `e93f70926aff…` | 2774 B | 949283 | — | btc, alice, finney |
| ✅ Bitcoin-anchored | `Mathematics/Grothendieck-Defect/paper.pdf` | `821d860519f7…` | 2774 B | 949283 | — | btc, alice, finney |
| ✅ Bitcoin-anchored | `…lence/certificate | Bell-Godel Lean4 verification.lean` | `454f6d6be22e…` | 2774 B | 949283 | — | btc, alice, finney |
| ✅ Bitcoin-anchored | `…lence/certificate | Bell-Godel Wolfram verification.wl` | `dc368869991d…` | 2774 B | 949283 | — | btc, alice, finney |
| ✅ Bitcoin-anchored | `Mathematics/RH=Riemann_Hypothesis/169_HR_RH_v6.5.pdf` | `3dba135a902d…` | 4987 B | 944805 | — | bob, btc, finney |
| ✅ Bitcoin-anchored | `…hematics/RH=Riemann_Hypothesis/wolfram_verification.wl` | `ffc89d9e53cc…` | 2774 B | 949283 | — | btc, alice, finney |
| ✅ Bitcoin-anchored | `Muons/Grothendieck-Defect/paper.md` | `e93f70926aff…` | 2774 B | 949283 | — | btc, alice, finney |
| ✅ Bitcoin-anchored | `Muons/Grothendieck-Defect/paper.pdf` | `821d860519f7…` | 2774 B | 949283 | — | btc, alice, finney |
| ✅ Bitcoin-anchored | `Muons/Gödel-Bell_equivalence/MASTER_CERTIFICATE.json` | `a1712f5d75bc…` | 2774 B | 949283 | — | btc, alice, finney |
| ✅ Bitcoin-anchored | `Muons/Gödel-Bell_equivalence/Verify.lean` | `ddfe0aecca69…` | 2774 B | 949283 | — | btc, alice, finney |
| ✅ Bitcoin-anchored | `…lence/certificate | Bell-Godel Lean4 verification.lean` | `454f6d6be22e…` | 2774 B | 949283 | — | btc, alice, finney |
| ✅ Bitcoin-anchored | `…lence/certificate | Bell-Godel Wolfram verification.wl` | `dc368869991d…` | 2774 B | 949283 | — | btc, alice, finney |
| ✅ Bitcoin-anchored | `…lence/certificate | ConjD Lean4 atomic resolution.lean` | `b8f97eb425b2…` | 2774 B | 949283 | — | btc, alice, finney |
| ✅ Bitcoin-anchored | `…lence/certificate | ConjE Lean4 atomic resolution.lean` | `716045cc75fc…` | 2774 B | 949283 | — | btc, alice, finney |
| ✅ Bitcoin-anchored | `…alence/certificate | Section 10 Wolfram Mathematica.wl` | `ef852516b735…` | 2704 B | 949283 | — | btc, alice, finney |
| ✅ Bitcoin-anchored | `…uivalence/literature | ConjD deep search compendium.md` | `f8b4d0653c49…` | 2704 B | 949283 | — | btc, alice, finney |
| ✅ Bitcoin-anchored | `…uivalence/literature | ConjE deep search compendium.md` | `b34b073b234c…` | 2704 B | 949283 | — | btc, alice, finney |
| ✅ Bitcoin-anchored | `…s/Gödel-Bell_equivalence/paper | Godel Bell KS v5.3.md` | `b81737f0c71e…` | 2704 B | 949283 | — | btc, alice, finney |
| ✅ Bitcoin-anchored | `…ell_equivalence/python_finite_witness_certificate.json` | `6ad7a77e6a56…` | 2459 B | 949282 | — | btc, bob, alice |
| ✅ Bitcoin-anchored | `Muons/Gödel-Bell_equivalence/run.json` | `d027008d8ed2…` | 2459 B | 949282 | — | btc, bob, alice |
| ✅ Bitcoin-anchored | `Muons/RH=Riemann_Hypothesis/169_HR_RH_v6.5.pdf` | `3dba135a902d…` | 4987 B | 944805 | — | bob, btc, finney |
| ✅ Bitcoin-anchored | `Muons/RH=Riemann_Hypothesis/wolfram_verification.wl` | `ffc89d9e53cc…` | 2424 B | 949282 | — | btc, bob, alice |

---

## How to verify yourself

```bash
pip install opentimestamps-client
ots verify "path/to/file.pdf.ots"
# ✅ output: 'Success! Bitcoin block N attests data existed as of YYYY-MM-DD HH:MM:SS UTC'
```

**Trust chain:** ots verify checks the .ots against the Bitcoin blockchain directly (no centralized authority required). Trust requires only this repo (.ots + source) + access to any honest Bitcoin node.

---

**Pipeline:** `.github/workflows/ots-protect.yml` · **Schedule:** `17 */6 * * *` + push triggers + manual  
**License of .ots files:** [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)

