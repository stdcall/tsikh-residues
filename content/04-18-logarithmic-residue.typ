#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

== Logarithmic residue <sec:logarithmic-residue>

In the theory of functions of one complex variable we understand by a
logarithmic residue the residue of the logarithmic differential
$d ln f = d f \/ f$ of a holomorphic function $f$ or, in the more general case,
the residue of the product $phi dot.c d ln f$ of a holomorphic function $phi$
and a logarithmic differential. In the multidimensional situation we can
consider several variants of logarithmic differentials and their residues. Thus
for a mapping $f: CC^n -> CC^p$ it is natural to define the logarithmic
differential by putting
$
  d ln f = frac(d f_1, f_1) and dots.c and frac(d f_p, f_p),
$
where the $f_j$ are the components of the mapping $f$. For example, in the case
when $p = n$ and $a$ is an isolated zero for the mapping $f$ there is #source(
  145,
)defined the local residue $res_a omega$ of the form $omega = phi dot.c d ln f$,
which according to Proposition~@prop:logarithmic-residue of @ss:geometric-trace
is equal to the product $mu dot.c phi(a)$, where $mu$ is the multiplicity of the
mapping $f$ at the point $a$. From @ss:boundary-representation we know that the
local residue of $omega$ is equal to the integral over the boundary
$partial scr(U)_a$ of the form $eta_omega$, which in the given case is
$phi dot.c beta(f, overline(f))$, where $beta$ is the Martinelli-Bochner kernel.
Thus we arrive at the equality (the Yuzhakov-Roos formula)
$
  integral_(partial scr(U)_a) phi beta(f, overline(f)) = mu dot.c phi(a).
$
#new-par
In the book @bib:Aizenberg1979b Aizenberg and Yuzhakov consider other variants
of multidimensional residues (and corresponding formulas) for mappings
$f: CC^n -> CC^n$ with isolated zeros. Such mappings (more precisely, systems of
functions $f = (f_1, ..., f_n)$) will be called _determined_, in contrast to
mappings $f: CC^n -> CC^p$, $p != n$, which we shall call _underdetermined_ if
$p < n$ and _overdetermined_ if $p > n$. In this section we give variants of
logarithmic residues for underdetermined and overdetermined systems.

#subsection[Underdetermined systems (the case of complete intersections)]
<ss:complete-intersection-residue>
We will consider a formula for the logarithmic residue connected with a mapping
$f: CC^n -> CC^p$ $(p < n)$ such that $dim f^(-1) (0) = n - p$. We first define
the notion of the multiplicity of the mapping $f$ along its zero set. Suppose
that $f$ is holomorphic in a domain $G subset CC^n$, and that the dimension of
the set $Z_f = f^(-1) (0) inter G$ is equal to $n - p$. For each point
$a in reg Z_f$ we choose a complex plane $L_a$ transversal to the tangent plane
$T_a (Z_f)$. If $l_(p + 1), ..., l_n$ are linear functions specifying $L_a$,
then the multiplicity $mu_a = mu_a (g)$ of the system
$g = (f_1, ..., f_p, l_(p + 1), ..., l_n)$ is the same for any transversal plane
$L_a$. Moreover, by means of Rouché's principle it is not difficult to verify
that the multiplicity $mu_a$ is the same for all points $a in reg Z_f$ lying on
one irreducible component $S$ of the set $Z_f$. We denote this multiplicity by
$mu_S (f)$ and call it the _multiplicity of the mapping $f$_ along the
irreducible component $S$. Everywhere below we shall consider the set $Z_f$
taking account of the multiplicities of its components, that is, we shall regard
it as a holomorphic chain $sum mu_S (f) S$. We note (see @bib:Chirka1985b[§12])
that this holomorphic chain $Z_f$ coincides with the chain-intersection
$F_1 and dots.c and F_p$ of holomorphic chains (divisors) $F_j$ defined by the
functions $f_j$. The holomorphic chain $Z_f$ defines the current of integration
$I[Z_f] = sum mu_S (f) I[S]$.

Let us recall some notation from Chapter~@ch:residual-currents. We denote by
$scr(F)$ the family of divisors ${F_1, ..., F_p}$, $F_j = {f_j = 0}$; next,
$T^delta = T^delta (f)$ is the tube consisting of all points $z in G$ for which
$|f_j (z)| = epsilon_j (delta)$, $j = 1, ..., p$, and $epsilon(delta)$ is an
admissible path in $RR_>^p$.

#theorem[
  Let $f: G -> CC^p$ be a holomorphic mapping of a domain $G subset CC^n$ for
  which the set of zeros $Z_f$ has dimension $n - p$. Then the residual current
  $(2 pi i)^(-p) R_scr(F) [d f \/ f]$ coincides with the current of integration
  $I[Z_f]$, that is, for #source(146)any form $psi in scr(D)^(2(n - p)) (G)$ we
  have
  $
    (2 pi i)^(-p) lim_(delta -> 0) integral_(T^delta)
    frac(d f_1, f_1) and dots.c and frac(d f_p, f_p) and psi
    = integral_(Z_f) psi.
  $ <eq:log-current>
] <th:log-current>

#proof[
  Let $psi$ be a form of $scr(D)^(2(n - p)) (G)$. We choose a function
  $phi in scr(O) (G)$ that is nonzero almost everywhere on $Z_f inter supp psi$
  and is equal to zero on $sng Z_f inter supp psi$. Then the mapping
  $(f, phi): G -> CC^(p + 1)$ is a complete intersection in a neighborhood of
  the support of $psi$ and according to @ss:nonpolar-principal-value and
  @ss:iterated-limit we have the equalities
  $
    R_scr(F) [frac(d f, f)](psi) = R_scr(F) P_Phi [frac(d f, f)](psi)
    = lim_(r -> 0) lim_(delta -> 0) integral_(T^(delta, r))
    frac(d f_1, f_1) and dots.c and frac(d f_p, f_p) and psi.
  $ <eq:log-current-iterated>
  Here the principal value $P_Phi$ is considered with respect to the
  hypersurface $Phi = {phi = 0}$, and the integration set $T^(delta, r)$ is the
  tube $T^delta (f|_(D^r))$ constructed from the restriction of $f$ to the
  domain $D^r = {z in G: |phi(z)| > r}$, which does not contain singular points
  of the set $Z_f inter supp psi$. We show that in @eq:log-current-iterated the
  inner limit is equal to the integral $I[Z_f inter D^r](psi)$; thus the
  assertion will be proved, since the set $Z_f inter D^0$ is everywhere dense in
  $Z_f inter supp psi$.

  Using Sard's theorem, we choose a sequence of positive numbers ${r_k}$ that
  converges to zero such that the $r_k^2$ are noncritical values for the
  restriction of the function $|phi|^2$ to $reg Z_f$. For each $k$ we cover the
  compact set $K = Z_f inter overline(D)^(r_k) inter supp psi$ by a finite
  family of open sets $scr(U)_nu$ in $G$. In each of these open sets we can
  choose the coordinate system $z_1, ..., z_n$ so that
  $scr(U)_nu inter D^(r_k) = scr(U)' times scr(U)''$ (here $scr(U)'$ is a
  neighborhood of zero in the space $CC^p$ of the variables
  $z' = (z_1, ..., z_p)$, and $scr(U)''$ is a neighborhood of zero in the space
  $CC^(n - p)$ of the variables $z'' = (z_(p + 1), ..., z_n)$), and
  $Z_f inter scr(U)_nu = 0' times scr(U)''$. The existence of the neighborhoods
  $scr(U)_nu$ follows from the fact that $K$ consists only of smooth points of
  $Z_f$, and at points $z in K$ where $|phi| = r_k$ we have $d phi|_(Z_f) != 0$.

  Let ${eta_nu}$ be a decomposition of unity in some neighborhood of the compact
  set $K$, corresponding to the covering ${scr(U)_nu}$. Taking into account
  @eq:log-current-iterated and what we said above, our problem reduces to a
  proof of the equality
  $
    lim_(delta -> 0) I[T^(delta, r_k)](d f and eta_nu psi \/ f)
    = mu dot.c I[0' times scr(U)''](eta_nu psi),
  $ <eq:log-current-local>
  where $mu = mu_S (f)$ is the multiplicity of the mapping $f$ along the
  irreducible component $S$ that intersects $scr(U)_nu$.

  We observe that in @eq:log-current-local the integration on the left-hand side
  is actually carried over the tube
  $T_nu^delta = T^(delta, r_k) inter (scr(U)' times scr(U)'')$, because the
  support of $eta_nu$ lies in $scr(U)_nu$. The tube $T_nu^delta$ is stratified
  into a family of analytic sets
  $A(zeta) = {f = zeta} inter (scr(U)' times scr(U)'')$, where $zeta$ runs over
  the distinguished boundary $Gamma^(epsilon(delta))
  = {zeta in CC^p: |zeta_j| = epsilon_j (delta), j = 1, ..., p}$. #source(147)We
  prove that in some neighborhood $scr(V)$ of the origin in the space $CC^p$
  there is a proper analytic subset $V$ with the property that for each
  $zeta in scr(V) without V$ the set $A(zeta)$ is smooth. In fact, we consider
  the mapping $g: scr(U)' times scr(U)'' -> CC^(p + N)$ whose components are
  $f_1, ..., f_p$ and all of the Jacobians $partial f \/ partial z_I$,
  $abs(I) = p$. There are more than $n$ of these components, and they are
  functionally dependent, so the image $g(scr(U)' times scr(U)'')$ lies in some
  analytic subset $tilde(V)$ of a neighborhood of zero in $CC^(p + N)$. Suppose
  that the coordinates of the space $CC^(p + N)$ are numbered so that
  $zeta_1 = f_1, ..., zeta_p = f_p$,
  $zeta_(p + 1) = partial f \/ partial z', ...$. Clearly, the set of critical
  values of the mapping $f$ lies in a set $V$ for which
  $V times {(0, ..., 0)}
  = tilde(V) inter {zeta_(p + 1) = dots.c = zeta_(p + N) = 0}$
  (the zero on the left-hand side is repeated $N$ times). Since $tilde(V)$ is
  analytic, the set $V$ is also analytic, and taking into account Sard's
  theorem, $V$ is a proper subset of some neighborhood $scr(V) subset CC^p$.

  It is not difficult to verify, using the admissibility of the path
  $epsilon(delta)$, that for small $delta$ the distinguished boundary
  $Gamma^(epsilon(delta))$ does not intersect $V$. Consequently, for small
  $delta$ the tube $T_nu^delta$ is stratified into nonsingular fibers $A(zeta)$.
  Since ${f = 0} inter scr(U)_nu = 0' times scr(U)''$, the mapping $f$ does not
  have zeros on $partial scr(U)' times scr(U)''$. This implies that for all
  $zeta$ sufficiently close to 0 the set $A(zeta)$ does not intersect
  $partial scr(U)' times scr(U)''$. Hence the projection
  $pi_zeta: A(zeta) -> scr(U)''$ is a proper mapping and even an analytic
  covering over $scr(U)''$. The discriminant set $sigma = sigma(zeta)$ of this
  covering is the image of the analytic set
  ${partial f \/ partial z' = 0} inter A(zeta)$. The number of sheets of the
  covering $pi_zeta$ is equal (see @ss:geometric-multiplicity) to the
  multiplicity of $f$ along $0' times scr(U)''$, that is, the multiplicity
  $mu_S (f)$ along a component $S$ of the analytic set $Z_f$ that intersects
  $scr(U)_nu$.

  Let us represent the integral on the left-hand side of @eq:log-current-local
  as an iterated integral
  $
    integral_(Gamma^(epsilon(delta)))
    frac(d zeta_1, zeta_1) and dots.c and frac(d zeta_p, zeta_p)
    integral_(A(zeta)) eta_nu psi.
  $ <eq:log-current-fibered>
  We can write the inner integral (we denote it by $h(zeta)$) as follows:
  $
    I[scr(U)'' without sigma(zeta)]{(eta_nu psi)(pi_zeta^(-1) (z''))}
    = I[scr(U)'']{(eta_nu psi)(pi_zeta^(-1) (z''))}.
  $
  The function $h(zeta)$ is continuous in $zeta in scr(V)$, because according to
  Rouché's principle the zeros $pi_zeta^(-1) (z'')$ of the mapping
  $f(dot.c, z'') - zeta$ (here $z''$ is fixed) depend continuously on $zeta$.
  Since all of the sheets $p_zeta^((nu)) (z'') in pi_zeta^(-1) (z'')$,
  $nu = 1, ..., mu$, of the covering $pi_zeta$ tend to $0' times scr(U)''$ as
  $zeta -> 0$, the quantity $h(0)$ is equal to
  $mu dot.c I[0' times scr(U)''](eta_nu psi)$. Now from @eq:log-current-fibered
  we obtain @eq:log-current-local, and the proof of the theorem is complete.
]

We observe that in the case $p = 1$ the formula @eq:log-current is just the
Poincaré-Lelong formula: $I[Z_f] = (i \/ pi) partial dbar log|f|$. In fact,
starting from the equality $d f \/ f = 2 partial log|f|$, on the basis of
@eq:log-current we can write for forms $psi$ of bidegree #source(
  148,
)$(n - 1, n - 1)$ the chain of equalities
$
  I[Z_f](psi) & = -i/pi lim_(epsilon -> 0) integral_(abs(f) = epsilon)
                partial log|f| and psi \
              & = i/pi lim_(epsilon -> 0) integral_(abs(f) > epsilon)
                dbar (partial log|f| and psi) \
              & = i/pi lim_(epsilon -> 0) integral_(abs(f) > epsilon)
                log|f| partial dbar psi \
              & = (i/pi partial dbar log|f|)(psi).
$
Here the second equality is written by using Stokes's formula and the fact that
the bidegree of $psi$ is $(n - 1, n - 1)$.

For $p > 1$ the formula of Poincaré-Lelong type is written in the form (see
@bib:Griffiths1973)
$
  I[Z_f] = (i/pi partial dbar log|f|)^p,
$ <eq:poincare-lelong>
where $|f|^2 = |f_1|^2 + dots.c + |f_p|^2$. This formula can also be obtained
from @eq:log-current by the scheme used by Griffiths and Harris
(@bib:Griffiths1978a[p.~651]) in proving the proposition of
@ss:boundary-representation. In turn, from @eq:poincare-lelong we can derive the
following assertion (see @bib:Lupacciolu1979).

#proposition[
  Let $f: G -> CC^p$ be a holomorphic mapping of a domain $G subset CC^n$ for
  which the set of zeros $Z_f$ has dimension $n - p$. If a relatively compact
  domain $D$ in $G$ has piecewise smooth boundary $partial D$ that intersects
  the set of smooth points $reg Z_f$ in a set of zero measure in $Z_f$, then for
  any $dbar$-closed form $psi$ of bidegree $(n - p, n - p)$ the formula
  $
    integral_(partial D) beta(f) and psi = integral_(Z_f inter D) psi,
  $ <eq:log-martinelli>
  holds on $G$, where $beta(u)$ is the Martinelli-Bochner kernel in the
  variables $u in CC^p$.
] <prop:log-martinelli>

We observe that in the case $p = n$ the formula @eq:log-martinelli coincides
with the Yuzhakov-Roos formula. For the derivation of @eq:log-martinelli from
@eq:poincare-lelong in this case see the survey of Aizenberg @bib:Aizenberg1985.

#subsection[Underdetermined systems (the case of incomplete intersections)]
<ss:incomplete-intersection-residue>
Consider a mapping $f: G -> CC^p$ of a domain $G subset CC^n$, $p <= n$, where
we do not require any restrictions on the dimension of the set of zeros
$f^(-1) (0)$. As in @ss:complete-intersection-residue[subsection], with the
logarithmic differential
$
  frac(d f, f) = frac(d f_1, f_1) and dots.c and frac(d f_p, f_p)
$
there is associated the residual current $R_scr(F) [d f \/ f]$ with respect to
the sequence of hypersurfaces $scr(F) = {F_1, ..., F_p}$, $F_j = {f_j = 0}$.
From @ss:main-theorem we #source(149)know that the support of this current lies
on the essential intersection $V_e (f)$ of the sequence $scr(F)$. It is
therefore reasonable to assume that the residual current $R_scr(F) [d f \/ f]$
coincides with the current of integration over the essential intersection
$V_e (f)$ if the essential intersection is considered with multiplicity, that
is, as a holomorphic chain. We shall denote this holomorphic chain by $C_e (f)$.
Like the essential intersection, the chain $C_e (f)$ is constructed in a
recurrent way. The chain $C_e (f_1)$ is the divisor of the function $f_1$. We
assume that $C_e (f_1, ..., f_(j - 1))$ has been constructed for $j <= p$. If
$
  C_e (f_1, ..., f_(j - 1)) = sum n_i M_i, wide n_i in NN,
$
is the expansion in irreducible components, we put
$
  tilde(C)_e (f_1, ..., f_(j - 1))
  = sum {n_i M_i: M_i subset tilde(V)_e (f_1, ..., f_(j - 1))}.
$ <eq:essential-chain>
We recall that $tilde(V)_e (f_1, ..., f_(j - 1))$ is the union of irreducible
components $M_i$ on which $f_j equiv.not 0$. In view of the latter property,
there is defined the chain-intersection (see @bib:Chirka1985b[§12])
$
  C_e (f_1, ..., f_j) = tilde(C)_e (f_1, ..., f_(j - 1)) and (f_j)
$
of the chain @eq:essential-chain and the divisor $(f_j)$ of the function $f_j$.
From the construction it is obvious that the support of the chain $C_e (f)$
coincides with the essential intersection $V_e (f)$.

The next result generalizes a result of
@ss:complete-intersection-residue[subsection].

#theorem[
  Let $f: G -> CC^p$ be a holomorphic mapping of a domain $G subset CC^n$,
  $p <= n$. For any form $psi in scr(D)^(2(n - p)) (G)$ we have the equality
  $
    (2 pi i)^(-p) R_scr(F) [frac(d f, f)](psi) = integral_(C_e (f)) psi,
  $
  where $R_scr(F)$ is the residual current with respect to the sequence of
  hypersurfaces $scr(F) = {F_1, ..., F_p}$, $F_j = {f_j = 0}$.
] <th:solomin>

We omit the proof of the theorem; it is in the original paper of Solomin
@bib:Solomin1977.

#subsection[Overdetermined systems] <ss:overdetermined>
Let us extend the logarithmic residue formula from @ss:geometric-trace to the
case of overdetermined systems (when the number of functions is greater than the
number of variables). Let $f: G -> CC^m$ be a holomorphic mapping of a domain
$G subset CC^n$, where $m > n$. The _multiplicity_ of the mapping $f$ at the
point $a$ is the number
$
  mu_a (f) = limits(overline(lim))_(z -> a) \# f^(-1) (f(z)),
$ <eq:overdetermined-multiplicity>
where $\#$ denotes the cardinality of a set. In the case of determined systems
$(m = n)$ the multiplicity @eq:overdetermined-multiplicity coincides with that
introduced in @ss:geometric-multiplicity. For #source(150)simplicity we shall
consider only systems that are overdetermined by one, in other words, mappings
$
  f = (f_1, ..., f_(n + 1)): G -> CC^(n + 1), wide G subset CC^n.
$ <eq:overdetermined-mapping>
We put $f' = (f_1, ..., f_n)$ and assume that the polyhedron
$
  Pi = {z in G: |f_j (z)| < r_j, j = 1, ..., n} relcomp G,
$ <eq:overdetermined-polyhedron>
that is, $Pi$ is relatively compact in $G$. This implies that
$f': Pi -> scr(B)'$ is an analytic covering over the polydisk
$scr(B)' = {w' in CC^n: |w_j| < r_j, j = 1, ..., n}$, that is, for each
$w' in scr(B)'$ the inverse image $(f')^(-1) (w')$ consists of the same number
(taking account of multiplicity) of points $z^((nu)) (w') in Pi$,
$nu = 1, ..., p$. We define the resultant of the function
$f_(n + 1) - w_(n + 1)$ with respect to the system $f' - w'$ (or, more briefly,
the _resultant_ of the system $f - w$):
$
  R(w) = R(w', w_(n + 1))
  = product_(nu = 1)^p [f_(n + 1) (z^((nu)) (w')) - w_(n + 1)].
$ <eq:overdetermined-resultant>
#new-par
The resultant $R(w)$ is a polynomial in $w_(n + 1)$ whose coefficients are
elementary symmetric functions of $f_(n + 1) (z^((nu)) (w'))$, $nu = 1, ..., p$.
Consequently, $R(w)$ is a holomorphic function (pseudopolynomial) in the domain
$D = scr(B)' times CC subset CC^(n + 1)$. Clearly, $f$ maps $Pi$ onto the
analytic set
$
  A = {w in D: R(w) = 0}.
$
#new-par
We observe that if the polyhedron $Pi$ is connected, then $A$ is an irreducible
analytic set. In fact, the set of regular points $reg A$ is the image of the
connected set $Pi without f^(-1) (sng A)$ (it is well known that an analytic set
does not divide the domain), so it follows that $reg A$ is connected and $A$ is
irreducible. At the same time, $A$ can be locally reducible. For example,
$f = (f_1, f_2) = (z^2 - 1, z(z^2 - 1))$ gives a mapping of the complex plane
$CC$ onto an irreducible analytic set
$A = {w_2^2 - w_1^2 - w_1^3 = 0} subset CC^2$, which has two local irreducible
components at the origin: these components are the images
$f(scr(U)_(plus.minus 1))$ of small neighborhoods of the points
$plus.minus 1 in CC$, that is, $w = 0$ is a point of self-intersection of the
complex curve $A$.

We also observe that if $f$ is polynomial, and $f'$ is a proper mapping of the
space $CC^n$, then $R(w)$ is a polynomial, which in view of the irreducibility
of $A$ is either irreducible or the power of an irreducible polynomial:
$R = R_*^d$. The fact that the degree $d$ can be greater than one is shown by
the example $f = (z^4, z^6): CC -> CC^2$; here for the system $f - w$ the
resultant @eq:overdetermined-resultant has the form $R(w) = (w_1^3 - w_2^2)^2$
and $d = 2$.

A geometric interpretation of the number $d$ is the following: for almost all
$w in A$ the inverse images $f^(-1) (w)$ consist of $d$ distinct points of
multiplicity #source(151)1. Indeed, it follows from @eq:overdetermined-resultant
that
$
  R(w) = (R_* (w))^d
  = (product_(j = 1)^(p \/ d) [f_(n + 1) (z^((j)) (w')) - w_(n + 1)])^d,
$
where ${z^((j)) (w'), j = 1, ..., p \/ d}$ is the set of those inverse images of
$(f')^(-1) (w')$ for which the values $f_(n + 1) (z^((j)) (w'))$ are distinct
(by virtue of the irreducibility of $R_*$ such values are distinct for almost
all $w' in scr(B)'$). Hence, for points $w = (w', w_(n + 1))$ of an everywhere
dense subset $tilde(A) subset A$ there are only $d$ equalities (of the $p$
possible ones) of the form $f_(n + 1) (z^((nu)) (w')) = w_(n + 1)$,
$nu = nu_1, ..., nu_d$. Hence the inverse image of the point $w$ is the set of
points $z^((nu_1)) (w'), ..., z^((nu_d)) (w')$. The fact that the mapping $f$
has multiplicity 1 at these points follows from the definition of the
multiplicity and openness of the set $tilde(A)$ (the complement to $tilde(A)$
consists of points of $A$ that project into a null set of the discriminant of
the pseudopolynomial $R_*$).

The resultant @eq:overdetermined-resultant can be calculated by using formula
@eq:logarithmic-residue from @ss:geometric-trace. In this formula, applied to
the mapping $f' - w'$, we put successively
$phi = 1, f_(n + 1), f_(n + 1)^2, ..., f_(n + 1)^p$. As a result we obtain the
power sums
$
  sum_(nu = 1)^p [f_(n + 1) (z^((nu)) (w'))]^k, wide k = 0, 1, ..., p,
$
by means of which from Newton's formulas we restore the elementary symmetric
functions, that is, the coefficients of the pseudopolynomial
@eq:overdetermined-resultant. Thus the formula @eq:logarithmic-residue from
@ss:geometric-trace gives, in principle, the possibility of determining whether
the mapping @eq:overdetermined-mapping has zeros in the polyhedron
@eq:overdetermined-polyhedron: for this it is necessary and sufficient that
$R(0) = 0$.

Let $R = R_1^(d_1) dots.c R_m^(d_m)$ be an expansion of the pseudopolynomial
@eq:overdetermined-resultant into a product of irreducible pseudopolynomials (we
recall that the case $m > 1$ is possible only for a disconnected polyhedron $Pi$
in @eq:overdetermined-polyhedron). We denote by $R_* = R_1 dots.c R_m$ the
product of the irreducible pseudopolynomials to the first degree. Let
$H(zeta, w)$ be the holomorphic function in $D times D$ determined from the
Hefer expansion
$
  R_* (zeta) - R_* (w) = sum_(j = 1)^n P_j (zeta, w)(zeta_j - w_j)
  + H(zeta, w)(zeta_(n + 1) - w_(n + 1)).
$ <eq:hefer>
Finally, let $A_1, ..., A_q$ be the local irreducible components of the analytic
set $A = {R(w) = 0}$ at zero. We are now in a position to give the logarithmic
residue formula for overdetermined systems.

#theorem[
  #source(152)Suppose that condition @eq:overdetermined-polyhedron is satisfied
  for the mapping $f$ from @eq:overdetermined-mapping. Then for any function
  $phi(z)$ that is holomorphic in the closure $overline(Pi)$ we have
  $
    & sum_(j = 1)^q {lim_(w -> 0 \ w in A_j) [
          (frac(partial R_* (w), partial w_(n + 1)))^(-1)
          integral_Gamma phi(z) H(f(z), w) frac(d f'(z), f'(z) - w')
        ]} \
    & quad = (2 pi i)^n sum_(a in Z_f) mu_a (f) phi(a),
  $ <eq:overdetermined-residue>
  where
  $
    frac(d f', f' - w')
    = frac(d f_1, f_1 - w_1) and dots.c and frac(d f_n, f_n - w_n),
  $
  $Z_f$ is the set of zeros of the mapping $f$ in the polyhedron $Pi$, and
  $Gamma$ is the distinguished boundary of $Pi$.
] <th:overdetermined>

Before proving the theorem, we make some clarifications to formula
@eq:overdetermined-residue. We observe that from this formula there follows the
result of Proposition~@prop:logarithmic-residue in @ss:geometric-trace. For we
can regard the determined system $f'$ as an overdetermined system of the form
$f = (f', f_(n + 1))$, where $f_(n + 1) equiv 0$; the image of the mapping
$w = f(z)$ lies in the hyperplane $w_(n + 1) = 0$, and it is easy to see that
$R_* (w) = w_(n + 1)$. In this case in @eq:overdetermined-residue $q = 1$,
$H equiv 1$, $partial R_* \/ partial w_(n + 1) equiv 1$; in addition, the
integrand is continuous in $w'$, so after redenoting $f'$ by $f$ the formula
@eq:overdetermined-residue goes over to formula @eq:logarithmic-residue of
@ss:geometric-trace.

The reason that in @eq:overdetermined-residue, besides the integral, which
depends continuously on perturbations of the mapping $f$, we need to take the
limit with respect to $w in A$, lies in the instability of the problem of
calculating the right-hand side of @eq:overdetermined-residue for overdetermined
systems $f$: under (absolute) small perturbations of $f$, the set of zeros $Z_f$
can change sharply, in particular, become empty.

#proof(title: [Proof of the theorem.])[
  Suppose that $w' in CC^n$ and that $|w_j| < r_j$ for all $j$ from 1 to $n$
  (here $r_j$ are the radii of the polyhedron $Pi = Pi^r (f')$). By the lemma of
  @ss:boundary-representation there is a positive number
  $delta_0 = delta_0 (w')$ for which in the domain
  $G_(w') = G without {z: product_(j = 1)^n [f_j (z) - w_j] = 0}$ we have the
  homology of cycles
  $
    Gamma ~ Gamma^delta (f' - w')
  $ <eq:overdetermined-homology>
  for all $delta$, $0 < delta < delta_0$. Let $w'$ be a noncritical value of the
  mapping $f'$; then all roots $z^((nu)) = z^((nu)) (w')$, $nu = 1, ..., p$, of
  the system of equations $f' = w'$ are distinct, that is,
  $Z_(f' - w') = {z^((nu)) (w')}_(nu = 1, ..., p)$. Clearly, for fixed $w'$ and
  sufficiently small $delta$ the cycle $Gamma^delta (f' - w')$ splits into a sum
  of cycles concentrated in the pairwise disjoint neighborhoods
  $scr(U)_(z^((nu)))$ of points $z^((nu))$:
  $Gamma^delta (f' - w') = sum_(nu = 1)^p Gamma_(z^((nu)))$ where
  $
    Gamma_(z^((nu)))
    = {z in scr(U)_(z^((nu))): |f_j (z) - w_j| = delta_j, j = 1, ..., n}.
  $
  #source(153)Now from @eq:overdetermined-homology and formula
  @eq:logarithmic-residue of @ss:geometric-trace we have
  $
    integral_Gamma phi(z) H(f(z), w) frac(d f'(z), f'(z) - w')
    = (2 pi i)^n sum_(nu = 1)^p phi(z^((nu))) H(f(z^((nu))), w).
  $ <eq:overdetermined-integral>
  We observe that $R_* (f(z^((nu)))) = 0$, $f_j (z^((nu))) = w_j$,
  $j = 1, ..., n$, therefore from @eq:hefer we obtain
  $
    H(f(z^((nu))), w) = 0 quad "if" f_(n + 1) (z^((nu))) != w_(n + 1).
  $
  Consequently, for the chosen $w$, the only terms in the right-hand side of
  @eq:overdetermined-integral that can be nonzero are those for which
  $f(z^((nu))) = w$. In other words,
  $
    & integral_Gamma phi(z) H(f(z), w) frac(d f'(z), f'(z) - w') \
    & quad = (2 pi i)^n sum_(a(w) in Z_(f(z) - w))
      phi(a(w)) H(f(a(w)), f(a(w))).
  $ <eq:overdetermined-reduced>
  But $H(f(a(w)), f(a(w))) = H(w, w)$, and from @eq:hefer it is easy to conclude
  that $H(w, w) = partial R_* \/ partial w_(n + 1)$. As a result the left-hand
  side of @eq:overdetermined-residue has the form
  $
    sum_(j = 1)^q lim_(w -> 0 \ w in A_j) phi(a(w)), wide
    a(w) in Z_(f(z) - w)
  $
  and consequently (by the definition @eq:overdetermined-multiplicity of the
  multiplicity $mu_a (f)$, where $a in Z_f$), it is equal to the right-hand
  side. This proves the theorem.
]

#remark[
  The theorem can be extended with very little change to the case of any
  overdetermined mappings $f: CC^n -> CC^(n + k)$, $k >= 1$. In
  @eq:overdetermined-residue we must replace the derivative
  $partial R_* \/ partial w_(n + 1)$ by the product
  $
    (partial R_(1 *) \/ partial w_(n + 1)) dots.c
    (partial R_(k *) \/ partial w_(n + k)),
  $
  where $R_(j *)$ is constructed in the way described above from $R_j$, the
  resultant of the system $(f' - w', f_(n + j) - w_(n + j))$, and replace
  $H(f(z), w)$ by the product $H_1 (f(z), w) dots.c H_k (f(z), w)$, where the
  $H_j$ are constructed from formula @eq:hefer, starting from $R_(j *)$.
] <rem:overdetermined>
