import Mathlib.LinearAlgebra.Matrix.SchurComplement
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.Tactic

/-!
Chapter IV, §§16-20, of A. K. Tsikh, *Multidimensional Residues and Their
Applications* (AMS, 1992).

Formalised steps.

* §16.4, proof of the theorem, (7)-(9) (p. 114; labels `eq:g-weil`,
  `eq:g-series`, `eq:g-integral`): the Hefer matrix of the system
  `F = (f(ζ) - f(z), z)` with respect to the differences `(ξ - ζ, η - z)` is
  block triangular, `[[P(ξ, ζ), -P(η, z)], [0, 1]]`, so its determinant is
  `det P(ξ, ζ)` and depends only on `(ξ, ζ)` (`hefer_block_det`).  The
  blocks are arbitrary square matrices over a commutative ring.
* §18.1, formula (5) (p. 136; `eq:poincare-lelong`, open question 2): for
  `u = (1/2) log(|z|^2 + ε)` the complex Hessian is
  `(1/2)(c δ_jk - c^2 z̄_j z_k)`, `c = 1/(t + ε)`, `t = Σ z̄_j z_j`;
  `king_hessian_det` computes `det(c δ_jk - c^2 a_j b_k) = c^n (1 - c (b ⬝ a))`
  for all `n` (matrix determinant lemma), and `king_hessian_det_eps` gives
  `ε/(t + ε)^(n+1)`.  The volume and radial integrals that turn this into the
  total mass 1 (not `1/n!`) are checked in `checks/sage/ch4.py` (C1).
* §19.1, proof of Bézout's theorem (p. 142; `eq:homogeneous-multiplicity`):
  from Euler's formula `k_j g_j = Σ_q z_q ∂g_j/∂z_q`, `g = A z` with
  `A_jq = k_j⁻¹ ∂g_j/∂z_q` (`bezout_euler_linear`) and
  `det A = (k_1⋯k_n)⁻¹ det(∂g/∂z)` (`bezout_euler_det`).
* §20.1, the lemma (p. 149; `lem:exact-form`, with the corrected condition
  `p + n ≠ q`): with Euler's identities `Σ z_j P_j = p P`, `Σ z_j Q_j = q Q`
  as hypotheses (`P_j`, `Q_j` the values of the partial derivatives),
  `Σ_j ∂_j(z_j P/Q) = (p + n - q) P/Q` (`exact_form_coefficient`), the
  coefficient of `dσ` for `σ = (P/Q) Σ (-1)^(j-1) z_j dz[j]`.
* §20.3, end of the proof of the theorem and the lemma (pp. 155-156;
  `th:order-bound`, `lem:lost-roots`, `eq:blowup-multiplicities`,
  `eq:resultant-star`): `d_n (d_1⋯d_(n-1)) = d_1⋯d_n`, the exponent of
  `R^*(u) = u^(-d_1⋯d_n) R(u)` once `μ_1 + ⋯ + μ_r = d_1⋯d_(n-1)`
  (`resultant_exponent`); and for multiplicities `m_k` with
  `Σ m_k = μ - d_1⋯d_n` and `|α| ≥ β = μ - d_1⋯d_n + d`,
  `|α| - d ≥ m_k` for every `k` (`blowup_order_bound`), including
  `|α| = β`.

Not covered: residues, currents, integrals, homology, the local algebras
and multiplicities themselves (examples in `checks/sage/ch4.py`).
-/

namespace TsikhResidues.Ch4

open Matrix Finset

section Hefer

variable {R : Type*} [CommRing R] {n : Type*} [Fintype n] [DecidableEq n]

/-- The Hefer determinant of `(f(ζ) - f(z), z)`: block triangular. -/
theorem hefer_block_det (A B : Matrix n n R) :
    (fromBlocks A B 0 1 : Matrix (n ⊕ n) (n ⊕ n) R).det = A.det := by
  rw [det_fromBlocks_zero₂₁, det_one, mul_one]

end Hefer

section King

variable {K : Type*} [Field K] {n : ℕ}

/-- `det(c δ_jk - c² a_j b_k) = cⁿ (1 - c (b ⬝ a))`. -/
theorem king_hessian_det (c : K) (a b : Fin n → K) :
    (Matrix.of fun j k => c * (if j = k then 1 else 0) - c ^ 2 * (a j * b k)).det
      = c ^ n * (1 - c * (b ⬝ᵥ a)) := by
  have hM : (Matrix.of fun j k => c * (if j = k then 1 else 0) - c ^ 2 * (a j * b k))
      = c • (1 + replicateCol Unit (-(c • a)) * replicateRow Unit b) := by
    ext j k
    by_cases hjk : j = k <;>
      simp [hjk, replicateCol, replicateRow, Matrix.mul_apply] <;> ring
  rw [hM, det_smul, det_one_add_replicateCol_mul_replicateRow, Fintype.card_fin]
  simp [dotProduct_neg, dotProduct_smul, sub_eq_add_neg]

/-- With `c = 1/(t + ε)`, `t = b ⬝ a`: the determinant is `ε/(t + ε)^(n+1)`. -/
theorem king_hessian_det_eps (ε : K) (a b : Fin n → K) (h : b ⬝ᵥ a + ε ≠ 0) :
    (Matrix.of fun j k => (b ⬝ᵥ a + ε)⁻¹ * (if j = k then 1 else 0)
        - ((b ⬝ᵥ a + ε)⁻¹) ^ 2 * (a j * b k)).det
      = ε / (b ⬝ᵥ a + ε) ^ (n + 1) := by
  rw [king_hessian_det, inv_pow, pow_succ]
  field_simp
  ring

end King

section Bezout

variable {K : Type*} [Field K] {n : Type*} [Fintype n] [DecidableEq n]

omit [DecidableEq n] in
/-- Euler's formula `k_j g_j = Σ_q z_q J_jq` gives `g = A z`. -/
theorem bezout_euler_linear (k g : n → K) (z : n → K) (J : Matrix n n K)
    (hk : ∀ j, k j ≠ 0) (hE : ∀ j, k j * g j = ∑ q, z q * J j q) (j : n) :
    g j = ∑ q, ((k j)⁻¹ * J j q) * z q := by
  have h := hE j
  calc g j = (k j)⁻¹ * (k j * g j) := by field_simp [hk j]
    _ = ∑ q, ((k j)⁻¹ * J j q) * z q := by
      rw [h, Finset.mul_sum]
      refine Finset.sum_congr rfl fun q _ => by ring

/-- `det A = (k_1⋯k_n)⁻¹ det J` for `A_jq = k_j⁻¹ J_jq`. -/
theorem bezout_euler_det (k : n → K) (J : Matrix n n K) :
    (Matrix.of fun j q => (k j)⁻¹ * J j q).det = (∏ j, k j)⁻¹ * J.det := by
  rw [det_mul_column, Finset.prod_inv_distrib]

end Bezout

section ExactForm

variable {K : Type*} [Field K] {n : ℕ}

/-- The coefficient of `dσ` in the lemma of §20.1: given Euler's identities,
`Σ_j (P/Q + z_j (P_j Q - P Q_j)/Q²) = (p + n - q) P/Q`. -/
theorem exact_form_coefficient (z dP dQ : Fin n → K) (P Q p q : K) (hQ : Q ≠ 0)
    (hP : ∑ j, z j * dP j = p * P) (hQe : ∑ j, z j * dQ j = q * Q) :
    ∑ j, (P / Q + z j * ((dP j * Q - P * dQ j) / Q ^ 2))
      = (p + n - q) * (P / Q) := by
  have h1 : ∀ j, P / Q + z j * ((dP j * Q - P * dQ j) / Q ^ 2)
      = P / Q + (z j * dP j) / Q - P * (z j * dQ j) / Q ^ 2 := by
    intro j
    field_simp
    ring
  rw [Finset.sum_congr rfl (fun j _ => h1 j)]
  simp only [Finset.sum_sub_distrib, Finset.sum_add_distrib, ← Finset.sum_div,
    ← Finset.mul_sum, hP, hQe, Finset.sum_const, Finset.card_univ, Fintype.card_fin,
    nsmul_eq_mul]
  field_simp
  ring

end ExactForm

section Blowup

/-- `d_n (d_1⋯d_(n-1)) = d_1⋯d_n` (indices from `0`). -/
theorem resultant_exponent {n : ℕ} (d : Fin (n + 1) → ℕ) :
    d (Fin.last n) * ∏ i : Fin n, d i.castSucc = ∏ i, d i := by
  rw [Fin.prod_univ_castSucc, mul_comm]

/-- The end of the proof of the theorem of §20.3: if the multiplicities
`m_k` of the zeros of `f^*` on `{w_n = 0}` sum to `μ - D` (`D = d_1⋯d_n ≤ μ`)
and `|α| ≥ μ - D + d`, then `|α| - d ≥ m_k` for every `k`. -/
theorem blowup_order_bound {l : ℕ} (m : Fin l → ℕ) (μ D d a : ℕ)
    (hsum : ∑ k, m k = μ - D) (ha : μ - D + d ≤ a) (k : Fin l) :
    m k ≤ a - d := by
  have hk : m k ≤ ∑ k, m k :=
    Finset.single_le_sum (fun i _ => Nat.zero_le (m i)) (Finset.mem_univ k)
  omega

end Blowup

end TsikhResidues.Ch4

#print axioms TsikhResidues.Ch4.hefer_block_det
#print axioms TsikhResidues.Ch4.king_hessian_det
#print axioms TsikhResidues.Ch4.king_hessian_det_eps
#print axioms TsikhResidues.Ch4.bezout_euler_linear
#print axioms TsikhResidues.Ch4.bezout_euler_det
#print axioms TsikhResidues.Ch4.exact_form_coefficient
#print axioms TsikhResidues.Ch4.resultant_exponent
#print axioms TsikhResidues.Ch4.blowup_order_bound
