# Experimental Decision Protocol by 2033

**Companion note to** [Franchi Viceré 2026, DOI:10.5281/zenodo.19644594](https://doi.org/10.5281/zenodo.19644594)

---

## 1. The Inverted-Ordering Target Band

Under Majorana reality with the current NuFit-6.0 oscillation fit and neutrino masses consistent with cosmological bounds $\sum m_\nu < 0.12$ eV, the effective neutrinoless double-beta-decay mass under **inverted ordering (IO)** lies in the band

$$
|m_{\beta\beta}|_{\rm IO} \in [15, 50] \ \text{meV}
$$

(with mild dependence on Majorana CP phases $\alpha_{21}, \alpha_{31}$). Under **normal ordering (NO)** the band extends down to arbitrarily small values due to phase cancellation.

**The 2033 decision point**: if IO is correct (currently disfavored at $\sim 2.5\sigma$ by global fits but still viable) and Majorana reality holds, the IO band will be **fully within reach** of the next-generation experiments.

## 2. The Three Flagship Experiments

### 2.1 CUPID — $^{100}$Mo in scintillating bolometers

- **Location**: Laboratori Nazionali del Gran Sasso (LNGS), Italy
- **Technique**: Li$_2$$^{100}$MoO$_4$ crystals at $\sim$10 mK, dual heat + scintillation readout for $\alpha/\beta$ discrimination
- **Isotope mass**: $\sim$250 kg of $^{100}$Mo (enrichment $\sim$95%)
- **Target half-life sensitivity** (5 yr exposure): $T_{1/2}^{0\nu} \gtrsim 1.5 \times 10^{27}$ yr
- **Effective mass reach**: $|m_{\beta\beta}| \lesssim 12$ meV
- **Commissioning**: $\sim$2028 at CUORE cryostat

### 2.2 LEGEND-1000 — $^{76}$Ge in HPGe detectors

- **Location**: LNGS (Phase 2 may move to SURF)
- **Technique**: point-contact HPGe detectors in liquid argon active veto (Ge enrichment $\sim$92% in $^{76}$Ge)
- **Isotope mass**: $\sim$1000 kg of $^{76}$Ge
- **Target half-life sensitivity** (10 yr exposure): $T_{1/2}^{0\nu} \gtrsim 1.3 \times 10^{28}$ yr
- **Effective mass reach**: $|m_{\beta\beta}| \lesssim 9$ meV
- **Commissioning**: $\sim$2029

### 2.3 nEXO — $^{136}$Xe in liquid-xenon TPC

- **Location**: SNOLAB, Sudbury, Ontario, Canada (Cryopit)
- **Technique**: 5000 kg of enriched (90% $^{136}$Xe) liquid xenon in single-phase TPC, tracking + scintillation
- **Isotope mass**: $\sim$5000 kg of $^{136}$Xe
- **Target half-life sensitivity** (10 yr exposure): $T_{1/2}^{0\nu} \gtrsim 1.4 \times 10^{28}$ yr
- **Effective mass reach**: $|m_{\beta\beta}| \lesssim 7$ meV
- **Commissioning**: $\sim$2030

## 3. Complementarity Matrix

The three experiments use **three different isotopes** with **different nuclear matrix elements (NMEs)**. Combined analyses substantially reduce NME systematic uncertainty, which is the dominant theoretical error in extracting $|m_{\beta\beta}|$ from half-life measurements.

| | $^{76}$Ge | $^{100}$Mo | $^{136}$Xe |
|---|:-:|:-:|:-:|
| $Q_{\beta\beta}$ (MeV) | 2.04 | 3.03 | 2.46 |
| $G^{0\nu}$ ($10^{-15}$ yr$^{-1}$) | 2.4 | 15.9 | 3.7 |
| NME ($M^{0\nu}$) QRPA | 4.3–5.2 | 3.0–4.0 | 2.5–3.0 |
| NME ($M^{0\nu}$) IBM-2 | 5.5 | 4.0 | 3.4 |
| NME ($M^{0\nu}$) Shell Model | 2.8 | — | 1.6 |
| Detector technology | HPGe | scint. bolometer | LXe TPC |
| Backgrounds in ROI | ultra-low $\gamma$ | $\alpha$ discrimination | ${}^{137}$Xe, ${}^{222}$Rn |

A **signal observation in one isotope** can be independently cross-checked in the other two. A **null result across all three** is highly constraining.

## 4. Falsification Conditions

### 4.1 Positive detection

If $0\nu\beta\beta$ is observed in any of CUPID / LEGEND-1000 / nEXO:
- $|m_{\beta\beta}|$ extracted (with NME-dependent uncertainty band)
- Majorana reality confirmed
- Theorem **vindicated** in the strongest possible way

### 4.2 Null detection across all three experiments

If by 2033 all three reach design sensitivity and see **null** $0\nu\beta\beta$ across the IO band:

- Under NO, the theorem remains consistent (no constraint, signal below reach)
- Under IO (if still favored), **at least one hypothesis must fail**:
  1. $w_2(M) = 0$ fails — spacetime has obstruction to spin structure (no known experimental hint)
  2. Residual unbroken $U(1)_{B-L}$ or similar — implies new stable light gauge boson
  3. CPT breaking — contradicts decades of tests (K, B, D, $\mu$, Penning traps)

All three "outs" are extraordinary.

### 4.3 Scenario matrix

| Ordering (by 2033) | $0\nu\beta\beta$ result | Consistency with theorem |
|---|---|---|
| NO preferred | null | Fully consistent (theorem silent) |
| NO preferred | observed | Consistent; Majorana + $|m_{\beta\beta}|$ extracted |
| IO preferred | observed | **Strong confirmation** |
| IO preferred | null across all three | **Falsification** of a hypothesis |
| Ordering unresolved | mixed | Complementary isotope cross-checks become critical |

## 5. Beyond 2033

If IO + null persists, the natural next step is **KATRIN-plus + cosmology** to tighten the absolute neutrino mass scale $\sum m_\nu$, combined with **long-baseline oscillation** (DUNE, Hyper-K) for ordering determination. The parameter space then becomes severely constrained, and any surviving theory must account for:

- Majorana reality (from the categorical theorem)
- Null $0\nu\beta\beta$
- Consistent cosmological $\sum m_\nu$
- Measured $\Delta m_{\rm atm}^2$, $\theta_{23}$

Current analyses (Cadamuro & Giusarma 2024, arXiv) suggest this corner of parameter space is very small.

## 6. References

See [`references.bib`](./references.bib) for BibTeX of the cited works. Key references:

- NuFit-6.0: [Esteban et al. 2024, JHEP 12:216](https://doi.org/10.1007/JHEP12(2024)216)
- CUPID: arXiv:1907.09376 + CUORE collaboration proceedings
- LEGEND: arXiv:2107.11462
- nEXO: arXiv:1805.11142

## 7. License

This protocol note is released under [CC BY-NC-ND 4.0](https://creativecommons.org/licenses/by-nc-nd/4.0/) together with the parent article.

© 2026 Christian Franchi Viceré
