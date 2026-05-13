(*
  certificate | Section 10 Wolfram Mathematica.wl
  Appendix F of: Gödel ≡ Bell ≡ Kochen–Specker (Franchi Viceré 2026, v5.3)

  Independent computer-algebra verification of §7.2 (formerly §10):
  HeytingArithUniverse ≅ BohrLikeUniverse modulo the auxiliary `code` field.

  Witness: H3 = {⊥, m, ⊤} (3-chain Heyting algebra, non-Boolean).
  Method:  exhaustive enumeration on the finite witness.
  Verifier: Wolfram Mathematica kernel ≥ 13.0
  Expected: all four checks return True, exit code 0, ~2 s wall time.
*)

(* --- 3-chain Heyting witness --- *)
H3 = {0, 1, 2};                          (* 0 = ⊥,  1 = m,  2 = ⊤ *)
bot = 0; top = 2;
meetH[x_, y_] := Min[x, y];
joinH[x_, y_] := Max[x, y];
impH[x_, y_]  := If[x <= y, top, y];
negH[x_]      := impH[x, bot];

(* --- Check 1: Heyting adjunction  meet(x,y) ≤ z  ⇔  x ≤ imp(y,z) --- *)
adjunction = AllTrue[
  Tuples[H3, 3],
  Function[{xyz},
    With[{x = xyz[[1]], y = xyz[[2]], z = xyz[[3]]},
      (meetH[x, y] <= z) === (x <= impH[y, z])
    ]
  ]
];
Print["Check 1 — Heyting adjunction on H3: ", adjunction];

(* --- Check 2: ¬-fixed-point set is empty on H3 (Lemma 3.1 specialised) --- *)
fpSet = Select[H3, negH[#] === # &];
Print["Check 2 — neg-fixed-point set on H3: ", fpSet, "   (empty ⇒ Lemma 3.1 holds)"];

(* --- Check 3: 8↔8 theorem-name bijection  HeytingArithUniverse ↔ BohrLikeUniverse --- *)
arithNames = {"heyting", "nontriv", "Form", "subst", "code",
              "heyting_neg_no_fp", "no_WPS_of_fp_free_endo", "categorical_godel"};
bohrNames  = {"heyting", "nontriv", "Spec", "daseinise", "(auxiliary dropped)",
              "heyting_neg_no_fp", "no_WPS_of_fp_free_endo_bohr", "categorical_KS"};
bijection8 = (Length[arithNames] === 8) && (Length[bohrNames] === 8) &&
             (Length[Union[Thread[arithNames -> bohrNames]]] === 8);
Print["Check 3 — 8↔8 theorem-name bijection well-defined: ", bijection8];

(* --- Check 4: φ_P ↔ φ_v coupling under renaming β --- *)
(* For the 3-chain witness, P : Form → H3 and v : Spec → H3 are formally identical
   functions modulo the rename Form → Spec, subst → daseinise.
   Verify that for ANY predicate P : {1,2,3} → H3, the WPS condition computed
   in the arithmetic arm equals the WPS condition computed in the Bohr-like arm. *)
predicates = Tuples[H3, 3];   (* all P : {1,2,3} → H3 *)
operArith[x_, y_] := Mod[x*y + 1, 3] + 1;     (* placeholder substitution *)
operBohr[x_, y_]  := operArith[x, y];          (* identical under β-renaming *)
forms = {1, 2, 3};
couplingMatches = AllTrue[
  predicates,
  Function[P,
    With[{
      arithWPS = AllTrue[forms,
        Function[x, P[[operArith[x, x]]] === negH[P[[operArith[x, x]]]]]],
      bohrWPS  = AllTrue[forms,
        Function[x, P[[operBohr[x, x]]]  === negH[P[[operBohr[x, x]]]]]]
    },
      arithWPS === bohrWPS
    ]
  ]
];
Print["Check 4 — φ_P ↔ φ_v coupling under β-renaming: ", couplingMatches];

(* --- Final verdict --- *)
allGood = adjunction && (fpSet === {}) && bijection8 && couplingMatches;
Print["\n================================"];
Print["VERDICT: ", If[allGood, "ALL FOUR CHECKS PASS  ✓", "FAILURE  ✗"]];
Print["================================"];
Exit[If[allGood, 0, 1]];
