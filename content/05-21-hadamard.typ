#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

== Singularities of the two-dimensional Hadamard composition <sec:hadamard>

#subsection[The one-dimensional case] <ss:hadamard-one-dimensional>
Let $a(z)$ and $b(z)$ be holomorphic functions in a neighborhood of the point 0
of the complex plane $CC$ and let
$
  a(z) = sum_(k >= 0) a_k z^k, wide b(z) = sum_(k >= 0) b_k z^k
$
be their Taylor expansions. The #index-mark("Hadamard composition")_Hadamard
composition_ of the functions $a$ and $b$ is the function
$
  H_(a, b) (t) = sum_(k >= 0) (a_k dot b_k) t^k.
$
Hadamard's theorem on the multiplication of singularities asserts, in particular
(@bib:Bieberbach1955[§5.1]), that if $a(z)$ and $b(z)$ are single-valued
functions with only isolated singular points $alpha_j$ and $beta_k$ respectively
in the finite part of the complex plane, then their Hadamard composition
$H_(a, b) (t)$ can have singularities only at points of the form
$alpha_j dot beta_k$ (that is, the singularities are multiplied). Thus, this
theorem can be applied effectively to the case when the power series under
investigation can be divided into "factors," whose singularities can be found
more easily.

Let us give an idea of the proof of the theorem on multiplication of
singularities. On the assumption that the singularities of the function $b(z)$
lie in a bounded domain of the complex plane, the singularities of the function
$hat(b) (z) := b(t \/ z)$ for $t$ sufficiently close to zero fall into a
neighborhood of #source(174)zero. It is easy to see that the Hadamard
composition admits the integral representation
$
  H_(a, b) (t) = (2 pi i)^(-1) integral_Gamma a(z) b(t \/ z) frac(d z, z),
$ <eq:hadamard-integral>
where the contour $Gamma = {|z| = epsilon}$ is chosen so that it separates the
singularities ${alpha_j}$ and ${t \/ beta_k}$ of the functions $a(z)$ and
$b(t \/ z)$. Under a change of parameter $t$ in the integral
@eq:hadamard-integral the singularities $t \/ beta_k$ of the function
$hat(b) (z)$ can approach the contour $Gamma$. However, thanks to a possible
deformation of the contour we can perform a holomorphic extension of the
integral depending on a parameter, until either at least one of the
singularities $t \/ beta_k$ would merge with some point $alpha_j$, or the
singularity $t \/ beta_k$ would tend to infinity. In the assumption about
singularities of the function $b(z)$ the latter can happen only as
$t -> infinity$. Therefore, the function $H_(a, b) (t)$ can have singularities
only at points that satisfy at least one of the equalities
$t \/ beta_k = alpha_j$, that is, at points $t = alpha_j dot beta_k$.

For the case when $b(z) = P(z) \/ product_k (z - beta_k)^(r_k)$ is a rational
function we prove the same result by applying the proposition of
@ss:holomorphy-parameter. This method of proving the theorem on multiplication
of singularities will be used in @ss:hadamard-two-dimensional[subsection] in the
two-dimensional situation. The integral in @eq:hadamard-integral takes the form
$
  H_(a, b) (t) = (2 pi i)^(-1) integral_Gamma frac(h(z, t), f(z, t)) d z,
$ <eq:hadamard-integral-rational>
where $f(z, t) = z^m product_k (t - beta_k z)^(r_k)$ is a polynomial, $h(z, t)$
is a holomorphic function in $X times CC$, and $X = CC without {alpha_j}$ is the
domain of holomorphy for $a(z)$. Thus the integral
@eq:hadamard-integral-rational has the form @eq:parameter-residue from
@ss:holomorphy-parameter and according to the proposition of
@ss:holomorphy-parameter it can be extended to a domain $tilde(G) subset CC$,
over which the analytic set $Z = {(z, t) in X times CC: f(z, t) = 0}$ is an
analytic covering. Such a $tilde(G)$ will be the set of those $t in CC$ for
which $z^m product_k (t - beta_k z)^(r_k)$ has the greatest possible number of
roots in the domain $X$ (with multiplicities), that is,
$tilde(G) = CC without {t = alpha_j dot beta_k}$.

#subsection[The two-dimensional Hadamard composition and its singularities]
<ss:hadamard-two-dimensional>
Let
$
  a(z_1, z_2) = sum_(m, n >= 0) a_(m n) z_1^m z_2^n, wide
  b(z_1, z_2) = sum_(m, n >= 0) b_(m n) z_1^m z_2^n
$
be functions holomorphic in a neighborhood of the origin of the space $CC^2$,
and let
$
  H_(a b) (t_1, t_2) = sum_(m, n >= 0) (a_(m n) b_(m n)) t_1^m t_2^n
$ <eq:hadamard-two-dimensional>
#notation-mark($H_(a b)$, sort: "H a b")be their Hadamard composition.

The following simple example shows that in the two-dimensional situation the
theorem on multiplication of singularities in an equivalent formulation becomes
extremely rough if we understand the product $A dot B$ of singularities $A$ and
$B$ of the functions $a$ and $b$ to be the totality of coordinate-wise #source(
  175,
)products ${z w = (z_1 w_1, z_2 w_2): z in A, w in B}$. Namely, it is easy to
verify that for the set $A = {z_1 + z_2 - 1 = 0}$ the product $A dot A$ is the
entire space $CC^2$, while the Hadamard composition $H_(a, a)$ of the function
$a = (z_1 + z_2 - 1)^(-1)$ (whose singularities coincide with $A$) with itself
is holomorphic at the origin.

Nevertheless, let us try to obtain some analog of the theorem on multiplication
of singularities for the Hadamard composition in the case when $a$ and $b$ are
rational functions of two variables. It turns out that, as a rule, to obtain
singularities of the composition $H_(a, b)$ we must multiply coordinate-wise
only those points $z in A$, $w in B$ that satisfy some algebraic equation in the
space $CC^4$ of the variables $z, w$. In certain cases we add to the
singularities the limiting values of the product $z w$ when $(z, w)$ tends to
infinity so that $z in A$, $w in B$.

Thus, let $a(z) = M(z) \/ N(z)$ and $b(z) = P(z) \/ Q(z)$ be rational functions
of two variables $z = (z_1, z_2)$ that are holomorphic at the origin,
$N(0, 0) != 0$, $Q(0, 0) != 0$. The singularities of the functions $a$ and $b$
are the algebraic sets $A = {N(z) = 0}$ and $B = {Q(z) = 0}$.

#theorem[
  The Hadamard composition $H_(a, b) (t_1, t_2)$ of the rational functions $a$
  and $b$ is an algebraic function and it can have singularities only on the
  union $R_b union R_Pi$ of algebraic curves, where $R_b$ is an algebraic curve
  lying in the set $A dot B$ of the coordinate-wise product of singularities,
  and $R_Pi$ is the set of limiting values of the coordinate-wise products
  ${z dot w: (z, w)|_(A times B) -> infinity}$ (the notation
  $(z, w)|_(A times B) -> infinity$ means that $(z, w)$ tends to infinity on the
  set $A times B$).
] <th:hadamard>

#remark[
  The notations $R_b$ and $R_Pi$ are explained by the fact that branching of the
  algebraic function $H_(a, b)$ can happen only around $R_b$, and $R_Pi$ is a
  polar curve of single-valued character (see @bib:Safonov1985).
] <rem:hadamard-notation>

#remark[
  Specific equations for the curves $R_b$ and $R_Pi$ will be written out after
  the proof of the theorem.
] <rem:hadamard-equations>

#proof[
  As in the one-dimensional case, for the composition we have the integral
  representation
  $
    H_(a, b) (t_1, t_2) = (2 pi i)^(-2) integral_Gamma a(z_1, z_2)
    b(t_1 \/ z_1, t_2 \/ z_2) frac(d z_1 and d z_2, z_1 z_2),
  $ <eq:hadamard-integral-two>
  where $Gamma = {|z_1| = |z_2| = rho}$, $rho$ is chosen so that the functions
  $a$ and $b$ are holomorphic in the closed bidisk
  $overline(scr(U)) = {|z_1| <= rho, |z_2| <= rho}$ (this is equivalent to $N$
  and $Q$ not being equal to zero in $overline(scr(U))$), and $(t_1, t_2)$
  varies close to zero. After the obvious transformations,
  @eq:hadamard-integral-two can be written in the form
  $
    H_(a, b) (t) = (2 pi i)^(-2) integral_Gamma
    frac(h(z, t) d z, f_1 (z) f_2 (z, t)), wide z = (z_1, z_2), quad
    t = (t_1, t_2),
  $ <eq:hadamard-integral-reduced>
  where $f_1 (z) = N(z)$, $f_2 (z, t) = z_1^(r_1) z_2^(r_2) Q(t_1 \/ z_1,
    t_2 \/ z_2)$, and $r_i$ is greater than or equal to the degree of the
  polynomial $Q$ in the variable $z_i$, so $f_2$ and #source(176)$h(z, t)$ are
  polynomials. We observe that since $Q != 0$ in $overline(scr(U))$, for
  sufficiently small $t$ the function $f_2 (z, t)$ is not equal to zero when
  $|z_1| >= rho$, $|z_2| >= rho$.

  In order to describe the singularities of the integral
  @eq:hadamard-integral-reduced, which depends on a parameter, we apply the
  results of §§@sec:representability[n], @sec:parameter[n]. Namely, by means of
  the theorem of @ss:separating-cycles we show that it is equal to the sum of
  local residues, and then we find their singularities, using the proposition of
  @ss:holomorphy-parameter.

  The integrand
  $
    omega(z, t) = h(z, t) d z \/ f_1 (z) dot f_2 (z, t)
  $ <eq:hadamard-form>
  in the projective space $PP_2$ in addition to the curves ${f_1 = 0}$ and
  ${f_2 = 0}$ can also have singularities on the line at infinity $F_infinity$,
  which in the homogeneous coordinates $(z_0, z_1, z_2)$ is characterized by the
  condition $z_0 = 0$. We consider in $PP_2$ the divisors
  $F_1 = {f_1 = 0} union F_infinity$, $F_2 = F_2 (t) = {f_2 (z, t) = 0}$. From
  the definitions of the functions $f_j$ it is clear that $F_1$ is the union of
  the set $A$ of singularities of $a(z)$ and the line at infinity, and $F_2 (t)$
  is the set that in the finite (affine) part consists of points $(z_1, z_2)$
  such that $(t_1 \/ z_1, t_2 \/ z_2) in B$, possibly including one or both of
  the coordinate axes.

  We put $scr(U)_(plus.minus plus.minus)
  = {|z_1| lt.gt rho, |z_2| lt.gt rho}$#notation-mark(
    $scr(U)_(plus.minus plus.minus)$,
    sort: "U",
  ), where $rho$ is chosen so that the integral representations
  @eq:hadamard-integral-two and @eq:hadamard-integral-reduced hold;
  consequently, the divisors $F_1$ and $F_2$ do not intersect
  $overline(scr(U))_(+ +)$ and $overline(scr(U))_(- -)$ respectively. Thus,
  $F_1 inter F_2$ lies in the union
  $overline(scr(U))_(+ -) union overline(scr(U))_(- +)$ of the closures of the
  "poles" $scr(U)_(+ -)$ and $scr(U)_(- +)$; these closures contain one each of
  the points $a_(+ -)^((infinity))$, $a_(- +)^((infinity))$, which in the
  homogeneous coordinates $(z_0, z_1, z_2)$ are written in the form
  $a_(+ -)^((infinity)) = (0, 0, z_2)$, $a_(- +)^((infinity)) = (0, z_1, 0)$.
]

#lemma[
  Under the stated choice of the radius $rho$, the Hadamard composition of the
  functions $a$ and $b$ is expressed in terms of the local residues of the form
  @eq:hadamard-form by the formulas
  $
    H_(a, b) (t) = sum_(z(t) in overline(scr(U))_(+ -)) res_(z(t)) omega(z, t)
    = - sum_(z(t) in overline(scr(U))_(- +)) res_(z(t)) omega(z, t).
  $ <eq:hadamard-residues>
] <lem:hadamard-residues>

#remark(numbered: false)[
  The fact that $H_(a, b)$ is algebraic follows from @eq:hadamard-residues and
  the proposition of @ss:algebraicity-parameter.
] <rem:hadamard-algebraic>

#proof[
  For the cycle $Gamma$ from the integral representation
  @eq:hadamard-integral-two we have $Gamma = (-1)^(k - 1) partial c^((k))$,
  where the $c^((k))$ are the three-dimensional chains
  $
                    c^((1)) & = {|z_1| <= rho, |z_2| = rho}, \
    c^((2)) = c_alpha^((2)) & = {|z_2| >= rho,
                                |z_1| - rho = alpha(|z_2| - rho)},
  $
  and $alpha > 0$ is an arbitrary real number. For the supports of these chains
  we have $|c^((1))| subset PP_2 without F_1$, $|c^((2))| subset
  PP_2 without F_2$. By Corollary~@cor:domain-boundary of
  @ss:separation-coefficients in the domain $PP_2 without F_1 union F_2$ of
  regularity of the form $omega(z, t)$ the cycle $Gamma$ is homologous to the
  sum $sum (Gamma_(z(t)): z(t) in G)$, where $Gamma_(z(t))$ is a local cycle at
  the point $z(t)$ of intersection of the divisors $F_1$ and $F_2 (t)$, and
  $G = G_alpha = {|z_2| > rho, |z_1| - rho < alpha(|z_2| - rho)}$. Clearly,
  $overline(G)_alpha$ tends to $overline(scr(U))_(+ -)$ when $alpha -> 0$, so
  #source(177)$Gamma ~ sum (Gamma_(z(t)): z(t) in overline(scr(U))_(+ -))$;
  hence the first equality in @eq:hadamard-residues is established. The second
  equality follows from the theorem of @ss:total-sum-theorem on the total sum of
  residues.

  Let us pass to the proof of the second part of the theorem; the description of
  the singularities of $H_(a, b) (t)$. By formula @eq:hadamard-residues the
  function $H_(a, b) (t)$ is the sum of residues at those finite points
  $z(t) = z^((nu)) (t)$ of the intersection $Z(t)$ that lie in the domain
  $scr(U)_(+ -)$, plus the residue $res_(a_(+ -)^((infinity))) omega(z, t)$ at a
  stationary point (that does not change as $t$ varies). According to the
  proposition of @ss:holomorphy-parameter, each residue at a point
  $z^((nu)) (t) in scr(U)_(+ -)$ can have singularities only on the set
  $R_b union R'_Pi$, where $R_b$ is the set of points $t' in CC^2$ around which
  there occurs a ramification of the element $z^((nu)) (t)$ of the multi-valued
  algebraic vector-valued function defined by the system of equations
  ${f_1 (z) = f_2 (z, t) = 0}$, and $R'_Pi$ is the set of those points
  $t' in CC^2$ at which at least one element $z^((nu)) (t) in scr(U)_(+ -)$ has
  a pole (it tends precisely to the point at infinity $a_(- +)^((infinity))$ as
  $t -> t'$). Similarly, the residue at the stationary point
  $a_(+ -)^((infinity))$ can have singularities only in the set $R''_Pi$ of
  those points $t' in CC^2$ at which at least one element
  $z^((nu)) (t) in scr(U)_(- +)$ tends to $a_(+ -)^((infinity))$ as $t -> t'$.
  We observe that it can happen that $Z(t)$ for small $t$ does not have points
  in $CC^2$, that is, it consists of one or two points at infinity. In this case
  for any $t$ either $Z(t) inter CC^2$ is empty or it is nondiscrete, that is,
  it consists of an algebraic curve whose closure in $PP_2$ intersects at least
  one of the points $a_(- +)^((infinity))$, $a_(+ -)^((infinity))$. The set
  $R'''_Pi$ of those points $t'$ for which this last property holds can also be
  singular for the residue at the stationary point. Thus, the set of
  singularities of $H_(a, b) (t)$ is concentrated on $R_b union R_Pi$, where
  $R_Pi = R'_Pi union R''_Pi union R'''_Pi$. Here $R_b$ is the discriminant set
  of the algebraic vector-valued function defined by the system of equations
  $
    N(z) = Q(t_1 \/ z_1, t_2 \/ z_2) = 0.
  $ <eq:hadamard-system>
  This set is algebraic, that is, it is specified by a polynomial equation
  $Phi(t_1, t_2) = 0$. In addition, according to @eq:hadamard-system for
  $t = (t_1, t_2) in R_b$ there is a point $z in A$ such that
  $w := (t_1 \/ z_1, t_2 \/ z_2) in B$, that is, $t = z dot w in A dot B$.

  Each point $t' in R_Pi$ is characterized by the fact that there are solutions
  $z(t)$ of the system @eq:hadamard-system with the property $z(t) -> infinity$
  as $t -> t'$. Again, this implies that there are sequences
  ${t^((n))} subset CC^2$, ${z^((n))} subset A$ such that $t^((n)) -> t'$,
  $z^((n)) -> infinity$, $w^((n)) := (t_1^((n)) \/ z_1^((n)),
    t_2^((n)) \/ z_2^((n))) in B$. Hence
  $t' = lim_(n -> infinity) z^((n)) dot w^((n))$.

  It remains to establish that the set $R_Pi$ is algebraic. To do this, we
  eliminate the variable $z_2$ in the system @eq:hadamard-system, obtaining a
  polynomial $R_1 (z_1, t_1, t_2)$, then eliminate the variable $z_1$, obtaining
  a polynomial $R_2 (z_2, t_1, t_2)$. If $k_i (t_1, t_2)$ is the coefficient at
  the highest power of $z_i$ in $R_i$ ($i = 1, 2$), then clearly
  $R_Pi = {t: k_1 (t) dot k_2 (t) = 0}$. This proves the theorem.
]

The equation for the polar curve of the Hadamard composition was written out
using the system @eq:hadamard-system (that is, the singularities of the
functions $a$ #source(178)and $b$) at the end of the proof of the theorem. In
order to write out the equation for the branch curve, we denote by $N^* (z)$ and
$Q^* (z)$ the products of the first degrees of all irreducible factors of the
polynomials $N$ and $Q$ respectively. Let $J$ be the Jacobian of the system of
Laurent polynomials $N^* (z)$, $Q^* (t_1 \/ z_1, t_2 \/ z_2)$ in the variables
$z_1, z_2$. If $J = J(z, t)$ is not identically zero on the solutions of the
system @eq:hadamard-system, then after eliminating the variables $z_1, z_2$ from
the system of equations, we obtain an equation $Phi(t_1, t_2) = 0$ for $R_b$.

#example[
  Let
  $
    a(z_1, z_2) = (1 - z_1 - z_2)^(-1) = sum_(m, n >= 0) binom(m + n, n)
    z_1^m z_2^n.
  $
  We calculate the composition
  $H_(a, a) (t) = sum_(m, n >= 0) binom(m + n, n)^2 t_1^m t_2^n$ from
  @eq:hadamard-residues. We have
  $
    omega(z, t) & = frac(
                    d z_1 and d z_2,
                    (1 - z_1 - z_2)(1 - t_1 \/ z_1 - t_2 \/ z_2) z_1 z_2
                  ) \
                & = frac(
                    d z_1 and d z_2,
                    (1 - z_1 - z_2)(z_1 z_2 - t_2 z_1 - t_1 z_2)
                  ),
  $
  where the form $omega(z, t)$ does not have poles on the line at infinity
  $F_infinity$. The intersection $F_1 inter F_2 (t)$ of the divisors
  $F_1 = {1 - z_1 - z_2 = 0}$, $F_2 = {z_1 z_2 - t_2 z_1 - t_1 z_2 = 0}$
  consists of two points $z^((nu)) (t)$, $nu = 1, 2$, and for $t$ close to zero
  the point
  $
    z^((1)) (t) = & lr(
                      \( frac(1 + t_1 - t_2, 2)
                      - sqrt((frac(1 + t_1 - t_2, 2))^2 - t_1)\,
                    ) \
                  & quad lr(
                      1 - frac(1 + t_1 - t_2, 2)
                      + sqrt((frac(1 + t_1 - t_2, 2))^2 - t_1) \)
                    )
  $
  is in $scr(U)_(+ -)$. The Jacobian of the system $1 - z_1 - z_2$,
  $z_1 z_2 - t_2 z_1 - t_1 z_2$ is equal to $J = (z_2 - z_1) + (t_1 - t_2)$, so
  from @eq:hadamard-residues by Cauchy's formula
  $
    H_(a, a) (t) = res_(z^((1)) (t)) omega(z, t)
    = frac(1, J(z^((1)) (t), t))
    = frac(1, sqrt((1 - t_1 - t_2)^2 - 4 t_1 t_2)).
  $
] <exm:hadamard-square>

#example[
  Let
  $
    a(z) & = (1 - z_1 - z_2 z_3)^(-1) = sum_(m, n >= 0) binom(m + n, n)
           z_1^m z_2^n z_3^n, \
    b(z) & = (1 - z_1 z_2 - z_3)^(-1) = sum_(m, n >= 0) binom(m + n, n)
           z_1^m z_2^m z_3^n
  $
  be rational functions of three variables. Their Hadamard composition has the
  form
  $
    H_(a, b) (t) = sum_(n >= 0) binom(2 n, n)^2 (t_1 t_2 t_3)^n.
  $
  #source(179)Using the formula $(2 n)! = n! 2^n dot (2 n - 1)!!$, we have
  $
    H_(a, b) (t) = sum_(n >= 0) frac([(2 n - 1)!!]^2, (n!)^2 2^(2 n))
    (16 t_1 t_2 t_3)^n = F(1 \/ 2, 1 \/ 2, 1, 16 t_1 t_2 t_3),
  $
  where $F(alpha, beta, gamma, xi)$ is the Gauss hypergeometric function. In our
  case, when $alpha = beta = 1 \/ 2$, $gamma = 1$, this function is reduced to
  the complete elliptic integral (see @bib:Bateman1953)
  $
    F(1 \/ 2, 1 \/ 2, 1, xi) = frac(2, pi) integral_0^1
    frac(d u, sqrt((1 - u^2)(1 - u^2 xi)))
  $
  and it is not algebraic.
] <exm:hadamard-three>

This example shows that in dimension $n > 2$ the Hadamard composition is
expressed in terms of the periods of Abelian integrals
(@bib:Aizenberg1979b[p.~170], @bib:Griffiths1969) and not in terms of local
residues. This is also obvious from the integral representation of the
multidimensional Hadamard composition (see formula @eq:hadamard-integral of
@ss:hadamard-one-dimensional[subsection], where the scalar variables $z$ and $t$
must be replaced by vector variables, $t \/ z$ by
$(t_1 \/ z_1, ..., t_n \/ z_n)$, and $Gamma$ by the distinguished boundary of
the polydisk). For rational functions $a(z)$ and $b(z)$ the integrand has
singularities only on two divisors, and for an analysis of a local residue we
need $n$ divisors.

#subsection[The diagonal of a double power series] <ss:diagonal>
The construction of the diagonal of a double power series is closely related to
the concept of a Hadamard composition. Suppose that the function $G(z_1, z_2)$
is holomorphic in a neighborhood of zero and that
$
  G(z_1, z_2) = sum_(m, n >= 0) g(m, n) z_1^m z_2^n
$ <eq:diagonal-series>
is its Taylor expansion. We fix certain natural numbers $p$ and $q$ and call the
function
$
  d_(p, q) (t) = sum_(k >= 0) g(k p, k q) t^k
$ <eq:diagonal>
of one complex variable $t$ the #index-mark(
  "Diagonal of a series",
)_$(p, q)$-diagonal of the series_ @eq:diagonal-series. Interest in the
investigation of the diagonal of a multiple series is related to its application
in combinatorics (@bib:Egorychev1977, @bib:Djokovic1978), theoretical physics
(@bib:Parasyuk1962, @bib:Gilbert1965), algebraic geometry (@bib:Deligne1984),
and the solution of difference equations (@bib:Hautus1971). Apparently Poincaré
@bib:Poincare1952 was the first to consider the problem of the asymptotics of
the Taylor coefficients $g(k p, k q)$ as $k -> infinity$ and the related problem
of singularities of the diagonal $d_(p, q)$.

If $G$ is the product of functions of one variable: $G = a(z_1) dot b(z_2)$,
then when $p = q = 1$ the diagonal @eq:diagonal, constructed from $G$, coincides
with the Hadamard composition of the functions $a$ and $b$ (see
@ss:hadamard-one-dimensional[subsection]). Therefore in this special case the
singularities of the diagonal $d_(1, 1) (t)$ are obtained as products
$z_1 dot z_2$ of the coordinates of the singularities of #source(180)the
original function $G$. Such a connection between the singularities of the
diagonal and the original function is not accidental, and by analogy with the
theorem of @ss:hadamard-two-dimensional[subsection] we have the following
result.

#proposition[
  If $G(z_1, z_2) = M \/ N$ is a rational function with singularities on the
  algebraic curve $A = {N = 0}$, then its $(p, q)$-diagonal $d_(p, q) (t)$ is an
  algebraic function with singularities on the set $R_b union R_Pi$, where
  $R_b = {Phi(t) = 0}$ are zeros of some polynomial $Phi(t)$, that lie in the
  set of products ${t = z_1^p z_2^q}$ of coordinates of points
  $(z_1, z_2) in A$, and $R_Pi$ is the set of limiting values of products
  ${z_1^p z_2^q: (z_1, z_2)|_A -> infinity}$.

  More precisely, $R_b$ is the ramification set of the vector-valued function
  $z = phi(t)$ satisfying the system of equations $N(z) = z_1^p z_2^q - t = 0$,
  and $R_Pi$ is the set of its poles.
] <prop:diagonal>

The proof of the proposition is based on the integral representation for the
diagonal
$
  d_(p, q) (t) = (2 pi i)^(-2) integral_Gamma
  frac(G(z_1, z_2) z_1^(p - 1) z_2^(q - 1) d z_1 and d z_2, z_1^p z_2^q - t)
$ <eq:diagonal-integral>
as an integral over the cycle $Gamma = {|z_1| = |z_2| = rho}$, where $rho$ is
chosen so that $G$ is holomorphic in the bidisk ${|z_1| <= rho, |z_2| <= rho}$.
If $G = M \/ N$ is a rational function, then the integrand in
@eq:diagonal-integral is represented in the form
$omega(z, t) = h(z) d z \/ f_1 (z) f_2 (z, t)$ with poles on ${N := f_1 = 0}$,
${f_2 := z_1^p z_2^q - t = 0}$ and possibly on the line at infinity $F_infinity$
if we consider this form in projective space. After that we follow the proof of
the theorem of @ss:hadamard-two-dimensional[subsection]: as in the lemma of
@ss:hadamard-two-dimensional[subsection], we express the diagonal as a sum of
local residues, then by means of the proposition in @ss:holomorphy-parameter we
investigate their singularities (for the details see @bib:Safonov1984). The fact
that $d_(p, q) (t)$ is algebraic follows from the proposition in
@ss:algebraicity-parameter.
