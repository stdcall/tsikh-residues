import Mathlib.Analysis.Complex.Basic
import Mathlib.Tactic

/-!
Chapter V, §23, of A. K. Tsikh, *Multidimensional Residues and Their
Applications* (AMS, 1992).

Formalised steps.

* The lemma of §23.2, finite part (p. 174; label `lem:divisors-chains`): for
  `a ≥ 0`, `r > 0`, a point `(z₁, x₂)` with `Im z₁ ≥ 0` and `x₂` real (the
  finite part of the chain `c₊`) gives
  `Im φ_{j+} = Im (a z₁ + b x₂ + c + i r) = a Im z₁ + r > 0`
  (`phi_plus_im_pos`), and symmetrically `Im φ_{j-} < 0` on `c₋`
  (`phi_minus_im_neg`); so `F_±` does not meet `c_±` in `ℂ²`.
* The same lemma, the chart `z'₁ = z₁⁻¹` at infinity in the case
  `a_j > 0`, `b_j = 0` (p. 174, the corrected sign "Im z'₁ ≷ 0"): a point
  of `F_{j±} = {a + (c ± i r) z'₁ = 0}` has `Im z'₁ > 0` for `+`
  (`chart_plus_im_pos`) and `< 0` for `-` (`chart_minus_im_neg`), while
  `Im z₁⁻¹ ≤ 0` when `Im z₁ ≥ 0` (`inv_im_nonpos`) and `≥ 0` when
  `Im z₁ ≤ 0` (`inv_im_nonneg`); hence `F_{j±}` misses `c_±` there
  (`chart_plus_disjoint`, `chart_minus_disjoint`).  The printed sign
  (`Im z'₁ < 0` on `F_{j+}`) fails already for `a = r = 1`, `c = 0`,
  `z'₁ = i` (`chart_printed_sign_fails`).
* The proof of the theorem of §23.2 (p. 174; `th:integrals-residues`,
  `eq:integral-bidisk`): the Cayley map `w = (i - z)/(i + z)` satisfies
  `|i - z|² - |i + z|² = -4 Im z` (`cayley_normSq_sub`), so `|w| < 1` iff
  `Im z > 0` (`cayley_disk_iff`) and `|w| = 1` iff `z` is real
  (`cayley_circle_iff`); thus the domain `{|w₂| > 1}` of the proof is
  `{Im z₂ < 0}`.
* Formula (3) of §23.2 (p. 173; `eq:integrals-residues`, the corrected
  half-planes) on `G = 1/(x₁² + 1)(x₂² + 1)`: with `f₋ = (z₁ - i)(z₂ - i)`,
  `f₊ = (z₁ + i)(z₂ + i)` the Jacobian `det ∂(f₋, f₊)/∂(z₁, z₂)` is `-4` at
  `(-i, i)` and `4` at `(i, -i)` (`product_jacobian`); so, the residues
  being `1/J`, `(2πi)² · (-1/4) = π²` (the corrected (3), sum over
  `ℂ × ℂ₊`) and `(2πi)² · (1/4) = -π²` (the printed (3), sum over
  `ℂ × ℂ₋`) for any complex `p` in place of `π`
  (`product_corrected_value`, `product_printed_value`).  That
  `∫∫ dx₁ dx₂/(x₁² + 1)(x₂² + 1) = π²` is not formalised (it is checked,
  with the other integrals of the chapter, in `checks/sage/ch5.py`).

Not covered: residues, integrals, homology, the cycles and their
orientations; the examples of §§21-23 are checked in `checks/sage/ch5.py`.
-/

namespace TsikhResidues.Ch5

open Complex

/-- On the finite part of `c₊` (`Im z₁ ≥ 0`, `x₂` real), `Im φ_{j+} > 0`. -/
theorem phi_plus_im_pos (a b c r : ℝ) (ha : 0 ≤ a) (hr : 0 < r) (z₁ : ℂ)
    (x₂ : ℝ) (h₁ : 0 ≤ z₁.im) :
    0 < ((a : ℂ) * z₁ + b * x₂ + c + r * I).im := by
  simp only [add_im, mul_im, ofReal_re, ofReal_im, I_re, I_im]
  nlinarith [mul_nonneg ha h₁]

/-- On the finite part of `c₋` (`Im z₁ ≤ 0`, `x₂` real), `Im φ_{j-} < 0`. -/
theorem phi_minus_im_neg (a b c r : ℝ) (ha : 0 ≤ a) (hr : 0 < r) (z₁ : ℂ)
    (x₂ : ℝ) (h₁ : z₁.im ≤ 0) :
    ((a : ℂ) * z₁ + b * x₂ + c - r * I).im < 0 := by
  simp only [sub_im, add_im, mul_im, ofReal_re, ofReal_im, I_re, I_im]
  nlinarith [mul_nonpos_of_nonneg_of_nonpos ha h₁]

/-- The chart at infinity, `b_j = 0`: a point `w = z'₁` of
`F_{j+} = {a + (c + i r) z'₁ = 0}` has `Im z'₁ = a r/(c² + r²) > 0`. -/
theorem chart_plus_im_pos (a c r : ℝ) (ha : 0 < a) (hr : 0 < r) (w : ℂ)
    (hw : (a : ℂ) + (c + r * I) * w = 0) : 0 < w.im := by
  have h1 := congrArg re hw
  have h2 := congrArg im hw
  simp only [add_re, add_im, mul_re, mul_im, ofReal_re, ofReal_im, I_re, I_im,
    zero_re, zero_im] at h1 h2
  have key : (c ^ 2 + r ^ 2) * w.im = a * r := by linear_combination -r * h1 + c * h2
  have hpos : 0 < c ^ 2 + r ^ 2 := by positivity
  by_contra hneg
  replace hneg := not_lt.mp hneg
  nlinarith [mul_pos ha hr, mul_nonpos_of_nonneg_of_nonpos hpos.le hneg]

/-- The chart at infinity, `b_j = 0`: a point of
`F_{j-} = {a + (c - i r) z'₁ = 0}` has `Im z'₁ = -a r/(c² + r²) < 0`. -/
theorem chart_minus_im_neg (a c r : ℝ) (ha : 0 < a) (hr : 0 < r) (w : ℂ)
    (hw : (a : ℂ) + (c - r * I) * w = 0) : w.im < 0 := by
  have h1 := congrArg re hw
  have h2 := congrArg im hw
  simp only [add_re, add_im, sub_re, sub_im, mul_re, mul_im, ofReal_re,
    ofReal_im, I_re, I_im, zero_re, zero_im] at h1 h2
  have key : (c ^ 2 + r ^ 2) * w.im = -(a * r) := by
    linear_combination r * h1 + c * h2
  have hpos : 0 < c ^ 2 + r ^ 2 := by positivity
  by_contra hneg
  replace hneg := not_lt.mp hneg
  nlinarith [mul_pos ha hr, mul_nonneg hpos.le hneg]

/-- On `c₊` (`Im z₁ ≥ 0`) the chart coordinate `z'₁ = z₁⁻¹` has
`Im z'₁ ≤ 0`. -/
theorem inv_im_nonpos (z : ℂ) (hz : 0 ≤ z.im) : (z⁻¹).im ≤ 0 := by
  rw [inv_im]
  exact div_nonpos_of_nonpos_of_nonneg (by linarith) (normSq_nonneg z)

/-- On `c₋` (`Im z₁ ≤ 0`) the chart coordinate `z'₁ = z₁⁻¹` has
`Im z'₁ ≥ 0`. -/
theorem inv_im_nonneg (z : ℂ) (hz : z.im ≤ 0) : 0 ≤ (z⁻¹).im := by
  rw [inv_im]
  exact div_nonneg (by linarith) (normSq_nonneg z)

/-- `F_{j+}` (with `a_j > 0`, `b_j = 0`) misses `c₊` in the chart `z'₁`. -/
theorem chart_plus_disjoint (a c r : ℝ) (ha : 0 < a) (hr : 0 < r) (z₁ : ℂ)
    (hz : 0 ≤ z₁.im) : (a : ℂ) + (c + r * I) * z₁⁻¹ ≠ 0 := fun h => by
  have h1 := chart_plus_im_pos a c r ha hr _ h
  have h2 := inv_im_nonpos z₁ hz
  linarith

/-- `F_{j-}` (with `a_j > 0`, `b_j = 0`) misses `c₋` in the chart `z'₁`. -/
theorem chart_minus_disjoint (a c r : ℝ) (ha : 0 < a) (hr : 0 < r) (z₁ : ℂ)
    (hz : z₁.im ≤ 0) : (a : ℂ) + (c - r * I) * z₁⁻¹ ≠ 0 := fun h => by
  have h1 := chart_minus_im_neg a c r ha hr _ h
  have h2 := inv_im_nonneg z₁ hz
  linarith

/-- The printed sign "`Im z'₁ < 0` on `F_{j+}`" fails: `a = r = 1`, `c = 0`,
`z'₁ = i`. -/
theorem chart_printed_sign_fails :
    ¬ ∀ (a c r : ℝ), 0 < a → 0 < r → ∀ w : ℂ,
      (a : ℂ) + (c + r * I) * w = 0 → w.im < 0 := by
  intro h
  have := h 1 0 1 one_pos one_pos I (by simp)
  norm_num at this

/-- The Cayley map: `|i - z|² - |i + z|² = -4 Im z`. -/
theorem cayley_normSq_sub (z : ℂ) :
    normSq (I - z) - normSq (I + z) = -4 * z.im := by
  simp only [normSq_apply, sub_re, sub_im, add_re, add_im, I_re, I_im]
  ring

/-- `|w| < 1` for `w = (i - z)/(i + z)` iff `Im z > 0`. -/
theorem cayley_disk_iff (z : ℂ) :
    normSq (I - z) < normSq (I + z) ↔ 0 < z.im := by
  have := cayley_normSq_sub z
  constructor <;> intro h <;> linarith

/-- `|w| = 1` for `w = (i - z)/(i + z)` iff `z` is real. -/
theorem cayley_circle_iff (z : ℂ) :
    normSq (I - z) = normSq (I + z) ↔ z.im = 0 := by
  have := cayley_normSq_sub z
  constructor <;> intro h <;> linarith

/-- The Jacobian of `(f₋, f₊) = ((z₁ - i)(z₂ - i), (z₁ + i)(z₂ + i))`,
`det [[z₂ - i, z₁ - i], [z₂ + i, z₁ + i]]`, at `(-i, i)` and `(i, -i)`. -/
theorem product_jacobian :
    ((I - I) * (-I + I) - (-I - I) * (I + I) = -4) ∧
      ((-I - I) * (I + I) - (I - I) * (-I + I) = 4) := by
  constructor <;> ring_nf <;> simp [I_sq]

/-- The corrected (3): `(2πi)² · res_{(-i, i)} = (2πi)² · (-1/4) = π²`
(here for any `p` in place of `π`). -/
theorem product_corrected_value (p : ℂ) :
    (2 * p * I) ^ 2 * (1 / (-4)) = p ^ 2 := by
  ring_nf
  simp [I_sq]

/-- The printed (3): `(2πi)² · res_{(i, -i)} = (2πi)² · (1/4) = -π²`. -/
theorem product_printed_value (p : ℂ) :
    (2 * p * I) ^ 2 * (1 / 4) = -p ^ 2 := by
  ring_nf
  simp [I_sq]

end TsikhResidues.Ch5

#print axioms TsikhResidues.Ch5.phi_plus_im_pos
#print axioms TsikhResidues.Ch5.phi_minus_im_neg
#print axioms TsikhResidues.Ch5.chart_plus_im_pos
#print axioms TsikhResidues.Ch5.chart_minus_im_neg
#print axioms TsikhResidues.Ch5.inv_im_nonpos
#print axioms TsikhResidues.Ch5.inv_im_nonneg
#print axioms TsikhResidues.Ch5.chart_plus_disjoint
#print axioms TsikhResidues.Ch5.chart_minus_disjoint
#print axioms TsikhResidues.Ch5.chart_printed_sign_fails
#print axioms TsikhResidues.Ch5.cayley_normSq_sub
#print axioms TsikhResidues.Ch5.cayley_disk_iff
#print axioms TsikhResidues.Ch5.cayley_circle_iff
#print axioms TsikhResidues.Ch5.product_jacobian
#print axioms TsikhResidues.Ch5.product_corrected_value
#print axioms TsikhResidues.Ch5.product_printed_value
