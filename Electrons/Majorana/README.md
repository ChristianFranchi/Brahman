# Majorana Was Right: The Neutrino's Double Identity, 89 Years Later

**A Categorical Theorem: CPT Invariance · ABS Classification · Bott Periodicity mod 8 · Galois Descent Force $\psi = \psi^c$**

---

## Published Article

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.19644594.svg)](https://doi.org/10.5281/zenodo.19644594)

**Franchi Viceré, C.** (18 April 2026). *Majorana Was Right: The Neutrino's Double Identity, 89 Years Later — A Categorical Theorem: CPT Invariance, ABS Classification, Bott Periodicity mod 8, and Galois Descent Force $\psi = \psi^c$* (Version 6.1). Zenodo.

- **DOI**: [10.5281/zenodo.19644594](https://doi.org/10.5281/zenodo.19644594)
- **Zenodo record**: <https://zenodo.org/records/19644594>
- **Version**: 6.1 (FINAL)
- **License**: [CC BY-NC-ND 4.0](https://creativecommons.org/licenses/by-nc-nd/4.0/)

## Files in this companion repository

| File | Description |
|---|---|
| [`majorana_v6.1-FINAL.pdf`](./majorana_v6.1-FINAL.pdf) | Mirror of the published manuscript from Zenodo |
| [`majorana_v6_1-FINAL.pdf.ots`](./majorana_v6_1-FINAL.pdf.ots) | OpenTimestamps Bitcoin proof of existence |
| [`CITATION.cff`](./CITATION.cff) | Citation metadata (GitHub-parseable) |
| [`references.bib`](./references.bib) | BibTeX for the 9 cited works |
| [`experimental_protocol.md`](./experimental_protocol.md) | $0\nu\beta\beta$ decision landscape — CUPID, LEGEND-1000, nEXO by 2033 |
| [`LICENSE`](./LICENSE) | CC BY-NC-ND 4.0 text |

## Integrity

- **PDF SHA-256**: `94f539c49b4e903573582bb86a2ec11f880e70e4e72ddaa85788967efbe2a310`
- **PDF MD5**: `9a99cf798f7c2b6b020cb640dc381b13`
- **OTS MD5**: `72874c2ff5876cc10f5627d1d1e1f684`
- **Timestamped**: 18 April 2026 (Bitcoin blockchain via OpenTimestamps)

### Verification

```bash
# Hash check
sha256sum majorana_v6.1-FINAL.pdf
# Expected: 94f539c49b4e903573582bb86a2ec11f880e70e4e72ddaa85788967efbe2a310

# OpenTimestamps verification (requires opentimestamps-client)
pip install opentimestamps-client
ots verify majorana_v6_1-FINAL.pdf.ots
```

---

## Abstract

I prove that any **neutral spin-½ fermion** on a 4D Lorentzian spin manifold $(M, g)$ with $w_2(M) = 0$, admitting a **CPT-stable vacuum sector** and carrying **no unbroken gauge $U(1)$ charge**, must be a **Majorana fermion**. The Dirac alternative is algebraically excluded.

The proof rests on four independent categorical pillars:

1. **CPT theorem** (Jost–Streater–Wightman 1964; Doplicher–Haag–Roberts 1971) — provides the anti-linear antiautomorphism $\Theta$.
2. **Atiyah–Bott–Shapiro classification** of real Clifford modules (1964) — identifies $\mathrm{Cl}_{3,1}(\mathbb{R}) \cong M_4(\mathbb{R})$.
3. **Bott periodicity mod 8** with KO-dimension indexing (Connes 1995) — places the real structure $J$ with $J^2 = +1$.
4. **Galois descent** for $\mathrm{Spin}(3,1)$-bundles — forces the reality structure globally.

The four pillars meet at a single algebraic constraint that has exactly one solution: $\psi = \psi^c$.

**Consequences**:
- Seesaw mass $M_R \neq 0$ is forced (Schechter–Valle 1982)
- Leptogenesis becomes algebraic necessity (Fukugita–Yanagida 1986), with floor $M_R \gtrsim 10^9$ GeV (thermal) or $\gtrsim$ TeV (resonant)
- By 2033, CUPID + LEGEND-1000 + nEXO will cover the inverted-ordering $|m_{\beta\beta}|$ band — **genuinely falsifiable within a decade**

## The Eight Theorems (All Proved)

| # | Theorem | Principal ingredients |
|:-:|---|---|
| 1 | CPT $\Rightarrow$ anti-linear antiautomorphism $\Theta$ on the net | Jost–Streater–Wightman 1964; DHR 1971 |
| 2 | ABS: $\mathrm{Cl}_{3,1}(\mathbb{R}) \cong M_4(\mathbb{R})$ | Atiyah–Bott–Shapiro 1964 |
| 3 | Real structure $J$, $J^2 = +1$, KO-dim 2 (mod 8) | Bott periodicity; Connes 1995; Lawson–Michelsohn 1989 |
| 4 | Galois descent: $\mathrm{Spin}(3,1)$-bundle from $\mathbb{C}$ to $\mathbb{R}$ | Descent theory for principal bundles |
| 5 | $\psi = \psi^c$ forced when $U(1)$-charge absent | Synthesis of 1–4 |
| 6 | Dirac alternative algebraically excluded | No complex structure compatible with $J^2 = +1$ + neutrality |
| 7 | Seesaw $M_R \neq 0$ forced | Schechter–Valle 1982 (reverse implication) |
| 8 | Leptogenesis bounds $M_R \gtrsim 10^9$ GeV (thermal) or $\gtrsim$ TeV (resonant) | Fukugita–Yanagida 1986 + NuFit-6.0 (2024) |

## Experimental Decision Protocol by 2033

See [`experimental_protocol.md`](./experimental_protocol.md) for the full landscape.

| Experiment | Isotope | Sensitivity target $|m_{\beta\beta}|$ | Commissioning |
|---|---|---|---|
| **CUPID** | $^{100}$Mo (Li$_2$MoO$_4$ scintillating bolometers at LNGS) | $\lesssim 12$ meV | $\sim 2028$ |
| **LEGEND-1000** | $^{76}$Ge (HPGe detectors at LNGS) | $\lesssim 9$ meV | $\sim 2029$ |
| **nEXO** | $^{136}$Xe (5 t LXe TPC, SNOLAB) | $\lesssim 7$ meV | $\sim 2030$ |

**Falsification condition**: if all three reach design sensitivity by 2033 and observe *null* $0\nu\beta\beta$ across the IO band $|m_{\beta\beta}| \in [15, 50]$ meV while the global oscillation fit still prefers the inverted hierarchy, then **at least one** theorem hypothesis must fail:

- $w_2(M) \neq 0$ (spacetime fails to be spin), **or**
- residual unbroken $U(1)$-charge (new symmetry), **or**
- CPT breaking (violates JSW).

All three are extraordinary claims requiring extraordinary evidence.

## Related Works

**Cites (DOI)**:
- [`10.1016/0040-9383(64)90003-5`](https://doi.org/10.1016/0040-9383(64)90003-5) — Atiyah, Bott, Shapiro 1964
- [`10.1007/BF02961314`](https://doi.org/10.1007/BF02961314) — Majorana 1937
- [`10.1016/0370-2693(86)91126-3`](https://doi.org/10.1016/0370-2693(86)91126-3) — Fukugita, Yanagida 1986
- [`10.1007/BF01331022`](https://doi.org/10.1007/BF01331022) — Doplicher, Haag, Roberts 1971
- [`10.1103/PhysRevD.25.2951`](https://doi.org/10.1103/PhysRevD.25.2951) — Schechter, Valle 1982
- [`10.1007/JHEP12(2024)216`](https://doi.org/10.1007/JHEP12(2024)216) — NuFit-6.0, Esteban et al.

**Is referenced by**: [`10.5281/zenodo.19482800`](https://doi.org/10.5281/zenodo.19482800)

## Subjects (MSC 2020)

- **81V15** — Quantum field theory on curved spacetimes
- **15A66** — Multilinear algebra, Clifford algebras
- **53C27** — Spin geometry
- **19L64** — K-theory, KO-theory

## Keywords

Majorana neutrinos · CPT theorem · Clifford modules · Atiyah–Bott–Shapiro classification · Bott periodicity · real structure · KO-dimension · Galois descent · neutrinoless double beta decay · seesaw mechanism · leptogenesis · Doplicher–Haag–Roberts · spin geometry · mathematical physics

---

## Author

**Christian Franchi Viceré**
A.I. Visions LTD (London, UK)
ORCID: [0009-0001-8974-4991](https://orcid.org/0009-0001-8974-4991)
LinkedIn: [christian-franchi-bab00ab4](https://www.linkedin.com/in/christian-franchi-bab00ab4/)

## License

This companion repository and the article are released under
[Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)](https://creativecommons.org/licenses/by-nc-nd/4.0/).

For permissions beyond this license, contact the author on LinkedIn.

© 2026 Christian Franchi Viceré. All rights reserved.
