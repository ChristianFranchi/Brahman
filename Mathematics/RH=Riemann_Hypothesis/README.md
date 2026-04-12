# A Proof of the Riemann Hypothesis for the Riemann Zeta Function

**Author:** Christian Franchi Viceré  
**ORCID:** [0009-0001-8974-4991](https://orcid.org/0009-0001-8974-4991)  
**DOI:** [10.5281/zenodo.19546495](https://doi.org/10.5281/zenodo.19546495)  
**Date:** April 12, 2026  
**License:** CC BY-NC-ND 4.0

## Contents

| File | Description |
|------|-------------|
| `169_HR_RH_v6.5.md` | Paper source (Markdown + LaTeX) |
| `169_HR_RH_v6.5.pdf` | Paper (PDF, pandoc+tectonic) |
| `169_HR_RH_v6.5.pdf.ots` | Bitcoin blockchain timestamp (OpenTimestamps) |
| `proof_blockchain.json` | Blockchain proof record |
| `wolfram_verification.wl` | Wolfram Mathematica verification script |

## Abstract

Proof of Weil positivity Q_W ≥ 0 for all smooth compactly supported test functions, implying RH via the Weil criterion. Five CLASS A theorems. Numerically verified via Wolfram Mathematica.

## Verification

```bash
# Verify blockchain timestamp
ots verify 169_HR_RH_v6.5.pdf.ots

# Verify with Wolfram Mathematica
wolframscript -file wolfram_verification.wl
```

## SHA-256

```
169_HR_RH_v6.5.pdf: d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed
```
