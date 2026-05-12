# Gödel–Bell — Categorical Equivalence Certificates

Machine-verified certificates for the categorical-substrate result:

> *Theorem A — Universal Lawvere Obstruction:* in any topos with non-trivial Heyting subobject classifier, no weakly point-surjective morphism $\varphi: A \to \Omega^A$ exists.

Set-theoretic instance (Lean 4) + three finite-Heyting witnesses (Wolfram).

**Author:** Christian Franchi Viceré · ORCID [0009-0001-8974-4991](https://orcid.org/0009-0001-8974-4991) · [LinkedIn](https://www.linkedin.com/in/christian-franchi-bab00ab4/)
**License:** CC BY-NC-ND 4.0
**Priority stamp:** 2026-05-11

## Path note

This folder is available at two equivalent paths:

- **Canonical:** `Mathematics/Gödel-Bell_equivalence/` (source of truth)
- **Mirror:** `Muons/Gödel-Bell_equivalence/` (auto-synced by GitHub Action [`mirror-mathematics-to-muons.yml`](../../.github/workflows/mirror-mathematics-to-muons.yml))

Both contain byte-identical files. Always edit only the canonical path.

## Files

| File | Verifier | Status |
|:-----|:---------|:------:|
| `certificate \| Bell-Godel Lean4 verification.lean` | Lean 4 kernel, pure core (no Mathlib) | ⊢ exit 0, 5988 ms, 0 sorry |
| `certificate \| Bell-Godel Wolfram verification.wl` | Wolfram Mathematica kernel | ⊢ exit 0, 4533 ms |
| `certificate \| Bell-Godel verification log.json` | execution metadata | — |

## Lean 4 declarations verified

| Name | Paper reference | Status |
|:-----|:----------------|:------:|
| `heyting_neg_no_fixed_point` | Lemma 3.1 | ⊢ |
| `lawvere_set` | Lemma 3.2 (Set instance) | ⊢ |
| `lawvere_no_wps` | Corollary 3.3 (contrapositive) | ⊢ |
| `universal_lawvere_obstruction_set` | Theorem A — Set instance | ⊢ |

No `sorry`, no axiom beyond Lean core.

## Wolfram witnesses

| Witness | Type | Non-fixed-point search |
|:--------|:-----|:-----------------------|
| 3-element chain $0<1<2$ | non-Boolean Heyting | $\varnothing$ ✓ |
| 5-element chain | non-Boolean Heyting | $\varnothing$ ✓ |
| $P(\{1,2\})$ Boolean diamond | Boolean (hence Heyting) | $\varnothing$ ✓ |

Heyting adjunction axiom + non-contradiction verified on all triples.

## Scope and limits

The certificates prove the **Set-theoretic instance** of Theorem A (part (a) in paper §4). The full topos-internal form (parts (b)–(e), Bohr topos $\mathbf{T}_A$, syntactic topos $\mathbf{T}_T$) follows by reading the Set proof in the Mitchell–Bénabou internal language of any topos with non-trivial Heyting $\Omega$. That lifting is in the paper, not in these certificates.

## Reproduction

```sh
lean "certificate | Bell-Godel Lean4 verification.lean"             # expect exit 0
wolframscript "certificate | Bell-Godel Wolfram verification.wl"    # expect exit 0
```

## Companion

Brahman repository root: <https://github.com/ChristianFranchi/Brahman>
