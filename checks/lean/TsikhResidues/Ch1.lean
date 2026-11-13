import Mathlib.GroupTheory.Perm.Fin
import Mathlib.Tactic.NormNum

/-!
# Chapter I: bounded steps

Tsikh, *Multidimensional Residues and Their Applications* (AMS, 1992),
Chapter I, §2.4, printed p. 6 (`ss:semianalytic-orientation`, correction
math-p6-tube-boundary-sign).

The tube `T_(I,J)`, `I = {1, …, s}`, `J = {s + 1, …, n}`, is oriented by the
parameters `θ_1, …, θ_s, r_(s+1), θ_(s+1), …, r_n, θ_n`; its boundary piece
`|f_j| = ε_j` (`j ∈ J`, the interval `(0, ε_j)`) gets the orientation of §1.3:
the outward normal `r_j` is moved to the front and dropped.  The parameter
`r_j` stands at the place `s + 2k` (counted from `0`), `k = j - s - 1`, and
moving it to the front is the cycle `Fin.cycleRange` of that place.

* `tube_boundary_sign`: the sign of this move is `(-1)^s` for every `j`; the
  remaining parameters, with `θ_j` moved past the `2k` parameters of the pairs
  before it (no sign), are `θ_1, …, θ_s, θ_j, r_(s+1), θ_(s+1), …, [j], …,
  r_n, θ_n`, the orientation of the corrected text.
* `tube_boundary_sign_printed_false`: the printed sign `(-1)^j` fails for
  `n = 1`, `s = 0`, `j = 1` (the disc `|f_1| < ε_1` and its boundary circle).

This checks the combinatorial sign only; that the boundary of a parametrized
chain carries this orientation is the convention of §1.3, and the integrals
of `checks/sage/ch1.py` (section S2) confirm the formula by Stokes' formula
for `f = z`, `n ≤ 3`.
-/

namespace TsikhResidues.Ch1

theorem tube_boundary_sign (s k N : ℕ) (h : s + 2 * k < N) :
    Equiv.Perm.sign (Fin.cycleRange (⟨s + 2 * k, h⟩ : Fin N)) = (-1) ^ s := by
  rw [Fin.sign_cycleRange, pow_add, pow_mul]
  norm_num

theorem tube_boundary_sign_printed_false :
    Equiv.Perm.sign (Fin.cycleRange (⟨0, by norm_num⟩ : Fin 2)) ≠ (-1) ^ 1 := by
  rw [Fin.sign_cycleRange]
  decide

end TsikhResidues.Ch1

#print axioms TsikhResidues.Ch1.tube_boundary_sign
#print axioms TsikhResidues.Ch1.tube_boundary_sign_printed_false
