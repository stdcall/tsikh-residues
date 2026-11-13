#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

#heading(level: 2)[Calculation of the quantification error \ of a
  two-dimensional numerical recursive filter] <sec:filter>

#subsection[Definition of a quantification error] <ss:quantization-definition>
The concept of a numerical recursive filter arises in the digital signal
processing and starts from the finite-difference equation (see @bib:Dautov1981,
@bib:Jury1974)
$
  y_k = sum_(l <= k) p_l x_(k - l) - sum_(l <= k \ l != 0) q_l y_(k - l).
$ <eq:filter-equation>
Here $k = (k_1, ..., k_n)$ and $l = (l_1, ..., l_n)$ are multi-indices with
nonnegative integer components, and $l <= k$ means that $l_j <= k_j$ for all $j$
from 1 to $n$; ${p_l}$ and ${q_l}$ are finite sets of real (or complex) numbers,
where $q_0 = 1$. The sequences ${x_k}$ and ${y_k}$ are called respectively the
_input_ and _output signals of the filter._ Equation @eq:filter-equation can be
rewritten in the form
$
  Y = G dot X,
$ <eq:filter-transfer>
#source(181)where $X = sum_k x_k z^k$ and $Y = sum_k y_k z^k$ are the generating
functions for the input and output signals,
$
  G(z) = P(z) \/ Q(z), quad P(z) = sum_l p_l z^l, quad Q(z) = sum_l q_l z^l.
$
The rational function $G(z)$ that satisfies @eq:filter-transfer is called the
_transfer function of the filter._

The filters used at present by engineers are mainly two-dimensional, so we shall
consider the case $n = 2$.

Since $q_0 = 1$, it follows that $Q(0) != 0$, and the function $G(z)$ is
holomorphic in a neighborhood of the origin. Let
$
  G(z_1, z_2) = sum_(k_1, k_2 >= 0) g_(k_1 k_2) z_1^(k_1) z_2^(k_2)
$ <eq:filter-taylor>
be the Taylor expansion of $G$ at zero. The #index-mark(
  "Quantization error",
)_quantization error_ of the filter is defined by the formula (see
@bib:Roitman1981)
$
  J = sum_(k_1, k_2 >= 0) |g_(k_1 k_2)|^2.
$ <eq:quantization-error>
#notation-mark($J$, sort: "J")We assume that $p_l$, $q_l$, and consequently
$g_(k_1 k_2)$, are real numbers. In addition, we shall assume that $G$ is
represented by an uncancellable fraction $P \/ Q$. According to Parseval's
equality
$
  J = (2 pi i)^(-2) integral.double_(|z_1| = 1 \ |z_2| = 1) G dot overline(G)
  frac(d z_1 and d z_2, z_1 z_2).
$
We denote the unit bidisk by $scr(U) = {z = (z_1, z_2): |z_1| < 1, |z_2| < 1}$
and its distinguished boundary by $Gamma = {|z_1| = |z_2| = 1}$. Since the
variable $overline(z)_j$ equals $z_j^(-1)$, and the $g_(k_1 k_2)$ are real, we
have $overline(G(z_1, z_2)) = G(z_1^(-1), z_2^(-1))$ and
$
  J = (2 pi i)^(-2) integral_Gamma G(z_1, z_2) G(z_1^(-1), z_2^(-1))
  frac(d z_1 and d z_2, z_1 z_2).
$ <eq:quantization-integral>

#subsection[Expression for $J$ in terms of local residues]
<ss:quantization-residues>
Thus, by formula @eq:quantization-integral of
@ss:quantization-definition[subsection] the value of the quantization error is
represented by the integral, generally improper, of a rational function over a
cycle $Gamma$. If the function $G$ is holomorphic in a closed bidisk
$overline(scr(U))$, then the integral in this formula is proper, and in addition
$J$ coincides with the value of the Hadamard composition $H_(G, G) (t)$ at the
point $t = (1, 1)$ (see formula @eq:hadamard-integral-two of
@ss:hadamard-two-dimensional). Consequently, by the lemma of
@ss:hadamard-two-dimensional the error $J$ is expressed as the sum of local
residues of the integrand. Our problem is to show that this formula remains true
in the case when $G$ is nonholomorphic in $overline(scr(U))$. We first mention
the "nonholomorphy measure" of $G$ in $overline(scr(U))$ under the condition
that the series @eq:quantization-error of
@ss:quantization-definition[subsection] converges.

#proposition(title: [see @bib:Tsikh1985c])[
  #source(182)The series of squares of the Taylor coefficients of a rational
  function $G$ converges if and only if $G$ is holomorphic in $scr(U)$ and
  square integrable on its distinguished boundary:
  $G in scr(O) (scr(U)) inter L_2 (Gamma)$.
] <prop:square-summable>

#remark[
  As an addition to the assertion we have stated, we observe that the condition
  that the series of squares of the Taylor coefficients of the rational function
  $G$ converges implies that the latter is holomorphic not only in $scr(U)$, but
  also at all points of the closure $overline(scr(U))$, except for finitely many
  points of the distinguished boundary $Gamma$. In fact, according to the
  Weierstrass preparation theorem the complex curve ${Q(z_1, z_2) = 0}$ can
  touch the faces ${|z_1| < 1, |z_2| = 1}$ and ${|z_1| = 1, |z_2| < 1}$ (that
  is, it intersects these faces without getting into $scr(U)$) only when the
  polynomial $Q$ has a factor of the form $z_1 - z_1^0$ ($|z_1^0| = 1$) or
  $z_2 - z_2^0$ ($|z_2^0| = 1$). The latter is impossible because the fraction
  $P \/ Q$ is uncancellable and $G in L_2 (Gamma)$. For the same reason, $Q$ can
  vanish only at finitely many points of $Gamma$.
] <rem:square-summable>

As in connection with the Hadamard composition, we write the integrand in
@eq:quantization-integral of @ss:quantization-definition[subsection] in the form
$
  omega = frac(h(z_1, z_2) d z_1 and d z_2, f_1 (z_1, z_2) f_2 (z_1, z_2)),
$ <eq:filter-form>
where $f_1 = Q$, and $h$ and $f_2$ are polynomials. If the degree of the
numerator in @eq:filter-form is sufficiently high, then the extension of the
form $omega$ to the projective space $PP_2$ has poles on the complex curves
$F_1 = {f_1 = 0} union F_infinity$, $F_2 = {f_2 = 0}$, where $F_infinity$ is the
line at infinity in $PP_2$. We observe that $F_2$ either coincides with the set
${Q(z_1^(-1), z_2^(-1)) = 0}$ or is obtained from it by the addition of one or
both of the coordinate axes.

We set $scr(U)_(plus.minus plus.minus) = {|z_1| lt.gt 1, |z_2| lt.gt 1}$,
$Z = F_1 inter F_2$. We note that $scr(U)_(+ +) = scr(U)$, and the closures of
$scr(U)_(+ -)$ and $scr(U)_(- +)$ in $PP_2$ contain one of the points at
infinity $a_(+ -)^((infinity))$ and $a_(- +)^((infinity))$ each. We set
$hat(scr(U))_(+ -) = scr(U)_(+ -) union {a_(+ -)^((infinity))}$,
$hat(scr(U))_(- +) = scr(U)_(- +) union {a_(- +)^((infinity))}$.

#theorem[
  If the series of squares of the Taylor coefficients of the rational function
  $G$ converges, then its sum can be expressed in terms of the local residues of
  the form $omega$ as follows:
  $
    J = sum_(a in hat(scr(U))_(+ -)) res_a omega
    = - sum_(a in hat(scr(U))_(- +)) res_a omega.
  $ <eq:quantization-residues>
] <th:quantization-residues>

#proof[
  If $G$ is holomorphic in the closed bidisk
  $overline(scr(U)) = overline(scr(U))_(+ +)$, then formula
  @eq:quantization-residues follows from the remark above that
  $J = H_(G, G) (1, 1)$ and the lemma of @ss:hadamard-two-dimensional. We now
  consider the general case when the denominator $Q$ can have zeros on the
  distinguished boundary $Gamma$. From the condition of the theorem and the
  proposition of @ss:quantization-residues[subsection] it follows that the
  function $G in L_2 (Gamma)$, and so the integral of $omega$ over $Gamma$ is
  equal to an iterated integral:
  $
    J = (2 pi i)^(-2) integral_Gamma omega
    = (2 pi i)^(-2) integral_(|z_1| = 1) d z_1 integral_(|z_2| = 1)
    frac(h, f_1 f_2) d z_2.
  $ <eq:quantization-iterated>
  #source(183)Let $R(z_1)$ be the resultant of the polynomials $f_1$ and $f_2$,
  for which (see @bib:VanDerWaerden1971[p.~85]) there are polynomials $L$ and
  $S$ in the variables $(z_1, z_2)$ such that $R = L f_1 + S f_2$. Then the
  integrand in @eq:quantization-iterated is equal to
  $
    frac(h, f_1 f_2) = frac(h L, R f_2) + frac(h S, R f_1).
  $
  According to the remark to the proposition of
  @ss:quantization-residues[subsection], the polynomial $Q = f_1$ is not equal
  to zero on the face ${|z_1| = 1, |z_2| < 1}$, so for almost all $z_1$
  ($|z_1| = 1$) the fraction $h S \/ R f_1$ is holomorphic in $z_2$ in a closed
  disk, and by Cauchy's theorem the inner integral in @eq:quantization-iterated,
  which corresponds to the term $h S \/ R f_1$, is equal to zero, so
  $
    J = (2 pi i)^(-2) integral_(|z_1| = 1) d z_1 integral_(|z_2| = 1)
    frac(h L, R f_2) d z_2.
  $ <eq:quantization-l>
  We denote the inner integral in @eq:quantization-l by $I(z_1)$. Since $f_2$
  does not vanish on the set ${|z_1| = 1, |z_2| > 1}$, for almost all $z_1$ from
  the circle $|z_1| = 1$ the integral $I(z_1)$ is equal to the residue of the
  rational function $h L \/ R f_2$ at the point at infinity of the Riemann
  sphere, and so it is a rational function of $z_1$. But $I(z_1)$ is integrable
  on the circle ${|z_1| = 1}$ (since $G in L_2 (Gamma)$), so by the rationality
  of the function we conclude that $I(z_1)$ does not have poles on the unit
  circle. Therefore in @eq:quantization-l the outer integration can be carried
  out over the circle ${|z_1| = 1 + epsilon}$, where $epsilon$ is any positive
  number such that there are no poles of $I(z_1)$ in the ring
  ${1 <= |z_1| <= 1 + epsilon}$ (or, of course, zeros of the resultant
  $R(z_1)$).

  Thus,
  $
    J = (2 pi i)^(-2) integral_(Gamma(epsilon)) frac(h L, R f_2)
    d z_1 and d z_2,
  $ <eq:quantization-shifted>
  where $Gamma(epsilon) = {|z_1| = 1 + epsilon, |z_2| = 1}$, and $R$ and $f_2$
  do not vanish on $Gamma(epsilon)$. Exactly as in the lemma of
  @ss:hadamard-two-dimensional, we apply the arguments to the cycle
  $Gamma(epsilon)$ and the divisors $F_1 = {R(z_1) = 0} union F_infinity$,
  $F_2 = {f_2 = 0}$. As a result, from @eq:quantization-shifted we obtain
  $
    J = - sum_(a in hat(scr(U))_(- +)) res_a omega',
  $ <eq:quantization-shifted-residues>
  where $omega' = h L d z \/ R f_2$. We observe that the system of polynomials
  $(R, f_2)$ is obtained from $(f_1, f_2)$ by the transformation
  $R = L f_1 + S f_2$, $f_2 = 0 dot f_1 + 1 dot f_2$, and the determinant of
  this transformation is equal to $L$. Consequently, from the transformation
  formula (see @ss:transformation-formula) we obtain
  $res_a omega = res_a omega'$ for any point $a in CC^2$.

  To prove that the residues of $omega$ and $omega'$ are equal at the point at
  infinity $a_(- +)^((infinity)) in hat(scr(U))_(- +)$, we proceed as follows.
  We observe that when $lambda < 1$ the function $G_lambda = G(lambda z)$ is
  holomorphic in the closed bidisc $overline(scr(U))_(+ +)$. Formulas
  @eq:quantization-residues and @eq:quantization-shifted-residues hold for this
  function with the corresponding forms $omega_lambda$ and $omega'_lambda$ and
  the #source(184)quantity $J_lambda$. But since
  $res_a omega_lambda = res_a omega'_lambda$ for any point $a in CC^2$, the
  residues of $omega_lambda$ and $omega'_lambda$ also coincide at the point
  $a_(- +)^((infinity))$. Taking the limit as $lambda -> 1$ and using the
  continuity principle (see @ss:continuity-principle), we conclude that
  $res_(a_(- +)^((infinity))) omega = res_(a_(- +)^((infinity))) omega'$. Thus,
  the second equality in @eq:quantization-residues follows from
  @eq:quantization-shifted-residues. The first equality is proved similarly.
]

#example[
  Let $G = P \/ Q = (z_1 - z_2) \/ (2 - z_1 - z_2)(2 + z_1 + z_2)$. The zeros of
  the denominator of $G$ intersect the closed unit bidisk
  $overline(scr(U))_(+ +)$ at only two points $(1, 1)$ and $(-1, -1)$ lying on
  the distinguished boundary $Gamma$. At these points the numerator also
  vanishes. It is not difficult to verify that $G$ is square integrable on
  $Gamma$. Therefore according to the proposition in
  @ss:quantization-residues[subsection] the series of squares of the Taylor
  coefficients of $G$ converges, and by @eq:quantization-residues its sum is
  equal to $J = sum (res_a omega: a in hat(scr(U))_(+ -))$, where
  $
    omega = & -(z_1 - z_2)^2 d z_1 and d z_2
              \/ [(2 - z_1 - z_2)(2 + z_1 + z_2)] \
            & times [(2 z_1 z_2 - z_1 - z_2)(2 z_1 z_2 + z_1 + z_2)].
  $
  The line at infinity $F_infinity$ is not polar for the form $omega$, since the
  degree of the denominator exceeds the degree of the numerator by no less than
  three. The algebraic curves
  $F_1 = {f_1 := (2 - z_1 - z_2)(2 + z_1 + z_2) = 0}$ and
  $F_2 = {f_2 := (2 z_1 z_2 - z_1 - z_2)(2 z_1 z_2 + z_1 + z_2) = 0}$ have two
  common points in $hat(scr(U))_(+ -)$: $a^((1)) = (1 - sqrt(2), 1 + sqrt(2))$,
  $a^((2)) = (-1 + sqrt(2), -1 - sqrt(2))$. At these points the Jacobian of the
  polynomials $f_1$ and $f_2$ is nonzero, and by Cauchy's formula the
  calculation gives $res_(a^((j))) omega = sqrt(2) \/ 16$, $j = 1, 2$. As a
  result, $J = sqrt(2) \/ 8$.
] <exm:quantization>
