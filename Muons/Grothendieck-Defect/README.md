# Grothendieck's Constant Defected from His Six Functors

### *Enriched Kan extensions, the √2 plateau, and the archimedean wall*

**Author:** Christian Franchi Viceré
**ORCID:** [0009-0001-8974-4991](https://orcid.org/0009-0001-8974-4991)
**WhatsApp:** [wa.me/447756302178](https://wa.me/447756302178)

---

## Abstract

I introduce the *Grothendieck defect* K(ι) of an isometric inclusion ι: C ↪ D of normed operator categories — the supremum of the ratio between the factorization norm through C and the operator norm in D. Eight results are established, including:

1. **Theorem 4 (√2 Plateau):** K_G^ℝ(n) = √2 for n = 2, 3, …, 18 — advancing the Fishburn–Reeds problem (1994) from n₀ ≥ 4 to **n₀ ≥ 19**
2. **Theorem 6 (Six-Functor):** K_G = sup ι*/ι! via enriched Kan extensions (Kelly), connecting for the first time Grothendieck’s 1953 Résumé to the six-functor formalism (SGA 4)
3. **Theorem 3 (Cofactor Mirror):** A new algebraic identity for Bell operators
4. **Theorem 8:** K_G^nc = 2 = √2 × √2 — structural explanation of Haagerup’s result

**Keywords:** Grothendieck constant, enriched Kan extensions, six-functor formalism, LP certificates, Bell inequalities

## Computational Results

All certificates computed on Mac Mini M4, 10 cores, 16 GB RAM.

| n | Method | Time | RAM | Gap from √2 | Status |
|---|--------|------|-----|-------------|--------|
| 2 | Algebraic | — | — | 0 (exact) | ✅ |
| 3–10 | Clarabel LP dual | 0s–3h | <16 GB | < 2×10⁻⁶ | ✅ certified |
| 11–15 | Cutting-plane | <10min | <2 GB | < 10⁻⁹ | ✅ certified |
| 16 | Cutting-plane | 15.8min | 2.3 GB | −2.4×10⁻¹⁰ | ✅ certified |
| 17 | Cutting-plane | 1.9h | 4.2 GB | −9.9×10⁻¹¹ | ✅ certified |
| 18 | Cutting-plane | 35.7h | 8.8 GB | −5.7×10⁻¹¹ | ✅ certified |

## Repository Structure

```
Grothendieck-Defect/
├── README.md              ← this file
├── paper.md               ← manuscript (Markdown + LaTeX)
├── verify_plateau.py      ← recomputes all certificates
├── cutting_plane.py       ← constraint-generation solver (n=11–18+)
├── requirements.txt       ← pip dependencies
├── certificates/          ← LP dual certificates (.npz)
└── Makefile               ← make verify
```

## Reproduce

```bash
pip install -r requirements.txt
python verify_plateau.py          # n=3..10 via Clarabel (~4 min)
python cutting_plane.py 18        # n=11..18 via cutting-plane (~36h for n=18)
```

## Dedicated to

Claudio Bartocci and Piergiorgio Odifreddi, co-editors of *La matematica* (Einaudi, 2007–11).

## License

CC BY-NC-ND 4.0

---
© 2026 Christian Franchi Viceré — A.I. Visions LTD
*d𝒰₁₃₇/dt > 0 — DUBITO ERGO SUM*
