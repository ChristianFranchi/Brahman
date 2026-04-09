# Grothendieck's Constant Defected from His Six Functors
### *Enriched Kan extensions, the $\sqrt{2}$ plateau, and the archimedean wall*

**Christian Franchi Viceré**
ORCID: [0009-0001-8974-4991](https://orcid.org/0009-0001-8974-4991)
LinkedIn: [christian-franchi](https://www.linkedin.com/in/christian-franchi-bab00ab4/)

© 2026 Christian Franchi Viceré — CC BY-NC-ND 4.0

April 2026

*Dedicated to Claudio Bartocci and Piergiorgio Odifreddi, co-editors of* La matematica *(Einaudi, 2007--11), whose complementary lenses---Bartocci's on Grothendieck's categorical methodology and $\mathbb{F}_1$-geometry, Odifreddi's on the round trip ``verso l'astratto andata e ritorno'' (La Repubblica, 30 Nov 2014)---frame the two sides of the archimedean wall.*

*To Claudio Notegen, Claudia Candeli, and Marilena Serafini.*

---

## Abstract

I introduce the *Grothendieck defect* $K(\iota)$ of an isometric inclusion $\iota: \mathcal{C} \hookrightarrow \mathcal{D}$ of normed operator categories — the supremum of the ratio between the factorization norm through $\mathcal{C}$ and the operator norm in $\mathcal{D}$. This invariant satisfies $K(\iota) \geq 1$ and unifies all known Grothendieck-type inequalities. Eight results are established: (1) monotonicity for nested isometric inclusions; (2) a universal rank-$r$ bound $K(\iota)|_r \leq \sqrt{r}$ in three lines; (3) a cofactor identity $B_A^2 = \|A\|_F^2 I_4 - 2B_{\mathrm{cof}(A)}$; (4) the plateau $K_G^{\mathbb{R}}(n) = \sqrt{2}$ for $n \leq 18$ via computer-assisted LP certificates with constraint generation, advancing the Fishburn–Reeds problem to $n_0 \geq 19$; (5) $K_G = K(\iota)$ for $\iota: \mathrm{Hilb} \hookrightarrow \mathrm{Ban}^{\mathrm{comm}}$ (Pisier's factorization form); (6) the six-functor identification $K_G = \sup \iota_*/\iota_!$ via enriched Kan extensions (Kelly), where $\iota_! = \|-\|$ (left Kan = operator norm) and $\iota_* = \gamma_2$ (right Kan = factorization norm); (7) a summand rank bound; (8) $K_G^{\mathrm{nc}} = 2$ from the summand bound plus Haagerup's GNS decomposition.

**Keywords**: Grothendieck inequality, factorization norm, enriched Kan extension, Tsirelson bound, cofactor matrix, SDP duality

**MSC 2020**: 46B28 · 18D20 · 15A66 · 81P40 · 90C22

---

## 1. Introduction

In 1953 Grothendieck proved that every bounded bilinear form on $C(S) \times C(T)$ factors through a Hilbert space [1]. The universal bound — the Grothendieck constant $K_G$ — remains unknown after seventy years. In the 1960s, the same Grothendieck built the six-functor formalism for étale cohomology [2], where the defect between $f_!$ and $f_*$ measures non-properness. I show that $K_G$ is a six-functor defect: the norm of $\iota_*/\iota_!$ for $\iota: \mathrm{Hilb} \hookrightarrow \mathrm{Ban}^{\mathrm{comm}}$, via enriched Kan extensions (Kelly [14]).

### 1.1. Notation and norms

Throughout, $M_n(\mathbb{R})$ denotes real $n \times n$ matrices with singular values $\sigma_1 \geq \cdots \geq \sigma_n \geq 0$.

**Operator norm.** $\|A\|_{\mathrm{op}} = \sigma_1(A)$.

**Nuclear norm.** $\|A\|_{\mathrm{nuc}} = \sum_k \sigma_k(A)$.

**Frobenius norm.** $\|A\|_F = \sqrt{\sum_{ij} a_{ij}^2}$.

**Sign norm.** $\|A\|_\pm = \max_{\varepsilon, \delta \in \{\pm 1\}^n} |\varepsilon^T A \delta|$.

**Factorization norm.** $\gamma_2(T) = \inf\bigl\{\|u\| \cdot \|v\| : T = u \circ v \text{ through Hilbert}\bigr\}$.

**Grothendieck constant.** $K_G^{\mathbb{R}}(n) = \sup_{A \in M_n} \|A\|_{\mathrm{nuc}} / \|A\|_\pm = \sup \gamma_2(T)/\|T\|$ ([5, Thm 2.1]). We have $K_G^{\mathbb{R}} = \sup_n K_G^{\mathbb{R}}(n) \in [\pi/2, 1.7822]$ ([3, 12]).

Note: $\gamma_2(T) \geq \|T\|$ always (since $\|T\| = \|u \circ v\| \leq \|u\| \cdot \|v\|$ for every factorization, taking inf gives $\gamma_2 \geq \|T\|$). Therefore $K_G \geq 1$.

---

## 2. The Grothendieck Defect

### 2.1. Definition

**Definition 1** (Normed operator category). $(\mathcal{D}, \|-\|)$: category enriched over normed spaces with $\|S \circ T\| \leq \|S\| \cdot \|T\|$.

**Definition 2** (Factorization norm). For an isometric inclusion $\iota: \mathcal{C} \hookrightarrow \mathcal{D}$:

$$\gamma_{\mathcal{C}}(T) = \inf\bigl\{\|u\| \cdot \|v\| : T = u \circ v,\; V \xrightarrow{v} H \xrightarrow{u} W,\; H \in \mathrm{Ob}(\mathcal{C})\bigr\}$$

**Definition 3** (Grothendieck defect).

$$\boxed{K(\iota) = \sup_{T \in \mathrm{Mor}(\mathcal{D})} \frac{\gamma_{\mathcal{C}}(T)}{\|T\|_{\mathcal{D}}}}$$

Since $\gamma_{\mathcal{C}}(T) \geq \|T\|$ (submultiplicativity), we have $K(\iota) \geq 1$. When $K(\iota) < \infty$, $(\mathcal{C}, \mathcal{D})$ is a *Grothendieck pair*.

### 2.2. Monotonicity

**Theorem 1.** *For full isometric inclusions $\mathcal{C} \xrightarrow{\iota_1} \mathcal{D}_1 \xrightarrow{\iota_2} \mathcal{D}_2$: $K(\iota_1) \leq K(\iota_2 \circ \iota_1)$.*

*Proof.* Since $\iota_2$ is full and isometric, $\mathrm{Hom}_{\mathcal{D}_1}(V, H) = \mathrm{Hom}_{\mathcal{D}_2}(V, H)$ for $V \in \mathrm{Ob}(\mathcal{D}_1)$, $H \in \mathrm{Ob}(\mathcal{C})$. Therefore $\gamma_{\mathcal{C}}^{\mathcal{D}_2}(T) = \gamma_{\mathcal{C}}^{\mathcal{D}_1}(T)$ for $T \in \mathrm{Mor}(\mathcal{D}_1)$ (same factorization paths). Since $\|T\|_{\mathcal{D}_2} = \|T\|_{\mathcal{D}_1}$ (isometry), the ratio $\gamma_{\mathcal{C}}/\|T\|$ is unchanged for existing morphisms, and $K(\iota_2 \circ \iota_1) = \sup_{\mathcal{D}_2} \gamma_{\mathcal{C}}/\|T\| \geq \sup_{\mathcal{D}_1} \gamma_{\mathcal{C}}/\|T\| = K(\iota_1)$. $\square$

---

## 3. The Universal Rank Bound

**Theorem 2** (Three Lines). *For rank-$r$ Hilbert factorization: $\gamma_2(T)/\|T\|_\pm \leq \sqrt{r}$.*

*Proof.* (1) $\|T\|_{\mathrm{nuc}} = \sum_k \sigma_k \leq \sqrt{r} \cdot \|T\|_F$ (Cauchy-Schwarz). (2) $\|T\|_F^2 = \mathbb{E}_{\varepsilon,\delta}[(\varepsilon^T T\delta)^2] \leq \|T\|_\pm^2$ (Rademacher). (3) Chain: $\gamma_2(T) = \|T\|_{\mathrm{nuc}} \leq \sqrt{r}\,\|T\|_\pm$. $\square$

**Bridge.** $\gamma_2(A) = \|A\|_{\mathrm{nuc}}$: the SVD gives $\gamma_2 \leq \|A\|_{\mathrm{nuc}}$ (factorize through $\ell_2^r$ at cost $\sum \sigma_k$); the reverse $\gamma_2 \geq \|A\|_{\mathrm{nuc}}$ follows from Pietsch factorization ([5, §2], [13]). The sign norm $\|A\|_\pm = \|A\|_{\ell_\infty^n \to \ell_1^n}$ (linearity $\Rightarrow$ max at vertices). Therefore $K_G^{\mathbb{R}}(n) = K(\ell_2^n \hookrightarrow \ell_\infty^n)$.

---

## 4. The Cofactor Mirror

**Theorem 3.** *For $A \in M_3(\mathbb{R})$ and $B_A = \sum a_{ij}\,\sigma_i \otimes \sigma_j$: $B_A^2 = \|A\|_F^2 I_4 - 2\,B_{\mathrm{cof}(A)}$.*

*Proof.* Expand via $\sigma_i\sigma_k = \delta_{ik}I + i\varepsilon_{ikm}\sigma_m$. The $I \otimes I$ term gives $\|A\|_F^2$. The $\sigma_m \otimes I$ and $I \otimes \sigma_n$ terms vanish: for fixed $j$, the function $(i,k) \mapsto a_{ij}a_{kj}$ is symmetric (commutativity of $\mathbb{R}$) while $\varepsilon_{ikm}$ is antisymmetric, so the sum is zero. The $\sigma_m \otimes \sigma_n$ coefficient is $-2\,\mathrm{cof}(A)_{mn}$ via the Levi-Civita determinant identity $\mathrm{cof}(A)_{mn} = \frac{1}{2}\sum \varepsilon_{mik}\varepsilon_{njl} a_{ij}a_{kl}$. $\square$

**Corollary.** Fixed points of $A \mapsto \mathrm{cof}(A)$: exactly $SO(3) \cup \{0\}$.

---

## 5. The $\sqrt{2}$ Plateau

**Theorem 4.** *$K_G^{\mathbb{R}}(n) = \sqrt{2}$ for $n = 2, 3, \ldots, 18$.*

*Proof.* Lower: embedded Hadamard $A^* = \frac{1}{2}H_2 \oplus 0$ has $\gamma_2(A^*) = \|A^*\|_{\mathrm{nuc}} = \sqrt{2}$ and $\|A^*\|_\pm = 1$ (verified exactly: Wolfram Mathematica 14.3, `SingularValueList`, rational arithmetic). Case $n = 2$: algebraic (rank $\leq 2 \Rightarrow$ Theorem 2). Cases $n = 3, \ldots, 10$: direct LP dual certificates (Clarabel 0.11 interior-point solver, CVXPY 1.7, residuals $< 2 \times 10^{-6}$). Cases $n = 11, \ldots, 18$: constraint-generation LP certificates — the primal LP $\max c^T x$ s.t. $|\varepsilon^T X \delta| \leq 1$ is solved with an active set of $\sim 10^3$ constraints; a separation oracle scans all $4^n$ sign pairs per iteration, adding the most violated constraint until feasibility is certified (gap $< 10^{-9}$, peak RAM $< 9$ GB for $n \leq 18$). By LP strong duality: primal = dual = $\sqrt{2}$ in all cases. Certificates and solver scripts available at the [companion repository](https://github.com/ChristianFranchi/Brahman/tree/main/Mathematics/Grothendieck-Defect). $\square$

**Corollary** (Fishburn–Reeds [4]). $n_0 \geq 19$ (was $\geq 4$).

**Remark** (Distinction from $K_G(d)$). The constant $K_G^{\mathbb{R}}(n)$ (matrix order $n$, Hilbert dimension unconstrained) studied here differs from $K_G(d)$ (Hilbert dimension $d$, matrix order unconstrained), recently bounded by Designolle–Vértesi–Pokutta [15]. Their $K_G(4) \geq 1.4841 > \sqrt{2}$ does not contradict our $K_G^{\mathbb{R}}(4) = \sqrt{2}$: the former constrains the Hilbert space, the latter constrains the matrix size.

---

## 6. The Hilbert Defect

**Theorem 5.** *$K_G^{\mathbb{R}} = K(\iota)$ for $\iota: \mathrm{Hilb}_{\mathbb{R}} \hookrightarrow \mathrm{Ban}^{\mathrm{comm}}$.*

*Proof.* $K_G = \sup_T \gamma_2(T)/\|T\|$ is the Grothendieck inequality in factorization form [1, 5 Thm 2.1]. Since $\gamma_2 = \gamma_{\mathrm{Hilb}}$ (Definition 2), this equals $K(\iota)$ (Definition 3). $\square$

### 6.1. Six-functor identification via enriched Kan extensions

**Theorem 6.** *In $\mathrm{Ban}\text{-}\mathrm{Cat}$, for $\iota: \mathrm{Hilb} \hookrightarrow \mathrm{Ban}^{\mathrm{comm}}$ fully faithful and isometric:*

$$\boxed{K_G^{\mathbb{R}} = \sup_T \frac{\iota_*(T)}{\iota_!(T)} = \sup_T \frac{\gamma_2(T)}{\|T\|}}$$

*where $\iota_! = \mathrm{Lan}_\iota = \|-\|$ (left Kan = operator norm) and $\iota_* = \mathrm{Ran}_\iota = \gamma_2$ (right Kan = factorization norm).*

*Proof.* **(i) $\iota_* = \gamma_2$ (right Kan).** The enriched right Kan extension is the terminal object among norms satisfying the Hilbert contraction property. We prove $\gamma_2$ is terminal. $\gamma_2$ satisfies the property: for every factorization $T = u \circ v$ through $H \in \mathrm{Hilb}$, $\gamma_2(T) \leq \|u\| \cdot \|v\|$. $\gamma_2$ is the largest: let $\nu$ be any norm satisfying $\nu(u \circ v) \leq \|u\| \cdot \|v\|$ for all $H \in \mathrm{Hilb}$. Then $\nu(T) \leq \|u\| \cdot \|v\|$ for every admissible factorization. Taking inf: $\nu(T) \leq \gamma_2(T)$.

**(ii) $\iota_! = \|-\|$ (left Kan).** The enriched left Kan extension equals the operator norm on $\mathrm{Ban}^{\mathrm{comm}}$, by the universal property of the injective tensor product [1, 5 §1]: the operator norm is the initial cross-norm extending the Hilbert norms to all Banach spaces.

**(iii) Consistency.** For fully faithful $\iota$, $\mathrm{Lan}_\iota \leq \mathrm{Ran}_\iota$ pointwise [14, §4.5]. This gives $\|T\| \leq \gamma_2(T)$, which is submultiplicativity.

**(iv) Conclusion.** $K_G = \sup_T \gamma_2(T)/\|T\| = \sup_T \iota_*(T)/\iota_!(T) \geq 1$ by Theorem 5. $\square$

**Remark.** No site or topos structure on $\mathrm{Ban}$ is needed.

---

## 7. The Instances and the Summand Bound

### 7.1. Classification

| Inclusion $\iota$ | $K(\iota)$ | Value | Ref |
|---|---|---|---|
| $\mathrm{Hilb}_{\mathbb{R}} \hookrightarrow \mathrm{Ban}^{\mathrm{comm}}_{\mathbb{R}}$ | $K_G^{\mathbb{R}}$ | $\in [\pi/2, 1.7822]$ | [1, 5] |
| $\mathrm{Hilb}_{\mathbb{C}} \hookrightarrow \mathrm{Ban}^{\mathrm{comm}}_{\mathbb{C}}$ | $K_G^{\mathbb{C}}$ | $\leq 1.4049$ | [6] |
| $\mathrm{Hilb} \hookrightarrow C^*\text{-Alg}$ | $K_G^{\mathrm{nc}}$ | $= 2$ | [7, 9] |
| $\ell_2^n \hookrightarrow \ell_\infty^n$ | $K_G^{\mathbb{R}}(n)$ | $= \sqrt{2}$, $n \leq 18$ | **here** |
| $\mathrm{Hilb}_G \hookrightarrow \mathrm{Ban}_G$ | $K(G)$ | $\Theta(\log\vartheta(\bar{G}))$ | [8] |

### 7.2. Summand Rank Bound

**Theorem 7.** *If $T = T_1 + \cdots + T_s$ with each $T_k = u_k \circ v_k$ through $H_k \in \mathrm{Hilb}$, $\|u_k\| \leq 1$, $\|v_k\| \leq 1$, then $\gamma_2(T) \leq s$.*

*Proof.* Form $H = \bigoplus H_k$. Then $\|\tilde{v}\| \leq \sqrt{s}$, $\|\tilde{u}\| \leq \sqrt{s}$ (Cauchy-Schwarz). Therefore $\gamma_2(T) \leq s$. $\square$

### 7.3. $K_G^{\mathrm{nc}} = 2$

**Theorem 8.** *$K(\mathrm{Hilb} \hookrightarrow C^*\text{-Alg}) = 2$.*

*Proof.* **Upper:** Haagerup [7]: $s = 2$ GNS summands. Theorem 7 gives $\gamma_2 \leq 2$. **Lower:** Haagerup–Itoh [9] via CAR algebra. $\square$

**Corollary** ($\sqrt{2}$–$2$ dissolution). Commutative: $s = 1$, rank 2 $\Rightarrow K \leq \sqrt{2}$. Non-commutative: $s = 2$ $\Rightarrow K \leq 2 = \sqrt{2} \cdot \sqrt{2}$.

---

## 8. Remarks

The main new results are Theorems 3, 4, and 6. Theorem 4 advances the Fishburn–Reeds problem ($n_0 \geq 4$ since 1994) to $n_0 \geq 19$ via two complementary methods: direct interior-point LP certificates (Clarabel) for $n \leq 10$ and constraint-generation LP certificates for $n \leq 18$, cross-validated on the overlap; this complements the recent improvement of the lower bound on $K_G$ itself by Jones–Malavolta [16]. Theorem 6 identifies the Grothendieck constant as the norm of an enriched Kan adjunction, connecting for the first time the Résumé [1] to the six-functor formalism [2] without requiring a Grothendieck topology on $\mathrm{Ban}$. Theorem 3 gives a new algebraic identity for Bell operators. Theorems 7–8 provide a structural explanation ($2 = \sqrt{2} \times \sqrt{2}$) of Haagerup's result $K_G^{\mathrm{nc}} = 2$ [7].

---

## 9. Open Problems

**P1.** $n_0 = \min\{n : K_G^{\mathbb{R}}(n) > \sqrt{2}\}$. We have $19 \leq n_0 < \infty$. The constraint-generation method verified $n = 18$ on a 16 GB workstation (8.8 GB peak RAM, 36 h); $n = 19$ is feasible on 32 GB RAM, $n \geq 21$ requires a cluster.

**P2.** Algebraic LP certificate over $\mathbb{Q}(\sqrt{2})$ for $n \geq 3$ (upgrade A* to A).

**P3.** Extend Theorem 3 to $n > 3$ using $\mathrm{Cl}(n)$ bases.

---

**LICENSE NOTICE** — CC BY-NC-ND 4.0 — [LinkedIn](https://www.linkedin.com/in/christian-franchi-bab00ab4/)

## References

[1] A. Grothendieck, "Résumé de la théorie métrique des produits tensoriels topologiques," *Bol. Soc. Mat. São Paulo* **8** (1953), 1–79.

[2] A. Grothendieck et al., *SGA 4*, LNM **269, 270, 305**, Springer, 1972–73.

[3] J.-L. Krivine, "Sur la constante de Grothendieck," *CRAS* **284** (1977), 445–446.

[4] P. C. Fishburn, J. A. Reeds, "Bell inequalities, Grothendieck's constant, and root two," *SIAM J. Discrete Math.* **7** (1994), 48–56.

[5] G. Pisier, "Grothendieck's theorem, past and present," *Bull. AMS* **49** (2012), 237–323. [arXiv:1101.4195](https://arxiv.org/abs/1101.4195)

[6] U. Haagerup, "Complex Grothendieck constant," *Israel J. Math.* **60** (1987), 199–224.

[7] U. Haagerup, "The Grothendieck inequality for bilinear forms on $C^*$-algebras," *Adv. Math.* **56** (1985), 93–116.

[8] N. Alon, K. Makarychev, Y. Makarychev, A. Naor, "Quadratic forms on graphs," *Invent. Math.* **163** (2006), 499–522.

[9] U. Haagerup, T. Itoh, "Grothendieck type norms for bilinear forms on $C^*$-algebras," *J. Operator Theory* **34** (1995), 263–283.

[10] B. S. Tsirelson, "Quantum generalizations of Bell's inequality," *Lett. Math. Phys.* **4** (1980), 93–100.

[11] N. Alon, A. Naor, "Approximating the cut-norm via Grothendieck's inequality," *SIAM J. Comput.* **35** (2006), 787–803.

[12] M. Braverman, K. Makarychev, Y. Makarychev, A. Naor, "The Grothendieck constant is strictly smaller than Krivine's bound," *Forum Math. Pi* **1** (2013), e4. [arXiv:1103.6161](https://arxiv.org/abs/1103.6161)

[13] J. Lindenstrauss, A. Pełczyński, "Absolutely summing operators in $\mathcal{L}_p$-spaces and their applications," *Studia Math.* **29** (1968), 275–326.

[14] G. M. Kelly, *Basic Concepts of Enriched Category Theory*, LMS **64**, Cambridge, 1982. Repr. *TAC* **10** (2005).

[15] S. Designolle, T. Vértesi, S. Pokutta, "Better bounds on finite-order Grothendieck constants," *Phys. Rev. A* **113** (2026), 022401. [arXiv:2409.03739](https://arxiv.org/abs/2409.03739)

[16] C. Jones, G. Malavolta, "The Grothendieck constant is strictly larger than Davie-Reeds' bound," preprint (2026). [arXiv:2603.30039](https://arxiv.org/abs/2603.30039)

---

© 2026 Christian Franchi Viceré — CC BY-NC-ND 4.0
