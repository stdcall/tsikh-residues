#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

== Calculation of a class of integrals over $RR^2$ <sec:integrals>

#subsection[Boundedness of the range of application of local residues]
<ss:range-boundedness>
Among the numerous applications of the theory of residues for functions in one
variable, the most popular is the calculation of definite integrals by means of
residues. For example, the convergent integral
$integral_(-infinity)^infinity P(x) d x \/ Q(x)$ of a rational function over the
line $RR^1$ is equal to $2 pi i$ times the sum of the residues of the integrand
in the upper half-plane. Attempts to apply local residues to the calculation of
integrals of rational functions in $n$ variables over the space $RR^n$ encounter
difficulties in principle. Consider the example
$
  I = integral.double_(RR^2) frac(d x_1 d x_2, (x_1^2 + x_2^2 + R)^2), wide
  R > 0.
$ <eq:integral-example>
On the complexification of $RR^2$ (so that $x_1 = Re z_1$, $x_2 = Re z_2$) the
integrand has singularities on the complex algebraic curve
$K = {(z_1, z_2) in CC^2: z_1^2 + z_2^2 + R = 0}$. This curve is a smooth
manifold, and so the polynomial $z_1^2 + z_2^2 + R$ cannot be represented at any
point $a in K$ as the product #source(185)of two functions holomorphic in a
neighborhood of $a$ with an isolated common zero at this point. In other words,
the pole of the integrand (which is a rational form) cannot be represented as
the union of two divisors in $CC^2$ with an isolated intersection, so the
integral @eq:integral-example cannot be expressed in terms of local residues in
the complexification $CC^2$ of the space $RR^2$.

In addition, we can show that the integral @eq:integral-example not only cannot
be expressed in terms of local residues, but also cannot be expressed in terms
of double residues in $CC^2$, that is, in terms of integrals
$integral_Gamma omega$ of the form
$omega = d z_1 and d z_2 \/ (z_1^2 + z_2^2 + R)^2$ over compact two-dimensional
cycles in $CC^2 without K$.

#subsection[A class of rational functions] <ss:rational-class>
Let us mention one case of integrals over $RR^2$ of rational functions in two
variables, whose calculation reduces to the calculation of local residues.
Consider an integral of the form
$
  I = integral.double_(RR^2) G(x_1, x_2) d x_1 d x_2,
$ <eq:integral-class>
where
$
  G(x_1, x_2) = h(x_1, x_2) bigslash
  product_(j = 1)^m [(a_j x_1 + b_j x_2 + c_j)^2 + r_j^2]^(q_j),
$ <eq:integral-class-g>
$h$ is a polynomial, $a_j, b_j, c_j, r_j$ are real numbers, $r_j != 0$, and
$q_j$ are natural numbers. We can assume that $a_j >= 0$, $r_j > 0$, and if
$a_j = 0$, then $b_j > 0$.

Let $omega = G(z_1, z_2) d z_1 and d z_2$ be the extension of the integrand in
@eq:integral-class-g to the complexification $CC^2$ of the space $RR^2$. We
represent the denominator as a product $f_- dot f_+$, where
$
  f_(plus.minus) = product_(j = 1)^m
  [a_j z_1 + b_j z_2 + c_j plus.minus i r_j]^(q_j)
$
($i$ is the imaginary unit). We denote by
$CC_(plus.minus) = {zeta in CC: Im zeta gt.lt 0}$ the upper and lower
half-planes of the space $CC$.

#theorem[
  If the integral @eq:integral-class converges absolutely, then it can be
  expressed in terms of local residues by the formulas
  $
    I = (2 pi i)^2 sum_(a in CC times CC_+) res_a ""_((f_-, f_+)) (h)
    = -(2 pi i)^2 sum_(a in CC times CC_-) res_a ""_((f_-, f_+)) (h);
  $ <eq:integrals-residues>
  in other words, the integral $I$ is equal (up to a factor
  $plus.minus (2 pi i)^2$) to the sum of the residues of the integrand
  $omega = G d z_1 and d z_2$ with respect to the divisors
  $F_(plus.minus) = {f_(plus.minus) = 0}$ at points $a$ of the domain
  ${(z_1, z_2) in CC^2: Im z_2 gt.lt 0}$.
] <th:integrals-residues>

#proof[
  Let $overline(CC)^2$ be a product of Riemann spheres and $overline(RR^2)$ be
  the closure of the real subspace $RR^2$ in $overline(CC)^2$. Clearly,
  $overline(RR)^2 = overline(RR^2)$. We denote by
  $c_(plus.minus) = overline(CC)_(plus.minus) times overline(RR)$ the product of
  the closed upper (lower) half-plane and the closed real line; $c_(plus.minus)$
  are the three-dimensional chains that are the closures in $overline(CC)^2$ of
  the sets ${Im z_1 gt.lt 0, Im z_2 = 0}$.
]

#lemma[
  #source(186)The divisor $F_(plus.minus) = {f_(plus.minus) = 0}$ can intersect
  the chain $c_(plus.minus)$ only at the point $(infinity, infinity)$:
  $F_+ inter (c_+ without {(infinity, infinity)}) = emptyset$,
  $F_- inter (c_- without {(infinity, infinity)}) = emptyset$.
] <lem:divisors-chains>

#proof[
  We first show that in the finite part $CC^2 subset overline(CC)^2$ the divisor
  $F_(plus.minus)$ does not intersect the chain $c_(plus.minus)$, that is, for
  each $j$ from 1 to $m$ the linear function
  $phi_(j plus.minus) := a_j z_1 + b_j z_2 + c_j plus.minus i r_j$ does not
  vanish on $c_(plus.minus)$. Indeed, by the assumption $a_j >= 0$, $r_j > 0$,
  so $Im phi_(j +)|_(c_+) > 0$, $Im phi_(j -)|_(c_-) < 0$.

  Let us examine the situation at infinity. Consider the chart in
  $overline(CC)^2$ with coordinates $z'_1 = z_1^(-1)$, $z'_2 = z_2^(-1)$
  containing the point $(z'_1, z'_2) = (0, 0)$, that is, the point
  $(z_1, z_2) = (infinity, infinity)$. If $a_j != 0$, $b_j != 0$, then the
  divisor $F_(j plus.minus) := {phi_(j plus.minus) = 0}$ in this chart is given
  by the equation $a_j z'_2 + b_j z'_1 + (c_j plus.minus i r_j) z'_1 z'_2 = 0$.
  Consequently, $F_(j plus.minus)$ intersects each of the lines at infinity
  ${z'_1 = 0}$, ${z'_2 = 0}$ at one point $(0, 0)$. If $a_j = 0$, $b_j != 0$,
  then $F_(j plus.minus) = {b_j + (c_j plus.minus i r_j) z'_2 = 0}$, that is,
  for $(z'_1, z'_2) in F_(j plus.minus)$ the imaginary part
  $Im z'_2 = Im[-b_j \/ (c_j plus.minus i r_j)] != 0$ and
  $F_(j plus.minus) inter c_(plus.minus) = emptyset$. Finally, if $a_j > 0$,
  $b_j = 0$, then $F_(j plus.minus) = {a_j + (c_j plus.minus i r_j) z'_1 = 0}$,
  that is, for $(z'_1, z'_2) in F_(j plus.minus)$ the imaginary part
  $Im z'_1 gt.lt 0$ and $F_(j plus.minus) inter c_(plus.minus) = emptyset$. We
  leave the reader to verify that in the charts $(z_1, z_2^(-1))$ and
  $(z_1^(-1), z_2)$ the intersections $F_(plus.minus) inter c_(plus.minus)$ are
  empty.

  Let us make the change of variables
  $w = Phi(z): w_j = (i - z_j) \/ (i + z_j)$, $j = 1, 2$, under which the
  closure $overline(RR^2)$ of the real space $RR^2 subset CC^2$ goes over to the
  distinguished boundary $Gamma = {|w_1| = |w_2| = 1}$ of the bidisk, and the
  integral @eq:integral-class goes over to
  $
    I = integral.double_Gamma frac(tilde(h) (w), tilde(f)_- tilde(f)_+)
    d w_1 and d w_2.
  $ <eq:integral-bidisk>
  This change of variables takes the upper half-plane in each variable $z_j$
  into a unit disk, the chains $c_(plus.minus)$ into the chains
  $
    tilde(c)_+ = {|w_1| <= 1, |w_2| = 1}, quad
    tilde(c)_- = {|w_1| >= 1, |w_2| = 1} subset overline(CC)^2,
  $
  and the point $(infinity, infinity)$ into $(-1, -1) in Gamma$. According to
  the lemma the divisor $tilde(F)_- := {tilde(f)_- = 0}$ can intersect the chain
  $tilde(c)_-$ only at the point $(-1, -1)$, so the arguments in the proof of
  the theorem of @sec:filter can be applied. Thus, the integral
  @eq:integral-bidisk can be expressed in terms of the sum of the residues of
  the integrand associated with the intersection points of the divisors
  $tilde(F)_(plus.minus) = {tilde(f)_(plus.minus) = 0}$ in the domain
  ${|w_2| > 1}$. After returning to the original variables $z_j$ we arrive at
  @eq:integrals-residues.
]

#example[
  Let us calculate the integral
  $
    I = integral.double_(RR^2) d x_1 d x_2 \/ (x_1^2 + r_1^2)(x_2^2 + r_2^2)
    [(x_1 + x_2)^2 + r_3^2].
  $
  The system of equations $f_- = f_+ = 0$, where
  $f_(plus.minus) = (z_1 plus.minus i r_1)(z_2 plus.minus i r_2) times
  [(z_1 + z_2) plus.minus i r_3]$, has the following three roots in the domain
  ${Im z_2 > 0}$:
  $
    a^((1)) = (-i r_1, i r_2), quad a^((2)) = (-i r_1, i(r_1 + r_3)), quad
    a^((3)) = (-i(r_2 + r_3), i r_2).
  $
  #source(187)If $r_1 + r_3 != r_2$, $r_2 + r_3 != r_1$, then these roots are
  pairwise distinct and simple for the mapping $f = (f_-, f_+)$. Therefore
  $
    res_(a^((1))) ""_f (1)
    & = -[1 \/ (z_1 - i r_1)(z_2 + i r_2)[(z_1 + z_2)^2 + r_3^2]]|_(a^((1))), \
    res_(a^((2))) ""_f (1)
    & = -[1 \/ (z_1 - i r_1)(z_2^2 + r_2^2)(z_1 + z_2 + i r_3)]|_(a^((2))), \
    res_(a^((3))) ""_f (1)
    & = -[1 \/ (z_1^2 + r_1^2)(z_2 + i r_2)(z_1 + z_2 - i r_3)]|_(a^((3))).
  $
  By formula @eq:integrals-residues, the integral $I$ is equal to $(2 pi i)^2$
  times the sum of these residues, and after calculations we have
  $I = pi^2 \/ r_1 r_2 r_3 (r_1 + r_2 + r_3)$.

  We observe that since the original integral is continuous in the parameters
  $r_j > 0$, the resulting expression for $I$ is also true in the case when
  $r_1 + r_3 = r_2$ or $r_2 + r_3 = r_1$. In this case instead of three distinct
  roots in the domain ${Im z_2 > 0}$ there will be two, one of which is
  multiple. Calculations of this root, taking account of multiplicity, give the
  same result (the same analytic expression for $I$ in the parameters $r_j$).
] <exm:integral-three>
