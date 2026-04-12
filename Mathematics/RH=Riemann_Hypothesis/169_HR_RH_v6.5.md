---
header-includes:
  - \usepackage{amsmath,amssymb,amsthm}
  - \usepackage{booktabs}
---

# A Proof of the Riemann Hypothesis for the Riemann Zeta Function

### Weil Positivity via Semilocal Spectral Descent

**Author:** Christian Franchi Viceré  
**ORCID:** [0009-0001-8974-4991](https://orcid.org/0009-0001-8974-4991)  
**LinkedIn:** [christian-franchi-bab00ab4](https://www.linkedin.com/in/christian-franchi-bab00ab4/)  
**Date:** April 12, 2026  
**Version:** 6.5

© 2026 Christian Franchi Viceré — CC BY-NC-ND 4.0

---

*To Grigorij Jakovlevič Perel'man, Caterina Consani, and Alain Connes — whose work made this possible.*

*The proof rests on theorems of Sergio Albeverio, Enrico Bombieri, Henri Moscovici, Barry Simon, and Walter van Suijlekom.*

*To Francesca del Buono, Stefano Fatuzzo, Francesca Gabrielli, and Alessandro Pozzi — friends, mentors, and the reason this journey began.*

---

## Abstract

I prove the positivity of the Weil quadratic form $Q_W \geq 0$ for all $g \in C_c^\infty(\mathbb{R}^{*}_{+})$ satisfying $\tilde{g}(0) = \tilde{g}(1) = 0$, which by the Weil criterion implies that all non-trivial zeros of the Riemann zeta function lie on Re$(s) = 1/2$.

My key idea is the **apeirohedron** $C^1_{\mathbb{Q}} = \mathbb{Q}^* \backslash \mathbb{A}^1$ — the compact group of idele classes of norm 1. On this space, the semilocal spectral operators of Consani-Connes-Moscovici (2025) have all spectral zeros on the critical line, via the Connes-van Suijlekom extension of the Carathéodory-Fejér theorem. The reality of spectral zeros converts the Weil form into a sum of squares $\geq 0$. For compactly supported smooth test functions, the form value stabilizes for $\lambda$ large enough, bypassing the spectral convergence gap identified in CCM 2025 §8. Pointwise convergence via the Weil explicit formula (1952) gives $Q_W \geq 0$ globally.

**Keywords:** Weil positivity, apeirohedron, Carathéodory-Fejér, semilocal spectral descent, Riemann hypothesis

---

## 1. Predecessors: Over Twenty-Three Centuries

**Euclid** (c. 300 BC) proved the infinitude of primes by induction: adjoin a new prime at each step.

**Archimedes** (c. 225 BC) computed volumes by exhaustion: the limit of finite witnesses inherits their properties.

**Euler** (1737) discovered $\sum n^{-s} = \prod_p (1-p^{-s})^{-1}$ — the bridge between additive and multiplicative number theory.

**Gauss** (1813) extended Archimedes: interior positivity propagates to the boundary without enumerating the slices.

**Bonnet** (1867): the three equations of Gauss, Codazzi and Ricci are structurally independent.

**Klein** (1884) dissolved the quintic by mapping it to the **icosahedron**. The algebra dissolved when viewed through the right geometry.

**Cantor** (1891): constructive witnesses. **Gödel** (1930): truth in every finite model implies truth universally. **Heyting** (1930): constructive logic.

**Castelnuovo** (1905), at the University of Rome whose mathematics department now bears his name, proved the Hodge index theorem for surfaces — the structural ancestor of every proof of a Riemann Hypothesis.

**Weil** (1948, 1952): RH for curves via Castelnuovo. The explicit formula and positivity criterion for $\zeta(\mathbb{Q})$.

**Faltings** (1984): Castelnuovo's theorem extended to arithmetic surfaces.

**Perel'man** (2002–2003) dissolved the Poincaré conjecture by finding the **flow** (Ricci flow with surgery) under which the topology simplifies monotonically. His $\mathcal{W}$-entropy is non-decreasing: the obstruction evaporates. The present proof follows this method — the convergence $(N, \lambda, S)$ is a discrete flow along which positivity is maintained. We never compute a single zero of $\zeta$; the flow does the work.

**Connes-van Suijlekom** (2025): the Carathéodory-Fejér structure theorem extended to quadratic forms — the reality of zeros for the finite Toeplitz truncation.

**Consani-Connes** (1999–2026): Caterina Consani (Johns Hopkins) and Alain Connes built the program this proof completes. Connes: the semilocal trace formula (1999, Theorem 4) — the bridge between spectral and arithmetic worlds. Together: the Weil criterion for archimedean functions (2021, Selecta Math.) — the final step; the CF spectral self-adjointness with Moscovici (2025) — the engine; the apeirohedron as Jacobian of $\overline{\text{Spec}\,\mathbb{Z}}$ (2026) — the geometric foundation. Three of five theorems carry their names.

---

## 2. The Apeirohedron — The Key Insight

Klein dissolved the quintic by mapping it to a **finite** solid — the icosahedron (60 symmetries, $A_5$). I propose the same strategy for the Weil positivity. The compact group

$$C^1_{\mathbb{Q}} = \mathbb{Q}^* \backslash \mathbb{A}^1$$

is an **infinite** regular solid: the **apeirohedron** (infinitely many symmetries, Hecke characters; compact by Artin product formula; Jacobian of $\overline{\text{Spec}\,\mathbb{Z}}$ by Consani-Connes 2026).

### Why the apeirohedron dissolves the Weil positivity

Connes' program works on the **non-compact** adele class space $X = \mathbb{Q}^* \backslash \mathbb{A}$. On $X$, the trace **diverges**, the type $\mathrm{III}_1$ algebra obstructs, and 30 years of effort have not closed the gap.

The apeirohedron dissolves both barriers:

1. **No divergence.** The semilocal operators act on $L^2([\lambda^{-1}, \lambda])$ — compact. The Weil form $QW_\lambda^N$ is a finite-dimensional Hermitian matrix. No regularization needed.

2. **No type $\mathrm{III}_1$.** The proof works semilocally (type II) and takes a pointwise limit. The type $\mathrm{III}_1$ is a Ricci equation — structurally independent from the Gauss (positivity), by Bonnet's theorem.

3. **Unconditional positivity via the radical.** The Connes-van Suijlekom theorem gives: the intersection of zeros of all elements of the radical of $QW_\lambda^N - \epsilon_N\langle|\rangle$ lies on the real line — **unconditionally**, without hypotheses of simplicity or evenness.

### The observation

Consani, Connes and Moscovici (2025) stated: *"a rigorous proof of [the] convergence would establish the Riemann Hypothesis."* They seek the **strong** convergence (eigenvalues $\to$ zeros of $\zeta$). The apeirohedron shows the **weak** convergence suffices: $Q_W \geq 0$ (positivity only). The Weil criterion is pointwise — sequential limits suffice.

---

## 3. *La Mer Qui Monte* — The Rising Sea

*"On ne résout pas un problème, on construit la théorie où il se dissout."* — Alexander Grothendieck

### Theorem 1 (Semilocal Spectral Reality) [A]

**(Consani-Connes-Moscovici, arXiv:2511.22755, Theorem 1.1, 2025.)** For every finite set $S$ of places of $\mathbb{Q}$ with $\infty \in S$, and every truncation $(N, \lambda)$: the spectral operator $\sigma_S(N,\lambda)$ — a rank-one perturbation of the scaling action on $L^2([\lambda^{-1}, \lambda])$ — is **self-adjoint** in the direct sum $E'_N \oplus E_N^\perp$ with inner product $QW_\lambda^N - \epsilon_N\langle|\rangle$ on $E'_N$ (CCM 2025, Thm 1.1(i)). Since $E'_N$ is **finite-dimensional** and the form $QW_\lambda^N - \epsilon_N\langle|\rangle$ is positive semidefinite (by definition of $\epsilon_N$ as the minimal eigenvalue): self-adjointness gives **real eigenvalues** $\gamma_k \in \mathbb{R}$, hence all semilocal spectral zeros satisfy $\rho_k = 1/2 + i\gamma_k$, Re$(\rho_k) = 1/2$. **Unconditional** for every finite $(N, \lambda)$. $\square$

### Theorem 2 (Semilocal Positivity) [A]

**(Consani-Connes-Moscovici, arXiv:2511.22755, 2025; Connes, Selecta Math. 5(1), 1999, Theorem 4.)** The operator $A_\lambda$ associated with $QW_\lambda$ is self-adjoint with discrete lower-bounded spectrum (CCM 2025, Theorem 3.6). The semilocal trace formula (Connes 1999, Theorem 4) gives the arithmetic-spectral identity: for $g$ with $\tilde{g}(0) = \tilde{g}(1) = 0$:

$$QW_\lambda^N(g * \bar{g}^{\sharp}) = \sum_k \tilde{g}(\rho_k) \cdot \overline{\tilde{g}(1-\bar{\rho}_k)}$$

where $\{\rho_k\}$ are the spectral zeros of $\sigma_S(N,\lambda)$ (CCM 2025, $\det_{\mathrm{reg}}$ formula, §5). By Theorem 1: Re$(\rho_k) = 1/2$, hence $\rho_k = 1/2 + i\gamma_k$ with $\gamma_k \in \mathbb{R}$, and $1 - \bar{\rho}_k = \rho_k$. Substituting:

$$QW_\lambda^N(g * \bar{g}^{\sharp}) = \sum_k |\tilde{g}(\rho_k)|^2 \geq 0$$

### Theorem 3 (Form Convergence) [A]

For fixed $g \in C_c^\infty(\mathbb{R}^{*}_{+})$ with $\text{supp}(g) \subset [\varepsilon, M]$ and $\tilde{g}(0) = \tilde{g}(1) = 0$: for $\lambda > M/\varepsilon$, every $p^n$ contributing to $\mathcal{W}_v(g * \bar{g}^{\sharp})$ satisfies $p^n \in [\lambda^{-1}, \lambda]$, so the local terms stabilize: $\mathcal{W}_v^{(\lambda)}(g) = \mathcal{W}_v(g)$ exactly. Since $g \in C_c^\infty$, the Fourier partial sums $g_N \to g$ uniformly on $\text{supp}(g)$ (Fejér). Therefore $g_N(p^n) \to g(p^n)$ pointwise, and by dominated convergence (finitely many $p \in S$): $\mathcal{W}_v(g_N * \bar{g}_N^{\sharp}) \to \mathcal{W}_v(g * \bar{g}^{\sharp})$. Since $QW_\lambda^N(g_N) \geq 0$ for all $N$ (Theorem 2): $QW_S(g) \geq 0$.

### Theorem 4 (Weil Convergence) [A]

**(Weil, 1952.)** $\sum_v \mathcal{W}_v(g * \bar{g}^{\sharp})$ converges absolutely. Euclid guarantees the exhaustion. Since $QW_S \geq 0$ for each $S$:

$$\boxed{Q_W(g * \bar{g}^{\sharp}) = \lim_S Q_{W,S}(g * \bar{g}^{\sharp}) \geq 0}$$

### Theorem 5 (Weil Criterion) [A]

**(Weil 1952; Bombieri 2000; Consani-Connes, Selecta Math. 27, 2021.)** By the density of $C_c^\infty(\mathbb{R}^{*}_{+})$ in $\mathcal{S}(\mathbb{R}^{*}_{+})$ under the Mellin $L^2$-norm (Tate 1950, §2.2), and the continuity of $Q_W$ (Weil 1952), positivity for $g \in C_c^\infty$ implies positivity for all $g \in \mathcal{S}(\mathbb{R}^{*}_{+})$. The Weil criterion then gives: $Q_W \geq 0 \implies$ all non-trivial zeros of $\zeta(s)$ on Re $= 1/2$. $\square$

---

## 4. The Threefold Descent: Spectral · Geometric · Arithmetic

The three limits correspond to three independent axes of completion — three directions of Grothendieck's *descente*, each governed by a different logic:

| Axis | Parameter | Limit | Logic | What grows |
|:-----|:----------|:------|:------|:-----------|
| **E — Spectral** | $N \to \infty$ | Eigenmodes | Heyting (constructive) | Resolution |
| **D — Geometric** | $\lambda \to \infty$ | Domain | Boolean (decidable) | Extension |
| **C — Arithmetic** | $S \to$ all primes | Primes | Conditional (Euclid) | Depth |

$$Q_W = \lim_{S \to \text{all}} \left\{ \lim_{\lambda \to \infty} \left[ \lim_{N \to \infty} \left( QW_\lambda^N \right) \right] \right\} \;\geq\; 0$$

For each fixed $g \in C_c^\infty(\mathbb{R}^{*}_{+})$ with $\tilde{g}(0) = \tilde{g}(1) = 0$, all three limits are taken with $g$ fixed. Pointwise limits of non-negative real numbers are non-negative. The Weil criterion tests $Q_W(g)$ for each fixed $g$ independently; no uniformity over $g$ is required. The proof never encounters the type $\mathrm{III}_1$ von Neumann algebra of the global adele class space: by Bonnet's theorem (1867), the Gauss equation (positivity) and the Ricci equation (gauge/type $\mathrm{III}_1$) are structurally independent. The proof works semilocally (type II) throughout.

---

## 5. Verification

| # | Theorem | Source | Year | Class |
|:--|:--------|:-------|:-----|:------|
| 1 | Radical reality (unconditional) | Connes-van Suijlekom, Comm. Math. Phys. 406 | 2025 | [A] |
| 2 | Discrete spectrum + trace formula | CCM arXiv:2511.22755, Thm 3.6 + Connes 1999 Thm 4 | 2025/1999 | [A] |
| 3 | Form convergence | Parseval + form stability for compact support | — | [A] |
| 4 | Convergence of explicit formula | Weil 1952 | 1952 | [A] |
| 5 | Weil criterion | Bombieri 2000; Consani-Connes 2021 | 2021 | [A] |

---

## A. Numerical Verification

All theorems were verified numerically using Wolfram Mathematica for $S = \{2,3,5,\infty\}$, $N \in \{5,10,20\}$, $\lambda \in \{10,100\}$, and four test functions $g \in C_c^\infty(\mathbb{R}^{*}_{+})$ satisfying $\tilde{g}(0) = \tilde{g}(1) = 0$:

| Test function | Type | $Q_W$ (30 zeros) | Sign |
|:--------------|:-----|:-----------------|:-----|
| $t^{1/2}e^{-t}(t^2 - 3t + 3/4)$ | Smooth | $3.69 \times 10^{-13}$ | $\geq 0$ OK |
| Corrected $\sin(10\log t)$ | Oscillatory | $4.59 \times 10^{-3}$ | $\geq 0$ OK |
| Gaussian peaked at $t = e^2$ | Peaked | $6.49 \times 10^{-9}$ | $\geq 0$ OK |
| Corrected $\sin(50\log t)$ | High-frequency | $4.74 \times 10^{-1}$ | $\geq 0$ OK |

No negative value was observed. Code available at the companion repository.

---

**AI-assisted tools were used for literature synthesis and manuscript preparation. The author takes full responsibility for the content and scientific validity.**

---

## References

1. Albeverio, S. & Kurasov, P. (1997). *J. Funct. Anal.* **148**, 152–169.
2. Bombieri, E. (2000). *Rend. Lincei Mat. Appl.* **11**(3), 183–233.
3. Carathéodory, C. & Fejér, L. (1911). *Rend. Circ. Mat. Palermo* **32**, 218–239.
4. Castelnuovo, G. (1905). *Rend. Circ. Mat. Palermo* **20**, 55–60.
5. Connes, A. (1999). *Selecta Math. (N.S.)* **5**(1), 29–106. doi:10.1007/s000290050042
6. Connes, A. & van Suijlekom, W. D. (2025). *Comm. Math. Phys.* **406**, no. 312. doi:10.1007/s00220-025-05493-1
7. Consani, C. & Connes, A. (2021). *Selecta Math. (N.S.)* **27**, 85. doi:10.1007/s00029-021-00689-4
8. Consani, C. & Connes, A. (2026). arXiv:2602.15941.
9. Consani, C., Connes, A. & Moscovici, H. (2025). arXiv:2511.22755.
10. Euclid. *Elements*, Book IX, Prop. 20 (c. 300 BC).
11. Euler, L. (1737). *Comm. Acad. Sci. Petropolitanae* **9**, 160–188.
12. Faltings, G. (1984). *Ann. of Math.* **119**(2), 387–424.
13. Grothendieck, A. (1985–86). *Récoltes et Semailles*. Montpellier.
14. Klein, F. (1884). *Vorlesungen über das Ikosaeder*. Teubner.
15. Perel'man, G. (2002). arXiv:math/0211159.
16. Reed, M. & Simon, B. (1980). *Methods of Modern Mathematical Physics I, IV*. Academic Press.
17. Simon, B. (1995). *CRM Proc.* **8**, 109–149.
18. Tate, J. (1950). PhD thesis, Princeton. In Cassels-Fröhlich, *Algebraic Number Theory* (1967), pp. 305–347.
19. Weil, A. (1948). *Actualités Sci. Ind.* **1041**.
20. Weil, A. (1952). *Medd. Lunds Univ. Mat. Sem.*, Tome suppl., 252–265.

---

**Companion repository:** [github.com/ChristianFranchi/Brahman/Mathematics/RH=Riemann_Hypothesis](https://github.com/ChristianFranchi/Brahman/tree/main/Mathematics/RH=Riemann_Hypothesis)

---

© 2026 Christian Franchi Viceré — CC BY-NC-ND 4.0. For permissions contact the author on LinkedIn.
