#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

== An expression for a local residue in terms of the trace <sec:trace>

Here we give an algebraic interpretation of the local residue $res_a ""_f$ in
terms of the trace of a finite extension (connected with the mapping $f$) of the
field of germs of meromorphic functions at a point $a$.

#subsection[Geometric trace] <ss:geometric-trace>
Let $f: scr(U) -> G$ be a holomorphic mapping of the domains
$scr(U) subset CC_z^n$, $G subset CC_w^n$. We say that the mapping $f$ _has
finite type_ if for each $w in G$ the equation $f(z) = w$ has the same finite
number of roots, counted with multiplicities, in the domain $scr(U)$. We assume
that the holomorphic mapping $f: overline(scr(U)) -> CC_w^n$ does not vanish on
the boundary $partial scr(U)$, and the set of zeros $f^(-1) (0)$ is nonempty. We
set $G$ equal to a connected component of the point $0 in CC_w^n$ in the set
$CC_w^n without f(partial scr(U))$. In this case the mapping
$f: overline(scr(U)) -> G$ has finite type. In fact, since $G$ is connected, any
two points $w^((1)), w^((2)) in G$ can be joined by a continuous path
$gamma(t)$; according to Proposition~@prop:zeros-count in
@ss:geometric-multiplicity the number of roots of the equation $f = gamma(t)$ in
$scr(U)$ is determined by the integral
$integral_(partial scr(U)) beta(f - gamma(t))$; since it is continuous with
respect to $t$ and is equal to an integer, this integral is constant.

Let us define the important concept of the trace with respect to a holomorphic
mapping. Let $f: scr(U) -> G$ be a holomorphic mapping of finite type of the
domains $scr(U) subset CC_z^n$, $G subset CC_w^n$, and $H(z) = phi \/ psi$ be a
function meromorphic in $scr(U)$. The _trace_ of $H$ with respect to $f$ is the
function#notation-mark($Tr$, sort: "Tr")
$
  [Tr H](w) = sum_nu H(z^((nu)) (w)), wide
  w in G without f({psi = 0}),
$ <eq:trace>
#source(38)where the summation is carried out over all roots (counting
multiplicities) of the system of equations $f(z) = w$. We shall call the trace
defined in this way #index-mark("Trace", sub: "geometric")_geometric_ in
contrast to the algebraic trace, which will be considered below.

#proposition[
  The trace of a meromorphic (holomorphic) function $H$ is a meromorphic
  (holomorphic) function in $G$.
] <prop:trace-meromorphic>

#proof[
  _Case_ 1: $H$ is holomorphic in $scr(U)$. There is an elegant proof that the
  trace is holomorphic (see @bib:Griffiths1978a[p.~668]): one shows that the
  trace is a $dbar$-closed distribution, so from the regularity property of the
  operator $dbar$ it follows that the trace is holomorphic. We give another
  proof by using the Lemma of @ss:boundary-representation. Let $w^0$ be an
  arbitrary point in $G$ and $scr(B)_epsilon$ be the polydisk in $G$ with center
  at this point and radius $epsilon$. For brevity we shall assume that
  $w^0 = 0$. According to Proposition~@prop:multiplicity of
  @ss:geometric-multiplicity, for almost every point $w in scr(B)_epsilon$ all
  inverse images $z^((nu)) (w) in f^(-1) (w)$ are simple roots for the system
  $f = w$ (we denote the number of such roots by $mu$). We consider the family
  of disjoint neighborhoods $scr(U)_nu subset scr(U)$ of points $z^((nu)) (w)$
  and in each neighborhood $scr(U)_nu$ we choose a cycle
  $Gamma_nu = Gamma^delta (f - w)$, where $delta$ is sufficiently small (we
  recall that the cycle $Gamma^delta (f - w)$ is determined by the mapping
  $f - w$ in $scr(U)_nu$, that is, it consists of points $z in scr(U)_nu$ such
  that $|f_j (z) - w_j| = delta$ for all $j$ from 1 to $n$). By Cauchy's formula
  $
    [Tr H](w) = sum_(nu = 1)^mu (2 pi i)^(-n) integral_(Gamma_nu)
    frac(H d f, f - w).
  $ <eq:trace-cauchy>
  From the Lemma of @ss:boundary-representation it follows that in the domain of
  regularity of the integrand the sum of the cycles
  $Gamma_1 + dots.c + Gamma_mu$ is homologous to the cycle
  $Gamma = Gamma^epsilon (f)$ determined by the mapping $f$ in the domain
  $scr(U) supset f^(-1) (overline(scr(B))_epsilon)$. Consequently, by Stokes's
  formula
  $
    [Tr H](w) = (2 pi i)^(-n) integral_Gamma frac(H d f, f - w).
  $ <eq:trace-stokes>
  Here the integration is carried out over the compact cycle $Gamma$, which does
  not depend on $w$, in contrast to the integrals in @eq:trace-cauchy. The
  integrand is holomorphic with respect to $w$ and regular on
  $Gamma = Gamma^epsilon (f)$ for all $w in scr(B)_epsilon$. Hence it follows
  that $Tr H in scr(O) (scr(B)_epsilon)$. Since $w^0 in G$ is arbitrary, we
  obtain the assertion that the trace is holomorphic for a holomorphic function
  $H$.

  _Case_ 2: $H = phi \/ psi$ is meromorphic. From the definition of the trace,
  in the notation $z^((nu)) = z^((nu)) (w)$ we have
  $
    [Tr H](w) = sum_(nu = 1)^mu frac(phi(z^((nu))), psi(z^((nu))))
    = frac(
      sum_(nu = 1)^mu [phi(z^((nu))) product_(k != nu) psi(z^((k)))],
      product_(nu = 1)^mu psi(z^((nu)))
    )
    = frac(A(w), B(w)).
  $
  The fact that the numerator and denominator of the last fraction are
  holomorphic follows from Newton's formulas, according to which $B$ is a
  polynomial with respect to the power sums
  $psi^q (z^((1))) + dots.c + psi^q (z^((mu))) = Tr psi^q$, #source(39)
  $q = 0, 1, ..., mu$, and $A$ is a polynomial with respect to these power sums
  and sums of the form $Tr phi dot psi^q$ (see, for example,
  @bib:Tsikh1986[§4.1]). From Case 1, which has been proved, we conclude that
  $A$ and $B$ are holomorphic, which completes the proof.
]

We observe that when $w = 0$ formula @eq:trace-stokes becomes the logarithmic
residue formula. Let us state the corresponding assertion more completely.

#proposition(title: [#index-mark(
    "Formula",
    sub: "logarithmic residue",
    target: <prop:logarithmic-residue>,
  )the logarithmic residue formula])[
  If $f = (f_1, ..., f_n)$ is a holomorphic mapping in a domain
  $scr(U) subset CC^n$ and the polyhedron
  $Pi = {z in scr(U): |f_j (z)| < r_j, j = 1, ..., n}$ is relatively compact in
  $scr(U)$, then for any holomorphic function $phi$ in $overline(Pi)$ we have
  the formula
  $
    sum_(a in Z_f) mu_a (f) phi(a) = (2 pi i)^(-n) integral_Gamma
    phi frac(d f_1, f_1) and dots.c and frac(d f_n, f_n),
  $ <eq:logarithmic-residue>
  where $Z_f$ is the set of zeros of the mapping $f$ in the polyhedron $Pi$,
  $mu_a (f)$ is the multiplicity of the zero $a$ of the mapping $f$, and
  $Gamma = {z in scr(U): |f_j (z)| = r_j, j = 1, ..., n}$ is the distinguished
  boundary of $Pi$.
] <prop:logarithmic-residue>

#subsection[An expression for a local residue in terms of the trace]
<ss:residue-trace>
Sometimes the trace of a meromorphic function can be holomorphic. In the next
assertion we distinguish the class of such meromorphic functions.

#proposition[
  If the polydisk $scr(B)_epsilon relcomp G$, then the trace of the meromorphic
  function $H = h \/ J$ (where $h in scr(O) (scr(U))$ and $J$ is the Jacobian of
  the mapping $f$) admits the integral representation
  $
    [Tr h \/ J](w) = (2 pi i)^(-n) integral_(Gamma^epsilon (f))
    frac(h(z) d z, f(z) - w)
  $ <eq:trace-representation>
  in $scr(B)_epsilon$, and is therefore holomorphic in $scr(B)_epsilon$.
] <prop:trace-representation>

#proof[
  The proof repeats the argument in @ss:geometric-trace[subsection]:
  $
    [Tr h \/ J](w) & = sum_nu frac(h, J) (z^((nu)) (w))
                     = sum_nu (2 pi i)^(-n)
                     integral_(Gamma_(z_w^((nu)))) frac(h d z, f - w) \
                   & = (2 pi i)^(-n) integral_(Gamma^epsilon (f))
                     frac(h d z, f - w).
  $
]

Let us apply the proposition to the case when $scr(U) = scr(U)_a$ and
$f: scr(U)_a -> G$ is a holomorphic mapping with an isolated zero at the point
$a$; as a result we obtain the following theorem.

#theorem[
  A local residue is expressed in terms of the trace by the formula
  $
    res_a ""_f (h) = [Tr h \/ J](0),
  $ <eq:residue-trace>
  where $J$ is the Jacobian of the mapping $f$.
] <th:residue-trace>

#subsection[A formula for change of variables] <ss:change-of-variables>
#source(40)Taking account of Cauchy's formula, we can write formula
@eq:residue-trace in the previous theorem in the form
$
  (2 pi i)^(-n) integral_(Gamma^epsilon (f)) frac(h d f, J dot f)
  = (2 pi i)^(-n) integral_(Gamma^epsilon (w)) [Tr h \/ J dot f] d w,
$ <eq:residue-trace-integral>
since $[Tr h \/ J dot f](w) = w^(-I) [Tr h \/ J](w)$. Formula @eq:residue-trace
can easily be extended to arbitrary meromorphic functions. Namely, consider a
holomorphic mapping $f: scr(U) -> G$. Suppose that the polyhedron
$Pi = Pi^r (f) = {z in scr(U): |f_j (z)| < r_j, j = 1, ..., n} relcomp scr(U)$,
and $(r_1^2, ..., r_n^2)$ is a noncritical value of the mapping
$(|f_1|^2, ..., |f_n|^2): scr(U) -> RR_+^n$ (the last condition ensures the
smoothness of the cycle $Gamma^r (f)$, the distinguished boundary of the
polyhedron $Pi$).

#proposition[
  If the singular set of a meromorphic function $H$ does not intersect the
  distinguished boundary $Gamma^r (f)$, then the following formula for "change
  of variables" holds:
  $
    integral_(Gamma^r (f)) H(z) d f
    = integral_(Gamma^r (w)) [Tr H](w) d w.
  $ <eq:change-of-variables>
] <prop:change-of-variables>

#proof[
  The proposition follows from the definition of an integral over a manifold,
  the trace, and the fact that the restriction $f|_(Gamma^r (f))$ is a finite
  covering over the framework $Gamma^r (w) = {|w_j| = r_j, j = 1, ..., n}$. We
  observe that formula @eq:change-of-variables does not fit into the general
  formula for change of variables
  $integral_gamma f^\# (omega) = integral_(f_\# (gamma)) omega$ (see
  @ss:differential-forms). For although in our case
  $Gamma^r (w) = f_\# (Gamma^r (f))$, the form $H(z) d f$ is not equal to the
  form $f^\# (Tr H)$, generally speaking.
]

Formula @eq:change-of-variables is particularly effective when the trace
$[Tr H](w)$ is holomorphic in a neighborhood of the framework $Gamma^r (w)$ and
can therefore be expanded in a Laurent series; then the integral on the right is
equal to the coefficient of $w^(-I)$ in this series. We observe that formula
@eq:change-of-variables, which has been proved using the transcendental
definition of an integral, is the basis of the definition of a residue in
algebraic geometry. Namely, let $K$ be a finite extension of the ring $E$ of
Laurent series with finitely many negative monomials, that is, in $K$ there is a
finite set of elements $e_1, ..., e_mu$ such that each element $g in K$ is
naturally represented in the form $g = alpha_1 e_1 + dots.c + alpha_mu e_mu$,
$alpha_j in E$. Then for elements $g in K$ we set
$
  Res_K g := Res_E compose Tr_(K \/ E) g,
$
where $Res_E psi = c_(-I)$ for $psi = sum c_alpha w^alpha$, and $Tr_(K \/ E) g$
is the #index-mark("Trace", sub: "algebraic")_algebraic trace_ of the element
$g$ of the extension $K supset E$, which is defined as the trace (sum of
diagonal elements) of the matrix $norm(alpha_(i j))$ defined by the condition
$g e_k = alpha_(k 1) e_1 + dots.c + alpha_(k mu) e_mu$, $k = 1, ..., mu$ (see
@bib:Lomadze1981, @bib:Parshin1976, @bib:Tate1968).

When $n > 1$ the set of meromorphic functions of the form $h \/ J dot f$ that
occur on the left-hand side of @eq:residue-trace-integral (in the definition of
local residue) is not a #source(41) finite extension of the ring $E$. However,
as we shall show in @ss:bishop[subsection], this set lies in some finite
extension of the field of meromorphic functions, and the algebraic trace of
$h \/ J dot f$ in this extension coincides with the geometric trace from the
right-hand side of @eq:residue-trace-integral.

#subsection[The integral representation of Bishop and the extension
  $K supset scr(M)$] <ss:bishop>
#index-mark(
  "Integral representation",
  sub: "of Bishop",
  target: <ss:bishop>,
)The question concerns the integral representation of meromorphic functions of
the form $h \/ J$, where $h$ is a holomorphic function, and $J = J_f$ is the
Jacobian of a mapping $f: scr(U) -> G$ of finite type. For this we observe that
if we put $w = f(zeta)$ in formula @eq:trace-representation of
@ss:residue-trace[subsection], then the integral on the right gives the value of
$h \/ J$ at the point $z = zeta$ plus the sum of its values in the inverse
images $zeta^((nu)) = zeta^((nu)) (f(zeta)) in f^(-1) (f(zeta))$,
$nu = 2, ..., mu$, of the point $w = f(zeta)$. To annihilate the summation at
these $mu - 1$ points, we introduce into the integrand of formula
@eq:trace-representation in @ss:residue-trace[subsection] the nonidentically
zero weight $B(zeta, z)$, which has the following property for any fixed $zeta$
from the polyhedron
$Pi = {z in scr(U): |f_j (z)| < r_j, j = 1, ..., n} relcomp scr(U)$ the function
$B(zeta, z)$ is equal to zero at all points $z in f^(-1) (f(zeta))$ not equal to
$zeta$. Since the analytic set ${(zeta, z) in Pi times Pi: f(z) = f(zeta)}$
contains the set ${zeta = z}$ as an irreducible component, such a function
exists. Let us describe its construction. Let $w^((0))$ be a noncritical value
of the mapping $f$, and $psi(z)$ be a function holomorphic in $overline(Pi)$ for
which all values $psi(z^((nu)) (w^((0))))$ are distinct (for $psi$ we can take a
linear function, for example). We define the function
$
  B(zeta, z) = {product_(nu = 2)^mu [psi(z^((nu))) - psi(zeta)]}
  {product_(k >= 1, s > 1 \ k != s) [psi(z^((k))) - psi(z^((s)))]},
$ <eq:bishop-weight>
where we assume that the numbering of the inverse images
$z^((nu)) = z^((nu)) (f(z))$ is such that $z^((1)) = z$. Since the "shortened"
power sums $[psi(z^((2)) (f(z)))]^k + dots.c + [psi(z^((mu)) (f(z)))]^k$ differ
from the complete power sums by holomorphic term $[psi(z)]^k$, they are
holomorphic. Hence the expression in the first braces in @eq:bishop-weight is a
polynomial in $psi(zeta)$, whose coefficients depend holomorphically on $z$. The
expression in the second braces is obtained by multiplying the expression in the
first braces at $zeta = z$ by a symmetric function with respect to the variables
$psi(z^((nu)) (f(z)))$, $nu = 2, ..., mu$. It is holomorphic in $z$.
Interchanging the variables $zeta$ and $z$, we arrive at the expression
$
  B(z, zeta) = c_0 (zeta) psi^0 (z) + c_1 (zeta) psi^1 (z) + dots.c
  + c_(mu - 1) (zeta) psi^(mu - 1) (z),
$ <eq:bishop-weight-expansion>
where the $c_k (zeta)$ are holomorphic in $overline(Pi)$. Since
$B(z, zeta^((nu)) (f(z))) = 0$ for $zeta^((nu)) (f(z)) != z$ by construction, we
have from formula @eq:trace-representation of @ss:residue-trace[subsection] the
following theorem.

#theorem[
  At each point $z in Pi$ at which the Jacobian $J$ of the mapping $f$ is
  nonzero, for the meromorphic function $h \/ J$, $h in scr(O) (overline(Pi))$,
  we have the #source(42) integral formula
  $
    frac(h(z), J(z)) B(z, z) = (2 pi i)^(-n) integral_Gamma
    frac(h(zeta) B(z, zeta) d zeta, f(zeta) - f(z)),
  $ <eq:bishop>
  where $Gamma$ is the distinguished boundary of $Pi$.
] <th:bishop>

Since
$
  B(z, z) & = product_(k, s >= 1 \ k != s)
            [psi(z^((k)) (f(z))) - psi(z^((s)) (f(z)))] \
          & = product_(k, s >= 1 \ k != s)
            [psi(z^((k)) (w)) - psi(z^((s)) (w))]|_(w = f(z)),
$
that is, $B(z, z) = b(f(z))$, where $b(w)$ is holomorphic in the polydisk
$scr(B)_r = {w: |w_j| < r_j, j = 1, ..., n}$, from @eq:bishop-weight-expansion
and @eq:bishop we obtain
$
  h(z) \/ J(z) = c_0 (w) psi^0 (z) + dots.c + c_(mu - 1) (w) psi^(mu - 1) (z),
  wide w = f(z),
$ <eq:bishop-expansion>
where $c_k (w)$ are meromorphic in $scr(B)_r$. We thus arrive at the following
assertion.

#proposition[
  The family of meromorphic functions ${h \/ J, h in scr(O) (overline(Pi))}$
  lies in the finite extension $K$ of the field of meromorphic functions
  $scr(M) = scr(M) (scr(B)_r)$ generated by the basis
  ${psi^0 (z) equiv 1, psi^1 (z), ..., psi^(mu - 1) (z)}$.
] <prop:finite-extension>

To conclude this subsection we prove the following proposition.

#proposition[
  The trace of the meromorphic function $H = h \/ J$, defined geometrically in
  @ss:geometric-trace[subsection], coincides with the algebraic trace
  $Tr_(K \/ scr(M)) H$ of the element $H in K$.
] <prop:algebraic-trace>

#proof[
  By definition, the trace $Tr_(K \/ scr(M)) H$ is equal to the sum of diagonal
  elements of the matrix $A = norm(c_(k j) (w))$, defined from the equalities
  $
    H psi^k = c_(k 0) (w) psi^0 (z) + dots.c
    + c_(k, mu - 1) (w) psi^(mu - 1) (z), wide k = 0, 1, ..., mu - 1.
  $
  This system of equalities holds for any $z in Pi$ and $w = f(z)$. We write it
  as a system of homogeneous linear equations $(A(w) - H(z) E) psi(z) = 0$,
  $w = f(z)$, where $E$ is the unit matrix and $psi$ is the column vector with
  coordinates $psi^k$. Since the system has nontrivial solutions
  $psi(z^((nu)) (w))$, $nu = 1, ..., mu$, for almost all $w in scr(B)_r$, the
  determinants of the matrices $norm(A(w) - H(z^((nu)) (w)) E)$ are equal to
  zero for all $nu = 1, ..., mu$. Consequently, $H(z^((nu)) (w))$ are
  characteristic roots of the matrix $A(w)$, so
  $sum H(z^((nu)) (w)) = Tr A = Tr_(K \/ scr(M)) H$, as required.
]
