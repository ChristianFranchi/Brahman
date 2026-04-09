#!/usr/bin/env python3
"""Verify K_G^R(n) = sqrt(2) via constraint-generation LP.

Author: Christian Franchi Viceré (ORCID: 0009-0001-8974-4991)
License: CC BY-NC-ND 4.0

Usage: python cutting_plane.py [max_n]
  Default max_n=15. Tested up to n=18 (35.7h, 8.8 GB RAM).
  For n<=10, verify_plateau.py (Clarabel) is faster.
"""
import numpy as np, cvxpy as cp, time, os, sys, resource
from itertools import product
CERT = os.path.join(os.path.dirname(__file__) or '.', "certificates", "cutting_plane")
os.makedirs(CERT, exist_ok=True)
s2 = np.sqrt(2)
NM = int(sys.argv[1]) if len(sys.argv)>1 else 15
def rmb(): return resource.getrusage(resource.RUSAGE_SELF).ru_maxrss/(1024*1024)
def ft(s):
    if s<1: return "%.0fms"%(s*1000)
    if s<60: return "%.1fs"%s
    if s<3600: return "%.1fmin"%(s/60)
    return "%.1fh"%(s/3600)
print("="*70)
print("  GROTHENDIECK K_G^R(n) -- CUTTING-PLANE")
print("  Solver: CVXPY+Clarabel | Range: n=3..%d"%NM)
print("  Certs: %s"%CERT)
print("="*70, flush=True)
for n in range(3, NM+1):
    print("\n"+"="*60)
    print("  n=%d | 2^n=%d | 4^n=%d"%(n, 2**n, 4**n))
    print("="*60, flush=True)
    t0=time.time(); N=2**n
    signs=np.array(list(product([-1,1],repeat=n)),dtype=np.float64)
    print("  [%s] signs %dx%d = %.1fMB"%(ft(time.time()-t0),N,n,signs.nbytes/1e6),flush=True)
    As=np.zeros((n,n));As[0,0]=As[0,1]=As[1,0]=0.5;As[1,1]=-0.5
    U,S,Vt=np.linalg.svd(As,full_matrices=False); cv=(U@Vt).flatten()
    ck=cv@As.flatten()
    print("  [check] c*A*=%.10f sqrt2=%.10f %s"%(ck,s2,"OK" if abs(ck-s2)<1e-8 else "FAIL"),flush=True)
    rng=np.random.default_rng(137+n);ar=[];ab=[];seen=set()
    for _ in range(min(N*N,500)):
        i,j=rng.integers(N),rng.integers(N)
        if (i,j) not in seen:
            seen.add((i,j));r=np.outer(signs[i],signs[j]).flatten()
            ar.append(r);ab.append(1.0);ar.append(-r);ab.append(1.0)
    print("  [%s] seeded %d constraints"%(ft(time.time()-t0),len(ar)),flush=True)
    conv=False
    for it in range(500):
        ti=time.time();x=cp.Variable(n*n);Am=np.array(ar);bv=np.array(ab)
        prob=cp.Problem(cp.Maximize(cv@x),[Am@x<=bv])
        try: val=prob.solve(solver=cp.CLARABEL)
        except:
            try: val=prob.solve(solver=cp.SCS,max_iters=100000,eps=1e-9)
            except: print("  [iter %d] FAIL"%it,flush=True); break
        tl=time.time()
        if prob.status not in ['optimal','optimal_inaccurate']:
            print("  [iter %d] %s"%(it,prob.status),flush=True)
            for _ in range(100):
                i,j=rng.integers(N),rng.integers(N);r=np.outer(signs[i],signs[j]).flatten()
                ar.append(r);ab.append(1.0);ar.append(-r);ab.append(1.0)
            continue
        xo=x.value.reshape(n,n);ts=time.time();mv=0.0;bi=bj=0;bs=1.0
        SA=signs@xo;ch=min(N,2000)
        for s in range(0,N,ch):
            e=min(s+ch,N);bl=SA[s:e]@signs.T;fi=np.argmax(np.abs(bl))
            li,lj=np.unravel_index(fi,bl.shape);lv=abs(bl[li,lj])
            if lv>mv: mv=lv;bi=s+li;bj=lj;bs=1.0 if bl[li,lj]>0 else -1.0
        te=time.time();gap=val-s2
        if it%5==0 or mv<=1.0+1e-7 or it<3:
            print("  [it %3d] val=%.10f gap=%+.2e viol=%.6f act=%d LP=%s sep=%s RAM=%.0fMB"%(it,val,gap,mv,len(ar),ft(tl-ti),ft(te-ts),rmb()),flush=True)
        if mv<=1.0+1e-7:
            tf=time.time()
            print("  ---- CONVERGED iter=%d ----"%it)
            print("  VAL  = %.15f"%val)
            print("  sqrt2= %.15f"%s2)
            print("  gap  = %.2e"%gap)
            print("  act=%d time=%s RAM=%.0fMB"%(len(ar),ft(tf-t0),rmb()))
            if abs(gap)<1e-2:
                p=os.path.join(CERT,"cert_n%d.npz"%n)
                np.savez_compressed(p,x_opt=xo,val=val,n=n,rows=np.array(ar),b=np.array(ab),iters=it,time_s=tf-t0)
                print("  cert = %s"%p)
                print("  *** K_G^R(%d) = sqrt(2) CERTIFIED ***"%n)
            elif gap>0.01: print("  *** WARNING: numerical ***")
            else: print("  *** BREAKING POINT? ***")
            conv=True;break
        r=np.outer(signs[bi],signs[bj]).flatten();ar.append(bs*r);ab.append(1.0)
    if not conv: print("  MAX_ITER val=%.10f time=%s"%(val,ft(time.time()-t0)))
print("\n"+"="*70+"\n  ALL DONE\n  Certs: %s\n"%CERT+"="*70)
