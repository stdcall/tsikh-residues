import Mathlib.LinearAlgebra.Matrix.Adjugate
import Mathlib.LinearAlgebra.Matrix.SchurComplement
import Mathlib.Analysis.Complex.Basic
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Positivity

/-!
# Chapter II: bounded steps

Tsikh, *Multidimensional Residues and Their Applications* (AMS, 1992),
Chapter II, §5 and §8, printed pp. 14-42.

* `det_smul_eq_adjugate_mulVec`, `mul_det_eq_sum_adjugate` (§5.5, the lemma,
  `lem:det-in-ideal`): if `g = A f`, then `det A • f = adj A *ᵥ g`; in
  coordinates `f i * det A = ∑ₖ (adj A) i k * g k`.  At a point `P` where
  `f_1(P) ≠ 0` this is the book's `det A = ∑ₖ g_k [A_(k1) / f_1]`, so
  `det A ∈ I_P(g)` (the book's cofactors `A_(k1)` are `(adj A) 1 k`).  Any
  commutative ring: the germs at `P`.
* `det_two_one`, `det_two_one_ne_zero` (§5.6, the example for `n ≥ 3`,
  `ss:local-duality`, correction p25-sum-i-le-j): the matrix with twos on the
  diagonal and ones elsewhere has determinant `n + 1`, hence is nonsingular
  for every `n`; `det_all_twos` (the printed sum over all pairs `i, j`
  gives the matrix with all entries 2): determinant `0` for `n ≥ 2`.
* `generators_exceed` (§5.6, the end of the example): for `n ≥ 3` the bound
  `(n + 1) n / 2 - 1` exceeds `n`, written without division as
  `2 (n + 1) < n (n + 1)`.
* `homotopy_chain_inside`, `homotopy_chain_regular` (§5.3, proof of the
  lemma, `lem:homology-cycles`): if `|w| > ε` then
  `|w - t ζ| > ε - t |ζ|` (`0 ≤ t`), so the chain `c(ζ)` lies in the closed
  polyhedron; if `|w - t ζ| = ε - t |ζ|`, `t ≤ 1` (the book has
  `0 ≤ t ≤ 1`), `|ζ| < ε`, then `|w - ζ| ≥ ε - |ζ| > 0`, so `|c(ζ)|` avoids
  the zeros of `f_j - ζ_j`.
  Here `w = f_j(z)`, `ζ = ζ_j`, `ε = ε_j`.
* `displaced_boundary_step` (§8.1, proof of the lemma on a "displaced"
  distinguished boundary, `lem:displaced-boundary`): `|f| ≥ r`, `|g| ≤ ρ`,
  `δ < r - ρ` give `|f + g| > δ`.
-/

namespace TsikhResidues.Ch2

open Matrix

theorem det_smul_eq_adjugate_mulVec {R : Type*} [CommRing R] {n : ℕ}
    (A : Matrix (Fin n) (Fin n) R) (f : Fin n → R) :
    A.det • f = A.adjugate *ᵥ (A *ᵥ f) := by
  rw [mulVec_mulVec, adjugate_mul, smul_mulVec, one_mulVec]

theorem mul_det_eq_sum_adjugate {R : Type*} [CommRing R] {n : ℕ}
    (A : Matrix (Fin n) (Fin n) R) (f : Fin n → R) (i : Fin n) :
    f i * A.det = ∑ k, A.adjugate i k * (A *ᵥ f) k := by
  have h := congrFun (det_smul_eq_adjugate_mulVec A f) i
  simp only [Pi.smul_apply, smul_eq_mul] at h
  rw [mul_comm, h]
  rfl

theorem det_two_one (n : ℕ) :
    (Matrix.of fun i j : Fin n => if i = j then (2 : ℚ) else 1).det = n + 1 := by
  have hM : (Matrix.of fun i j : Fin n => if i = j then (2 : ℚ) else 1) =
      1 + replicateCol Unit (fun _ : Fin n => (1 : ℚ)) *
        replicateRow Unit (fun _ : Fin n => (1 : ℚ)) := by
    ext i j
    by_cases h : i = j
    · subst h
      simp [one_apply, mul_apply, replicateCol_apply, replicateRow_apply]
      norm_num
    · simp [one_apply, h, mul_apply, replicateCol_apply, replicateRow_apply]
  rw [hM, det_one_add_replicateCol_mul_replicateRow]
  simp [dotProduct]
  ring

theorem det_two_one_ne_zero (n : ℕ) :
    (Matrix.of fun i j : Fin n => if i = j then (2 : ℚ) else 1).det ≠ 0 := by
  rw [det_two_one]
  positivity

theorem det_all_twos (n : ℕ) (hn : 2 ≤ n) :
    (Matrix.of fun _ _ : Fin n => (2 : ℚ)).det = 0 := by
  have h01 : (⟨0, by omega⟩ : Fin n) ≠ ⟨1, by omega⟩ := by
    simp [Fin.ext_iff]
  exact det_zero_of_row_eq h01 rfl

theorem generators_exceed (n : ℕ) (hn : 3 ≤ n) : 2 * (n + 1) < n * (n + 1) := by
  nlinarith

theorem homotopy_chain_inside (w ζ : ℂ) (ε t : ℝ) (ht : 0 ≤ t) (hw : ε < ‖w‖) :
    ε - t * ‖ζ‖ < ‖w - (t : ℂ) * ζ‖ := by
  have h1 : ‖w‖ - ‖(t : ℂ) * ζ‖ ≤ ‖w - (t : ℂ) * ζ‖ := norm_sub_norm_le _ _
  have h2 : ‖(t : ℂ) * ζ‖ = t * ‖ζ‖ := by
    rw [norm_mul, Complex.norm_real, Real.norm_of_nonneg ht]
  linarith

theorem homotopy_chain_regular (w ζ : ℂ) (ε t : ℝ) (ht1 : t ≤ 1)
    (hζ : ‖ζ‖ < ε) (hc : ‖w - (t : ℂ) * ζ‖ = ε - t * ‖ζ‖) :
    ε - ‖ζ‖ ≤ ‖w - ζ‖ ∧ 0 < ε - ‖ζ‖ := by
  refine ⟨?_, by linarith⟩
  have hsplit : w - ζ = (w - (t : ℂ) * ζ) - ((1 - t : ℝ) : ℂ) * ζ := by
    push_cast
    ring
  have h1 : ‖w - (t : ℂ) * ζ‖ - ‖((1 - t : ℝ) : ℂ) * ζ‖ ≤ ‖w - ζ‖ := by
    rw [hsplit]
    exact norm_sub_norm_le _ _
  have h2 : ‖((1 - t : ℝ) : ℂ) * ζ‖ = (1 - t) * ‖ζ‖ := by
    rw [norm_mul, Complex.norm_real, Real.norm_of_nonneg (by linarith)]
  nlinarith

theorem displaced_boundary_step (f g : ℂ) (r ρ δ : ℝ) (hf : r ≤ ‖f‖) (hg : ‖g‖ ≤ ρ)
    (hδ : δ < r - ρ) : δ < ‖f + g‖ := by
  have h : ‖f‖ - ‖g‖ ≤ ‖f + g‖ := by
    have := norm_sub_norm_le f (-g)
    simpa [sub_neg_eq_add, norm_neg] using this
  linarith

end TsikhResidues.Ch2

#print axioms TsikhResidues.Ch2.det_smul_eq_adjugate_mulVec
#print axioms TsikhResidues.Ch2.mul_det_eq_sum_adjugate
#print axioms TsikhResidues.Ch2.det_two_one
#print axioms TsikhResidues.Ch2.det_two_one_ne_zero
#print axioms TsikhResidues.Ch2.det_all_twos
#print axioms TsikhResidues.Ch2.generators_exceed
#print axioms TsikhResidues.Ch2.homotopy_chain_inside
#print axioms TsikhResidues.Ch2.homotopy_chain_regular
#print axioms TsikhResidues.Ch2.displaced_boundary_step
