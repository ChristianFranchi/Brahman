# Literature Deep Search — Conjecture D (Bohr-Lawvere Bridge)

**Compendium for:** *Gödel ≡ Bell ≡ Kochen–Specker* (Franchi Viceré 2026, v5.3) · Appendix D
**Last updated:** 2026-05-13

---

## Scope

Conjecture D states that the abstract Bohr-like universe structure encoding the Bohr topos $\mathbf{T}_A = [\mathcal{C}(A), \mathbf{Set}]$ of any unital $C^*$-algebra $A$ with $\dim \mathcal{H} \geq 3$ admits a Lawvere obstruction that yields the Kochen–Specker theorem as a structural corollary. This document tabulates the literature.

## Canonical sources (⊢ peer-reviewed)

| Ref | Year | Source | Contribution |
|:---:|:---:|:---|:---|
| KS67 | 1967 | *J. Math. Mech.* 17 | Kochen–Specker theorem (original) |
| BvN36 | 1936 | *Ann. Math.* 37 | Birkhoff-von Neumann quantum lattice non-Boolean |
| IB98 | 1998 | *Int. J. Theor. Phys.* 37 | Topos perspective on KS, I |
| HLS09 | 2009 | *Comm. Math. Phys.* 291 | Bohr topos $\Omega_A$ is non-trivial Heyting |
| CHLS09 (N1) | 2009 | *Found. Phys.* 39 | Intuitionistic quantum logic for $M_n(\mathbb{C})$ |
| DI08 | 2008 | *J. Math. Phys.* 49 | Daseinisation as topos-theoretic operation |
| BM06 | 2006 | *Ann. Pure Appl. Logic* 137 | Constructive Gelfand duality (globalised) |
| CS08 | 2008 | *Math. Proc. Camb. Phil. Soc.* 147 | Constructive Gelfand duality for $C^*$-algebras |
| AB11 | 2011 | *New J. Phys.* 13:113036 | Sheaf-theoretic contextuality / non-locality (used for Cor. C) |
| Gle57 | 1957 | *J. Math. Mech.* 6 | Gleason's theorem (uniqueness of quantum measure) |
| Mer90 | 1990 | *Phys. Rev. Lett.* 65 | Simple unified form of major no-hidden-variables theorems |
| Law69 | 1969 | *Lect. Notes Math.* 92 | Lawvere diagonal lemma |

## Supplementary (⊨ arXiv-only, used as additional evidence)

| Ref | arXiv | Note |
|:---:|:---|:---|
| LD18 | [1511.00950](https://arxiv.org/abs/1511.00950) | Many mathematical faces of Mermin's proof of KS — supplementary to Mer90 |
| Hen18 | [1411.0898](https://arxiv.org/abs/1411.0898) | Localic metric spaces & localic Gelfand duality — backed by BM06 + CS08 |

## Synthesis

The bridge from `BohrLikeUniverse` data pack to the Lawvere obstruction proceeds:

1. **Substrate:** HLS09 + CHLS09 establish that $\Omega_A$ is a non-trivial Heyting algebra for $\dim \mathcal{H} \geq 3$.
2. **Daseinisation:** DI08 supplies the binary operation `daseinise : Spec → Spec → Spec` on the spectral type.
3. **CCC step:** Law69 supplies the diagonal lemma in any cartesian closed category.
4. **Obstruction:** No weakly point-surjective $\varphi : \mathrm{Spec} \to \Omega^{\mathrm{Spec}}$ exists — this is Theorem A specialised. Kochen–Specker (no global section of spectral presheaf) follows.
5. **Bell corollary:** AB11 Theorem 8.1 reduces Bell non-locality to KS contextuality on the composite Bohr topos $\mathbf{T}_{A \otimes B}$.

Mer90 + LD18 supply alternative formulations of KS; BvN36 + Gle57 anchor the non-Boolean quantum lattice structure.

## Conclusion

Conjecture D is resolved at the abstract structural level by exhibiting `BohrLikeUniverse` with kernel-verified Lean 4 certificate (Appendix D, live re-verified Appendix H). Corollary C (Bell) inherits ⊨ status pending Mathlib4 composite-Bohr-topos formalisation. No ⊢ claim depends on arXiv-only sources.

© 2026 Christian Franchi Viceré — CC BY-NC-ND 4.0
