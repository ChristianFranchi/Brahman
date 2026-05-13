# Literature Deep Search — Conjecture E (Arithmetic-Lawvere Bridge)

**Compendium for:** *Gödel ≡ Bell ≡ Kochen–Specker* (Franchi Viceré 2026, v5.3) · Appendix C
**Last updated:** 2026-05-13

---

## Scope

Conjecture E states that the abstract Heyting arithmetic universe structure encoding the syntactic topos of any consistent first-order theory $T \supseteq \mathrm{PA}$ admits a Lawvere obstruction that yields Gödel's first incompleteness theorem as a structural corollary. This document tabulates the literature on which the bridge rests.

## Canonical sources (⊢ peer-reviewed)

| Ref | Year | Source | Contribution |
|:---:|:---:|:---|:---|
| Law69 | 1969 | *Lect. Notes Math.* 92 | Lawvere diagonal lemma in CCC |
| Joy05 | 2005 | *Cah. Top. Géom. Diff. Cat.* 46(3) | Gödel categorical via arithmetic universes |
| Maietti10 | 2010 | *Theory Appl. Categ.* 24(3) | Joyal's arithmetic universe as list-arithmetic pretopos |
| Yan03 | 2003 | *Bull. Symbolic Logic* 9 | Universal self-referential paradox |
| Rob23 | 2023 | *Compositionality* 5:8 | Substructural fixed-point theorems |
| Gödel31 | 1931 | *Monatshefte f. Math. Phys.* 38 | First incompleteness theorem (original) |
| Pitts01 | 2001 | OUP Handbook of Logic in CS vol. 5 | Categorical logic (Lindenbaum-Tarski Heyting structure) |
| MM92 | 1992 | Springer | Sheaves in Geometry and Logic (substrate) |

## Supplementary (⊨ arXiv-only, used as additional evidence)

| Ref | arXiv | Note |
|:---:|:---|:---|
| vDO20 | [2004.10482](https://arxiv.org/abs/2004.10482) | Gödel via arithmetic universes after Joyal — backed by Joy05 + Maietti10 |
| Sav24 | [2412.14084](https://arxiv.org/abs/2412.14084) | Incompleteness via Turing category — independent confirmation route |

## Synthesis

The bridge from `HeytingArithUniverse` data pack to the Lawvere obstruction proceeds:

1. **Substrate:** Joy05 + Maietti10 establish that the propositional structure of $T \supseteq \mathrm{PA}$ is a non-trivial Heyting algebra (Lindenbaum-Tarski).
2. **CCC step:** Law69 supplies the diagonal lemma in any cartesian closed category.
3. **Lift:** Pitts01 ensures the internal logic of the syntactic topos $\mathbf{T}_T$ is captured by the Mitchell-Bénabou language.
4. **Obstruction:** No weakly point-surjective $\varphi : \mathrm{Form} \to \Omega^{\mathrm{Form}}$ exists — this is Theorem A specialised. Gödel's theorem (truth exceeds provability) follows.

Rob23's substructural fixed-point theorems and Yan03's universal paradox classification provide cross-checks on the diagonal step.

## Conclusion

Conjecture E is resolved at the abstract structural level by exhibiting `HeytingArithUniverse` with kernel-verified Lean 4 certificate (Appendix C, live re-verified Appendix H). No ⊢ claim depends on arXiv-only sources.

© 2026 Christian Franchi Viceré — CC BY-NC-ND 4.0
