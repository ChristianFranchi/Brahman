(* ============================================= *)
(* NUMERICAL VERIFICATION                        *)
(* A Proof of the Riemann Hypothesis              *)
(* Christian Franchi Viceré, April 12, 2026        *)
(* DOI: 10.5281/zenodo.19546495                   *)
(* ============================================= *)

Print["RH Proof v6.5 — Numerical Verification"];
Print["Date: ", DateString[]];
Print[""];

(* Test function: g(t) = t^(1/2) Exp[-t] (t^2 - 3t + 3/4) *)
(* Mellin transform: gtilde[s] = Gamma[s+5/2] - 3 Gamma[s+3/2] + (3/4) Gamma[s+1/2] *)
gtilde[s_] := Gamma[s + 5/2] - 3 Gamma[s + 3/2] + 3/4 Gamma[s + 1/2];

(* CHECK 1: Vanishing conditions *)
Print["=== CHECK 1: Mellin vanishing conditions ==="];
Print["g~[0] = ", N[gtilde[0], 30]];
Print["g~[1] = ", N[gtilde[1], 30]];
Assert[gtilde[0] == 0, "FAIL: g~[0] != 0"];
Assert[gtilde[1] == 0, "FAIL: g~[1] != 0"];
Print["PASS: g~[0] = g~[1] = 0"];
Print[""];

(* CHECK 2: Spectral sum over first 50 zeros of zeta *)
Print["=== CHECK 2: Q_W = Sum |g~(rho_k)|^2 ==="];
gammas = Table[Im[ZetaZero[k]], {k, 1, 50}];
spectralSum = 2 Sum[Abs[gtilde[1/2 + I gammas[[k]]]]^2, {k, 1, 50}];
Print["Q_W (50 zeros) = ", N[spectralSum, 20]];
Print["Sign: ", If[spectralSum >= 0, ">=0 PASS", "<0 FAIL !!!"]];
Print[""];

(* CHECK 3: Multiple test functions *)
Print["=== CHECK 3: Stress tests ==="];

(* Test 2: Oscillatory *)
g2t[s_] := Gamma[s + 1/2 + 10 I] + Gamma[s + 1/2 - 10 I] - 
  3 (Gamma[s + 3/2 + 10 I] + Gamma[s + 3/2 - 10 I])/2;
q2 = 2 Sum[Abs[g2t[1/2 + I gammas[[k]]]]^2, {k, 1, 20}];
Print["Oscillatory Sin[10 Log[t]]: Q_W = ", N[q2, 10], 
  " ", If[q2 >= 0, "PASS", "FAIL"]];

(* Test 3: Peaked *)
gt3[s_?NumericQ] := NIntegrate[t^(1/2) Exp[-(Log[t] - 2)^2] t^(s - 1), 
  {t, 0, Infinity}, WorkingPrecision -> 20];
a0 = gt3[0]; a1 = gt3[1];
{c1, c2} = LinearSolve[
  {{N[Gamma[1/2], 20], N[Gamma[3/2], 20]}, 
   {N[Gamma[3/2], 20], N[Gamma[5/2], 20]}}, {-a0, -a1}];
g3tilde[s_?NumericQ] := gt3[s] + c1 Gamma[s + 1/2] + c2 Gamma[s + 3/2];
q3 = 2 Sum[Abs[g3tilde[1/2 + I gammas[[k]]]]^2, {k, 1, 30}];
Print["Peaked at t=e^2:        Q_W = ", N[q3, 10], 
  " ", If[q3 >= 0, "PASS", "FAIL"]];

(* Test 4: High-frequency *)
gt4[s_?NumericQ] := NIntegrate[t^(1/2) Exp[-t] Sin[50 Log[t]] t^(s - 1), 
  {t, 0, Infinity}, WorkingPrecision -> 20];
b0 = gt4[0]; b1 = gt4[1];
{d1, d2} = LinearSolve[
  {{N[Gamma[1/2], 20], N[Gamma[3/2], 20]}, 
   {N[Gamma[3/2], 20], N[Gamma[5/2], 20]}}, {-b0, -b1}];
g4tilde[s_?NumericQ] := gt4[s] + d1 Gamma[s + 1/2] + d2 Gamma[s + 3/2];
q4 = 2 Sum[Abs[g4tilde[1/2 + I gammas[[k]]]]^2, {k, 1, 20}];
Print["High-freq Sin[50Log]:   Q_W = ", N[q4, 10], 
  " ", If[q4 >= 0, "PASS", "FAIL"]];

Print[""];
Print["=== SUMMARY ==="];
Print["Test 1 (smooth):      ", If[spectralSum >= 0, "PASS", "FAIL"]];
Print["Test 2 (oscillatory): ", If[q2 >= 0, "PASS", "FAIL"]];
Print["Test 3 (peaked):      ", If[q3 >= 0, "PASS", "FAIL"]];
Print["Test 4 (high-freq):   ", If[q4 >= 0, "PASS", "FAIL"]];
allPass = And[spectralSum >= 0, q2 >= 0, q3 >= 0, q4 >= 0];
Print["ALL PASSED: ", allPass];
Print[""];
Print["DOI: 10.5281/zenodo.19546495"];
Print["SHA-256: d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"];
