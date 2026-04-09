.PHONY: verify verify-fast verify-full clean

verify: verify-fast

verify-fast:  ## n=3..8 (~15s)
	python verify_plateau.py 8

verify-full:  ## n=3..10 (~3h) + cutting-plane n=11..18 (~36h for n=18)
	python verify_plateau.py 10
	python cutting_plane.py 18

clean:
	rm -rf certificates/clarabel/*.npz certificates/cutting_plane/*.npz
