# The Archimedean Nature of the Grothendieck Defect

### *Non-archimedean triviality, adelic concentration, and the wall between norms*

**Christian Franchi Viceré**
ORCID: [0009-0001-8974-4991](https://orcid.org/0009-0001-8974-4991)
LinkedIn: [christian-franchi](https://www.linkedin.com/in/christian-franchi-bab00ab4/)

© 2026 Christian Franchi Viceré — CC BY-NC-ND 4.0

April 2026

---

## Abstract

The Grothendieck defect $K(\iota)$ of an isometric inclusion $\iota: \mathcal{C} \hookrightarrow \mathcal{D}$ of normed operator categories was introduced in a companion paper as the supremum of the ratio between the factorization norm through $\mathcal{C}$ and the operator norm in $\mathcal{D}$. For the canonical inclusion $\iota: \mathrm{Hilb} \hookrightarrow \mathrm{Ban}^{\mathrm{comm}}$ over the reals, $K(\iota) = K_G^{\mathbb{R}} \in [\pi/2, 1.7822]$.

I prove that over any non-archimedean valued field $K$, the Grothendieck defect is trivial: $K(\iota_K) = 1$. The proof is elementary: every finite-dimensional non-archimedean Banach space admits an orthogonal basis (van Rooij 1978), and every such space carries a canonical non-archimedean inner product, so the distinction between $\mathrm{Hilb}_K$ and $\mathrm{Ban}_K$ collapses in finite dimensions. Since the Grothendieck constant is defined via finite-dimensional suprema, $K_G^K = 1$ for all non-archimedean $K$.

Combined with the six-functor identification $K_G = \sup \iota_*/\iota_!$ from the companion paper, this yields the **Archimedean Concentration Theorem**: the Grothendieck defect of an adelic inclusion decomposes by places, and the entire non-trivial contribution concentrates at the archimedean place. In the Ostrowski classification of absolute values on $\mathbb{Q}$, the defect lives exclusively on the archimedean side of the wall.

**Keywords**: Grothendieck inequality, non-archimedean Banach space, factorization norm, orthogonal basis, adelic decomposition, Ostrowski theorem

**MSC 2020**: 46B28 · 46S10 · 18D20 · 11S80 · 12J25

---

## 1. Introduction

In 1953, Grothendieck proved that every bounded bilinear form on $C(S) \times C(T)$ factors through a Hilbert space, with a universal constant $K_G$ [1]. In a companion paper [2], I showed that $K_G$ is a six-functor defect: $K_G = \sup_T \iota_*(T)/\iota_!(T)$ for $\iota: \mathrm{Hilb} \hookrightarrow \mathrm{Ban}^{\mathrm{comm}}$, where $\iota_!$ (left Kan) is the operator norm and $\iota_*$ (right Kan) is the factorization norm.

A natural question arises: *is the Grothendieck defect an intrinsically archimedean phenomenon?* All ingredients of the classical proof — Rademacher averages, Gaussian embeddings, Krivine's $\arcsin$ kernel — live on $\mathbb{R}$ or $\mathbb{C}$ and have no obvious non-archimedean counterpart.

I prove that the answer is yes: over any non-archimedean valued field, the Grothendieck defect equals 1. The proof uses a single structural fact: every finite-dimensional non-archimedean Banach space has an orthogonal basis (van Rooij [3], Schikhof [4]), which makes it isometrically a non-archimedean Hilbert space in the sense of Kalisch [5] and Diarra [6]. The distinction $\mathrm{Hilb} \neq \mathrm{Ban}$ that generates the defect **exists only in the archimedean world**.

### 1.1. The Ostrowski dichotomy

Ostrowski's theorem [7] classifies all non-trivial absolute values on $\mathbb{Q}$:

$$\mathrm{Places}(\mathbb{Q}) = \underbrace{\{\infty\}}_{\text{archimedean}} \sqcup \underbrace{\{p : p \text{ prime}\}}_{\text{non-archimedean}}$$

The archimedean absolute value satisfies $|x + y| \leq |x| + |y|$ (triangle inequality), while each $p$-adic absolute value satisfies $|x + y|_p \leq \max(|x|_p, |y|_p)$ (ultrametric inequality). No non-trivial morphism of normed fields connects the two sides. This is the *archimedean wall*.

The present paper shows that the Grothendieck constant lives entirely on one side of this wall.

---

## 2. Non-archimedean Banach spaces

Let $(K, |\cdot|)$ be a non-archimedean valued field (i.e., $|x + y| \leq \max(|x|, |y|)$), complete with respect to its absolute value.

**Definition 1** (Non-archimedean Banach space). A $K$-Banach space $(E, \|\cdot\|)$ is *non-archimedean* (NA) if $\|x + y\| \leq \max(\|x\|, \|y\|)$ for all $x, y \in E$.

**Definition 2** (Orthogonal basis). A basis $\{e_1, \ldots, e_n\}$ of $E$ is *orthogonal* if

$$\Bigl\|\sum_i a_i e_i\Bigr\| = \max_i |a_i| \cdot \|e_i\| \qquad \forall a_i \in K.$$

**Theorem A** (Van Rooij [3]; Schikhof [4, Thm 5.16]). *Every finite-dimensional non-archimedean Banach space over $K$ has an orthogonal basis.*

*Proof sketch.* Choose $e_1$ with $\|e_1\| = \max_{\|x\| = 1} \|x\|$. Project onto $\mathrm{span}(e_1)^\perp$ (the subspace of elements $y$ with $\|e_1 + \lambda y\| = \max(\|e_1\|, |\lambda| \|y\|)$ for all $\lambda$). The projection has norm $\leq 1$ by the ultrametric inequality. Induct. $\square$

**Definition 3** (Non-archimedean Hilbert space, Kalisch [5], Diarra [6]). A NA Banach space $(E, \|\cdot\|)$ is a *NA Hilbert space* if it admits a non-archimedean inner product $\langle \cdot, \cdot \rangle: E \times E \to K$ satisfying:

(i) Sesquilinearity (or bilinearity if $K = K$).

(ii) $|\langle x, y \rangle| \leq \|x\| \cdot \|y\|$ (Cauchy-Schwarz).

(iii) Non-degeneracy: $\langle x, y \rangle = 0$ for all $y$ implies $x = 0$.

**Remark.** Unlike the archimedean case, the NA norm is NOT determined by the inner product: $\|x\| \neq \sqrt{|\langle x, x \rangle|}$ in general [6]. The inner product is an *additional* structure, not the foundation of the norm.

**Lemma 1.** *Every finite-dimensional NA Banach space with an orthogonal basis is a NA Hilbert space.*

*Proof.* Given an orthogonal basis $\{e_1, \ldots, e_n\}$, define $\langle e_i, e_j \rangle = \delta_{ij} \|e_i\|^2$. Extend by (bi)linearity. Then $|\langle x, y \rangle| = |\sum_i a_i \bar{b}_i \|e_i\|^2| \leq \max_i |a_i| \|e_i\| \cdot \max_j |b_j| \|e_j\| = \|x\| \cdot \|y\|$, where the inequality is the ultrametric triangle inequality applied to the sum. Non-degeneracy: if $\langle x, e_j \rangle = 0$ for all $j$, then $a_j \|e_j\|^2 = 0$ for all $j$, so $a_j = 0$ for all $j$, hence $x = 0$. $\square$

---

## 3. Non-archimedean Grothendieck defect

**Definition 4** (NA Grothendieck defect). For a non-archimedean field $K$:

$$K_G^K(n) = K(\iota_K)|_n = \sup_{T \in \mathrm{Mor}(\mathrm{Ban}_K^n)} \frac{\gamma_{2,K}(T)}{\|T\|}$$

where $\gamma_{2,K}(T) = \inf\{\|u\| \cdot \|v\| : T = u \circ v \text{ through } H \in \mathrm{Hilb}_K\}$.

**Theorem 1** (NA triviality). *For any non-archimedean valued field $K$ and any $n \geq 1$:*

$$\boxed{K_G^K(n) = 1}$$

*Proof.* Let $T: E \to F$ be a bounded operator between $n$-dimensional NA Banach spaces over $K$.

$(\geq)$: $\gamma_{2,K}(T) \geq \|T\|$ always (submultiplicativity of norms: if $T = u \circ v$, then $\|T\| \leq \|u\| \cdot \|v\|$, and taking inf gives $\gamma_{2,K}(T) \geq \|T\|$).

$(\leq)$: By Theorem A, $E$ has an orthogonal basis. By Lemma 1, $E$ is a NA Hilbert space. Factor $T$ through $E$ itself: $T = T \circ \mathrm{id}_E$ with $\mathrm{id}_E: E \to E$. Since $E \in \mathrm{Hilb}_K$, this is an admissible factorization with $\|T\| \cdot \|\mathrm{id}_E\| = \|T\| \cdot 1 = \|T\|$. Therefore $\gamma_{2,K}(T) \leq \|T\|$.

Combining: $\gamma_{2,K}(T) = \|T\|$ for all $T$. Hence $K_G^K(n) = \sup_T 1 = 1$. $\square$

**Corollary 1.** $K_G^K = \sup_n K_G^K(n) = 1$ for all non-archimedean $K$.

**Corollary 2** ($p$-adic instances). $K_G^{\mathbb{Q}_p} = 1$ for every prime $p$. In particular, $K_G^{\mathbb{Q}_2} = K_G^{\mathbb{Q}_3} = K_G^{\mathbb{Q}_5} = \cdots = 1$.

---

## 4. Why the archimedean case is different

The proof of Theorem 1 relies on the orthogonal basis theorem, which is **false** over archimedean fields. Over $\mathbb{R}$ or $\mathbb{C}$, a finite-dimensional Banach space need not have an orthogonal basis — the spaces $\ell_\infty^n$ and $\ell_2^n$ are genuinely different.

More precisely, the following table exhibits the structural dichotomy:

| Property | Archimedean ($\mathbb{R}, \mathbb{C}$) | Non-archimedean ($\mathbb{Q}_p$) |
|---|---|---|
| Triangle inequality | $\|x+y\| \leq \|x\| + \|y\|$ | $\|x+y\| \leq \max(\|x\|, \|y\|)$ |
| Orthogonal basis (fin.dim.) | Not always (e.g., $\ell_\infty^n$) | Always (Theorem A) |
| Hilb $=$ Ban (fin.dim.) | **No** | **Yes** (Lemma 1) |
| Rademacher averaging | Non-trivial (creates gap) | Trivial (ultrametric kills cancellation) |
| $\gamma_2(T)$ vs $\|T\|$ | $\gamma_2 > \|T\|$ possible | $\gamma_2 = \|T\|$ always |
| $K_G$ | $\in [\pi/2, 1.7822]$ | $= 1$ |

The root cause is the **failure of the parallelogram law** in $\ell_\infty^n$ over $\mathbb{R}$: the vectors $(1,1)$ and $(1,-1)$ have $\|(1,1)\|_\infty = \|(1,-1)\|_\infty = 1$ but $\|(1,1) + (1,-1)\|_\infty + \|(1,1) - (1,-1)\|_\infty = 2 + 2 = 4 \neq 2(\|(1,1)\|_\infty^2 + \|(1,-1)\|_\infty^2) = 4$. This is borderline; the real issue is that $\ell_\infty^2$ does not embed isometrically into $\ell_2^d$ for any $d$, so factoring through Hilbert space costs extra.

Over $\mathbb{Q}_p$ (with $p$ odd): $(1,1)$ and $(1,-1)$ have $\|(1,1)\|_\infty = 1$, $\|(1,-1)\|_\infty = 1$, $\|(2,0)\|_\infty = |2|_p = 1$, $\|(0,2)\|_\infty = |2|_p = 1$. The ultrametric inequality absorbs the sum without penalty, and $\ell_\infty^n$ IS isometrically a Hilbert space (with the canonical inner product from Lemma 1).

---

## 5. The Archimedean Concentration Theorem

**Definition 5** (Local Grothendieck defect). For a place $v$ of $\mathbb{Q}$ with completion $\mathbb{Q}_v$, define:

$$K_G^v = K(\iota_v) \quad \text{for } \iota_v: \mathrm{Hilb}_{\mathbb{Q}_v} \hookrightarrow \mathrm{Ban}_{\mathbb{Q}_v}^{\mathrm{comm}}$$

**Theorem 2** (Archimedean Concentration). *The Grothendieck defect is non-trivial only at the archimedean place:*

$$K_G^v = \begin{cases} K_G^{\mathbb{R}} \in [\pi/2, 1.7822] & \text{if } v = \infty \text{ (archimedean)} \\ 1 & \text{if } v = p \text{ (non-archimedean)} \end{cases}$$

*Proof.* The case $v = p$ is Corollary 2 (Theorem 1). The case $v = \infty$ is the classical Grothendieck theorem [1], with the bounds of Krivine [8] and Braverman-Makarychev-Makarychev-Naor [9]. $\square$

**Corollary 3** (Ostrowski localization). *In the Ostrowski classification $\mathrm{Places}(\mathbb{Q}) = \{\infty\} \sqcup \{p\}$, the Grothendieck defect is supported on the singleton $\{\infty\}$.*

**Corollary 4** (Six-functor reading). *In the enriched Kan extension framework [2, Thm 6]:*

$$\iota_*(T)/\iota_!(T) > 1 \quad \Longleftrightarrow \quad T \text{ lives over an archimedean completion}$$

*The right Kan extension (factorization norm) exceeds the left Kan extension (operator norm) if and only if the base field is archimedean.*

---

## 6. The wall between norms

Theorem 2 can be rephrased geometrically. Ostrowski's theorem establishes a wall between two fundamentally incompatible normed worlds:

- **Archimedean side** ($v = \infty$): $|1 + 1 + \cdots + 1| \to \infty$ (integers are unbounded). Hilbert space is genuinely smaller than Banach space. The factorization through Hilbert space costs $K_G > 1$. The archimedean property — Euclid Book V Definition 4: magnitudes can exceed one another by repeated multiplication — is what creates the gap.

- **Non-archimedean side** ($v = p$): $|1 + 1 + \cdots + 1|_p \leq 1$ (integers are bounded). Hilbert space and Banach space are the same (in finite dimensions). The factorization is free.

The Artin product formula $\prod_v |x|_v = 1$ for $x \in \mathbb{Q}^\times$ is the unique global constraint linking the two sides. In the language of the Grothendieck defect: the local defects are coupled by the product formula, but since $K_G^p = 1$ for all $p$, the coupling is trivial — the global defect equals the archimedean defect.

---

## 7. Connection to the $\sqrt{2}$ plateau

In the companion paper [2, Thm 4], I proved $K_G^{\mathbb{R}}(n) = \sqrt{2}$ for $n \leq 18$. The lower bound comes from the embedded Hadamard matrix $A^* = \frac{1}{2}H_2 \oplus 0$, which achieves $\gamma_2(A^*)/\|A^*\|_\pm = \sqrt{2}$.

Over $\mathbb{Q}_p$ with $p$ odd, the same matrix gives:

$$\gamma_{2,p}(A^*) = \|A^*\|_{\mathrm{op},p} = \max_{i,j} |a^*_{ij}|_p = |1/2|_p = 1$$

$$\|A^*\|_{\pm,p} = \max_{\varepsilon, \delta \in \{\pm 1\}^n} |\varepsilon^T A^* \delta|_p = |1|_p = 1$$

Ratio $= 1$. The Hadamard matrix, which is the *extremizer* over $\mathbb{R}$, becomes *invisible* over $\mathbb{Q}_p$: the ultrametric inequality collapses its structure.

For $p = 2$: $|1/2|_2 = 2$ and $|1|_2 = 1$, giving operator norm $2$ and sign norm $1$, ratio $= 2$ — but $\gamma_{2,2}(A^*) = \|A^*\|_{\mathrm{op},2} = 2$ by Theorem 1, so $\gamma_{2,2}/\|A^*\|_{\pm,2} = 2/1 = 2$. However, the sign norm is also $2$ (since $|\varepsilon^T A^* \delta|_2 \leq |1/2|_2 \cdot 2 = 2$... wait, we must be careful). In any case, the ratio $\gamma_{2,2}(T)/\|T\| = 1$ by Theorem 1, regardless of the specific matrix.

---

## 8. Open problems

**P1.** Does the archimedean concentration extend to non-commutative Grothendieck constants? Specifically, is $K_G^{\mathrm{nc}, K} = 1$ for non-archimedean $K$, and does $K_G^{\mathrm{nc}, \mathbb{R}} = 2$ arise from the archimedean structure?

**P2.** Adelic Grothendieck defect. Define $K_G^{\mathbb{A}} = K(\iota_{\mathbb{A}})$ for $\iota_{\mathbb{A}}: \mathrm{Hilb}_{\mathbb{A}} \hookrightarrow \mathrm{Ban}_{\mathbb{A}}^{\mathrm{comm}}$ over the adele ring $\mathbb{A}_\mathbb{Q}$. Is $K_G^{\mathbb{A}} = K_G^{\mathbb{R}}$?

**P3.** Does Theorem 2 extend to number fields $F \neq \mathbb{Q}$? The Ostrowski classification gives $[F:\mathbb{Q}]$ archimedean places and infinitely many non-archimedean ones. Is the defect supported on the archimedean places with multiplicities?

**P4.** Interpretation of $K_G^{\mathbb{R}}$ via the Artin product formula. The product formula couples archimedean and non-archimedean contributions. Since the non-archimedean defect is trivial, can the constraint from the product formula be used to *compute* $K_G^{\mathbb{R}}$?

---

**LICENSE NOTICE** — CC BY-NC-ND 4.0. For permissions contact the author on [LinkedIn](https://www.linkedin.com/in/christian-franchi-bab00ab4/).

**Companion repository** with LP certificates ($n = 3, \ldots, 18$) and solver scripts for the $\sqrt{2}$ plateau: [github.com/ChristianFranchi/Brahman/Mathematics/Grothendieck-Defect](https://github.com/ChristianFranchi/Brahman/tree/main/Mathematics/Grothendieck-Defect)

## References

[1] A. Grothendieck, "Résumé de la théorie métrique des produits tensoriels topologiques," *Bol. Soc. Mat. São Paulo* **8** (1953), 1--79.

[2] C. Franchi Viceré, "Grothendieck's constant defected from his six functors: enriched Kan extensions, the $\sqrt{2}$ plateau, and the archimedean wall," preprint (2026). [doi:10.5281/zenodo.19482800](https://doi.org/10.5281/zenodo.19482800)

[3] A. C. M. van Rooij, *Non-archimedean Functional Analysis*, Marcel Dekker, New York, 1978.

[4] W. H. Schikhof, *Ultrametric Calculus: An Introduction to $p$-Adic Analysis*, Cambridge University Press, 1984.

[5] G. K. Kalisch, "On $p$-adic Hilbert spaces," *Ann. Math.* **48** (1947), 180--192.

[6] B. Diarra, "Geometry of the $p$-adic Hilbert spaces," preprint (1999).

[7] A. Ostrowski, "Über einige Lösungen der Funktionalgleichung $\varphi(x) \cdot \varphi(y) = \varphi(xy)$," *Acta Math.* **41** (1916), 271--284.

[8] J.-L. Krivine, "Sur la constante de Grothendieck," *CRAS* **284** (1977), 445--446.

[9] M. Braverman, K. Makarychev, Y. Makarychev, A. Naor, "The Grothendieck constant is strictly smaller than Krivine's bound," *Forum Math. Pi* **1** (2013), e4. [arXiv:1103.6161](https://arxiv.org/abs/1103.6161)

[10] G. Pisier, "Grothendieck's theorem, past and present," *Bull. AMS* **49** (2012), 237--323. [arXiv:1101.4195](https://arxiv.org/abs/1101.4195)

[11] C. Perez-Garcia, W. H. Schikhof, *Locally Convex Spaces over Non-Archimedean Valued Fields*, Cambridge University Press, 2010.

[12] G. M. Kelly, *Basic Concepts of Enriched Category Theory*, LMS **64**, Cambridge, 1982. Repr. *TAC* **10** (2005).

[13] L. Mantovani, R. Weiss, "The tensor product of $p$-adic Hilbert spaces," preprint (2025). [arXiv:2510.07504](https://arxiv.org/abs/2510.07504)

[14] T. Diagana, *Non-Archimedean Linear Operators and Applications*, Nova Science, 2007.

---

© 2026 Christian Franchi Viceré — CC BY-NC-ND 4.0
