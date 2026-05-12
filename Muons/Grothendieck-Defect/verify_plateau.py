#!/usr/bin/env python3
"""Verify K_G^R(n) = sqrt(2) for n=3..10 via Clarabel LP dual certificates.

Author: Christian Franchi Viceré (ORCID: 0009-0001-8974-4991)
License: CC BY-NC-ND 4.0

Usage: python verify_plateau.py [max_n]
  Default max_n=10. Requires ~3h for n=10 on 16GB machine.
  For n>=11, use cutting_plane.py instead.
"""
import numpy as np, cvxpy as cp, time, os, sys
from itertools import product

CERT = os.path.join(os.path.dirname(__file__), "certificates", "clarabel")
os.makedirs(CERT, exist_ok=True)
s2 = np.sqrt(2)
NM = int(sys.argv[1]) if len(sys.argv) > 1 else 10

print("=" * 60)
print("  GROTHENDIECK K_G^R(n) -- CLARABEL LP DUAL CERTIFICATE")
print("  Range: n=3..%d" % NM)
print("=" * 60, flush=True)

for n in range(3, NM + 1):
    print("\n--- n=%d ---" % n, flush=True)
    t0 = time.time()
    N = 2 ** n
    signs = np.array(list(product([-1, 1], repeat=n)), dtype=np.float64)
    # Embedded Hadamard A* = (1/2)H_2 ⊕ 0
    As = np.zeros((n, n))
    As[0, 0] = As[0, 1] = As[1, 0] = 0.5
    As[1, 1] = -0.5
    U, S, Vt = np.linalg.svd(As, full_matrices=False)
    c = (U @ Vt).flatten()
    # Build constraint matrix: |eps^T X delta| <= 1 for all sign vectors
    rows = []
    for i in range(N):
        for j in range(N):
            row = np.outer(signs[i], signs[j]).flatten()
            rows.append(row)
            rows.append(-row)
    A_cons = np.array(rows)
    print("  Matrix: %dx%d, %.0f MB, built in %.1fs" % (
        A_cons.shape[0], A_cons.shape[1],
        A_cons.nbytes / 1e6, time.time() - t0), flush=True)
    # LP dual: min b^T y s.t. A^T y = c, y >= 0
    y = cp.Variable(A_cons.shape[0], nonneg=True)
    prob = cp.Problem(
        cp.Minimize(np.ones(len(y)) @ y),
        [A_cons.T @ y == c]
    )
    val = prob.solve(solver=cp.CLARABEL)
    elapsed = time.time() - t0
    gap = val - s2
    print("  VALUE   = %.15f" % val)
    print("  sqrt(2) = %.15f" % s2)
    print("  gap     = %.2e" % gap)
    print("  status  = %s" % prob.status)
    print("  time    = %.1fs" % elapsed)
    if prob.status == "optimal" and abs(gap) < 1e-2:
        p = os.path.join(CERT, "cert_n%d.npz" % n)
        np.savez_compressed(p, y_opt=y.value, val=val, n=n, gap=gap, time_s=elapsed)
        print("  cert    = %s" % p)
        print("  *** K_G^R(%d) = sqrt(2) CERTIFIED ***" % n)
    else:
        print("  *** FAILED ***")

print("\nDone. Certificates: %s" % CERT)
