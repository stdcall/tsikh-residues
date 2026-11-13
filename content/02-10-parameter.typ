#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

== Local residues depending on a parameter <sec:parameter>

#subsection[Holomorphy of a local residue depending on a parameter]
<ss:holomorphy-parameter>
Let $X$ be a complex analytic manifold of dimension $n$, and
$F_1 (t), ..., F_n (t)$ be hypersurfaces (divisors) in $X$ that depend on a
parameter $t in G subset CC^m$ and when $t = t^0$ they have an isolated
intersection at a point
$z^0 in Z(t^0) = F_1 (t^0) inter dots.c inter F_n (t^0)$. We assume that each
$F_j (t)$ depends holomorphically on the parameter $t$, that is, in a
neighborhood of each point $a$ they admit a representation
$F_j (t) = {z in scr(U)_a: f_j (z, t) = 0}$, where the $f_j$ are holomorphic
functions in $scr(U)_a times G$. Consequently, any meromorphic form
$omega(z, t)$ with poles on $F_j (t)$ #source(68) can be represented locally as
$omega(z, t) = h(z, t) d z \/ f_1 (z, t) dots.c f_n (z, t)$, and we can define
the local residue
$
  r(t) = (2 pi i)^(-n) integral_(Gamma_(z^0)) omega(z, t),
$ <eq:parameter-residue>
where $Gamma_(z^0) = {z in scr(U)_(z^0): |f_j (z, t^0)| = epsilon_j,
  j = 1, ..., n}$.

By hypothesis the mapping $f(z, t^0) = (f_1 (z, t^0), ..., f_n (z, t^0))$ has an
isolated zero at the point $z^0$, so for $t$ close to $t^0$ the mapping
$f(z, t)$ does not have zeros on the boundary $partial scr(U)_(z^0)$.
Consequently, it has finitely many zeros ${z^((nu)) (t)}$ in $scr(U)_(z^0)$,
each tending to $z^0$ as $t -> t^0$. Let $k$ be the maximum number of such
distinct zeros. As a result, for the analytic set
$
  Z = {(F_1 (t) inter dots.c inter F_n (t), t)} subset X times G
$
and the neighborhood $scr(W) = scr(U)_(z^0) times scr(V)_(t^0)$ the projection
$pi: Z inter scr(W) -> scr(V)_(t^0)$ is a $k$-sheeted analytic covering (see
@ss:local-description).

We denote by $tilde(G) subset G$ the maximum domain over which the germ of the
analytic set $Z$ at the point $(z^0, t^0)$ can be extended as a $k$-sheeted
analytic covering.

#proposition[
  The analytic element $r(t)$ defined by the local residue @eq:parameter-residue
  can be extended holomorphically to the domain $tilde(G)$, generally speaking,
  in a many-valued way.
] <prop:residue-continuation>

#proof[
  Let $sigma subset tilde(G)$ be the discriminant set of the covering $pi$. We
  first show that $r$ can be extended holomorphically to
  $tilde(G) without sigma$. Consider a point $t' in tilde(G) without sigma$
  sufficiently close to $t^0$, so that all the points $z^((nu)) (t')$,
  $nu = 1, ..., k$, are distinct. We prove that
  $
    r(t') = sum_(nu = 1)^k res_(z^((nu)) (t')) omega(z, t').
  $ <eq:residue-sum-parameter>
  In fact, for $t'$ sufficiently close to $t^0$, the functions
  $g_j (z, t') := f_j (z, t') - f_j (z, t^0)$ on the cycle $Gamma_(z^0)$ satisfy
  the inequalities
  $
    |f_j (z, t^0)| > |g_j (z, t')|, wide j = 1, ..., n.
  $
  Therefore, by the "displaced distinguished boundary" lemma, for all
  sufficiently small $delta_j$ in the domain
  $scr(U)_(z^0) without {z: product_(j = 1)^n f_j (z, t') = 0}$ we have
  $
    Gamma_(z^0) ~ Gamma(t') := {z in scr(U)_(z^0): |f_j (z, t')| = delta_j,
      quad j = 1, ..., n}.
  $
  But for each fixed $t'$ the cycle $Gamma(t')$ for sufficiently small $delta_j$
  splits into the sum $sum_(nu = 1)^k Gamma_(z^((nu)) (t'))$, where
  $Gamma_(z^((nu)) (t'))$ is the cycle that takes part in the definition of the
  local residue $res_(z^((nu)) (t')) omega(z, t')$; hence
  @eq:residue-sum-parameter is established.

  #source(69)Each residue on the right-hand side of @eq:residue-sum-parameter is
  the value at the point $t = t'$ of the analytic element
  $
    r_nu (t) = (2 pi i)^(-n) integral_(Gamma_(z^((nu)) (t'))) omega(z, t),
  $
  where $t$ runs through a sufficiently small neighborhood of the point $t'$. We
  now prove that the analytic elements $r_nu (t)$, defined in a neighborhood of
  the point $t'$ ($t'$ belongs to $tilde(G) without sigma$ and is sufficiently
  close to $t^0$), can be extended holomorphically along any arc $gamma(s)$ in
  $tilde(G) without sigma$. In fact, from the definition of the discriminant set
  $sigma$ we have $k$ pairwise disjoint paths $z^((nu)) (gamma(s))$ in $X$.
  Arguing as before, we cover the support of the path $gamma(s)$ by finitely
  many neighborhoods $scr(V)_(t^1), ..., scr(V)_(t^N)$ (here
  $scr(V)_(t^1) = scr(V)_(t')$), in each of which
  $
    (2 pi i)^(-n) integral_(Gamma_(z^((nu)) (t^j))) omega(z, t)
    & = (2 pi i)^(-n) integral_(Gamma_(z^((nu)) (t))) omega(z, t) \
    & = res_(z^((nu)) (t)) omega(z, t), wide t in scr(V)_(t^j).
  $
  This is shown in exactly the same way as @eq:residue-sum-parameter, where it
  was taken into account that in a neighborhood of the points
  $(z^((nu)) (t^j), t^j) in Z$, the set $Z$ is a one-sheet covering over
  $scr(V)_(t^j)$. As a result we see that the family of analytic elements
  $
    (2 pi i)^(-n) integral_(Gamma_(z^((nu)) (t^j))) omega(z, t),
    wide t in scr(V)_(t^j), quad j = 1, ..., N,
  $
  defines an analytic continuation of the element $r$ along the path $gamma$.

  Thus we have proved that $r(t) = r_1 (t) + dots.c + r_k (t)$ for
  $t in tilde(G) without sigma$, where
  $r_nu (t) = res_(z^((nu)) (t)) omega(z, t)$. Now suppose that
  $hat(t) in sigma$ and that $(z^((nu)) (hat(t)), hat(t))$,
  $nu = 1, ..., r < k$, are distinct points on $Z$, projected into $hat(t)$.
  Then by the principle of continuity (see @ss:continuity-principle)
  $r(t) -> sum_(nu = 1)^r res_(z^((nu)) (hat(t))) omega(z, hat(t))$ as
  $t -> hat(t)$. But this implies that $r(t)$ is a locally bounded function on
  $tilde(G) without sigma$. By Riemann's theorem (see @bib:Gunning1965[p.~19])
  it can be extended holomorphically to $sigma$.
]

#subsection[Algebraicity of a local residue that depends on a parameter]
<ss:algebraicity-parameter>
Consider a local residue that depends on a parameter in the case when
$omega(z, t)$ is a rational form, that is, when
$h(z, t), f_1 (z, t), ..., f_n (z, t)$ are polynomials in the variables
$z in CC^n$, $t in CC^m$. As before, we assume that the mapping $f(z, t^0)$ has
an isolated zero at the point $z^0$.

#proposition[
  If $omega(z, t) = h(z, t) d z \/ f_1 (z, t) dots.c f_n (z, t)$ is a rational
  form, then the function $r(t)$ defined by the local residue
  @eq:parameter-residue in @ss:holomorphy-parameter[subsection] is algebraic.
] <prop:residue-algebraic>

#proof[
  Consider the mapping $tilde(f) (z, t, tau) = f(z, t) - tau$, where
  $tau = (tau_1, ..., tau_n) in CC^n$, and the rational form
  $tilde(omega) (z, t, tau)$ and local residue
  $
    tilde(r) (t, tau) = (2 pi i)^(-n) integral_(Gamma_(z^0))
    tilde(omega) (z, t, tau)
  $ <eq:perturbed-residue>
  #source(70)associated with this mapping; here the cycle $Gamma_(z^0)$ is the
  same as in @eq:parameter-residue of @ss:holomorphy-parameter[subsection], that
  is, it is defined by the mapping $tilde(f) (z, t, tau)$ with $t = t^0$,
  $tau = 0$. Since $tilde(r) (t, 0) = r(t)$, it is sufficient to prove that the
  function @eq:perturbed-residue is algebraic. Let $tau'$ be a noncritical value
  for the mapping $f(z, t^0)$. Then for all $t'$ sufficiently close to $t^0$ the
  mapping $tilde(f) (z, t', tau')$ has $mu$ simple zeros
  $z^((nu)) = z^((nu)) (t', tau')$, $nu = 1, ..., mu$ ($mu$ is the multiplicity
  of the zero $z^0$ of the mapping $f(z, t^0)$). From formula
  @eq:residue-sum-parameter of @ss:holomorphy-parameter[subsection]
  $
    tilde(r) (t', tau') = sum_(nu = 1)^mu res_(z^((nu)))
    tilde(omega) (z, t', tau').
  $ <eq:perturbed-residue-sum>
  By the Cauchy formula, each residue in @eq:perturbed-residue-sum is equal to
  the value of the fraction $h(z, t') \/ J(z, t', tau')$ at the point
  $z = z^((nu)) (t', tau')$, where $J = partial tilde(f) \/ partial z$ is the
  Jacobian of the mapping $tilde(f)$. We observe that each coordinate
  $z_j^((nu)) (t', tau')$ of the root $z^((nu))$ of the system of equations
  $tilde(f) = 0$ satisfies the algebraic equation $R_j (z_j, t', tau') = 0$
  ($R_j$ is the resultant of the system $tilde(f)$ obtained by excluding the
  variables $z_1, ..., [j], ..., z_n$). Thus, each term in
  @eq:perturbed-residue-sum is a rational function of $mu dot n$ algebraic
  functions $z_j^((nu)) (t', tau')$, $j = 1, ..., n$, $nu = 1, ..., mu$. Since
  the set of algebraic functions forms a field, $tilde(r)$ and $r$ are algebraic
  functions.
]
