# Certificates

LP dual certificates proving K_G^R(n) = sqrt(2) for n = 3, ..., 18.

## Two methods, cross-validated on n=3..10

### `clarabel/` — Direct LP dual (Clarabel 0.11 interior-point)
- **n=3..9**: certified in seconds to minutes
- **n=10**: certified in ~3h (requires ~16 GB RAM)
- Format: `.npz` with `y_opt` (dual weights), `val`, `gap`, `time_s`

### `cutting_plane/` — Constraint-generation LP
- **n=3..18**: all certified
- Uses ~1000 active constraints + separation oracle
- Peak RAM: 8.8 GB for n=18, time: 35.7h
- Format: `.npz` with `x_opt`, `val`, `rows` (active constraints), `iters`, `time_s`

## Reproduce

```bash
pip install -r ../requirements.txt
python ../verify_plateau.py 9      # Clarabel, n=3..9, ~3 min
python ../cutting_plane.py 18      # Cutting-plane, n=3..18, ~36h for n=18
```

## Machine

All certificates computed on Mac Mini M4 (10 cores, 16 GB RAM, macOS Sequoia).
Date: 7–9 April 2026.

## Verification

To verify a certificate `cert_nN.npz`:
```python
import numpy as np
cert = np.load('cert_nN.npz')
print(f"n={cert['n']}, val={cert['val']:.15f}, gap from sqrt(2) = {cert['val'] - np.sqrt(2):.2e}")
```

© 2026 Christian Franchi Viceré — CC BY-NC-ND 4.0
