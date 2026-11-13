#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

== Statements of the main facts <sec:main-facts>

#subsection[Definitions] <ss:residual-definitions>
Consider a complex analytic manifold $X$ and in it a complex analytic subset $W$
of pure dimension $n$. We do not exclude cases when $W = X$.

We observe that with a view to complete generality we should consider $W$ to be
an analytic space, and then the requirement that $W$ is embedded in a manifold
would be eliminated. However, in this case it would be necessary to define the
concepts of a differential form and a current on an analytic space. By
differential forms on an analytic set $W subset X$ we shall mean the
restrictions of forms of $X$, and currents will be considered only on the
ambient manifold $X$. By a holomorphic mapping $f: W -> CC^p$ we shall
understand the restriction of a mapping $f = (f_1, ..., f_p)$ that is
holomorphic on the whole of $X$.

We partition the set ${1, ..., p}$ into two disjoint subsets $I$ and $J$, and
for any vector $epsilon = (epsilon_1, ..., epsilon_p) in RR_>^p$ we consider the
following semianalytic chain (#index-mark("Tube")_tube_):
$
  T_(I, J)^epsilon = T_(I, J)^epsilon (f)
  = {x in W: |f_i (x)| = epsilon_i, i in I, |f_j (x)| > epsilon_j, j in J}.
$
We admit variants when one of the sets $I$ or $J$ is empty, and we also define
$T_(emptyset, emptyset)^epsilon = W$. We specify the orientation of the tube
$T_(I, J)^epsilon$ in accordance with the description in
@ss:semianalytic-orientation.

An #index-mark("Path", sub: "admissible")_admissible path_ in $RR_>^p$ is any
continuous mapping $epsilon = epsilon(delta): [0, 1] -> RR_>^p$ such that
$epsilon_p (delta) -> 0$ as $delta -> 0$ and for any $j in {1, ..., p - 1}$ and
$q in NN$
$
  lim_(delta -> 0) (epsilon_j \/ epsilon_(j + 1)^q)(delta) = 0.
$
Clearly, for any admissible path $epsilon$ and any real numbers $nu_j$, not all
zero, the limit
$
  lim_(delta -> 0) product_(j = 1)^p epsilon_j^(nu_j) (delta)
$
is equal to zero or infinity. Moreover, if $nu_j > 0$, then the paths $epsilon$
and $(epsilon_1^(nu_1), ..., epsilon_p^(nu_p))$ are simultaneously admissible.

We sometimes denote the tube $T_(I, J)^epsilon$ by $T_(I, J)^delta$.

We denote by $F_j$ the hypersurface ${x in W: f_j (x) = 0}$, where $f_j$ are the
components of the mapping $f: W -> CC^p$, and consider the sequence of
hypersurfaces $scr(F) = {F_1, ..., F_p}$. The notation
$union.big scr(F)$#notation-mark($union.big scr(F)$, sort: "~u F") denotes the
union of the hypersurfaces $F_1, ..., F_p$, and
$inter.big scr(F)$#notation-mark($inter.big scr(F)$, sort: "~v F") denotes their
intersection.

#source(78)
We define the sets $tilde(V)_e (scr(F))$ and $V_e (scr(F))$ by induction on
$j in {0, 1, ..., p - 1}$. We put $F'_0 = W$ and assume that the set
$F'_(j - 1)$ has been defined for $j >= 1$; then $F'_j$ is the union of
irreducible components of the set $F'_(j - 1) inter F_j$ not contained in
$F_(j + 1)$. We call the complex analytic sets
$tilde(V)_e (scr(F)) = F'_(p - 1)$#notation-mark(
  $tilde(V)_e (scr(F))$,
  sort: "V e F ~",
) and $V_e (scr(F)) = F'_(p - 1) inter F_p$#notation-mark(
  $V_e (scr(F))$,
  sort: "V e F",
) _essential intersections_ of the sequence of hypersurfaces $scr(F)$. Clearly,
the essential intersections $tilde(V)_e (scr(F))$ and $V_e (scr(F))$ are either
empty or have dimensions $n - p + 1$ and $n - p$ respectively. In the case when
$inter.big scr(F)$ is a complete intersection, $V_e (scr(F))$ coincides with the
set-theoretical intersection $inter.big scr(F)$, and $tilde(V)_e (scr(F))$
coincides with the intersection $F_1 inter dots.c inter F_(p - 1)$.

#subsection[Main theorem] <ss:main-theorem>
Let $W$ be a complex analytic subset of pure dimension $n$ in the manifold $X$
and $f: W -> CC^p$ be a holomorphic mapping. We represent the set ${1, ..., p}$
as the union $I union J$ of disjoint subsets.

#theorem(period: false)[
  #roman-text[I.] General part ($I$ and $J$ arbitrary).

  #roman-text[(1)] For any admissible path $epsilon(delta)$ in $RR_>^p$ and any
  form $psi in scr(D)^(2n - abs(I)) (X)$ the limit
  $
    R_I P_J (psi) := R_(f_I) P_(f_J) (psi)
    := lim_(delta -> 0) I[T_(I, J)^(epsilon(delta)) (f)](
      psi \/ f_1 dots.c f_p
    )
  $ <eq:residual-limit>
  exists and does not depend on the choice of admissible path.

  #roman-text[(2)] The limit @eq:residual-limit depends continuously on $psi$
  with respect to the seminorms $p_(alpha beta)^K$ (see @ss:currents), that is,
  the functional $R_I P_J$ is a current.

  #roman-text[(3)] The current $R_I P_J$ has #index-mark(
    "Bidimension of a current",
  )bidimension $(n, n - abs(I))$, that is, it is equal to zero on all forms
  $psi$ of bidegree $(i, j) != (n, n - abs(I))$.

  #roman-text[II.] Special part ($abs(J) = 0, 1$).

  #roman-text[(4)] We denote $R_I P_emptyset$ by $R_f$. Then for any
  $j in {1, ..., p}$,
  $
    (-1)^(j + p + 1) dbar (R_I P_({j})) = R_f,
  $
  from which it follows that the current $R_f$ is $dbar$-closed.#ed-note[The
    1992 edition has
    $(-1)^(j + p) d(R_I P_({j})) = (-1)^(j + p) dbar (R_I P_({j})) = R_f$ here
    and in formula @eq:dbar-principal of @ss:operators. The sign does not agree
    with the conventions of @ss:currents: for $n = p = 1$, $f = z$ and
    $psi = g d z$ the Cauchy–Pompeiu formula gives
    $dbar P_f (psi) = -2 pi i g(0) = -R_f (psi)$. The equality with $d$ is
    false: for $f = z$ and $psi = z^2 chi(|z|^2) d overline(z)$, where the
    function $chi$ has compact support and is equal to $1$ near $0$,
    $R_f (psi) = dbar P_f (psi) = 0$, but
    $d P_f (psi) = -2 pi i integral_0^infinity chi(u) d u$.]

  #roman-text[(5)] For $I = {1, ..., p - 1}$ and $J = {p}$ the current
  $R_I P_J := R_(f') P_(f_p)$ is represented as a repeated limit:
  $
    R_(f') P_(f_p) (psi) = lim_(epsilon_p -> 0) lim_(delta -> 0)
    I[T_(I, J)^(epsilon'(delta), epsilon_p) (f)](psi \/ f_1 dots.c f_p),
  $
  where $f' = (f_1, ..., f_(p - 1))$,
  $epsilon' = (epsilon_1, ..., epsilon_(p - 1))$.

  #roman-text[(6)] The supports of the currents $R_(f') P_(f_p)$ and $R_f$ lie
  in the essential intersections $tilde(V)_e (scr(F))$ and $V_e (scr(F))$
  respectively, where $scr(F) = {F_1, ..., F_p}$, $F_j = {f_j = 0}$.
] <th:main>

The notation $R_(f_I) P_(f_J)$#notation-mark(
  $R_(f_I) P_(f_J)$,
  sort: "R f I P f J",
)#notation-mark($R_I P_J$, sort: "R I P J") is explained by the fact that with
respect to the system of functions $f_I = (f_i)_(i in I)$ the limit
@eq:residual-limit has "residual" nature, and with respect to the system
$f_J = (f_j)_(j in J)$ it has the nature of a principal value, which is obvious
from the definition of the tube $T_(I, J)^epsilon$. For this reason we call
#source(79) $R_I P_emptyset = R_f$ a #index-mark(
  "Residual current",
)_residual current_ with respect to the mapping $f$, or a $p$-residue, and
$R_(f') P_(f_p)$ is called a #index-mark(
  "Residue",
  sub: "of principal value",
)_$(p - 1)$-residue of principal value_ with respect to $f$. We shall denote the
$0$-residue of principal value with respect to $f$ by $P_f$.

We shall sometimes denote the residual current $R_f$ and the #index-mark(
  "Principal value",
)principal value $P_f$ by $R_(W; f)$#notation-mark(
  $R_(W; f)$,
  sort: "R W f",
) and $P_(W; f)$#notation-mark($P_(W; f)$, sort: "P W f") in order to emphasize
the analytic set on which the analysis is considered.

Finally, one more notation: for any smooth form $lambda$ on $X$ we shall denote
by $R_I P_J [lambda]$ the functional on $scr(D)^(2n - abs(I) - q) (X)$ (here
$q = deg lambda$) defined by $R_I P_J [lambda](psi) = R_I P_J (lambda and psi)$.
This functional is a current, since the operation $psi -> lambda and psi$ is
continuous with respect to the seminorms $p_(alpha beta)^K$:
$
  p_(alpha beta)^K (lambda and psi)
  <= sum_(abs(gamma) <= alpha \ abs(delta) <= beta)
  c_(gamma delta)^K p_(gamma delta)^K (psi), wide
  c_(gamma delta)^K in RR_+.
$

We observe that in the definition of the current @eq:residual-limit we started
from a mapping $f$ and integrated the semimeromorphic form
$psi \/ f_1 dots.c f_p$ with poles on the hypersurfaces $F_j$ specified by the
global equations $f_j = 0$. We shall now start from the sequence of
hypersurfaces $scr(F) = {F_1, ..., F_p}$, that is, the sequence of analytic
subsets $F_j subset W$, each locally specified by one equation. Let $lambda$ be
a semimeromorphic form of degree $q$ with poles on $union.big scr(F)$, that is,
it can be represented in some neighborhood $scr(U)_a$ of each point $a in W$ by
the relation $hat(lambda) \/ f_1^(k_1) dots.c f_p^(k_p)$, where $f_j = 0$ are
local equations for $F_j inter scr(U)_a$, and $hat(lambda)$ is a smooth form in
$scr(U)_a$ of degree $q$. In each such neighborhood there is defined a current
$R_(f_I^k) P_(f_J^k) [hat(lambda)]$ associated with the mapping
$f^k = (f_1^(k_1), ..., f_p^(k_p)): W inter scr(U)_a -> CC^p$. We can show that
this current does not depend on the choice of the functions $f_j$ that locally
determine the $F_j$ (for the cases when $J = emptyset$ or $J = {p}$, see the
proof in @bib:Coleff1978). Therefore, by a standard application of the method of
partition of unity, from the local data
$
  R_(f_I^k) P_(f_J^k) (hat(lambda) and psi), wide
  psi in scr(D)^(2n - q - abs(I)) (scr(U)_a)
$
we can construct a current that is defined by the sequence $scr(F)$ and the
semimeromorphic form $lambda$. We denote it by
$R_(scr(F)_I) P_(scr(F)_J) [lambda]$. We call the current
$R_scr(F) [lambda]$#notation-mark(
  $R_scr(F) [lambda]$,
  sort: "R F lambda",
) (corresponding to $J = emptyset$) the _$p$-residue of the form $lambda$_ with
respect to the sequence of hypersurfaces $scr(F)$, and we call
$R_(scr(F)') P_(F_p) [lambda]$ the _$(p - 1)$-residue of principal value_ with
respect to $scr(F)$ (here $scr(F)' = {F_1, ..., F_(p - 1)}$).

From the main theorem there follows a corollary.

#corollary[
  If $lambda$ is a semimeromorphic differential form of bidegree $(r, t)$, then
  the current $R_(scr(F)_I) P_(scr(F)_J) [lambda]$ has bidimension
  $(n - r, n - t - abs(I))$. The supports of the currents
  $R_(scr(F)') P_(F_p) [lambda]$ and $R_scr(F) [lambda]$ lie in the essential
  intersections $tilde(V)_e (scr(F))$ and $V_e (scr(F))$ respectively.
] <cor:residual-supports>
