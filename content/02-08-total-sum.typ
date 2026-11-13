#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

#heading(level: 2)[The total sum of local residues \ with respect to a
  polynomial mapping in $CC^n$]
<sec:total-sum>

Let us consider in more detail the case when $f: CC^n -> CC^n$ is a polynomial
mapping with a discrete set of zeros $Z = f^(-1) (0)$. For a polynomial
$h in CC[z] = CC[z_1, ..., z_n]$ we define the total sum of residues with
respect to $f$ (#index-mark("Residue", sub: "global")_global
residue_)#notation-mark($Res_f (h)$, sort: "R")
$
  Res_f (h) = sum_(a in Z) res_a ""_f (h).
$

#remark[
  If $h = phi J_f$ (here $J_f$ is the Jacobian of the mapping $f$), then
  according to Proposition~@prop:logarithmic-residue of @ss:geometric-trace the
  total sum of the residues is equal to the sum of the values of $phi$ over all
  zeros (counted with multiplicities) of the mapping $f$. If we put successively
  $phi = 1$, $phi = z_1$, $phi = z_1^2, ...,$ then the results of calculating
  the total sum of the residues give power sums for the first coordinates of the
  roots of $f$ and thus enable us to exclude from the system of equations
  $f = 0$ all unknowns apart from $z_1$ (see @bib:Aizenberg1977,
  @bib:Aizenberg1985 for more details).
] <rem:power-sums>

If the mapping $f$ is proper, then for any $epsilon > 0$ the global chain
$Gamma^epsilon (f) = {z in CC^n: |f_j (z)| = epsilon, j = 1, ..., n}$ is a
compact cycle. In addition, for small $epsilon$ it splits into a sum
$sum (Gamma_a^epsilon (f): a in Z)$ of local cycles in neighborhoods of the
zeros $a$ of the mapping $f$. Consequently, for proper mappings $f$ the global
residue is a single integral:
$
  Res_f (h) = (2 pi i)^(-n) integral_(Gamma^r (f)) frac(h d z, f_1 dots.c f_n),
$
where $r$ is any positive number, because the cycles $Gamma^r (f)$ and
$Gamma^epsilon (f)$ are homotopic in the domain of regularity of the integrand
(the homotopy between these cycles is realized by the family
${Gamma^(t epsilon + (1 - t) r) (f)}_(t in [0, 1])$).

We show that for a global residue, as for a local residue, the transformation
formula and duality hold. We shall give an algorithm for calculating a global
residue, based on the theory of exclusion (theory of resultants) and the formula
for calculating $Res_f$ for one class of proper mappings $f$. This formula will
be obtained on the basis of Rouché's principle for local residue, which we now
present.

#subsection[Rouché's principle for local residues] <ss:rouche-residues>
#index-mark(
  "Principle",
  sub: "of Rouché",
  target: <ss:rouche-residues>,
)Rouché's principle, which is generally accepted in the literature (see
@ss:geometric-multiplicity), compares the number of zeros of the mappings $f$
and $f + g$. Here we give the corresponding assertion about integrals over
contours $Gamma(f)$ and $Gamma(f + g)$. For this we prove the following
assertion, which generalizes the lemma of @ss:boundary-representation.

#lemma(title: [#index-mark(
    "Lemma on displaced distinguished boundary",
    target: <lem:displaced-boundary>,
  )on a "displaced" distinguished boundary])[
  #source(51)Let $f, g: scr(U) -> CC^n$ be holomorphic mappings of a domain
  $scr(U) subset CC^n$, where the polyhedron
  $Pi = Pi^r (f) = {z in scr(U): |f_j (z)| < r_j, j = 1, ..., n}$ is relatively
  compact in $scr(U)$. If the inequalities
  $
    |g_j (z)| < |f_j (z)|, wide j = 1, ..., n,
  $ <eq:displaced-inequalities>
  are satisfied on the distinguished boundary $Gamma = Gamma^r (f)$ of the
  polyhedron $Pi$, then there is a number $delta_0 > 0$ such that for all
  $delta in (0, delta_0)$ the distinguished boundaries $Gamma^r (f)$ and
  $Gamma^delta (f + g) = {z in Pi: |f_j + g_j| = delta, j = 1, ..., n}$ are
  homologous in
  $scr(U)_* = scr(U) without {z: (f_1 + g_1) dots.c (f_n + g_n) = 0}$.
] <lem:displaced-boundary>

#proof[
  We use the well-known fact that a holomorphic function in a closed polyhedron
  $overline(Pi)$ reaches its maximum absolute value on the distinguished
  boundary $Gamma$.

  We observe that this follows from Weil's integral representation (here it is
  relevant to say that the proof of Weil's formula (see @ss:weil-representation)
  uses only the transformation formula for a local residue and the assertion of
  the lemma in @ss:boundary-representation). In fact, for
  $phi in scr(O) (overline(Pi))$ we have
  $phi^m (z) = integral_Gamma phi^m (zeta) W(zeta, z) d zeta$, where $W$ is the
  corresponding kernel, and $m in NN$. Consequently,
  $|phi(z)|^m <= (sup_Gamma |phi(zeta)|^m)
  integral_Gamma |W(zeta, z)| |d zeta|$. Extracting the $m$th root and
  proceeding to the limit as $m -> infinity$, we obtain the required result
  $norm(phi)_Pi <= sup_Gamma |phi|$.

  We put $rho_j = max_(overline(Pi)) |g_j|$ and
  $delta_0 = min_(1 <= j <= n) {r_j - rho_j}$. From the conditions
  @eq:displaced-inequalities and the maximum modulus principle just proved, it
  follows that $delta_0 > 0$. For any $delta in (0, delta_0)$ we consider the
  family of $n$-chains
  $
    gamma_p = {z in overline(Pi): |f_j (z) + g_j (z)| = delta,
    quad j = 1, ..., p;                       & \
    |f_k (z)| = r_k, quad k = p + 1, ..., n}. &
  $
  We observe that $gamma_0 = Gamma^r (f)$, $gamma_n = Gamma^delta (f + g)$. We
  show that we can carry out the necessary homology $gamma_0 ~ gamma_n$ by means
  of the chain $gamma_0 ~ gamma_1 ~ dots.c ~ gamma_n$. For this we introduce the
  following $(n + 1)$-chains $tilde(c)_p$, consisting of points $z in scr(U)$
  for which
  $
    |f_j (z) + g_j (z)| = delta, quad j = 1, ..., p - 1, quad
    |f_p (z) + g_p (z)| >= delta, \
    |f_p (z)| <= r_p, quad |f_k (z)| = r_k, quad k = p + 1, ..., n.
  $ <eq:chain-conditions>
  We first prove that for all sufficiently small $epsilon > 0$ the intersections
  $|tilde(c)_p| inter Pi^(r + epsilon) (f)$ are compact in
  $Pi^(r + epsilon) (f)$ (in other words, the supports of the chains
  $tilde(c)_p$ do not contain "twigs" that adjoin $overline(Pi)$ from the
  outside). Let us assume the opposite, that is, there is a sequence of points
  ${a_m} subset |tilde(c)_p| without overline(Pi)$ with limit point
  $a in |tilde(c)_p| inter partial Pi$. This means, on the one hand, that
  $|f_j (a_m)| > r_j$ for some $j$ from 1 to $n$; from @eq:chain-conditions it
  follows that $1 <= j <= p - 1$. On the other hand,
  $|g_j (a_m)| <= rho_j + epsilon_m$, where $epsilon_m -> 0$ as $m -> infinity$.
  Hence $|f_j (a) + g_j (a)| >= |f_j (a)| - |g_j (a)| >= r_j - rho_j > delta$,
  which contradicts the relation $a in |tilde(c)_p|$.

  #source(52)Now let $c_p$ be the $(n + 1)$-chain in $overline(Pi)$ consisting
  of all points $z$ satisfying @eq:chain-conditions, that is,
  $c_p = tilde(c)_p inter overline(Pi)$. From what we have proved it follows
  that to obtain the boundary $partial c_p$ we need to replace one of the
  inequalities in its analytic representation @eq:chain-conditions in turn by an
  equality (we must take into account that in both cases the remaining
  inequalities are consequences of the other equalities and the condition
  $z in overline(Pi)$) and add the resulting chains with the corresponding signs
  (see @ss:semianalytic-orientation). As a result we obtain
  $partial c_p = gamma_(p - 1) - gamma_p$, and this completes the proof of the
  lemma.
]

From Stokes's formula, the lemma we have proved gives the following result.

#proposition(title: [Rouché's principle for residues])[
  Under the conditions of the lemma on a "displaced" framework
  $
    (2 pi i)^(-n) integral_(Gamma^r (f)) omega
    = (2 pi i)^(-n) integral_(Gamma^delta (f + g)) omega
    = sum_(a in Z_(f + g)) res_a omega,
  $
  where $omega = h d z \/ (f_1 + g_1) dots.c (f_n + g_n)$, and $Z_(f + g)$ is
  the set of zeros of the mapping $f + g$ in the polyhedron $Pi$.
] <prop:rouche-residues>

We note that this assertion can be very fruitfully applied to the derivation of
the Lagrange expansion for implicit functions of several variables
@bib:Aizenberg1979b, @bib:Yuzhakov1975a, and also to the calculation of
combinatorial sums @bib:Egorychev1977.

#subsection[On the calculation of a global residue by expansion in a Laurent
  series] <ss:laurent-expansion>
Let us apply Rouché's principle for residues to the calculation of the total sum
of residues with respect to a mapping $psi = (psi_1, ..., psi_n)$ with
components of the form
$
  psi_i (z) = z_i^(k_i) + sum_(j = 1)^(i - 1) z_j phi_(i j) (z) + Q_i (z),
  wide i = 1, ..., n,
$ <eq:special-mapping>
where the $phi_(i j)$ are homogeneous polynomials of degree $k_i - 1$, and the
$Q_i$ are polynomials of degree not greater than $k_i - 1$. Let $frak(R) (dot)$
denote the residue of the Laurent series $(dot)$, that is, the coefficient of
$z^(-I) = z_1^(-1) dots.c z_n^(-1)$.

#proposition[
  For any polynomial $h$ the total sum of the residues with respect to a
  polynomial mapping $psi$ with components of the form @eq:special-mapping is
  expressed by the formula
  $
    Res_psi (h) = frak(R) [sum_(abs(alpha) <= m) (-1)^(abs(alpha))
      frac(h s^alpha, z_1^((alpha_1 + 1) k_1) dots.c z_n^((alpha_n + 1) k_n))],
  $ <eq:laurent-formula>
  where $s = (s_1, ..., s_n)$, $s_i = psi_i - z_i^(k_i)$, and the limit of the
  summation $|alpha| <= m$ depends on the degree of the polynomial $h$ and
  $k = (k_1, ..., k_n)$.#ed-note[In the 1992 edition the denominator here, in
    the series of the proof and in formula @eq:global-residue-formula of
    @ss:global-transformation is $z^(alpha + k)$, and in the formula after
    Macaulay's theorem $z^(alpha + rho)$; for $n = 1$, $psi = z^2 + c$,
    $h = z^3$ that formula gives $c^2$ instead of $Res_psi (h) = -c$. The
    expansion
    $1 \/ (z_i^(k_i) + s_i)
    = sum_(alpha_i >= 0) (-s_i)^(alpha_i) \/ z_i^((alpha_i + 1) k_i)$
    gives the denominators above, as in Aizenberg and Yuzhakov
    @bib:Aizenberg1983c, Theorem~21.4.]
] <prop:laurent-formula>

#remark[
  Of course, from symmetry arguments, instead of a mapping of the form in
  @eq:special-mapping it is more natural to consider a mapping of the form
  #source(53)$psi_i = z_i^(k_i) + Q_i$, which corresponds to the case
  $phi_(i j) equiv 0$. Our choice of mapping $psi$ is explained by the fact that
  by means of the transformation formula and the theory of exclusion we reduce
  the calculation of a global residue with respect to an arbitrary mapping with
  a discrete set of zeros to the case of mappings of the form
  @eq:special-mapping.
] <rem:symmetric-form>

#proof[
  It is not difficult to verify that a mapping $psi$ of the form
  @eq:special-mapping is proper, so
  $
    Res_psi (h) = (2 pi i)^(-n) integral_(Gamma^delta (psi))
    h d z \/ psi_1 dots.c psi_n,
  $
  where $Gamma^delta (psi)$ is globally defined in $CC^n$ by the mapping $psi$,
  and $delta$ is any positive number. We consider the polydisk
  $Pi^r = {z: |z_j| < r_j, j = 1, ..., n}$ and show that the radii $r_j$ can be
  chosen so that all of the roots of $psi$ are in $Pi^r$ and on the
  distinguished boundary $Gamma^r$ of this polydisk we have
  $
    |z_i|^(k_i) > |s_i (z)|, wide i = 1, ..., n.
  $ <eq:dominant-inequalities>
  For we first choose the $r_j$ so that on $Gamma^r$ we have
  $|z_i^(k_i)| > |sum_(j = 1)^(i - 1) z_j phi_(i j) (z)|$, $i = 1, ..., n$ (for
  this we can fix $r_n$ and choose $r_1, ..., r_(n - 1)$ so that the inequality
  is satisfied when $i = n$; next we decrease $r_1, ..., r_(n - 2)$ so that the
  inequality is satisfied when $i = n - 1$, and so on). Now by proportional
  dilatation of the constructed vector $(r_1, ..., r_n)$, in view of the fact
  that $deg Q_i <= k_i - 1$, we can arrange that @eq:dominant-inequalities is
  satisfied. Clearly, for sufficiently large $r_j$ all of the roots of the
  mapping $psi$ lie in $Pi^r$. According to Rouché's principle for local
  residues, applied to the mappings $f = (z_1^(k_1), ..., z_n^(k_n))$,
  $g = (s_1, ..., s_n)$, we obtain
  $
    Res_psi (h) = (2 pi i)^(-n) integral_(Gamma^r)
    frac(h d z, (z_1^(k_1) + s_1) dots.c (z_n^(k_n) + s_n)).
  $
  Decomposing the integrand into a multiple geometric progression
  $
    sum_(abs(alpha) >= 0) (-1)^(abs(alpha)) h s^alpha \/
    z_1^((alpha_1 + 1) k_1) dots.c z_n^((alpha_n + 1) k_n),
  $
  which converges uniformly on $Gamma$ in view of @eq:dominant-inequalities, we
  obtain @eq:laurent-formula with summation over the infinite interval
  $|alpha| >= 0$. It is not difficult to verify that, taking account of the
  specific form of the $s_j$, we can cut off the sum (we do not dwell on this).
]

#subsection[A transformation formula for the global residue and an algorithm for
  calculation] <ss:global-transformation>
Suppose that polynomial mappings $f, g: CC^n -> CC^n$ are connected by the
relation $g = A f$, where $A$ is a polynomial matrix.

#proposition[
  If the set of zeros $Z_g$ of the mapping $g$ is discrete, then for any
  polynomial $h$
  $
    Res_f (h) = Res_g (h det A).
  $
] <prop:global-transformation>

#proof[
  The proposition follows from the definition of the global residue $Res$, the
  transformation formula for a local residue, and the Lemma of
  @ss:transformation-formula.
]

#source(54)This proposition enables us to find a formula for computing $Res_f$
with respect to any system of functions $f = (f_1, ..., f_n)$ that does not have
zeros at infinity in the projective space $PP_n$. Such systems have the form
$
  f_j = P_j + Q_j, wide j = 1, ..., n,
$
where $P_j$ is a homogeneous polynomial of highest degree (suppose that
$deg f_j = deg P_j = k_j$), $Q_j$ is a polynomial of degree $< k_j$, and the
system of homogeneous polynomials $P = (P_1, ..., P_n)$ has an isolated zero at
the origin. By Macaulay's theorem (see @ss:macaulay), the monomials $z_i^rho$
belong to the ideal $I(P)$, that is, $z_i^rho = sum_(j = 1)^n a_(i j) (z) P_j$,
$i = 1, ..., n$, where $rho = k_1 + dots.c + k_n - n + 1$, and the $a_(i j) (z)$
are homogeneous polynomials of degree $rho - k_j$. Let $A = norm(a_(i j))$.
Clearly, the system $psi = A f$ has the form $psi_i = z_i^rho + s_i$, that is,
the form @eq:special-mapping in @ss:laurent-expansion[subsection]. Therefore by
formula @eq:laurent-formula of @ss:laurent-expansion[subsection]
$
  Res_f (h) = Res_psi (h det A)
  = frak(R) [sum_(abs(alpha) <= m) (-1)^(abs(alpha))
    frac(
      (h det A)(A Q)^alpha, z_1^(rho (alpha_1 + 1)) dots.c
      z_n^(rho (alpha_n + 1))
    )].
$
#new-par
We now give an algorithm for calculating the global residue with respect to an
arbitrary polynomial mapping $f$ that relies on the transformation formula and
formula @eq:laurent-formula of @ss:laurent-expansion[subsection] for a mapping
of a special kind. Let us choose a coordinate system in $CC^n$ so that in the
polynomial $f_1$ the coefficient of the highest degree in the variable $z_n$ is
equal to one. Consider the Sylvester resultant of the polynomials $f_1$ and
$u_2 f_2 + dots.c + u_n f_n$ with respect to $z_n$:
$
  R(f_1, sum_(j = 2)^n u_j f_j) =: R_1 (' z, u),
$ <eq:resultant>
where $' z = (z_1, ..., z_(n - 1))$, $u = (u_2, ..., u_n)$. By a well-known rule
(see @bib:VanDerWaerden1971[p.~85]) there are polynomials $A(z, u)$, $B(z, u)$
such that
$
  R_1 (' z, u) = A(z, u) f_1 (z) + B(z, u) sum_(j = 2)^n u_j f_j (z).
$ <eq:resultant-relation>
Picking out the coefficients of monomials in $u$ in @eq:resultant and
@eq:resultant-relation, we obtain the system of resultants
$
  R_(1 q) (' z), wide q = 1, ..., s_1,
$ <eq:resultant-system>
and the system of relations
$
  R_(1, q) (' z) = sum_(nu = 1)^n A_(1, q, nu) (z) f_nu (z),
  wide q = 1, ..., s_1.
$
The system @eq:resultant-system has a discrete set of zeros, which is the
projection $Z_f$ on the space $CC^(n - 1)$ of variables $' z$. Consequently, the
system $f_1 (z), R_(11), ..., R_(1 s_1)$ #source(55)also has a discrete set of
zeros in $CC^n$. Applying the previous argument with resultants to the system
@eq:resultant-system and repeating the process, we obtain the totality of
systems of resultants
$
  {R_(j, q) (""^((j)) z) = R_(j, q) (z_1, ..., z_(n - j))}_(q = 1, ..., s_j),
  wide j = 1, ..., n - 1,
$
each of which has a discrete set of zeros, and the systems of relations
$
  R_(j, q) (""^((j)) z) = sum_(nu = 1)^n A_(j, q, nu) (z) f_nu (z),
  wide q = 1, ..., s_j.
$ <eq:resultant-relations>
We put $g = (g_1, ..., g_n)$, $g_j (z) = R_(n - j, 1) (z_1, ..., z_j)$,
$j = 1, ..., n - 1$, $g_n = f_1 (z)$. Obviously the mapping $g$ has a discrete
set of zeros and is connected with $f$ by the relations
$
  g_j (z) = sum_(nu = 1)^n A_(n - j, 1, nu) (z) f_nu (z), wide
  A_(0, 1, nu) = delta_(1 nu) = cases(1\, quad & nu = 1\,, 0\, & nu != 1.)
$
By the proposition we have just proved,
$
  Res_f (h) = Res_g (h dot det norm(A_(n - j, 1, nu))).
$ <eq:global-transformation-applied>
Since at each step the coordinate system $z_1, ..., z_(n - j)$ in $CC^(n - j)$
has been chosen so that in $R_(j, 1)$ the coefficient of the highest power of
$z_(n - j)$ is equal to 1, the function $g_j$ has the form
$g_j = z_j^(k_j) + s_j (z_1, ..., z_j)$, where $deg s_j <= k_j$,
$deg_(z_j) s_j < k_j$, that is, the form @eq:special-mapping of
@ss:laurent-expansion[subsection]. Therefore, taking account of
@eq:global-transformation-applied and formula @eq:laurent-formula of
@ss:laurent-expansion[subsection] we obtain
$
  Res_f (h) = frak(R) [sum_(abs(alpha) <= m) (-1)^(abs(alpha))
    h det norm(A_(n - j, 1, nu))
    frac(s^alpha, z_1^((alpha_1 + 1) k_1) dots.c z_n^((alpha_n + 1) k_n))].
$ <eq:global-residue-formula>
#new-par
To find the resultants and the relations @eq:resultant-relations we use only
rational operations, so we arrive at the following assertion.

#theorem[
  The total sum of the residues $Res_f (h)$ of the polynomial $h$ with respect
  to a polynomial mapping $f = (f_1, ..., f_n)$ with a discrete set of zeros in
  $CC^n$ is calculated by formula @eq:global-residue-formula and depends
  rationally on the coefficients of the polynomials $h$ and $f_j$.
] <th:global-residue-rational>

#subsection[Global duality] <ss:global-duality>
#index-mark(
  "Duality",
  sub: "global",
  target: <ss:global-duality>,
)Let $I(f)$ denote an ideal in the ring of polynomials
$CC[z] = CC[z_1, ..., z_n]$ that is generated by a system of polynomials
$f = (f_1, ..., f_n)$ with a discrete set of zeros $Z_f$, and let $I_a (f)$ be a
similar ideal in the ring $scr(O)_a$ of germs of functions holomorphic at the
point $a$. The duality theorem for the local residue $res ""_f$ (see
@ss:local-duality) extends to the total sum of residues as follows.

#proposition[
  #source(56)The polynomial $h$ belongs to the ideal $I(f)$ if and only if
  $Res_f (h dot g) = 0$ for any $g in CC[z]$.
] <prop:global-duality>

#proof[
  Necessity follows from the definition of $Res$ as the sum of local residues
  and the proposition of @ss:integral-definition. For the proof of sufficiency
  we use the theorem of Lasker and Noether, according to which $h in I(f)$ if
  $h in I_a (f)$ for each $a in Z_f$ (see @ss:ideals). Consequently, by the
  local duality theorem the question reduces to verifying at each point
  $a in Z_f$ the condition
  $
    res_a ""_f (h dot g) = 0, wide g in scr(O)_a.
  $ <eq:local-condition>
  In order to prove @eq:local-condition, for each point $a in Z_f$ we construct
  a polynomial $P_a (z)$ such that $P_a (a) != 0$, $P_a in I_b (f)$ for all
  $b in Z_f without {a}$ (the existence of such polynomials can be justified by
  means of a local variant of Hilbert's theorem on roots (see
  @ss:local-nullstellensatz)). Let us choose initial intervals $P_(a *)^(-1)$
  and $g_*$ of the Taylor series at the point $a$ of the functions $P_a^(-1)$
  and $g$ so that $P_a^(-1) - P_(a *)^(-1) in I_a (f)$, $g - g_* in I_a (f)$
  (this can be done again according to @ss:local-nullstellensatz). As a result
  we have
  $
    res_a ""_f (h dot g) = res_a ""_f (h dot g dot P_a^(-1) dot P_a)
    = res_a ""_f (h dot g_* dot P_(a *)^(-1) dot P_a).
  $
  Since $P_a in I_b (f)$ for $b != a$, for such $b$ we have
  $res_b ""_f (h dot g_* P_(a *)^(-1) P_a) = 0$. Consequently, the global
  residue $Res_f (h dot g_* P_(a *)^(-1) P_a)$ is equal to the local residue
  $res_a ""_f (h dot g)$, from which according to the condition of the
  proposition we obtain @eq:local-condition.
]

#remark[
  We can consider the total sum of the residues $Res$ with respect to any
  mapping $f: X -> CC^n$ of an $n$-dimensional manifold $X$ for which
  $Z_f = f^(-1) (0)$ is finite. In the case when $X$ is a Stein manifold, for
  $f$ we have an analog of the theorem of Lasker and Noether, which makes up the
  content of Cartan's theorem (see @bib:Hormander1966): if for $h in scr(O) (X)$
  at each point $a in Z_f$ we have $h in I_a (f)$, then $h in I(f)$, where
  $I(f)$ is the ideal in the ring $scr(O) (X)$ generated by the mapping $f$.
  Therefore the proof of the proposition leads us to the following assertion:
  _let $X$ be a Stein manifold of dimension $n$ and $f: X -> CC^n$ be a
  holomorphic mapping for which $Z_f$ is finite; if for a function
  $h in scr(O) (X)$ the global residue $Res_f (h dot g)$ is equal to zero for
  all $g in scr(O) (X)$, then $h in I(f)$._
] <rem:stein-duality>
