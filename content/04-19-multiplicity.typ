#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

#heading(
  level: 2,
)[Applications to the calculation of the multiplicity of mappings]
<sec:multiplicity>

This section is devoted to applications of local residues to the calculation of
the multiplicity of mappings $f: CC^n -> CC^n$. The applications are based on
formula @eq:logarithmic-residue of @ss:geometric-trace, according to which the
multiplicity $mu_a (f)$ of an isolated zero $a$ of the holomorphic mapping $f$
is equal to the local residue $res_a omega$, where $omega$ is the logarithmic
differential $d f \/ f = (d f_1 \/ f_1) and dots.c and (d f_n \/ f_n)$ of the
mapping $f$.

#subsection[Bézout's theorem] <ss:bezout>
#index-mark(
  "Theorem",
  sub: "of Bézout",
  target: <ss:bezout>,
)This is the classical assertion about the number of isolated roots of a system
of $n$ algebraic equations in the projective space $PP_n$.

#theorem[
  #source(154)If a system of algebraic equations $f = (f_1, ..., f_n) = 0$ has
  only isolated roots in the projective space $PP_n$, then the number of these
  roots with multiplicities is equal to the product of the degrees of the
  polynomials $f_j$.
] <th:bezout>

#proof[
  We first prove the following assertion: _if a system of homogeneous
  polynomials $g = (g_1, ..., g_n)$ in the space $CC^n$ has an isolated zero at
  the origin (consequently, in view of the homogeneity of the $g_j$, a unique
  zero in $CC^n$), then the multiplicity of the mapping $g$ at the point $z = 0$
  is equal to the product of the degrees of the polynomials $g_j$:_
  $
    mu_0 (g) = product_(j = 1)^n deg g_j.
  $ <eq:homogeneous-multiplicity>
  In order to prove @eq:homogeneous-multiplicity we use the Euler formula,
  according to which the homogeneous polynomials $g_j$ have the expansions
  $k_j g_j = z_1 a_(j 1) + dots.c + z_n a_(j n)$, where $k_j = deg g_j$, and the
  coefficients $a_(j q)$ are the derivatives $partial g_j \/ partial z_q$. Thus
  the mapping $g$ and the identity mapping $z$ are connected by the
  transformation $g = A z$, where the determinant of the matrix $A = (a_(j q))$
  is equal to $(k_1 dots.c k_n)^(-1) partial g \/ partial z$. Therefore,
  representing the multiplicity $mu_0 (g)$ by a local residue and using the
  formula for transforming a local residue (see @ss:transformation-formula), we
  obtain
  $
    mu_0 (g) = res_0 ""_g (partial g \/ partial z)
    = res_0 ""_z (k_1 dots.c k_n) = k_1 dots.c k_n,
  $
  that is, the equality @eq:homogeneous-multiplicity.

  To prove the theorem we choose homogeneous coordinates
  $xi = (xi_0, xi_1, ..., xi_n)$ in the space $PP_n$ so that the hyperplane
  ${xi_0 = 0}$ does not intersect the set of zeros of the system $f$. Then in
  affine coordinates $z_j = xi_j \/ xi_0$, $j = 1, ..., n$, the system $f$ takes
  the form
  $
    f_j (z) = g_j (z) + phi_j (z), wide j = 1, ..., n,
  $ <eq:affine-system>
  where $g_j (z)$ are homogeneous polynomials of degree $k_j = deg f_j$ and
  $phi_j$ are polynomials of degree $< k_j$, and the system
  $g = (g_1, ..., g_n)$ has a unique zero at $0 in CC^n$. We choose a ball
  $scr(B)_R subset CC^n$ with radius $R$ and center at 0, which contains all of
  the zeros of the system $f$ and, of course, the zero of the system $g$. We
  show that for sufficiently large $R$ the systems $f$ and $g$ have the same
  number of zeros in $scr(B)_R$, taken with multiplicities. For this we use
  Rouché's principle (see @ss:geometric-multiplicity) in the following way.
  Since $g^(-1) (0) = {0}$, for any point $zeta$ of the unit sphere
  $S_1 subset CC^n$ there is a number $j in {1, ..., n}$ for which
  $g_j (zeta) != 0$. There is a number $r_zeta$ such that for all $r > r_zeta$
  we have $|g_j (r zeta)| = r^(k_j) |g_j (zeta)| > |phi_j (r zeta)|$, because
  $phi_j$ has degree $< k_j$. By continuity this inequality also holds for
  points of some neighborhood $scr(U)_zeta$ of the point $zeta$ on the sphere
  $S_1$. The compact set $S_1$ can be covered by finitely many neighborhoods
  ${scr(U)_(zeta_k)}$ in which the inequalities with the corresponding numbers
  $r_(zeta_k)$ and #source(155)indices $j$ hold. We denote the greatest of the
  numbers $r_(zeta_k)$ by $R_0$. Then we deduce that for any $R > R_0$ and for
  each point $z$ of the sphere $S_R$ there is a number $j in {1, ..., n}$ for
  which $|g_j (z)| > |phi_j (z)|$. By Rouché's principle the systems
  @eq:affine-system and $g$ have the same number of zeros in the ball
  $scr(B)_R$, taking account of multiplicity. By formula
  @eq:homogeneous-multiplicity this number is equal to the product of the
  degrees of the polynomials $f_j$.
]

#subsection[The resultant of a system and its multiplicity]
<ss:resultant-multiplicity>
The basis for the solution of systems of algebraic equations is the method of
elimination of unknowns. As a rule, the procedure for elimination is realized by
the successive elimination of each of the unknowns, using Sylvester's resultant
of two polynomials. If the original system has only isolated roots, then at the
last stage of the elimination we obtain a system of equations in one unknown,
which we can replace by one equation. It turns out that if the original system
is determined (the number of equations is equal to the number of unknowns), then
we can eliminate all of the unknowns except one "in one step," and not by
successive elimination; the resulting equation preserves the multiplicity of the
roots. We now indicate the construction of the resulting equations, which is
suitable also for the solution of systems of holomorphic equations.

Suppose that the system $phi = (phi_1, ..., phi_n)$ of functions holomorphic in
a domain $G subset CC^n$ has finitely many zeros ${z^((nu))}$ in $G$. The
resultant of a function $psi$ with respect to the system $phi$ (or briefly the
#index-mark("Resultant")_resultant of the system_ $(phi, psi)$) is the number
$
  R(phi, psi) = product_nu psi^(mu_nu) (z^((nu))),
$
where $mu_nu$ is the multiplicity of the zero $z^((nu))$ of the system $phi$. In
the case when $n = 1$, $G = CC$, and $phi$ and $psi$ are polynomials, the
resultant $R(phi, psi)$ coincides with Sylvester's resultant.

We now consider a mapping $f: CC^n -> CC^n$ that is holomorphic in a
neighborhood of the origin. We assume that $z = 0$ is an isolated zero for $f$.
Then the complex dimension of the analytic set $K = {f' = 0}$ (here
$f' = (f_1, ..., f_(n - 1))$) at the point 0 is equal to one (see
@ss:analytic-definitions). Therefore (see @ss:local-description) in some
coordinate system $z$ there is a polydisk $scr(U)'$ in the space $CC^(n - 1)$ of
the variables $z' = (z_1, ..., z_(n - 1))$ and a disk $scr(U)_n$ in the complex
plane of the variable $z_n$ such that the projection
$pi: K inter (scr(U)' times scr(U)_n) -> scr(U)_n$ is an analytic covering. We
choose the disk $scr(U)_n$ so small that the discriminant set of the projection
$pi$ consists of the point $z_n = 0$ or is empty. What we have said implies that
for each $z_n in scr(U)_n without {0}$ the inverse image $pi^(-1) (z_n)$
consists of the same number $r$ of points $p^((nu)) (z_n)$, $nu = 1, ..., r$,
each of the form $(z'^((nu)) (z_n), z_n)$, where the $z'^((nu)) (z_n)$ are the
roots of the system $f'(z', z_n) = 0$ in the domain $scr(U)'$. Therefore for any
$z_n in scr(U)_n without {0}$ in the domain $scr(U)'$ we can define the
resultant of the function $f_n$ with respect to $f'$ (the resultant #source(
  156,
)of the system $f$):
$
  R(f) = product_(nu = 1)^r f_n^(mu_nu) (p^((nu)) (z_n)),
$
where $mu_nu$ is the multiplicity of the zero $z'^((nu)) (z_n)$ of the system
$f'$. From Rouché's principle it follows that the multiplicity $mu_nu$ is
constant for all points $p^((nu)) (z_n)$ of one irreducible component of $K$.
The resultant $R(f)$ is holomorphic in the disk $scr(U)_n$, because it depends
symmetrically on the branches $p^((nu)) (z_n)$ of a many-valued vector-function.
The most remarkable property of the resultant is expressed by the next
assertion.

#theorem[
  The multiplicity of the isolated zero $z = 0$ of a holomorphic mapping $f$ is
  equal to the multiplicity of the zero $z_n = 0$ of the resultant $R(f)$.
] <th:resultant-multiplicity>

#proof[
  Let $scr(U) = scr(U)' times scr(U)_n$, where $scr(U)'$ and $scr(U)_n$ are
  defined above. The multiplicity of the zero $z = 0$ of the mapping $f$ is
  expressed by the logarithmic residue
  $
    mu_0 (f) = (2 pi i)^(-n) integral_Gamma
    frac(d f', f') and frac(d f_n, f_n),
  $ <eq:resultant-log-residue>
  where $Gamma = Gamma^epsilon (f)$ is a local cycle at the point 0. We should
  like to replace the cycle $Gamma$ by a cycle $Gamma'$ homologous to it, which
  would be stratified into local cycles, connected with the mapping
  $f'(z', z_n)$ for fixed $z_n$. To this end we prove such a simple assertion
  (we recall that we are in the conditions when the system $(f'(z), z_n)$ has an
  isolated zero at the origin).
]

#lemma[
  If $delta$ is a positive number less than the radius of the disk $scr(U)_n$,
  then for sufficiently small $epsilon$ the cycle $Gamma = Gamma^epsilon (f)$ is
  homologous in the domain $scr(U)_* = scr(U) without {f_1 dots.c f_n = 0}$ to
  the cycle
  $
    Gamma' = {z in scr(U): |f_j| = epsilon, j = 1, ..., n - 1, |z_n| = delta}.
  $
  Thus, up to homology the local cycle is defined by only $n - 1$ components of
  the mapping $f$.
] <lem:local-cycle>

#proof(title: [Proof of the lemma.])[
  To prove the lemma we consider the real curve
  $gamma = K inter {|z_n| = delta}$ (we recall that
  $K = {z in scr(U): f' = 0}$). It is compact, since it is the inverse image of
  the circle ${|z_n| = delta}$ of the proper mapping $pi$. By hypothesis $z = 0$
  is an isolated zero of the mapping $f$, so the function $f_n$ is not equal to
  zero on $gamma$ and takes its smallest absolute value on it. We denote this
  value by $epsilon_0$. For any number $epsilon in (0, epsilon_0)$ we consider
  the chain $c$ defined in $scr(U)$ by the relations
  $
    |f_1| = dots.c = |f_(n - 1)| = epsilon, wide |f_n| >= epsilon, wide
    |z_n| <= delta.
  $ <eq:local-cycle-chain>
  Clearly, $|c| subset scr(U)_*$. For sufficiently small $epsilon$ the boundary
  $partial c$ is equal to $Gamma' - Gamma$, because when $|z_n| = delta$ the set
  of points that satisfies the relations @eq:local-cycle-chain lies in an
  arbitrarily small neighborhood of the curve $gamma$, where $|f_n| > epsilon$
  #source(157)\(this implies that in @eq:local-cycle-chain when $|z_n| = delta$
  the condition $|f_n| >= epsilon$ is superfluous), and when $|f_n| = epsilon$
  the set of points satisfying @eq:local-cycle-chain lies in an arbitrarily
  small neighborhood of the origin, where automatically $|z_n| < delta$. Thus,
  $Gamma ~ Gamma'$ in the domain $scr(U)_*$.
]

Let us continue the proof of the theorem. We observe that the cycle $Gamma'$ is
equal to the union $union.big (Gamma_w: w in gamma)$, where $Gamma_w$ is the
local cycle at the zero $w'$ of the mapping $f'(z', w_n)$. Here
$
  (2 pi i)^(1 - n) integral_(Gamma_w) frac(d f'(z', w_n), f'(z', w_n))
  = mu(w),
$
where $mu(w)$ is the multiplicity of the isolated zero $z' = w'$ of the system
$f'(z', w_n)$. Replacing the cycle $Gamma$ by $Gamma'$ in
@eq:resultant-log-residue, we obtain
$
  mu_0 (f) = (2 pi i)^(-n) integral_gamma integral_(Gamma_w)
  frac(d f', f') and frac(d f_n, f_n)
  = (2 pi i)^(-1) integral_gamma mu(w) frac(d f_n, f_n).
$
Since on $gamma$ to any $z_n in gamma_0 = {|z_n| = delta}$ there correspond $r$
points $w = p^((nu)) (z_n)$ and $mu(w) = mu_nu$ does not depend on $z_n$, the
last integral is equal to
$
  (2 pi i)^(-1) integral_(gamma_0) sum_(nu = 1)^r
  mu_nu frac(d f_n (p^((nu))), f_n (p^((nu))))
  & = (2 pi i)^(-1) integral_(gamma_0)
  d ln [product_(nu = 1)^r f_n^(mu_nu) (p^((nu)))] \
  & = (2 pi i)^(-1) integral_(gamma_0) frac(d R(f), R(f)) = mu_0 (R(f)).
$
This proves the theorem.

#subsection[Calculation of the multiplicity from the initial terms of the Taylor
  expansions] <ss:initial-terms>
The #index-mark("Order", sub: "of a function")_order of a holomorphic function_
$g$ at a point $a$ is the least order of the derivatives of $g$ that are nonzero
at $a$; we denote this order by $d_a (g)$. Thus, the Taylor expansion of $g$
with center at $a$ begins with terms of degree $d_a (g)$. We call the segment of
the Taylor series of $g$ consisting of terms of degree $d_a (g)$ the
#index-mark("Polynomial", sub: "initial")_initial polynomial_ for $g$ and denote
it by $(g)_*$. Clearly, $(g)_*$ is a homogeneous polynomial.

Consider the system
$
  f = (f_1, ..., f_n)
$ <eq:initial-system>
of holomorphic functions in some neighborhood of $0 in CC^n$ and the
corresponding system of initial polynomials
$
  (f)_* = ((f_1)_*, ..., (f_n)_*).
$ <eq:initial-polynomials>
If $n = 1$, that is, $f$ is a function of one variable, then the multiplicity
$mu_0 (f)$ coincides with the order $d_0 (f)$. The next assertion shows that in
the multidimensional case the multiplicity $mu_0 (f)$ of the system $f$ is
determined by the orders $d_0 (f_i)$ of the components $f_i$ only under some
restriction on the system of initial polynomials.

#theorem[
  #source(158)The multiplicity $mu_0 (f)$ of the system @eq:initial-system is
  equal to the product of orders $d_0 (f_1) dots.c d_0 (f_n)$ if and only if 0
  is an isolated zero of the system of initial polynomials
  @eq:initial-polynomials. We always have
  $mu_0 (f) >= d_0 (f_1) dots.c d_0 (f_n)$.
] <th:initial-terms>

We preface the proof of the theorem with an auxiliary assertion. We recall that
$K$ denotes the complex curve ${f' = 0}$. In some coordinate system $K$ is an
analytic covering over the disk $scr(U)_n$ of the $z_n$-plane and admits a
parametrization in the form of branches $p^((nu)) (z_n)$, $nu = 1, ..., r$, each
having coordinates of the form (see @ss:local-description)
$
  p_i^((nu)) = b_i^((nu)) z_n^(epsilon_(i nu)) + o(z_n^(epsilon_(i nu))),
  wide i = 1, ..., n - 1, wide p_n^((nu)) = z_n,
$ <eq:branches>
where $o$ denotes an infinitesimally small quantity as $z_n -> 0$, and
$b_i^((nu)) != 0$ if $p_i^((nu)) equiv.not 0$.

#lemma[
  There is a coordinate system of the space $CC^n$ in which each branch of the
  curve $K$ admits a parametrization
  $p^((nu)) (z_n) = a^((nu)) z_n + o(z_n^(1 + lambda))$, where $a^((nu))$ is a
  constant vector $(a_1^((nu)), ..., a_(n - 1)^((nu)), 1)$, $a_j^((nu)) != 0$,
  and the number $lambda$ is positive.
] <lem:linear-branches>

#proof[
  Let $l(z)$ be an arbitrary linear form of type $c_1 z_1 + dots.c + c_n z_n$.
  The resultant $R(f', l) = product_(nu = 1)^r l^(mu_nu) (p^((nu)) (z_n))$ is a
  power series in $z_n$ whose coefficients are polynomials in
  $c = (c_1, ..., c_n)$. Consequently, the set of $c$ for which the multiplicity
  $mu_0 (R(f', l)) = mu_0 (f', l)$ is minimal (we denote this multiplicity by
  $mu$) is open and everywhere dense in $CC^n$ as the complement of the set of
  zeros of a polynomial for the lowest power of $z_n$. We choose a coordinate
  system in $CC^n$ so that for all coordinate functions $z_i$ we have
  $mu_0 (f', z_i) = mu$, and show that such a coordinate system is the required
  one.

  Since the resultant of the system $(f', z_n)$ is equal to
  $z_n^(mu_1 + dots.c + mu_r)$, from our choice of coordinate system#footnote[In
    fact the number $r$ depends on the choice of the coordinate system in
    $CC^n$, but we keep the notation.] we have $mu_1 + dots.c + mu_r = mu$. At
  the same time, in accordance with the general form @eq:branches for branches
  $p^((nu))$, for almost all $u in CC$, the multiplicity of the resultant
  $R(f', z_i + u z_n)$ is equal to
  $
    sum_(nu: epsilon_(i nu) >= 1) mu_nu
    + sum_(nu: epsilon_(i nu) < 1) mu_nu epsilon_(i nu) = mu.
  $
  Since $mu = mu_1 + dots.c + mu_r$, we conclude that all $epsilon_(i nu) >= 1$.
  Finally, from the equalities
  $
    mu = mu_0 (R(f', z_i)) = sum_(nu = 1)^r mu_nu epsilon_(i nu),
    wide i = 1, ..., n - 1,
  $
  we deduce that all $epsilon_(i nu) = 1$, and the assertion of the lemma is
  proved.
]

#remark[
  #source(159)In fact we have proved that for almost any nonsingular linear
  transformation of the coordinates in $CC^n$ the branches of the curve $K$
  acquire the form stated in the lemma.
] <rem:linear-branches>

#proof(title: [Proof of the theorem.])[
  From the representation of the branch $p^((nu))$ in the form
  $a^((nu)) z_n + o(z_n^(1 + lambda))$ it follows that it touches the complex
  line ${z = a^((nu)) z_n}$. We denote the union of all such lines by $C(K)$ and
  call it the #index-mark("Cone", sub: "tangent")_tangent cone_ of the complex
  curve $K = {f' = 0}$ at the point 0. The tangent cone $C(K)$ is closely
  connected with the set of zeros of the system
  $(f')_* = ((f_1)_*, ..., (f_(n - 1))_*)$ of the initial polynomials.
]

#lemma[
  Suppose that the complex dimension of the set $K_* = {(f')_* = 0}$ is equal to
  one. Then $K_*$ coincides with the tangent cone $C(K)$, and the sum
  $mu_1 + dots.c + mu_r$ of the multiplicities of the branches $p^((nu))$ of the
  curve $K$ is equal to $d_0 (f_1) dots.c d_0 (f_(n - 1))$.
] <lem:tangent-cone>

#proof(title: [Proof of the lemma.])[
  We denote the order $d_0 (f_j)$ by $d_j$. Each function $f_j$ has the form
  $(f_j)_* + theta_j (z)$, where the order of $theta_j$ is greater than $d_j$.
  Consider the system
  $
    F_j (z', t, tau) = tau^(-d_j) f_j (tau dot.c z', tau dot.c t),
    wide j = 1, ..., n - 1,
  $ <eq:homotopy-system>
  which depends on the parameters $t in scr(U)_n$, $tau in [0, 1]$. Clearly,
  $F_j (z', t, 1) = f_j (z', t)$, $F_j (z', t, 0) = (f_j)_* (z', t)$. Moreover,
  for fixed $t$ and $tau$ the system @eq:homotopy-system has $r$ isolated zeros
  $z'^((nu)) (t, tau)$ satisfying the condition $tau dot.c z'^((nu)) (t, tau)
  = a'^((nu)) t tau + o((t dot.c tau)^(1 + lambda))$, so
  $
    z'^((nu)) (t, tau) = a'^((nu)) t + o(t^(1 + lambda) tau^lambda),
    wide nu = 1, ..., r.
  $
  Therefore for sufficiently small $|t|$ and any $tau in [0, 1]$ the zero
  $z'^((nu)) (t, tau)$ of the system @eq:homotopy-system lies in the ball
  $scr(B)_nu (t) = {z': |z' - a'^((nu)) t| < |t|^(1 + delta)}$, where
  $0 < delta < lambda$. We have thus constructed a homotopy $F'(z', t, tau)$ of
  the systems $(f')_* (z', t)$ and $f'(z', t)$, which for small $|t|$ does not
  have zeros on the spheres $partial scr(B)_nu (t)$. According to Rouché's
  principle these systems have the same (taking account of multiplicity) number
  of zeros in $scr(B)(t) = union.big_(nu = 1)^r scr(B)_nu (t)$. The number of
  zeros of the system $f'(z', t)$ in $scr(B)(t)$ is equal to
  $mu = mu_1 + dots.c + mu_r$. In turn, for all $t in scr(U)_n$ the systems
  $f'(z', t)$ are homotopic to each other in $scr(U)'$ (in the notation of
  @ss:resultant-multiplicity[subsection] the projection
  $pi: K inter (scr(U)' times scr(U)_n) -> scr(U)_n$ is an analytic covering).
  Consequently, $mu_0 (f'(z', 0)) = mu$. By the hypothesis of the lemma,
  $dim K_* = 1$, so for almost any complex line $L$ we have $L inter K_* = {0}$.
  Hence, taking account of the remark to Lemma~@lem:linear-branches, we can
  assume that the system $(f')_* (z', 0)$ has an isolated zero at the point
  $z' = 0'$. If we now use induction on the number of variables (that is, we
  assume that the theorem holds for $n - 1$ variables), we can conclude that
  $mu_0 (f'(z', 0)) = d_1 dots.c d_(n - 1)$, because $(f')_* (z', 0)$ is the
  system of initial polynomials for $f'(z', 0)$. As a result we have proved that
  $mu_1 + dots.c + mu_r = d_1 dots.c d_(n - 1)$, and also that the system
  #source(160)$(f')_* (z', t)$, homotopic to the system $f'(z', t)$, has exactly
  $d_1 dots.c d_(n - 1)$ zeros in $scr(B)(t)$, counted with multiplicities. From
  Bézout's theorem we conclude that all of the zeros of the system
  $(f')_* (z', t)$ lie in $scr(B)(t)$. Since the radii $|t|^(1 + delta)$ of the
  balls $scr(B)_nu (t)$ tend to zero as $t -> 0$ more rapidly than the distance
  between points lying in the hyperplane ${z: z_n = t}$ on different analytic
  lines of $K_*$, we have $K_* subset C(K)$. The reverse inclusion
  $C(K) subset K_*$ follows from the identities
  $
    f_j (p^((nu)) (z_n)) = z_n^(d_j) (f_j)_* (a^((nu))) + o(z_n^(d_j))
    equiv 0, wide j = 1, ..., n - 1,
  $
  according to which $(f')_* (a^((nu))) equiv 0$. This completes the proof of
  Lemma~@lem:tangent-cone.
]

#proof(title: [Proof of the theorem.])[
  _Sufficiency._ If the system of initial polynomials @eq:initial-polynomials
  has an isolated zero at $0 in CC^n$, then $K_*$ is one-dimensional and by
  Lemma~@lem:tangent-cone it coincides with $C(K)$. Consequently, for the
  vectors $a^((nu))$ from the parametrization of the branches of the curve $K$,
  we have $(f_n)_* (a^((nu)) dot.c z_n) equiv.not 0$ for all $nu$ from 1 to $r$.
  As a result
  $
    f_n (p^((nu))) = z_n^(d_n) dot.c (f_n)_* (a^((nu))) + o(z_n^(d_n)).
  $
  In addition, by Lemma~@lem:tangent-cone, $sum mu_nu = d_1 dots.c d_(n - 1)$,
  so the multiplicity of the zero of the resultant
  $R(f) = product_(nu = 1)^r f_n^(mu_nu) (p^((nu)))$ is equal to
  $d_1 dots.c d_n$. By the theorem of @ss:resultant-multiplicity[subsection],
  the sufficiency is proved.

  We prove the _necessity_ by induction on the number of variables. Suppose that
  the system @eq:initial-polynomials has a nonisolated zero. Then the dimension
  of $K_*$ is greater than or equal to 1. If $dim K_* = 1$, then by
  Lemma~@lem:tangent-cone we have $K_* = C(K)$. Since ${(f)_* = 0} != {0}$, for
  some $nu_0$ from 1 to $r$ we have $(f_n)_* (a^((nu_0))) = 0$, so
  $f_n (p^((nu_0))) = o(z_n^(d_n))$. Therefore
  $mu_0 (f) = mu_0 (R(f)) > d_1 dots.c d_n$ (as above, here we use the fact that
  the sum of the multiplicities $mu_nu$ is equal to the product
  $d_1 dots.c d_(n - 1)$). If $dim K_* > 1$, then the dimension of the set
  ${(f')_* (z', 0) = 0}$ is at least 1. By the inductive hypothesis,
  $mu_(0') (f'(z', 0)) > d_1 dots.c d_(n - 1)$. On the other hand,
  $mu_(0') (f'(z', 0))$ is equal to the number of zeros (with multiplicities) of
  the system $f'(z', z_n)$ for any fixed $z_n in scr(U)_n$, that is, to the
  number $mu_1 + dots.c + mu_r$. As a result,
  $mu_0 (f) = mu_0 (R(f)) > d_1 dots.c d_n$. This completes the proof of the
  theorem.
]

#subsection[The connection between algebraic and geometric multiplicities]
<ss:algebraic-multiplicity>
Suppose that the mapping $f: CC^n -> CC^n$ is holomorphic in a neighborhood of a
point $a in CC^n$. As we noted in @ss:local-duality, the local algebra
$Q_(f, a) = scr(O)_a \/ I_a (f)$ is a finite-dimensional vector space if $a$ is
an isolated zero of $f$. We call the dimension of this space the #index-mark(
  "Multiplicity",
  sub: "algebraic",
)algebraic multiplicity of the mapping $f$ at the point $a$, and denote it by
$k$.

#theorem[
  The geometric multiplicity is equal to the algebraic multiplicity:
  $mu_a (f) = dim Q_(f, a)$.
] <th:algebraic-multiplicity>

#proof[
  The proof is based on the Weierstrass preparation theorem (see @ss:wpt) and
  formula @eq:bishop-expansion of @ss:bishop. We first prove that
  $k >= mu := mu_a (f)$. Let #source(161)$v = (v_1, ..., v_mu)$ be an arbitrary
  vector in $CC^mu$ and let $w^0$ be a noncritical value for $f$. We denote by
  $z^((nu))$, $nu = 1, ..., mu$, the inverse images of this point with respect
  to the mapping $f$, and choose a polynomial $h$ such that
  $h(z^((nu))) = v_nu$, $nu = 1, ..., mu$. Taking account of the Weierstrass
  preparation theorem we have
  $
    h(z^((nu))) = sum_(j = 1)^k c_j (w^0) e_j (z^((nu))),
    wide nu = 1, ..., mu,
  $
  where the functions ${e_j}$ represent a basis in $Q_(f, a)$. Since the vector
  $v$ is arbitrary we conclude that the linear transformation
  $scr(A): CC^k -> CC^mu$ with matrix $A = norm(e_j (z^((nu))))$ is surjective.
  This implies that $k >= mu$. We prove that the reverse inequality $mu >= k$
  holds. Let us assume that $k > mu$. Then, applying the expansion
  @eq:bishop-expansion of @ss:bishop to the functions $e_j (z)$, we obtain a
  linear dependence of these functions over the field of meromorphic germs of
  the variables $w$, and consequently a relation of the form
  $c_1 (w) e_1 (z) + dots.c + c_k (w) e_k (z) = 0$, $w = f(z)$, where
  $c_j in scr(O)_0$, and at least one of the germs $c_j (w)$ is nonzero. But
  this contradicts the uniqueness of the expansion in the Weierstrass
  preparation theorem.
]
