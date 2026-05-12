-- ============================================================
-- Bell-Godel Cell B Paper: Lean 4 Mathematical Certificate
-- Lemmas 3.1, 3.2 and Theorem 4.1(a) — Universal Lawvere Obstruction
--
-- Pure Lean 4, no Mathlib dependency.
-- Verified on Lean 4 toolchain via IoT.ACTiVEgroup.it bridge
-- on 2026-05-11 at 09:38 CEST; exit_code 0; duration 5988 ms.
--
-- Author: Christian Franchi Viceré
-- ORCID:  0009-0001-8974-4991
-- LinkedIn: https://www.linkedin.com/in/christian-franchi-bab00ab4/
-- License: CC BY-NC-ND 4.0
-- ============================================================

-- A Heyting algebra is encoded by the minimal axioms needed for the
-- proof of Lemma 3.1. Non-triviality is encoded by `bot_ne_top`.

structure HeytingAlg (H : Type) where
  inf  : H → H → H
  himp : H → H → H
  bot  : H
  top  : H
  inf_idem            : ∀ x, inf x x = x
  inf_neg_eq_bot      : ∀ x, inf x (himp x bot) = bot
  himp_bot_bot_eq_top : himp bot bot = top
  bot_ne_top          : Ne bot top

-- ============================================================
-- LEMMA 3.1.  Heyting negation has no fixed point in any
-- non-trivial Heyting algebra.
--
-- Proof.  Suppose neg x = x.  Then
--   x ⊓ neg x = x ⊓ x = x ≤ ⊥,  hence x = ⊥.
-- But neg ⊥ = ⊤, so x = ⊤.  Then ⊥ = ⊤, contradicting
-- non-triviality.  □
-- ============================================================

theorem heyting_neg_no_fixed_point
    {H : Type} (HA : HeytingAlg H) :
    ∀ x : H, Ne (HA.himp x HA.bot) x := by
  intro x h
  have h1 : HA.inf x (HA.himp x HA.bot) = HA.bot := HA.inf_neg_eq_bot x
  rw [h]                       at h1
  rw [HA.inf_idem x]           at h1
  rw [h1]                      at h
  rw [HA.himp_bot_bot_eq_top]  at h
  exact HA.bot_ne_top h.symm

-- ============================================================
-- LEMMA 3.2.  Lawvere fixed-point theorem in the cartesian
-- closed category Set.
--
-- If phi : A → A → B is weakly point-surjective (every function
-- A → B is named by some a0 via phi), then every endomorphism
-- f : B → B has a fixed point.
--
-- Proof.  Define sigma a := f (phi a a).  By WPS, sigma = phi a0
-- for some a0.  Evaluating at a0:  f (phi a0 a0) = phi a0 a0,
-- so phi a0 a0 is a fixed point of f.  □
-- ============================================================

theorem lawvere_set
    {A B : Type} (phi : A → (A → B)) (f : B → B)
    (hphi : ∀ h : A → B, ∃ a0, h = phi a0) :
    ∃ b : B, f b = b := by
  let sigma : A → B := fun a => f (phi a a)
  cases hphi sigma with
  | intro a0 hsigma =>
    have heq : f (phi a0 a0) = phi a0 a0 := congrFun hsigma a0
    exact ⟨phi a0 a0, heq⟩

-- ============================================================
-- COROLLARY 3.3.  Lawvere contrapositive — if f has no fixed
-- point, then no weakly point-surjective phi exists.
-- ============================================================

theorem lawvere_no_wps
    {A B : Type} (f : B → B) (hf : ∀ b : B, Ne (f b) b) :
    ¬ ∃ phi : A → (A → B), ∀ h : A → B, ∃ a0, h = phi a0 := by
  intro hexists
  cases hexists with
  | intro phi hphi =>
    cases lawvere_set phi f hphi with
    | intro b hb => exact hf b hb

-- ============================================================
-- THEOREM A — UNIVERSAL LAWVERE OBSTRUCTION (Set instance).
--
-- For any non-trivial Heyting algebra H and any type A, no
-- weakly point-surjective evaluation phi : A → (A → H) exists.
--
-- This is the Set-theoretic instance of the universal categorical
-- statement Theorem A. The topos-internal version follows by reading
-- this lemma in the Mitchell-Bénabou language of any topos whose
-- subobject classifier is internally a non-trivial Heyting algebra.
--
-- IMPORTANT: Theorem A does NOT, by itself, imply the Kochen-Specker
-- theorem or Gödel's first incompleteness theorem. The translation
-- from "no weakly point-surjective phi : A → (A → Omega)" to "no
-- global section of a particular presheaf" (the spectral presheaf for
-- KS, the provability presheaf for Gödel) is non-trivial and stated
-- in the paper as Conjectures D and E. Both are currently open.
-- ============================================================

theorem universal_lawvere_obstruction_set
    {A H : Type} (HA : HeytingAlg H) :
    ¬ ∃ phi : A → (A → H), ∀ h : A → H, ∃ a0, h = phi a0 :=
  lawvere_no_wps (fun x => HA.himp x HA.bot)
    (fun x => heyting_neg_no_fixed_point HA x)

-- Sanity-check the kernel types
#check @heyting_neg_no_fixed_point
#check @lawvere_set
#check @lawvere_no_wps
#check @universal_lawvere_obstruction_set

-- END OF CERTIFICATE.
-- All four declarations were accepted by the Lean 4 kernel
-- with exit_code 0.  No `sorry`, no `axiom` beyond Lean core.
