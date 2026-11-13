/-
Chapter III of A. K. Tsikh, *Multidimensional Residues and Their
Applications* (AMS, 1992), §§11-15.

Formalised steps.

* §11.1, admissible paths (p. 65; label `ss:residual-definitions`) and their
  uses in Lemma 1 of §12.2, Lemma 3 of §12.2 and the lemma of §13.4: if
  `ε₂ → 0` and `ε₁ / ε₂ ^ q → 0` for every `q : ℕ`, then
  `ε₁ ^ a * ε₂ ^ b → 0` for every `a > 0` and every real `b`
  (`admissible_rpow_tendsto_zero`), and `ε₁ ^ a * ε₂ ^ b → ∞` for `a < 0`
  (`admissible_rpow_tendsto_atTop`): the first nonzero exponent decides.
  With all exponents zero the product is `1`, neither `0` nor `∞`
  (`admissible_rpow_zero_exponents`), hence "not all zero" in the corrected
  statement.  Notation: `e₁ e₂ : α → ℝ` are two consecutive coordinates of
  the path along a filter `l` (the book's `δ → 0`).
* §13.3, proof of the proposition (pp. 84-85; `prop:d-principal`,
  `eq:d-principal`): with the convention of §3.3,
  `dT(ψ) = (-1)^(r+1) T(dψ)` for `deg ψ = r = 2n - p - q`, the term
  `(-1)^q R_(I')P_({j})(λ ∧ dψ)` equals `(-1)^(p+1) dR_(I')P_({j})[λ](ψ)`
  (`stokes_term_sign`), and Stokes' formula
  `(-1)^j R_I[λ] = R_(I')P_({j})[dλ] + (-1)^q R_(I')P_({j})(λ ∧ dψ)` gives
  formula (1) with `(-1)^(j+p+1)` (`formula_one_corrected`).  The printed
  sign `(-1)^p` fails already for `n = p = 1`, `q = 0`
  (`printed_sign_fails`).  Values of the currents are elements of any
  commutative ring; `R`, `A`, `B`, `dR` stand for `R_I[λ](ψ)`,
  `R_(I')P_({j})[dλ](ψ)`, `R_(I')P_({j})[λ](dψ)` and `dR_(I')P_({j})[λ](ψ)`.
* §13.4, proof of the lemma (pp. 86-87; `lem:monomial-supports`): if for
  every row `k` of the first `p` rows of a matrix `α` with `p + 1` rows a
  column `c k` has `α k (c k) > 0` and zeros below, then the columns `c k`
  are distinct (`Ik_choice_injective`): `A = {c k}` has `|A| = p` and
  `α_A` is upper triangular with a positive diagonal and a zero last row, a
  normal matrix in the sense of p. 86.  Conversely, if one of these sets is
  empty, there is one positive integer `K` with
  `α r j ≤ Σ_(l > r) K α l j` on `M` (`Ik_empty_bound`, formula (1) of the
  proof; the book's `k_(r+1), ..., k_p` may all be taken equal to `K`).
* §12.2, Lemma 1 (p. 69; `lem:rank-deficient`): if `q_j ≤ q` and
  `a_j ≥ 0`, then `Σ q_j a_j ≤ q Σ a_j` (`rank_relation_bound`).
* §12.4, Step 5, and the lemma of §12.5 (pp. 79-81;
  `lem:fiber-integral`, `lem:conjugate-factor`): the exponents `b_j` are
  negative (`step5_exponents_neg`, `lemma125_exponents_neg`).

Not covered: the existence of the currents, the resolution of singularities,
Stokes' formula on semianalytic chains and the boundary of the tubes (they
are hypotheses `hS` of `formula_one_corrected`), the measure-theoretic limits
of §12; the identification of the supports with the planes `P_A` (the
combinatorial equivalence is checked exhaustively in `checks/sage/ch3.py`).
-/
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Algebra.Order.BigOperators.Group.Finset

namespace TsikhResidues.Ch3

open Filter Topology Finset

/-! ### §11.1: admissible paths -/

/-- `y → 0`, `y ≥ 0` and `a > 0` give `y ^ a → 0` (from first principles:
the continuity of `rpow` is not imported). -/
theorem tendsto_rpow_zero_of_tendsto {α : Type*} {l : Filter α}
    (y : α → ℝ) (hy : ∀ᶠ x in l, 0 ≤ y x) (hlim : Tendsto y l (𝓝 0))
    (a : ℝ) (ha : 0 < a) : Tendsto (fun x => y x ^ a) l (𝓝 0) := by
  rw [Metric.tendsto_nhds] at hlim ⊢
  intro ε hε
  have hε' : 0 < ε ^ (1 / a) := Real.rpow_pos_of_pos hε _
  filter_upwards [hlim _ hε', hy] with x hx hx0
  rw [Real.dist_eq, sub_zero] at hx ⊢
  rw [abs_of_nonneg hx0] at hx
  rw [abs_of_nonneg (Real.rpow_nonneg hx0 a)]
  calc y x ^ a < (ε ^ (1 / a)) ^ a := Real.rpow_lt_rpow hx0 hx ha
    _ = ε := by
      rw [← Real.rpow_mul hε.le, one_div_mul_cancel ha.ne', Real.rpow_one]

/-- §11.1 (p. 65): along an admissible path the first nonzero exponent
decides; here `a > 0`, so the product tends to `0`. -/
theorem admissible_rpow_tendsto_zero {α : Type*} {l : Filter α}
    (e₁ e₂ : α → ℝ) (h₁ : ∀ᶠ x in l, 0 < e₁ x) (h₂ : ∀ᶠ x in l, 0 < e₂ x)
    (h₂lim : Tendsto e₂ l (𝓝 0))
    (hadm : ∀ q : ℕ, Tendsto (fun x => e₁ x / e₂ x ^ q) l (𝓝 0))
    (a b : ℝ) (ha : 0 < a) :
    Tendsto (fun x => e₁ x ^ a * e₂ x ^ b) l (𝓝 0) := by
  obtain ⟨q, hq⟩ := exists_nat_ge (|b| / a)
  have hqa : 0 ≤ (q : ℝ) * a + b := by
    have h1 : |b| ≤ (q : ℝ) * a := by
      rw [div_le_iff₀ ha] at hq
      linarith
    have h2 : -b ≤ |b| := neg_le_abs b
    linarith
  have h₂lt : ∀ᶠ x in l, e₂ x < 1 :=
    h₂lim.eventually (gt_mem_nhds (by norm_num : (0 : ℝ) < 1))
  -- the factor (e₁ / e₂^q)^a tends to 0
  have hlim : Tendsto (fun x => (e₁ x / e₂ x ^ q) ^ a) l (𝓝 0) := by
    refine tendsto_rpow_zero_of_tendsto _ ?_ (hadm q) a ha
    filter_upwards [h₁, h₂] with x hx1 hx2
    exact div_nonneg hx1.le (pow_nonneg hx2.le q)
  -- e₁^a e₂^b = (e₁/e₂^q)^a * e₂^(q a + b), and the second factor is ≤ 1
  have hEq : ∀ᶠ x in l, e₁ x ^ a * e₂ x ^ b
      = (e₁ x / e₂ x ^ q) ^ a * e₂ x ^ ((q : ℝ) * a + b) := by
    filter_upwards [h₁, h₂] with x hx1 hx2
    have hne : e₂ x ^ ((q : ℝ) * a) ≠ 0 := (Real.rpow_pos_of_pos hx2 _).ne'
    rw [Real.div_rpow hx1.le (pow_nonneg hx2.le q), Real.rpow_add hx2,
      ← Real.rpow_natCast, ← Real.rpow_mul hx2.le]
    field_simp
  refine squeeze_zero' ?_ ?_ hlim
  · filter_upwards [h₁, h₂] with x hx1 hx2
    exact mul_nonneg (Real.rpow_nonneg hx1.le a) (Real.rpow_nonneg hx2.le b)
  · filter_upwards [hEq, h₁, h₂, h₂lt] with x hx hx1 hx2 hx3
    rw [hx]
    have hpos : 0 ≤ (e₁ x / e₂ x ^ q) ^ a :=
      Real.rpow_nonneg (div_nonneg hx1.le (pow_nonneg hx2.le q)) a
    have hle : e₂ x ^ ((q : ℝ) * a + b) ≤ 1 :=
      Real.rpow_le_one hx2.le hx3.le hqa
    calc (e₁ x / e₂ x ^ q) ^ a * e₂ x ^ ((q : ℝ) * a + b)
        ≤ (e₁ x / e₂ x ^ q) ^ a * 1 := mul_le_mul_of_nonneg_left hle hpos
      _ = (e₁ x / e₂ x ^ q) ^ a := mul_one _

/-- §11.1: with `a < 0` the product tends to `+∞`. -/
theorem admissible_rpow_tendsto_atTop {α : Type*} {l : Filter α}
    (e₁ e₂ : α → ℝ) (h₁ : ∀ᶠ x in l, 0 < e₁ x) (h₂ : ∀ᶠ x in l, 0 < e₂ x)
    (h₂lim : Tendsto e₂ l (𝓝 0))
    (hadm : ∀ q : ℕ, Tendsto (fun x => e₁ x / e₂ x ^ q) l (𝓝 0))
    (a b : ℝ) (ha : a < 0) :
    Tendsto (fun x => e₁ x ^ a * e₂ x ^ b) l atTop := by
  have h0 := admissible_rpow_tendsto_zero e₁ e₂ h₁ h₂ h₂lim hadm (-a) (-b)
    (by linarith)
  have hpos : ∀ᶠ x in l, 0 < e₁ x ^ (-a) * e₂ x ^ (-b) := by
    filter_upwards [h₁, h₂] with x hx1 hx2
    exact mul_pos (Real.rpow_pos_of_pos hx1 _) (Real.rpow_pos_of_pos hx2 _)
  have hw : Tendsto (fun x => e₁ x ^ (-a) * e₂ x ^ (-b)) l (𝓝[>] 0) :=
    tendsto_nhdsWithin_iff.mpr ⟨h0, hpos⟩
  have hinv := hw.inv_tendsto_nhdsGT_zero
  refine hinv.congr' ?_
  filter_upwards [h₁, h₂] with x hx1 hx2
  simp only [Pi.inv_apply]
  rw [mul_inv, Real.rpow_neg hx1.le, Real.rpow_neg hx2.le, inv_inv, inv_inv]

/-- §11.1: with all exponents zero the product is constantly `1`. -/
theorem admissible_rpow_zero_exponents {α : Type*} (e₁ e₂ : α → ℝ) (x : α) :
    e₁ x ^ (0 : ℝ) * e₂ x ^ (0 : ℝ) = 1 := by
  simp

/-! ### §13.3: the sign in formula (1) -/

/-- §13.3, proof (p. 85): with `r = 2n - p - q = deg ψ` and the convention
`dT(ψ) = (-1)^(r+1) T(dψ)` of §3.3, `(-1)^q T(λ ∧ dψ) = (-1)^(p+1) dT(ψ)`. -/
theorem neg_one_pow_congr {S : Type*} [CommRing S] {a b m : ℕ}
    (h : a + b = 2 * m) : (-1 : S) ^ a = (-1) ^ b := by
  have hb : ((-1 : S)) ^ b * (-1) ^ b = 1 := by
    rw [← pow_add, ← two_mul, pow_mul, neg_one_sq, one_pow]
  calc (-1 : S) ^ a = (-1) ^ a * ((-1) ^ b * (-1) ^ b) := by rw [hb, mul_one]
    _ = (-1) ^ (a + b) * (-1) ^ b := by rw [pow_add]; ring
    _ = (-1) ^ b := by rw [h, pow_mul, neg_one_sq, one_pow, one_mul]

theorem stokes_term_sign {S : Type*} [CommRing S] (n p q r : ℕ)
    (hr : r + p + q = 2 * n) (B dR : S) (hd : dR = (-1) ^ (r + 1) * B) :
    (-1) ^ q * B = (-1) ^ (p + 1) * dR := by
  subst hd
  rw [← mul_assoc, ← pow_add]
  congr 1
  exact neg_one_pow_congr (m := n + 1) (by omega)

/-- §13.3, formula (1) (p. 84): Stokes' formula of the proof and the
convention of §3.3 give the sign `(-1)^(j+p+1)`. -/
theorem formula_one_corrected {S : Type*} [CommRing S] (n p q r j : ℕ)
    (hr : r + p + q = 2 * n) (R A B dR : S)
    (hS : (-1) ^ j * R = A + (-1) ^ q * B)
    (hd : dR = (-1) ^ (r + 1) * B) :
    (-1) ^ (j + p + 1) * dR + (-1) ^ j * A = R := by
  have hB := stokes_term_sign n p q r hr B dR hd
  have hj : ((-1 : S)) ^ j * (-1) ^ j = 1 := by
    rw [← pow_add, ← two_mul, pow_mul, neg_one_sq, one_pow]
  have hR : R = (-1) ^ j * (A + (-1) ^ q * B) := by
    calc R = ((-1) ^ j * (-1) ^ j) * R := by rw [hj, one_mul]
      _ = (-1) ^ j * ((-1) ^ j * R) := by ring
      _ = (-1) ^ j * (A + (-1) ^ q * B) := by rw [hS]
  rw [hR, hB, pow_add, pow_add]
  ring

/-- §13.3: the printed sign `(-1)^p` in the proof fails for `n = p = 1`,
`q = 0` (here `r = 1`): `T(dψ) = 1` gives `dT(ψ) = 1`, while
`(-1)^q T(dψ) = 1 ≠ -1 = (-1)^p dT(ψ)`. -/
theorem printed_sign_fails :
    ¬ ∀ (n p q r : ℕ) (B dR : ℤ), r + p + q = 2 * n →
      dR = (-1) ^ (r + 1) * B → (-1) ^ q * B = (-1) ^ p * dR := by
  intro h
  have := h 1 1 0 1 1 1 (by norm_num) (by norm_num)
  norm_num at this

/-! ### §13.4: the sets `I_k` and normal matrices -/

/-- §13.4, proof of the lemma (p. 86): columns chosen in the sets `I_k`
(`α k (c k) > 0`, zeros below row `k`) are distinct, so they form a set `A`
with `|A| = p` on which `α_A` is upper triangular with a positive diagonal
and a zero last row. -/
theorem Ik_choice_injective {p : ℕ} {ι : Type*} (α : Fin (p + 1) → ι → ℕ)
    (c : Fin p → ι)
    (hc : ∀ k : Fin p, 0 < α k.castSucc (c k) ∧
      ∀ l : Fin (p + 1), k.castSucc < l → α l (c k) = 0) :
    Function.Injective c := by
  intro k k' hkk'
  by_contra hne
  rcases lt_or_gt_of_ne hne with hlt | hlt
  · have h0 := (hc k).2 k'.castSucc (Fin.castSucc_lt_castSucc_iff.mpr hlt)
    rw [hkk'] at h0
    have := (hc k').1
    omega
  · have h0 := (hc k').2 k.castSucc (Fin.castSucc_lt_castSucc_iff.mpr hlt)
    rw [← hkk'] at h0
    have := (hc k).1
    omega

/-- §13.4, formula (1) of the proof of the lemma (p. 86): if `I_r` is
empty on `M`, one positive integer `K` gives
`α r j ≤ Σ_(l > r) K α l j` for all `j ∈ M`. -/
theorem Ik_empty_bound {p : ℕ} {ι : Type*} (α : Fin (p + 1) → ι → ℕ)
    (M : Finset ι) (r : Fin (p + 1))
    (h : ∀ j ∈ M, α r j = 0 ∨ ∃ l, r < l ∧ 0 < α l j) :
    ∃ K : ℕ, 0 < K ∧ ∀ j ∈ M,
      α r j ≤ ∑ l ∈ univ.filter (fun l => r < l), K * α l j := by
  refine ⟨M.sup (α r) + 1, Nat.succ_pos _, fun j hj => ?_⟩
  rcases h j hj with h0 | ⟨l, hl, hpos⟩
  · rw [h0]; exact Nat.zero_le _
  · have hle : α r j ≤ M.sup (α r) := Finset.le_sup (f := α r) hj
    have hmem : l ∈ univ.filter (fun l => r < l) := by simp [hl]
    have hterm : (M.sup (α r) + 1) * α l j
        ≤ ∑ l ∈ univ.filter (fun l => r < l), (M.sup (α r) + 1) * α l j :=
      Finset.single_le_sum (f := fun l => (M.sup (α r) + 1) * α l j)
        (fun _ _ => Nat.zero_le _) hmem
    have : M.sup (α r) + 1 ≤ (M.sup (α r) + 1) * α l j :=
      Nat.le_mul_of_pos_right _ hpos
    omega

/-! ### §12.2 and §12.4 -/

/-- §12.2, Lemma 1 (p. 69): `Σ q_j a_j ≤ q Σ a_j` when `q_j ≤ q`,
`a_j ≥ 0`. -/
theorem rank_relation_bound {ι : Type*} (s : Finset ι) (qs a : ι → ℝ)
    (q : ℝ) (hq : ∀ j ∈ s, qs j ≤ q) (ha : ∀ j ∈ s, 0 ≤ a j) :
    ∑ j ∈ s, qs j * a j ≤ q * ∑ j ∈ s, a j := by
  rw [Finset.mul_sum]
  exact Finset.sum_le_sum fun j hj => mul_le_mul_of_nonneg_right (hq j hj) (ha j hj)

/-- §12.4, Step 5 (p. 79): for `σ + τ < γ_j - 1` the exponents
`b_j = -γ_j + 1 + σ - τ` (`j ∈ A`), `-γ_j - 1 + σ - τ` (`j ∈ S \ A`) and
`-γ_j + σ - τ` (`j ∉ S`) are negative. -/
theorem step5_exponents_neg (γ σ τ : ℕ) (h : σ + τ + 1 < γ) :
    -(γ : ℤ) + 1 + σ - τ < 0 ∧ -(γ : ℤ) - 1 + σ - τ < 0 ∧
      -(γ : ℤ) + σ - τ < 0 := by
  omega

/-- §12.5, the lemma (p. 81): for `σ + τ < γ_k` the exponents
`-γ_k + σ - τ` and `-γ_k - 1 + σ - τ` are negative. -/
theorem lemma125_exponents_neg (γ σ τ : ℕ) (h : σ + τ < γ) :
    -(γ : ℤ) + σ - τ < 0 ∧ -(γ : ℤ) - 1 + σ - τ < 0 := by
  omega

end TsikhResidues.Ch3

#print axioms TsikhResidues.Ch3.tendsto_rpow_zero_of_tendsto
#print axioms TsikhResidues.Ch3.neg_one_pow_congr
#print axioms TsikhResidues.Ch3.admissible_rpow_tendsto_zero
#print axioms TsikhResidues.Ch3.admissible_rpow_tendsto_atTop
#print axioms TsikhResidues.Ch3.admissible_rpow_zero_exponents
#print axioms TsikhResidues.Ch3.stokes_term_sign
#print axioms TsikhResidues.Ch3.formula_one_corrected
#print axioms TsikhResidues.Ch3.printed_sign_fails
#print axioms TsikhResidues.Ch3.Ik_choice_injective
#print axioms TsikhResidues.Ch3.Ik_empty_bound
#print axioms TsikhResidues.Ch3.rank_relation_bound
#print axioms TsikhResidues.Ch3.step5_exponents_neg
#print axioms TsikhResidues.Ch3.lemma125_exponents_neg
