#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

#heading(
  level: 2,
)[Weil's formula and some questions of local algebraic geometry]
<sec:weil-formula>

#subsection[Weil's integral representation in special analytic polyhedra]
<ss:weil-representation>
#index-mark(
  "Integral representation",
  sub: "of Weil",
  target: <ss:weil-representation>,
)We show that Weil's integral representation is connected with Cauchy's
representation by the formula for transforming a local residue in
@ss:transformation-formula. Let us recall that an _analytic polyhedron_, defined
by a family of functions $(f_1, ..., f_m) in scr(O) (G)$, $G subset CC^n$ (or a
mapping $f = (f_1, ..., f_m): G -> CC^m$) is a set
$
  Pi = Pi^r (f) = {z in G: |f_1 (z)| < r_1, ..., |f_m (z)| < r_m},
$
if it is relatively compact in $G$. In the case $m = n$ the polyhedron $Pi$ is
said to be _special._ We shall consider only special polyhedra. The
distinguished boundary of a special polyhedron $Pi$ consists of points
$z in overline(Pi)$ that satisfy the equality $|f_j (z)| = r_j$ for each $j$
from 1 to $n$ and is denoted by $Gamma = Gamma^r (f)$. We define the orientation
of $Gamma$ by the condition $d(arg f_1) and dots.c and d(arg f_n) >= 0$. As in
the local case (see @ss:integral-definition), the condition $Pi relcomp G$
implies that $Gamma$ is a cycle.

We use a well-known theorem of Hefer (@bib:Shabat1976[p.~260]) according to
which for some neighborhood $scr(U)$ of the polyhedron $Pi$ ($scr(U)$ must be a
domain of holomorphy, so it is sufficient to put $scr(U) = Pi^(r + delta) (f)$,
where $delta$ is sufficiently small) there exist functions
$P_(j k) (zeta, z) in scr(O) (scr(U) times scr(U))$ such that for all
$(zeta, z) in scr(U) times scr(U)$ we have the expansions
$
  f_j (zeta) - f_j (z) = sum_(k = 1)^n (zeta_k - z_k) P_(j k) (zeta, z), wide
  j = 1, ..., n,
$ <eq:hefer-expansion>
#source(118)which we shall hereafter call #index-mark(
  "Expansion of Hefer",
)_Hefer expansions._ We denote the determinant $det norm(P_(j k) (zeta, z))$ by
$H(zeta, z)$.

#theorem[
  For any function $h$ that is holomorphic in the closure of a special analytic
  polyhedron $Pi = Pi^r (f)$ we have the integral representation
  $
    h(z) = (2 pi i)^(-n) integral_Gamma
    frac(h(zeta) H(zeta, z), f(zeta) - f(z)) d zeta, wide z in Pi,
  $ <eq:weil-formula>
  where $Gamma = Gamma^r (f)$ is the distinguished boundary of $Pi$, and
  $f(zeta) - f(z) = product_(j = 1)^n [f_j (zeta) - f_j (z)]$.
] <th:weil>

#proof[
  Let $z$ be a fixed point of $Pi$. For all points $zeta in Gamma$ we have the
  inequalities $|f_j (zeta)| = r_j > |f_j (z)|$, $j = 1, ..., n$. Therefore
  according to the lemma of @ss:boundary-representation the cycle $Gamma$ is
  homologous in the domain of regularity of the integrand in @eq:weil-formula to
  the cycle $Gamma^delta = Gamma^delta (f(zeta) - f(z))$, where $delta$ is a
  sufficiently small number in $RR_>$. In turn, for small $delta$ the cycle
  $Gamma^delta$ splits into a sum of local cycles: $sum_nu Gamma_nu$, where
  $
    Gamma_nu = {zeta in scr(U)_(zeta^((nu)) (z)):
      |f_j (zeta) - f_j (z)| = delta, quad j = 1, ..., n}
  $
  is a local cycle in a neighborhood of zero $zeta^((nu)) (z)$ of the mapping
  $f(zeta) - f(z)$. We observe that among these zeros there is $zeta = z$. Since
  the mappings $f(zeta) - f(z)$ and
  $(zeta - z) = (zeta_1 - z_1, ..., zeta_n - z_n)$ are connected by the
  relations @eq:hefer-expansion, by the lemma in @ss:transformation-formula the
  determinant $H(zeta, z)$ belongs to the ideal
  $I_(zeta^((nu)) (z)) (f(zeta) - f(z))$ for all $zeta^((nu)) (z) != z$. Thus,
  by the Cauchy formula, the transformation formula, and the proposition of
  @ss:integral-definition, we obtain
  $
    & h(z) = (2 pi i)^(-n) integral_(Gamma^epsilon (zeta - z))
      frac(h(zeta) d zeta, zeta - z)
      = res_z ""_((f(zeta) - f(z))) (h(zeta) H(zeta, z)) \
    & = sum_nu res_(zeta^((nu)) (z)) ""_((f(zeta) - f(z))) (h(zeta) H(zeta, z)).
  $
  The residues in the last sum are integrals over the cycles $Gamma_nu$, whose
  sum is homologous to the cycle $Gamma$ in the domain of regularity of the
  integrand. By Stokes' formula this sum of residues coincides with the integral
  in @eq:weil-formula, and the theorem is proved.
]

#remark[
  Let us recall that the proof of the local duality theorem in @ss:local-duality
  relied mainly on Weil's formula, which in turn assumes the existence of
  expansions of the form @eq:hefer-expansion for domains of holomorphy $scr(U)$.
  The proof of this fact in the general case is not simple. However, in
  @ss:local-duality we used Weil's formula in an arbitrarily small neighborhood
  $scr(U)$, and in this (local) case an expansion of the form
  @eq:hefer-expansion can be established in an elementary way by means of the
  Cauchy integral formula.
] <rem:weil-local>

#subsection[A modification of Weil's formula] <ss:weil-modification>
The one-dimensional prototype of the formula that we give here is obtained in
the following way from the Cauchy formula. Let $G$ be a bounded domain of the
complex plane $CC$ with #source(119)piecewise smooth boundary, and $h$ be a
holomorphic function in $overline(G)$. In any relatively compact domain
$Pi subset G$, on the basis of Cauchy's integral formula we represent the
function $h$ in the form
$
  h(z) = (2 pi i)^(-1) integral_(partial G)
  frac(phi(zeta) h(zeta) d zeta, zeta - z), wide z in Pi,
$
where $phi$ is a smooth function in $CC$ that is equal to zero in $Pi$ and to
one on $partial G$. The weight function $phi$ is introduced with the idea to get
rid of the singularity of the Cauchy kernel at the point $zeta = z$. By the
application of Green's formula we obtain the required formula
$
  h(z) = (2 pi i)^(-1) integral_G h(zeta) dbar (frac(phi(zeta), zeta - z))
  and d zeta, wide z in Pi,
$
with integration over the domain $G$ (more precisely, over the "band"
$G without Pi$).

In the multidimensional case we shall start from Weil's formula. Let
$Pi = Pi^r (f)$ be a special analytic polyhedron in a domain $G subset CC^n$
corresponding to the mapping $f = (f_1, ..., f_n): G -> CC^n$. We fix a number
$p$ between 0 and $n$ and represent $f$ in the form $f = (f', f'')$, where
$f' = (f_1, ..., f_p)$, $f'' = (f_(p + 1), ..., f_n)$. Let us consider the
polyhedron
$
  Pi_epsilon^((p)) = {z in G: |f_i (z)| < r_i, quad i = 1, ..., p;
  quad |f_j (z)| < r_j + epsilon, & \
              j = p + 1, ..., n}, &
$
where we choose $epsilon$ so small that $Pi_epsilon^((p)) relcomp G$. We call
this polyhedron the #index-mark(
  "Extension of a polyhedron",
)_$epsilon$-extension_ of $Pi$ along $f''$.

#theorem[
  Let $Pi = Pi^r (f)$ be a special analytic polyhedron in a domain
  $G subset CC^n$ and $Pi_epsilon = Pi_epsilon^((p))$ be its $epsilon$-extension
  along $f''$. There is a smooth $dbar$-closed form $psi_z = psi_z^((p)) (zeta)$
  of bidegree $(n, n - p)$ whose coefficients depend holomorphically on
  $z in Pi$, and for any function $h in scr(O) (overline(Pi)_epsilon)$ we have
  the formula
  $
    h(z) = (2 pi i)^(-n) integral_gamma h(zeta)
    frac(psi_z (zeta), product_(j = 1)^p [f_j (zeta) - f_j (z)]), wide z in Pi,
  $ <eq:modified-weil>
  with integration over the face
  $
    gamma = gamma^((p)) = {zeta in overline(Pi)_epsilon: |f_j (zeta)| = r_j,
      quad j = 1, ..., p}
  $
  of the polyhedron $Pi_epsilon$.
] <th:weil-modification>

#proof[
  For each $j in {p + 1, ..., n}$ we construct a function $phi_j (zeta)$ that is
  smooth in $G$ and has the properties
  $
    phi_j|_({|f_j| <= r_j}) equiv 0, wide
    phi_j|_({|f_j| >= r_j + epsilon}) equiv 1
  $
  and we define the form
  $
    psi_z^((p)) (zeta) = dbar phi_(p + 1) and dots.c and dbar phi_n and H d zeta
    bigslash product_(j = p + 1)^n [f_j (zeta) - f_j (z)],
  $ <eq:psi-form>
  #source(120)where $H = H(zeta, z)$ is the determinant of the matrix formed by
  the coefficients $P_(j k)$ of the Hefer expansions for the functions $f_j$
  (see @ss:weil-representation[subsection]). For $p = n$ we suppose that
  $psi_z^((p)) (zeta) = H d zeta$. If $z$ is fixed and lies in $Pi$, then the
  denominator in @eq:psi-form can vanish only at those points $zeta$ at which
  $|f_j (zeta)| < r_j$ for at least one $j$ from $p + 1$ to $n$. However, in
  neighborhoods of such points $zeta$ the numerator is identically zero. Hence
  for $z in Pi$ the form $psi_z^((p)) (zeta)$ is smooth in $G$. It has bidegree
  $(n, n - p)$, and is obviously $dbar$-closed and depends holomorphically on
  $z in Pi$.

  We mention one more property of the form $psi_z^((p)) (zeta)$. The dependence
  of this form on the first $p$ functions $f_1, ..., f_p$ becomes apparent only
  in the choice of the determinant $H$, more precisely, in the choice of
  coefficients $P_(j k)$ of the Hefer expansions for the $f_j$. Consequently, we
  can assume that under the transformation
  $(f_1, ..., f_p) -> (delta_1 f_1, ..., delta_p f_p)$ the form @eq:psi-form is
  multiplied by $delta_1 dots.c delta_p$, and the integrand in @eq:modified-weil
  is invariant with respect to such transformations. Hence it follows that if
  the formula @eq:modified-weil is true for $z$ from the polyhedron $Pi^r$ with
  the first $p$ radii $r_1, ..., r_p$, then it is also true in the polyhedron
  $Pi^(r')$ with the first $p$ radii
  $r_1 plus.minus epsilon_1, ..., r_p plus.minus epsilon_p$, where the
  $epsilon_j$ are sufficiently small.

  We prove @eq:modified-weil by induction on $k = n - p$. For $k = 0$ (that is,
  $p = n$) @eq:psi-form has the form $H d zeta$ and the polyhedron $Pi_epsilon$
  coincides with $Pi$, so @eq:modified-weil becomes Weil's formula, which we
  proved in @ss:weil-representation[subsection].

  Let us assume that @eq:modified-weil holds for $k = n - (p + 1)$, that is, in
  the case when the number $p$ in it is replaced by $p + 1$. According to the
  last remark about the properties of @eq:psi-form, such a formula is true not
  only in the polyhedron $Pi$ but also in
  $
    tilde(Pi) = {z in G: |f_j (z)| < r_j, quad j != p + 1,
      quad |f_(p + 1) (z)| < r_(p + 1) + epsilon},
  $
  that is,
  $
    h(z) = (2 pi i)^(-n) integral_(tilde(gamma)) h(zeta)
    frac(
      psi_z^((p + 1)) (zeta),
      product_(j = 1)^(p + 1) [f_j (zeta) - f_j (z)]
    ),
    wide z in tilde(Pi),
  $ <eq:induction-formula>
  with integration over the face
  $
    & tilde(gamma) = tilde(gamma)^((p + 1)) \
    & quad = {zeta in overline(tilde(Pi))_epsilon^((p + 1)):
        |f_j (zeta)| = r_j, quad j = 1, ..., p,
        |f_(p + 1) (zeta)| = r_(p + 1) + epsilon}
  $
  of the polyhedron $tilde(Pi)_epsilon^((p + 1))$, which is the
  $epsilon$-extension of $tilde(Pi)$ along $tilde(f)'' = (f_(p + 2), ..., f_n)$,
  or equivalently the $epsilon$-extension of $Pi$ along $f''$.

  We denote by $gamma_j$ the $j$th face of $Pi_epsilon$ of dimension $2n - 1$,
  and by $gamma_(j_1, ..., j_k)$ the face of dimension $2n - k$, which is equal
  to the intersection $gamma_(j_1) inter dots.c inter gamma_(j_k)$. In this
  notation the face $gamma$ in @eq:modified-weil coincides with
  $gamma_(1, ..., p)$, and the face $tilde(gamma)$ in @eq:induction-formula
  coincides with $gamma_(1, ..., p + 1)$. The boundary
  $partial gamma = partial gamma_(1, ..., p)$ is equal to
  $
    partial gamma = tilde(gamma) - gamma_(1, ..., p, p + 2) + dots.c
    + gamma_(1, ..., p, n).
  $
  #source(121)We observe that the form $psi_z^((p + 1))$ is equal to zero on the
  faces $gamma_(1, ..., p, j)$, $j = p + 2, ..., n$. Next, the function
  $phi_(p + 1)$ is equal to one on $tilde(gamma)$, so in @eq:induction-formula
  in front of the form $psi_z^((p + 1))$ we can put the factor $phi_(p + 1)$ and
  replace $tilde(gamma)$ by $partial gamma$.

  After multiplication by $phi_(p + 1)$ the integrand in @eq:induction-formula
  becomes smooth on $gamma$ for all $z in Pi$. Applying Stokes's formula, we
  obtain
  $
    h(z) = (2 pi i)^(-n) integral_gamma h(zeta)
    frac(
      dbar phi_(p + 1) and psi_z^((p + 1)) (zeta),
      product_(j = 1)^(p + 1) [f_j (zeta) - f_j (z)]
    ),
    wide z in Pi,
  $
  that is, taking account of the definition of $psi_z^((p)) (zeta)$, the formula
  @eq:modified-weil.
]

From the theorem we have proved there follows the next assertion, which can be
useful in problems on the division of a function by an ideal (see
@ss:nondegeneracy, for example).

#corollary[
  Let $Pi = Pi^r (f)$ be a special analytic polyhedron in a domain $G$ of the
  space $CC^n$, determined by the system $f = (f_1, ..., f_n)$, and let
  $p in {1, ..., n}$. We assume that $epsilon$ is so small that
  $Pi^(r + epsilon) (f) relcomp G$. Then there is a differential form
  $psi_z = psi_z^((p)) (zeta)$ with the properties

  #roman-text[(i)] $psi_z in scr(E)^(n, n - p) (G)$ and $dbar psi_z = 0$;

  #roman-text[(ii)] the coefficients of $psi_z$ depend holomorphically on the
  parameter $z in Pi$;

  #roman-text[(iii)] the support of $psi_z$ lies in the set
  ${zeta in G: r_j < |f_j (zeta)| < r_j + epsilon, j = p + 1, ..., n}$, and for
  each function $h in scr(O) (Pi^(r + epsilon) (f))$ we have the representation
  $
    h(z) = (2 pi i)^(-n) integral_(T^r) h(zeta)
    frac(psi_z (zeta), f_1 (zeta) dots.c f_p (zeta)) + phi(z), wide z in Pi,
  $ <eq:division-representation>
  where $phi$ is an element of the ideal $I_Pi (f_1, ..., f_p)$ generated in the
  ring $scr(O) (Pi)$ by the functions $f_1, ..., f_p$, and $T^r$ is the tube
  ${zeta in G: |f_j (zeta)| = r_j, j = 1, ..., p}$.
] <cor:weil-division>

#proof[
  For $psi_z$ we choose the form defined by formula @eq:psi-form. From its
  construction it is obvious that it has the properties (i)--(iii). In addition,
  the form $psi_z$ is equal to zero on $|T^r| without |gamma|$, where $gamma$ is
  the face of $Pi_epsilon$ defined before the statement of the theorem. Thus, in
  @eq:modified-weil the face $gamma$ can be replaced by the tube $T^r$. Next we
  proceed as in the proof of the theorem of @ss:local-duality: in view of the
  fact that for $(zeta, z) in T^r times Pi$ we have $|f_j (zeta)| > |f_j (z)|$,
  $j = 1, ..., p$, the fraction of the integrand in @eq:modified-weil decomposes
  into a series of multiple geometric progression; under term-by-term
  integration the first term of the series gives the integral in
  @eq:division-representation, and the sum of all remaining terms lies in the
  ideal $I_Pi (f_1, ..., f_p)$.
]

#subsection[A local variant of Hilbert's theorem on roots]
<ss:local-nullstellensatz>
#index-mark(
  "Local variant of Nullstellensatz",
  target: <ss:local-nullstellensatz>,
)A local variant of the theorem on zeros (Nullstellensatz) asserts that if the
germ of a holomorphic function $h in scr(O)_a$ is equal to zero on the germ
$V_a$ of the analytic set $V = {f_1 = dots.c = f_m = 0} subset CC^n$, then some
power of $h$ lies in the ideal $I_a (f_1, ..., f_m) subset scr(O)_a$ generated
by the functions $f_1, ..., f_m$. We refine this result in the case when the
germ $V_a$ coincides with the point $a$ and $m = n$.

#proposition[
  #source(122)Suppose that the holomorphic mapping
  $f = (f_1, ..., f_n): scr(U)_a -> CC^n$ from a neighborhood of a point
  $a in CC^n$ has an isolated zero $z = a$. If the germ $h in scr(O)_a$ is equal
  to zero at the point $a$, then $h^mu in I_a (f)$, where $mu = mu_a (f)$ is the
  multiplicity of the mapping $f$ at the point $a$, and $I_a (f)$ is the ideal
  in the ring $scr(O)_a$ generated by the system $f_1, ..., f_n$.
] <prop:local-nullstellensatz>

#proof[
  We know from @ss:geometric-multiplicity that for all points $w$ from some
  polydisk $scr(B)_epsilon$ the system of equations $f(z) = w$ has only isolated
  roots in $scr(U)_a$, and the number of them (with multiplicities) is equal to
  $mu$; we denote these roots by $z^((1)) (w), ..., z^((mu)) (w)$.

  Let us consider the function
  $H(z, w) = product_(nu = 1)^mu [h(z) - h(z^((nu)) (w))]$, which we write in
  the form
  $
    H(z, w) = h(z)^mu + a_(mu - 1) (w) h(z)^(mu - 1) + dots.c + a_0 (w),
  $
  where the $a_k (w)$ are elementary symmetric functions of $h(z^((nu)) (w))$,
  and consequently polynomially expressed in terms of the power sums
  $
    sum_(nu = 1)^mu h^q (z^((nu)) (w)), wide q = 0, 1, 2, ... .
  $
  According to @ss:geometric-trace the coefficients $a_k (w)$ are holomorphic in
  $scr(B)_epsilon$. Since among the inverse images $f^(-1) (w)$ of the point
  $w = f(z)$ there is a point $z$, it is clear that $H(z, f(z)) equiv 0$, that
  is,
  $
    h^mu = -a_0 (f(z)) - dots.c - a_(mu - 1) (f(z)) h^(mu - 1).
  $
  By hypothesis, $h(a) = 0$, so that $a_k (0) = 0$, since $z^((nu)) (w) -> a$ as
  $w -> 0$. Hence $a_k (f(z)) in I_a (f)$ and $h^mu in I_a (f)$.
]

#subsection[The Weierstrass preparation theorem (WPT)] <ss:wpt>
Suppose that the mapping $f: CC_z^n -> CC_w^n$ is holomorphic in a neighborhood
of $0 in CC_z^n$, and that $f(0) = 0$. We denote by $scr(O) (z)$ and
$scr(O) (w)$ the rings of germs of functions holomorphic at $0 in CC^n$
(convergent power series) in the variables $z$ and $w$ respectively. We recall
(see @ss:local-duality) that $I_0 (f)$ is the ideal in the ring
$scr(O)_0 = scr(O) (z)$ generated by the components $f_j$ of the mapping
$f = (f_1, ..., f_n)$, and we denote by $Q_(f, 0)$ the local algebra
$scr(O)_0 \/ I_0 (f)$. We prove the following assertion, called the #index-mark(
  "Weierstrass preparation theorem (WPT)",
)_Weierstrass preparation theorem_ (WPT) (for its connection with a classic
variant of the theorem on division and the WPT on the separation of a
pseudopolynomial, see the remarks following the statement).

#theorem[
  Suppose that the mapping $w = f(z)$ has an isolated zero at 0 and that
  ${hat(e)_1, ..., hat(e)_k}$ is a basis of the local algebra $Q_(f, 0)$. Then
  for any germ $h in scr(O) (z)$ there is a unique expansion
  $
    h(z) = c_1 (f(z)) e_1 (z) + dots.c + c_k (f(z)) e_k (z),
  $ <eq:wpt-expansion>
  where $c_j (w) in scr(O) (w)$.
] <th:wpt>

#source(123)The expansion @eq:wpt-expansion is written in the form
$h(z) = sum_(j = 1)^k c_j (w) e_j (z)$, $w = f(z)$, so the theorem asserts that
the ring $scr(O) (z)$ is a finitely generated $scr(O) (w)$-module with basis
${e_j (z)}$.

In the special case when the mapping $f$ has the form
$f = (z', f_n) = (z_1, ..., z_(n - 1), f_n)$, and 0 is an isolated point of
$f^(-1) (0)$, it is not difficult to verify that the monomials
$1, z_n, z_n^2, ..., z_n^(k - 1)$ ($k$ is the multiplicity of the zero $z_n = 0$
of the function $f_n (0', z_n)$) represent a basis of the local algebra
$Q_(f, 0)$. In this case the theorem asserts that any germ $h$ can be uniquely
represented in the form $h(z) = sum_(j = 0)^(k - 1) c_j (z', f_n) z_n^j$.
Clearly, $c_j (z', f_n)$ can be represented by the sum $a_j (z') + q_j f_n$,
$q_j in scr(O)_0$, $a_j in scr(O)_(0')$, so we arrive at a classic variant of
the division theorem: $h = q f_n + r$, where $q in scr(O)_0$, and
$r = a_0 (z') + a_1 (z') z_n + dots.c + a_(k - 1) (z') z_n^(k - 1)$ is a
pseudopolynomial. We recall that if we put $h = z_n^k$ in the division theorem,
we obtain the Weierstrass preparation theorem on separation of a
pseudopolynomial (see @bib:Hormander1966).

#proof(title: [Proof of the theorem.])[
  The proof will be carried out on the following scheme: we first show that
  $scr(O) (z)$ is a finitely generated $scr(O) (w)$-module with a certain system
  of generators (not necessarily coinciding with ${e_j}$); hence by means of
  Nakayama's lemma we obtain the expansion @eq:wpt-expansion; finally, by
  invoking the local duality theorem we establish the uniqueness of the
  expansion @eq:wpt-expansion.

  #smallcaps[Step] 1. According to @ss:local-nullstellensatz[subsection], for
  all $i$ from 1 to $n$ the monomials $z_i^mu$ belong to the ideal $I_0 (f)$,
  where $mu$ is the multiplicity of the zero $z = 0$ of the mapping $f$. Thus,
  the family of monomials $z^alpha$,
  $alpha in A = {alpha_1 < mu, ..., alpha_n < mu}$, generates the local algebra
  $Q_(f, 0)$. We refer the reader to the book of Malgrange @bib:Malgrange1967,
  where he proves that this family generates the ring $scr(O) (z)$, regarded as
  an $scr(O) (w)$-module, that is, for any $h in scr(O) (z)$ there are
  $c_alpha in scr(O) (w)$ with the property
  $
    h(z) = sum_(alpha in A) c_alpha (w) z^alpha, wide w = f(z).
  $ <eq:generators-expansion>
  #new-par
  #smallcaps[Step] 2. We prove the expansion @eq:wpt-expansion. For this we use
  Nakayama's lemma (@bib:Griffiths1978a[p.~680]), which asserts that if for a
  finitely generated $scr(O)$-module $M$ we have $M = frak(m) dot M$, then
  $M = (0)$, the zero module. Here $frak(m)$ is the maximal ideal in the ring
  $scr(O) = scr(O)_0$ consisting of germs of functions that vanish at the point
  0; clearly, it is generated by coordinate functions, that is,
  $frak(m) = I_0 (z_1, ..., z_n)$. Here the product $frak(m) dot M$ is a
  submodule of $M$ consisting of all elements of the form
  $a_1 m_1 + dots.c + a_k m_k$, $a_j in frak(m)$, where ${m_j}_(j = 1, ..., k)$
  is a system of generators of $M$.

  Let $frak(m) = frak(m) (w)$ be a maximal ideal in the ring $scr(O) (w)$.
  According to @eq:generators-expansion we have
  $
    frak(m) dot scr(O) (z) = {sum_(alpha in A) a_alpha (w) z^alpha,
      quad w = f(z); quad a_alpha in frak(m)}.
  $
  Clearly, $frak(m) dot scr(O) (z)$ coincides with the ideal $I_0 (f)$. In fact,
  for each $a_alpha (w) in frak(m)$ #source(124)the germ $a_alpha (f(z))$
  belongs to the ideal $I_0 (f)$, so $frak(m) dot scr(O) (z) subset I_0 (f)$.
  Conversely, if $h in I_0 (f)$, that is, $h = q_1 f_1 + dots.c + q_n f_n$,
  then, applying @eq:generators-expansion to each germ $q_j$, we obtain
  $h in frak(m) dot scr(O) (z)$. We denote by
  $
    S = {c_1 (w) e_1 (z) + dots.c + c_k (w) e_k (z), quad w = f(z),
      quad c_j in scr(O) (w)}
  $
  the module in $scr(O) (z)$ consisting of elements that can be represented in
  the form @eq:wpt-expansion. We prove that $S = scr(O) (z)$. Consider the
  $scr(O) (w)$-module $M := scr(O) (z) \/ S$. We denote the class of the germ
  $h in scr(O) (z)$ in $M$ by $[h]$. Since ${hat(e)_j}$ is a basis of
  $scr(O) (z) \/ I_0 (f)$, for any $h in scr(O) (z)$ we have
  $h = c_1^0 e_1 (z) + dots.c + c_k^0 e_k (z) + h'$, where
  $h' in I_0 (f) = frak(m) dot scr(O) (z)$, and $c_j^0 in CC$. Consequently,
  $[h] = [h'] in frak(m) dot M$, and we obtain $M = frak(m) dot M$. By
  Nakayama's lemma $M = (0)$, so $S = scr(O) (z)$, and the expansion
  @eq:wpt-expansion is proved.

  #smallcaps[Step] 3. In order to prove the uniqueness of the expansion
  @eq:wpt-expansion, we consider the mapping
  $F = (f(z) - f(zeta); zeta): CC_(z, zeta)^(2n) -> CC^(2n)$, which under the
  hypothesis of the theorem for the mapping $f$ has the point $(0, 0)$ as an
  isolated zero. Since each coordinate function $zeta_j$ belongs to the ideal
  $I_(0, 0) (F)$, the elements of the local algebra $Q_(F, (0, 0))$ are
  represented by germs that depend only on $z$. At the same time, the two germs
  $h(z)$ and $g(z)$ represent the same element in this algebra if and only if
  $
    h(z) - g(z) equiv sum_(j = 1)^n q_j (z) f_j (z)
    + sum_(j = 1)^n phi_j (zeta, z) zeta_j
  $ <eq:germs-identity>
  (this expansion is based on the equality $f(0) = 0$, so
  $f(zeta) in I_0 (zeta_1, ..., zeta_n)$). The identity @eq:germs-identity is
  possible if and only if $h - g in I_0 (f)$. Thus, the local algebras
  $Q_(f, 0)$ and $Q_(F, (0, 0))$ are isomorphic, and the family of germs ${e_j}$
  is a basis of both the first and second algebras.

  Let $H(z, zeta)$ be an arbitrary germ of $scr(O) (z, zeta)$. Since
  ${hat(e)_j}$ is a basis of the local algebra $Q_(F, (0, 0))$ by what we proved
  in Step 2, $H$ has an expansion of the form @eq:wpt-expansion:
  $
    H(z, zeta) = sum_(j = 1)^k c_j (F(z, zeta)) e_j (z)
    = sum_(j = 1)^k g_j (zeta) e_j (z) + Phi(z, zeta),
  $ <eq:h-expansion>
  where $c_j (w, u) in scr(O) (w, u)$, $g_j (zeta) = c_j (0, zeta)$. It is clear
  that $Phi(z, zeta) in I_0 (f(z) - f(zeta))$. As a result, each germ
  $H(z, zeta)$, up to an element of the ideal $I_0 (f(z) - f(zeta))$, has an
  expansion in the system ${e_j (z)}$ with coefficients that depend on $zeta$.
]

#lemma[
  The coefficients $g_j (zeta)$ in the expansion @eq:h-expansion are determined
  uniquely from $H(z, zeta)$.
] <lem:wpt-coefficients>

#proof(title: [Proof (of the lemma).])[
  Suppose that $epsilon$ is so small that the polyhedron $Pi = Pi^epsilon (f)$
  (more precisely, its connected component near zero) is relatively #source(125)
  compact in some neighborhood of zero. We observe that the coefficients
  $g_j (zeta)$ satisfy in $Pi$ a system of linear equations
  $
    sum_(j = 1)^k g_j (zeta)
    {integral_Gamma frac(e_j (z) e_q (z) d z, f(z) - f(zeta))}
    = {integral_Gamma frac(H(z, zeta) e_q (z) d z, f(z) - f(zeta))}, wide
    q = 1, ..., k,
  $ <eq:linear-system>
  where $Gamma$ is the distinguished boundary of $Pi$, and
  $
    f(z) - f(zeta) = product_(nu = 1)^n [f_nu (z) - f_nu (zeta)].
  $
  In fact, for any fixed $zeta in Pi$ the inequalities
  $|f_nu (z)| > |f_nu (zeta)|$, $nu = 1, ..., n$, hold on the distinguished
  boundary $Gamma$, so by the lemma of @ss:boundary-representation the cycle
  $Gamma$ on the right-hand side of @eq:linear-system can be replaced by the
  cycle $Gamma^delta (f(z) - f(zeta))$. Let us carry out this replacement of
  cycles and substitute for $H$ its expansion @eq:h-expansion. Taking account of
  the proposition of @ss:integral-definition, the integral corresponding to the
  term $Phi$ vanishes (we recall that $Phi in I_0 (f(z) - f(zeta))$), and the
  integral corresponding to the sum $sum g_j (zeta) e_j (z)$ gives the left-hand
  side of @eq:linear-system with integration over the cycle
  $Gamma^delta (f(z) - f(zeta))$. By the lemma of @ss:boundary-representation we
  replace this cycle by $Gamma$.

  Next, since $Gamma$ is a local cycle, for $zeta = 0$ the determinant of the
  system of equations @eq:linear-system is equal to the determinant of the
  matrix $norm(B(hat(e)_j, hat(e)_q)) = norm(res_0 ""_f (e_j dot e_q))$ up to a
  factor $(2 pi i)^(-n k)$. The local duality theorem implies that this
  determinant is not equal to zero. By the continuity of integrals with respect
  to $zeta$ the determinant of the system @eq:linear-system is not equal to zero
  when $zeta$ is sufficiently close to the point $zeta = 0$. Hence we deduce
  that the $g_j (zeta)$ are uniquely determined by $H(z, zeta)$. The proof of
  the lemma is complete.

  Let us return to the proof of the uniqueness of the expansion
  @eq:wpt-expansion. Let $H(zeta, z)$ be a function of Weil's integral
  representation, which, according to the lemma we have just proved, admits the
  expansion @eq:h-expansion with uniquely determined coefficients $g_j (zeta)$.
  Substituting this expansion into Weil's formula for $h$ and using the fact
  that the integral corresponding to the term $Phi$ is equal to zero (see the
  arguments in the proof of the lemma), we obtain for $h$ an expansion of the
  form @eq:wpt-expansion, where the coefficients $c_j$ are determined by the
  formulas
  $
    c_j (w) = (2 pi i)^(-n) integral_Gamma
    frac(h(zeta) g_j (zeta) d zeta, f(zeta) - w), wide j = 1, ..., k.
  $
  #new-par
  Thus, the $c_j (w)$ depend only on $h$ and on the coefficients $g_j$ in the
  expansion @eq:h-expansion of the function $H$ from Weil's integral
  representation. The assertion about uniqueness will be finally proved if we
  establish that for all holomorphic functions $H$ serving the family of
  functions $h in scr(O) (overline(Pi))$ in Weil's integral formula, the
  coefficients $g_j$ are the same in the expansions @eq:h-expansion. Let $H$ and
  $H'$ be two such functions. We show that for the function #source(126)
  $G := H - H'$ the coefficients $g_j$ in @eq:h-expansion are identically equal
  to zero, that is, $G in I_0 (f(z) - f(zeta))$. In view of the choice of $H$
  and $H'$, the function $G$ is orthogonal to all $h in scr(O) (overline(Pi))$
  in the following sense:
  $
    integral_Gamma frac(G(zeta, z) h(zeta) d zeta, f(zeta) - f(z)) equiv 0,
  $ <eq:orthogonality>
  where $Pi = Pi^epsilon (f)$ is a polyhedron in a neighborhood of the point
  $zeta = 0$, and $Gamma$ is its distinguished boundary. We represent the
  function $G$ in the polyhedron
  $tilde(Pi) = {(zeta, z): |f_j (zeta) - f_j (z)| < delta_1, |z_j| < delta_2,
    j = 1, ..., n}$
  by the formula
  $
    G(zeta, z) = (2 pi i)^(-2n) integral_(tilde(Gamma))
    frac(
      G(xi, eta) tilde(H) (xi, eta, zeta, z) d xi and d eta,
      [(f(xi) - f(eta)) - (f(zeta) - f(z))] dot [eta - z]
    ),
  $ <eq:g-weil>
  where $tilde(Gamma)$ is the distinguished boundary of the polyhedron
  $tilde(Pi)$, and $tilde(H)$ is the determinant of the matrix consisting of
  coefficients of the Hefer expansions of the special system
  $F = (f(zeta) - f(z), z)$, which, as is easy to verify, can be chosen to
  depend only on $(xi, zeta)$. For points
  $(xi, eta, zeta, z) in tilde(Gamma) times tilde(Pi)$ we expand the fraction
  $[(f(xi) - f(eta)) - (f(zeta) - f(z))]^(-1)$ as a series of multiple geometric
  progression. Substituting this expansion in @eq:g-weil and integrating term by
  term, we obtain
  $
    G(zeta, z) = (2 pi i)^(-2n) integral_(tilde(Gamma))
    frac(
      G(xi, eta) tilde(H) (xi, zeta) d xi and d eta,
      [f(xi) - f(eta)][eta - z]
    )
    + phi(zeta, z),
  $ <eq:g-series>
  where $phi in I_0 (f(z) - f(zeta))$, and the first term, after integration
  with respect to $eta$, can be written as an integral
  $
    (2 pi i)^(-n) integral_(Gamma')
    frac(G(xi, z) tilde(H) (xi, zeta) d xi, f(xi) - f(z))
  $ <eq:g-integral>
  over the cycle $Gamma' = {xi: |f_j (xi) - f_j (z)| = delta_1, j = 1, ..., n}$.
  By the lemma in @ss:boundary-representation, for a sufficiently small
  $delta_1$ the cycle $Gamma'$ can be replaced by $Gamma$. On the basis of the
  assumptions @eq:orthogonality the integral @eq:g-integral is identically equal
  to zero, and from @eq:g-series we obtain $G = phi in I_0 (f(z) - f(zeta))$.
  This completes the proof of the theorem.
]

#subsection[Division with remainder and the WPT on the separation of a
  pseudopolynomial mapping] <ss:division-with-remainder>
Let us mention two consequences of the WPT, proved in @ss:wpt[subsection].
Namely, we extend classic variants of the theorem on division with remainder to
the germ of the function $f$, and the WPT on separation of a pseudopolynomial
for $f$ to the case when $f = (f_1, ..., f_p)$ is a holomorphic mapping,
$1 < p <= n$. We put $z' = (z_1, ..., z_p)$, $z'' = (z_(p + 1), ..., z_n)$, so
$z = (z', z'')$; if 0 is the origin of the space $CC^n$, then $0 = (0', 0'')$.

#theorem[
  #source(127)Suppose that a mapping $f: CC^n -> CC^p$ is holomorphic in a
  neighborhood of the origin and that $f(z', 0'')$ has an isolated zero
  $z' = 0'$. If ${hat(e)_j (z')}_(j = 1, ..., k)$ is a basis of the local
  algebra $Q_(f(z', 0''), 0')$, then for any germ $h in scr(O)_0$ we have the
  expansion $h = q_1 f_1 + dots.c + q_p f_p + r$, where $q_j in scr(O)_0$, and
  the remainder $r$ is written uniquely in the form
  $r(z) = c_1 (z'') e_1 (z') + dots.c + c_k (z'') e_k (z')$,
  $c_j in scr(O)_(0'')$.
] <th:division>

#proof[
  Consider the mapping $F = (f(z), z'')$ of the space $CC^n$, which by the
  hypothesis of the theorem has an isolated zero $z = 0$. Exactly as at the
  start of Step 3 of the proof of the WPT, we show that the local algebras
  $Q_(f(z', 0''), 0')$ and $Q_(F, 0)$ are isomorphic, and the system of germs
  ${e_j}$ is a basis of $Q_(F, 0)$. From the WPT it follows that for any
  $h in scr(O)_0$ we have the expansion
  $
    h = sum_(j = 1)^k tilde(c)_j (f(z), z'') e_j (z'), wide
    tilde(c)_j (w) in scr(O) (w),
  $ <eq:division-expansion>
  where the coefficients depend uniquely on $h$. Clearly,
  $tilde(c)_j (f(z), z'')$ can be represented as
  $c_j (z'') + {"an element of the ideal" I_0 (f)}$, and in this representation
  $c_j (z'')$ is uniquely determined by $tilde(c)_j (w)$. Substituting these
  representations in @eq:division-expansion, we obtain the assertion of the
  theorem.
]

We now extend the WPT on the separation of a pseudopolynomial (a Weierstrass
polynomial) to the case of holomorphic mappings. We first define an analog of a
Weierstrass polynomial. In the above notation for $z'$ and $z''$ we call a
mapping $P(z) = P(z', z''): CC^n -> CC^p$ a Weierstrass polynomial mapping if it
is polynomial in $z'$ and holomorphic in $z''$ in some neighborhood of the point
$z'' = 0''$, and the mapping $P^0 = P(z', 0''): CC^p -> CC^p$ has a unique zero
$z' = 0'$. According to @ss:ideals, under these conditions the ideal
$I(P^0) subset CC[z]$ is primary.

Suppose that the mapping $f: CC^n -> CC^p$ is holomorphic in a neighborhood of
the origin and $f(z', 0'')$ has an isolated zero $z' = 0'$. From a local variant
of the theorem on zeros (see @ss:local-nullstellensatz[subsection]) it follows
that monomials of sufficiently high degree $m$ lie in the ideal
$I_0 (f(z', 0''))$. We represent the mapping $g = f(z', 0'')$ as a sum
$g' + g''$, where $g'$ is a polynomial mapping whose components are degree
$m - 1$ segments of Taylor series of the corresponding components of the mapping
$g$, and the components of $g''$ consist of the remainders of the Taylor series
and therefore belong to the ideal $I_(0') (g)$. The following assertion is true:
_the ideals $I_(0') (g')$ and $I_(0') (g)$ are equal._ In fact, since
$g_j, g''_j in I_(0') (g)$, we have $g'_j = g_j - g''_j in I_(0') (g)$, from
which we obtain the inclusion $I_(0') (g') subset I_(0') (g)$.

We show that the reverse inclusion holds. Suppose that $h$ belongs to the ideal
$I_(0') (g): h = sum_j phi_j g_j$. By construction the components of $g''_j$
also #source(128)belong to this ideal: $g''_j = sum_q phi_(j q) g_q$. Hence
$
  h & = sum_j phi_j g'_j + sum_j phi_j g''_j
      = sum_j phi_j g'_j + sum_(j, q) phi_j phi_(j q) (g'_q + g''_q) \
    & = sum_j phi_j g'_j + sum_(j, q) phi_j phi_(j q) g'_q
      + sum_(j, q, r) phi_j phi_(j q) phi_(q r) (g'_r + g''_r).
$
Substituting into the last sum instead of the $g''_r$ their expansions in terms
of components of the mapping $g = g' + g''$ and iterating the process, we expand
$h$ as a series in powers of the family $B = {phi_(j q), phi_j, g'_j}$, which
consists of $p^2 + 2p$ functions. This series converges in the polyhedron $Pi$
consisting of points $z'$ at which the modulus of each function of the family
$B$ is less than one (it is easy to see this from the structure of the series:
it is formed from nonrecurring monomials with respect to functions of the family
$B$ with coefficients one). Clearly, $Pi$ contains some neighborhood of zero,
and since each term of the series contains at least one component of the mapping
$g'$, the function $h$ belongs to the ideal $I_(0') (g')$.

In particular, the equality of $I_(0') (g')$ and $I_(0') (g)$ implies that the
polynomial mapping $g'$ has the point $z' = 0'$ as an isolated zero. Therefore
the ideal $I(g') subset CC[z]$ splits into the intersection
$I^0 inter I^1 inter dots.c inter I^s$ of primary ideals, and for one of them,
say $I^0$, the set of zeros $V(I^0)$ in the space $CC^p$ consists of the point
$z' = 0'$ (see @ss:ideals). We call $I^0$ a _polynomial primary component_ at
the point $z' = 0'$ for the mapping $f(z', 0'')$. If $P^0 = (P_1^0, ..., P_r^0)$
is a system of generators of $I^0$, then, taking into account the proposition of
@ss:ideals and the assertion proved above, we have
$
  I_(0') (P^0) = I_(0') (g') = I_(0') (f(z', 0'')).
$ <eq:ideals-equal>

#theorem[
  Suppose that a mapping $f: CC^n -> CC^p$ is holomorphic in a neighborhood of
  the origin and $f(z', 0'')$ has an isolated zero $z' = 0'$. If the polynomial
  primary component at the point $z' = 0'$ for the mapping $f(z', 0'')$ is
  generated by $p$ polynomials $P_1^0, ..., P_p^0$, then there is a Weierstrass
  polynomial mapping $P(z)$ such that $P(z', 0'') = (P_1^0, ..., P_p^0)$ and
  $
    f(z) = A(z) P(z),
  $ <eq:weierstrass-factorization>
  where $A(z)$ is a matrix that is holomorphic and nonsingular in a neighborhood
  of $0 in CC^n$.
] <th:weierstrass-mapping>

#proof[
  Let ${hat(e)_j (z')}_(j = 1, ..., k)$ be a basis of the local algebra
  $Q_(f(z', 0''), 0')$. According to Theorem~@th:division on division, for the
  mapping $P^0 = (P_1^0, ..., P_p^0)$ we can write the expansion
  $
    P^0 (z') = B(z) f(z) + C(z'') e(z'),
  $ <eq:p0-expansion>
  where $B$ and $C$ are $p times p$ and $p times k$ matrices, holomorphic in
  neighborhoods of the points $z = 0$ and $z'' = 0''$ respectively, and $e(z')$
  is the vector of the #source(129)components $e_j (z')$. Since the ideals
  $I_(0') (P^0)$ and $I_(0') (f(z', 0''))$ are equal (see @eq:ideals-equal), in
  @eq:p0-expansion the matrix $C(0'')$ is zero and
  $P^0 (z') = B(z', 0'') f(z', 0'')$. Again in view of the equality of these
  ideals, the matrix $B(z', 0'')$ is invertible in some neighborhood of the
  point $z' = 0'$, so the matrix $B(z)$ is invertible in a neighborhood of
  $z = 0$. Applying the matrix $A = B^(-1)$ to both sides of @eq:p0-expansion we
  obtain the required representation @eq:weierstrass-factorization, where
  $P(z) = P^0 (z') - C(z'') e(z')$ is a Weierstrass polynomial mapping.
]
