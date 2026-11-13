#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

#heading(
  level: 2,
)[Existence theorem in the case of normal intersections]
<sec:normal-intersections>

#source(80)
Here we shall prove the existence of currents $R_I P_J$ associated with normal
intersections in the space $CC^n$.

#subsection[Statement of the theorem and some notation] <ss:normal-statement>
We now state an assertion that constitutes the general part of the main theorem
of @sec:main-facts for the case when $W$ is a unit polydisk of the space $CC^n$,
and $f = (f_1, ..., f_p)$ is the simplest mapping for which the set of zeros
${f_1 dots.c f_p = 0}$ consists of pieces of the coordinate planes, that is, it
forms normal intersections. Thus, let ${1, ..., p} = I union J$,
$I inter J = emptyset$.

#theorem[
  Let $f = (f_1, ..., f_p): scr(B) -> CC^p$ be a mapping of the unit polydisk
  $scr(B) subset CC^n$ into the space $CC^p$ ($p <= n$), and
  $
    f_j (z) = u_j (z) z^(alpha_j), quad alpha_j in NN^n, quad j = 1, ..., p,
  $
  where $u_j (z)$ are invertible holomorphic functions in $scr(B)$. We choose an
  arbitrary multi-index $gamma in NN^n$ with the property
  ${z^gamma = 0} subset {z^(alpha_1) dots.c z^(alpha_p) = 0}$. Then for any
  admissible path $epsilon(delta)$ in $RR_>^p$ and any form
  $psi in scr(D)^(2n - abs(I)) (scr(B))$ there the limit
  $
    R_(I, J)^gamma (psi)#notation-mark($R_(I, J)^gamma$, sort: "R I, J gamma")
    := lim_(delta -> 0) integral_(T_(I, J)^(epsilon(delta)) (f))
    psi \/ z^gamma,
  $
  exists and does not depend on the choice of admissible path $epsilon(delta)$.
  This limit depends continuously on $psi$ with respect to the seminorms
  $p_(alpha beta)^K$, $K relcomp scr(B)$, and is a current of bidimension
  $(n, n - abs(I))$.
] <th:normal-intersections>

A direct proof of the theorem will be given in subsections
@ss:existence-continuity[n] and @ss:bidimension[n], while in subsections
@ss:tube-parametrization[n] and @ss:special-taylor[n] we carry out some
preparatory work connected with a description of the set of integration
$T_(I, J)^(epsilon(delta)) (f)$ in polar coordinates and with the reduction of
the integrand $psi$ to a convenient form.

Let us give the notation that we shall use henceforth.

We denote the tube $T_(I, J)^(epsilon(delta)) (f)$ by $T_(I, J)^delta$.
Everywhere in this section $abs(I) = s$, $abs(J) = t$, where $abs(A)$ is the
cardinality of the set $A$. Next, $rho_j$, $theta_j$ are the polar coordinates
for the component $z_j$ of the vector $z in CC^n$; here
$rho(z) = rho = (rho_1, ..., rho_n)$,
$theta(z) = theta = (theta_1, ..., theta_n)$. For a set $S subset {1, ..., n}$
we denote by $rho[S]$#notation-mark($rho[S]$, sort: "rho [S]") the vector of
length $n - abs(S)$ obtained from the vector $(rho_1, ..., rho_n)$ by deleting
the coordinates with indices $i in S$.

Let $pi^+ [S]: CC^n -> RR_+^(n - s)$#notation-mark(
  $pi^+ [S]$,
  sort: "pi + S",
) be a mapping of the form $z -> rho[S]$. The image $pi^+ [S](scr(B))$ of the
unit polydisk is a unit cube in the space $RR_+^(n - s)$, which we denote by
$scr(B)^+ [S]$. We use the notation $W_delta$#notation-mark(
  $W_delta$,
  sort: "W delta",
) for the image of the tube $pi^+ [S](T_(I, J)^delta)$.

If $nu = (nu_1, ..., nu_n)$ is an integer-valued multi-index, we denote the
product $product_(j in.not S) rho_j^(nu_j)$ by $rho[S]^nu$; similarly,
$rho_S^nu = product_(i in S) rho_i^(nu_i)$, where
$rho_S = (rho_i)_(i in S)$#notation-mark($rho_S$, sort: "rho S").

We recall that $I[T](psi)$ is the integral of $psi$ over the chain $T$.

#subsection[Analytic specification and parametrization of tubes]
<ss:tube-parametrization>
#source(81)Let us describe in more detail the tube
$T_(I, J)^(epsilon(delta)) (f)$ for the mapping $f$, stated in the theorem. Its
analytic specification is
$
  T_(I, J)^delta = {z in scr(B): |u_i z^(alpha_i)| = epsilon_i (delta),
    i in I, |u_j z^(alpha_j)| > epsilon_j (delta), j in J}.
$ <eq:tube-specification>
Thus, this tube is determined by the set of functions $u_j$ and the matrix
$alpha$ consisting of rows $alpha_j$, $j = 1, ..., p$.

It is desirable that the tube should have real dimension $2n - s$ ($s = abs(I)$)
and be specified by the smallest number of inequalities. In order to achieve
what is desirable, we need to require that the rows of the matrix $alpha$ are
linearly independent. More precisely, the following holds.

#lemma[
  If $rank alpha < p$, then for all sufficiently small $delta > 0$ the tube
  $T_(I, J)^delta$ is either empty or determined by fewer than $p$ relations.
  The first situation occurs whenever at least one of the rows $alpha_i$ with
  index $i in I$ is expressed linearly in terms of the subsequent rows of the
  matrix $alpha$.
] <lem:rank-deficient>

#proof[
  Suppose that $rank alpha < p$, that is, the vectors $alpha_1, ..., alpha_p$
  are linearly dependent. Then for some $r$, $1 <= r <= p - 1$, we have
  $alpha_r = sum_(j = r + 1)^p q_j alpha_j$, where $q_j$ are rational numbers.
  Among the numbers $q_j$ we choose the maximum and denote it by $q$. Clearly,
  $
    alpha_(r k) <= q(alpha_(r + 1 k) + dots.c + alpha_(p k)), wide
    k = 1, ..., n.
  $
  Set
  $
    M = sup_(z in scr(B)) |u_(r + 1) (z) dots.c u_p (z)|^q, wide
    m = inf_(z in scr(B)) |u_r (z)|.
  $
  Then on the basis of these inequalities we conclude that for any point
  $z in scr(B)$
  $
    |f_r (z)| & = |u_r (z) z^(alpha_r)| >= m|z^(alpha_r)|
                >= m|z^(q(alpha_(r + 1) + dots.c + alpha_p))| \
              & >= m/M |u_(r + 1) (z) dots.c u_p (z)|^q
                |z^(alpha_(r + 1) + dots.c + alpha_p)|^q \
              & = m/M |f_(r + 1) (z) dots.c f_p (z)|^q.
  $
  Since for $z in T_(I, J)^delta$ we have $|f_j (z)| >= epsilon_j (delta)$, it
  follows that
  $
    |f_r (z)| >= m/M (epsilon_(r + 1) (delta) dots.c epsilon_p (delta))^q,
    wide z in T_(I, J)^delta.
  $ <eq:rank-bound>
  Two cases are possible:

  (1) $r in I$, and then for $z in T_(I, J)^delta$ we have
  $|f_r (z)| = epsilon_r (delta)$, so in view of the admissibility of the path
  $epsilon(delta)$ the inequality @eq:rank-bound is contradictory for
  sufficiently small $delta$, that is, $T_(I, J)^delta = emptyset$;

  (2) $r in J$, and then for $z in T_(I, J)^delta$ we have
  $|f_r (z)| > epsilon_r (delta)$. We show that for sufficiently small $delta$
  this inequality is a consequence of the equalities (inequalities)
  $|f_j (z)| = epsilon_j (delta)$ ($> epsilon_j (delta)$), $j = r + 1, ..., p$.
  Indeed, suppose that $z$ belongs to $T_(I, J)^delta$, and so it satisfies the
  latter system of relations. #source(82) Since $epsilon(delta)$ is an
  admissible path, for sufficiently small $delta$ we have $epsilon_r (delta)
  < (m \/ M)(epsilon_(r + 1) (delta) dots.c epsilon_p (delta))^q$, so from
  @eq:rank-bound it follows that $|f_r (z)| > epsilon_r (delta)$, which
  completes the proof of the lemma.
]

Let us study the tube @eq:tube-specification in more detail, when all the
functions $u_j equiv 1$. According to Lemma~@lem:rank-deficient the only case of
interest is $rank alpha = p$. By renaming the variables $z_j$ (this corresponds
to rearranging the columns of $alpha$) we can arrange that the matrix
$alpha_(I, S) = norm(alpha_(i j))_(i in I, j in S)$, where $S = {1, ..., s}$, is
nonsingular. In the notation $rho_j = |z_j|$, $rho = (rho_1, ..., rho_n)$ the
tube @eq:tube-specification is determined by points $z in scr(B)$ for which the
vector $rho$ satisfies the system of equations
$
  rho_S^(alpha_i) = epsilon_i \/ rho[S]^(alpha_i), wide i in I,
$ <eq:radii-equations>
and the system of inequalities
$
  rho^(alpha_j) > epsilon_j, wide j in J.
$ <eq:radii-inequalities>
After taking the logarithm of the system of equations @eq:radii-equations by
means of Cramer's rule, we find that the first $s$ coordinates of the vector
$rho$ are expressed in terms of the last $n - s$ coordinates and the vector
$epsilon_I = (epsilon_i)_(i in I)$ by formulas of the form
$
  rho_i = epsilon_I^(delta_i) \/ rho[S]^(beta_i), wide i = 1, ..., s,
$ <eq:radii-solution>
where $delta_i = (delta_(i 1), ..., delta_(i s))$,
$beta_i = (beta_(i 1), ..., beta_(i, n - s))$ are vectors with rational
components, and $rho[S] = (rho_(s + 1), ..., rho_n)$. We observe that since the
matrix $alpha_(I, S)$ is nonsingular the solution $rho_S = (rho_1, ..., rho_s)$
of the system @eq:radii-equations tends to zero together with $epsilon_I$, so in
@eq:radii-solution all the vectors $delta_i$, $i = 1, ..., s$, are nonzero.

We recall (see @ss:normal-statement[subsection]) that in the notation we have
adopted $pi^+ [S]: CC^n -> RR_+^(n - s)$ is a mapping of the form
$z -> (rho_(s + 1), ..., rho_n)$, and $W_delta = pi^+ [S](T_(I, J)^delta)$ is a
subset of the unit cube $scr(B)^+ [S] subset RR_+^(n - s)$. We show that
$W_delta$ is open in $scr(B)^+ [S]$. For this we substitute in
@eq:radii-inequalities the unknowns $rho_1, ..., rho_s$ of the system of
equations @eq:radii-equations, solved by @eq:radii-solution, and as a result we
obtain
$
  rho[S]^(beta'_1) > epsilon_(j_1) epsilon_I^(delta'_1), ...,
  rho[S]^(beta'_t) > epsilon_(j_t) epsilon_I^(delta'_t)
$ <eq:w-inequalities>
for certain vectors $beta'_1, ..., beta'_t$ and $delta'_1, ..., delta'_t$ of
length $n - s$ and $s$ with rational coordinates (here we put
$J = {j_1, ..., j_t}$). Since $T_(I, J)^delta subset scr(B)$, from
@eq:radii-solution we conclude that for points $z in T_(I, J)^delta$
$
  rho[S]^(beta_1) > epsilon_I^(delta_1), ...,
  rho[S]^(beta_s) > epsilon_I^(delta_s).
$ <eq:w-bounds>
Clearly, $T_(I, J)^delta$ consists of points $z in scr(B)$ for which
@eq:radii-solution and @eq:w-inequalities are satisfied, and $W_delta$ consists
of points $rho[S]$ of the cube $scr(B)^+ [S]$ for which @eq:w-inequalities and
@eq:w-bounds are satisfied. Hence $W_delta$ is open in $scr(B)^+ [S]$.

We are now in a position to define a parametrization of the tube
$T_(I, J)^delta$.

#lemma[
  #source(83)Let $f_j = z^(alpha_j)$, $j = 1, ..., p$. We assume that the matrix
  $alpha$ composed of the rows $alpha_j$ does not contain zero columns and that
  $det alpha_(I, S) != 0$ ($S = {1, ..., s}$). Then the mapping
  $
    nu_delta: (0, 2 pi)^n times W_delta -> T_(I, J)^delta,
  $ <eq:nu-delta>
  specified by the correspondence
  $
    (theta, rho[S]) xto(nu_delta) (rho_1 (dot.c) e^(i theta_1), ...,
      rho_s (dot.c) e^(i theta_s), rho_(s + 1) e^(i theta_(s + 1)), ...,
      rho_n e^(i theta_n)),
  $
  where $rho_i (dot.c) = rho_i (epsilon(delta), rho[S])$ are defined by
  @eq:radii-solution, is one-to-one and smooth; consequently, $nu_delta$
  specifies a parametrization of $T_(I, J)^delta$ in polar coordinates
  $(theta, rho[S])$.
] <lem:tube-parametrization>

#proof[
  By hypothesis the matrix $alpha$ does not contain zero columns, so for each
  point $z in T_(I, J)^delta$ the radii $rho_j = rho_j (z)$ are nonzero for all
  $j$ from $1$ to $n$. Consequently, for each point the quantities $rho[S]$,
  $theta[S]$ are uniquely determined, and since the matrix $alpha_(I, S)$ is
  nonsingular the vector $rho_S$ is uniquely determined by $rho[S]$. What we
  have said implies that $nu_delta$ is one-to-one. The smoothness of $nu_delta$
  is obvious from its construction.
]

Since by means of the parametrization of $nu_delta$ stated in
Lemma~@lem:tube-parametrization we can reduce the integration over the chain
$T_(I, J)^delta$ to integration over the direct product
$[0, 2 pi)^n times W_delta$, it is important to know how the measure of the set
$W_delta$ behaves as $delta -> 0$. We recall that $W_delta$ is a subset of the
cube $scr(B)^+ [S] subset RR_+^(n - s)$, which is determined by
@eq:w-inequalities and @eq:w-bounds, that is,
$
  W_delta & = W_(epsilon(delta)) \
  & = {rho[S] in scr(B)^+ [S]: && rho[S]^(beta_k)
    > epsilon_I^(delta_k), quad k = 1, ..., s; \
    & && rho[S]^(beta'_q) > epsilon_(j_q) epsilon_I^(delta'_q),
    quad q = 1, ..., t},
$ <eq:w-delta>
where $beta_k$, $beta'_q$, $delta_k$, $delta'_q$ are vectors with rational
coordinates. The vectors $epsilon_I = (epsilon_(i_1), ..., epsilon_(i_s))$,
$epsilon_J = (epsilon_(j_1), ..., epsilon_(j_t))$ depend on one parameter
$delta in (0, 1]$, and we assume that
$epsilon(delta) = (epsilon_1, ..., epsilon_p)$ is an admissible path in
$RR_>^p$. It is also important for us to know the behavior of the set
$W_epsilon$ when $epsilon$ depends on two parameters in the following special
way: $epsilon = (epsilon'(delta), epsilon_p)$, where
$epsilon'(delta) = (epsilon_1 (delta), ..., epsilon_(p - 1) (delta))$ is an
admissible path in $RR_>^(p - 1)$, and $epsilon_p$ is a free parameter that does
not depend on $delta$. We shall denote the corresponding set $W_epsilon$ by
$W_(epsilon'(delta), epsilon_p)$. We observe that the "contraction"
$epsilon'(delta)$ of any admissible path $epsilon(delta)$ in $RR_>^p$ is an
admissible path in $RR_>^(p - 1)$.

#lemma[
  Under the conditions of Lemma~@lem:tube-parametrization the following
  assertions hold:

  #roman-text[(i)] the Lebesgue $(n - s)$-measure $m(W_delta)$ of the set
  $W_delta$ tends (as $delta -> 0$) either to $0$ or to $1$, independently of
  the choice of admissible path $epsilon(delta)$;

  #roman-text[(ii)] if $p in J$, then for any admissible path $epsilon(delta)$
  in $RR_>^p$
  $
    lim_(epsilon_p -> 0) lim_(delta -> 0) m(W_(epsilon'(delta), epsilon_p))
    = lim_(delta -> 0) m(W_delta),
  $ <eq:measure-limit>
  #source(84)where the inner limit
  $gamma_(epsilon_p) := lim_(delta -> 0) m(W_(epsilon'(delta), epsilon_p))$
  can take one of three values: $0$, or $1$, or
  $m(scr(B)^+ [S] inter {rho[S]^(beta'_q) > epsilon_p})$, where $beta'_q$ is the
  vector from @eq:w-delta, corresponding to the index $q$ for which $j_q = p$.
] <lem:tube-measure>

#proof[
  (i) Since $epsilon = epsilon(delta)$ is an admissible path, and the vectors
  $delta_k$ from @eq:w-delta are nonzero (see the remark after formula
  @eq:radii-solution), each of the limits
  $
    lim_(delta -> 0) epsilon_I^(delta_k), wide k = 1, ..., s,
  $ <eq:limits-k>
  is equal to $0$ or $infinity$; the same is also true for the limits
  $
    lim_(delta -> 0) epsilon_(j_q) epsilon_I^(delta'_q), wide q = 1, ..., t.
  $ <eq:limits-q>
  #new-par
  Let us assume that at least one of these limits, say one of the limits in
  @eq:limits-k, is infinite. Then the point $rho[S] in scr(B)^+ [S]$ can satisfy
  the inequality $rho[S]^(beta_k) > epsilon_I^(delta_k)$ only when at least one
  of the coordinates $rho_(s + 1), ..., rho_n$ is sufficiently close to zero
  (and, of course, at least one of the coordinates of the vector $beta_k$ is
  negative). In other words, as $delta -> 0$ the set $W_delta$ falls into an
  arbitrarily small neighborhood of the closed set
  $K = {rho_(s + 1) dots.c rho_n = 0} subset RR_+^(n - s)$, whose measure is
  equal to zero. Hence $m(W_delta) -> 0$ as $delta -> 0$. Similarly we can show
  that $m(W_delta) -> 0$ if at least one of the limits @eq:limits-q is infinite.

  We now assume that all limits in @eq:limits-k and @eq:limits-q are equal to
  zero. In this case the point $rho[S]$ with nonzero coordinates falls into
  $W_delta$ for all sufficiently small $delta$. Since
  $m(scr(B)^+ [S] without K) = 1$, $m(W_delta) -> 1$ as $delta -> 0$. The
  observation that the limits @eq:limits-k and @eq:limits-q do not depend on the
  choice of admissible path completes the proof of (i).

  (ii) Suppose that $p in J$ and that $epsilon(delta)$ is an admissible path in
  $RR_>^p$. Consider the limit
  $gamma_(epsilon_p) = lim_(delta -> 0) m(W_(epsilon'(delta), epsilon_p))$. As
  in (i), we turn to the limits @eq:limits-k and @eq:limits-q, where we shall
  assume that $epsilon' = epsilon'(delta)$, and $epsilon_p$ is fixed. We observe
  at once that since $p in J$, $epsilon_p$ does not occur in @eq:limits-k and
  takes part in only one limit in @eq:limits-q, corresponding to the index $q$
  for which $j_q = p$. We first consider the case $delta'_q != 0$. In this case,
  in view of the fact that the path $epsilon(delta)$ is admissible, for any
  fixed $epsilon_p^0 != 0$ we have
  $
    lim_(delta -> 0) epsilon_p^0 epsilon_I (delta)^(delta'_q)
    = lim_(delta -> 0) epsilon_p (delta) epsilon_I (delta)^(delta'_q).
  $ <eq:fixed-limit>
  Repeating word for word the arguments from (i), we verify that
  $gamma_(epsilon_p^0) = 0$ if at least one of the limits @eq:limits-k and
  @eq:limits-q (when $epsilon_p = epsilon_p^0$) is infinite, and
  $gamma_(epsilon_p^0) = 1$ if all of the limits are equal to zero. In view of
  the proof of (i) and @eq:fixed-limit, we obtain the equality @eq:measure-limit
  in the case $delta'_q != 0$. Now suppose that $delta'_q = 0$. Again if at
  least one of the limits @eq:limits-k and @eq:limits-q (when
  $epsilon_p = epsilon_p^0$) is infinite, then $gamma_(epsilon_p^0) = 0$. It
  remains to consider the case when all limits except $lim epsilon_p^0$ #source(
    85,
  ) are zero. In this case any point
  $
    rho[S] in scr(B)^+ [S] without
    (K union {rho[S]^(beta'_q) <= epsilon_p^0})
  $
  falls into the set $W_(epsilon'(delta), epsilon_p^0)$ for all sufficiently
  small $delta$. But this implies that as $delta -> 0$
  $
    m(W_(epsilon'(delta), epsilon_p^0)) -> gamma_(epsilon_p^0)
    = m(scr(B)^+ [S] inter {rho[S]^(beta'_q) > epsilon_p^0}).
  $
  Obviously, $gamma_(epsilon_p) -> 1$ as $epsilon_p -> 0$. As we noted above,
  $epsilon_p$ occurs in only one of the expressions in @eq:limits-q, so in the
  last case under consideration, when $delta'_q = 0$ and all limits except
  $lim epsilon_p^0$ are equal to zero, we also have $m(W_delta) -> 1$ as
  $delta -> 0$. Thus the equality @eq:measure-limit is established, and the
  lemma is proved.
]

#subsection[Special Taylor expansions for smooth functions] <ss:special-taylor>
In work with the integrand of the functional $R_(I, J)^gamma (psi)$ an important
role will be played by the following assertion.

#lemma[
  Suppose that $gamma = (gamma_1, ..., gamma_n) in NN^n$. For an arbitrary
  smooth function $psi(z)$ in $CC^n$ there is an expansion
  $
    psi(z) = sum_(j = 1)^n sum_(sigma + tau < gamma_j)
    z_j^sigma overline(z)_j^tau g_(sigma tau)^j (z[j]) + Psi(z), wide
    Psi(z) = sum_(mu + nu = gamma) z^mu overline(z)^nu psi_(mu nu) (z),
  $
  where all functions are smooth, and $Psi$ depends continuously on $psi$ with
  respect to the seminorms $p_(alpha beta)^K$.
] <lem:special-taylor>

#proof[
  To the function $psi(z)$ we apply Taylor's formula in the variables $z_1$,
  $overline(z)_1$, restricting ourselves to terms of order $gamma_1$:
  $
    psi(z) = sum_(sigma + tau < gamma_1) z_1^sigma overline(z)_1^tau
    g_(sigma tau)^1 (z[1])
    + sum_(sigma + tau = gamma_1) z_1^sigma overline(z)_1^tau
    psi_(sigma tau)^1 (z),
  $ <eq:taylor-first>
  where $g_(sigma tau)^1 = (sigma! tau!)^(-1) partial^(sigma + tau) psi
  \/ partial z_1^sigma partial overline(z)_1^tau |_(z_1 = 0)$ and
  $psi_(sigma tau)^1$ are smooth functions. The $psi_(sigma tau)^1$ depend
  continuously on $psi$ with respect to the seminorms $p_(alpha beta)^K$; this
  follows from the integral representation of the remainder in Taylor's formula:
  $
    psi_(sigma tau)^1 (z) = gamma_1 (sigma! tau!)^(-1) integral_0^1
    (1 - t)^(gamma_1 - 1)
    frac(partial^(sigma + tau) psi, partial z_1^sigma partial overline(z)_1^tau)
    (t z_1, z[1]) d t.
  $
  #new-par
  Now to each function $psi_(sigma tau)^1$ we apply Taylor's formula in
  variables $z_2$, $overline(z)_2$, restricting ourselves to terms of order
  $gamma_2$. As a result the second sum in @eq:taylor-first takes the form
  $
    sum_(sigma + tau < gamma_2) z_2^sigma overline(z)_2^tau
    g_(sigma tau)^2 (z[2])
    + sum_(mu_1 + nu_1 = gamma_1 \ mu_2 + nu_2 = gamma_2)
    z_1^(mu_1) overline(z)_1^(nu_1) z_2^(mu_2) overline(z)_2^(nu_2)
    psi_(mu_1 nu_1 mu_2 nu_2)^2,
  $
  where the functions $psi_(mu_1 nu_1 mu_2 nu_2)^2$ depend continuously on
  $psi_(sigma tau)^1$ and therefore on $psi$. Continuing these arguments, we
  obtain the assertion of the lemma.
]

#subsection[Existence and continuity of $R_(I, J)^gamma$]
<ss:existence-continuity>
#source(86)We observe that the assertion of the theorem stated in
@ss:normal-statement[subsection] has local character: it is sufficient to prove
it for forms $psi$ with supports in small neighborhoods of each point
$a in scr(B)$. But since in some neighborhood $scr(U)_a$ of any such point the
mapping $f$ has the form $f_j = u_(j a) (z - a)^(alpha_j)$, $j = 1, ..., p$ (the
$u_j$ are invertible holomorphic functions in $scr(U)_a$), that is, the original
form with $a = 0$, it is sufficient to prove the existence and continuity of
$R_(I, J)^gamma$ for forms $psi$ with supports in some neighborhood of zero. We
split the proof into a number of steps.

#smallcaps[Step] 1 (reduction to the case when $u_j equiv 1$, $j = 1, ..., p$).
If the integration set $T_(I, J)^delta$ is empty for all sufficiently small
$delta$, then $R_(I, J)^gamma equiv 0$ and in this case the assertion of the
theorem is trivial. We therefore assume that $T_(I, J)^(delta_k) != emptyset$
for some sequence ${delta_k}$ that converges to zero. If $rank alpha = q < p$,
then by Lemma~@lem:rank-deficient of @ss:tube-parametrization[subsection] in the
analytic specification of the tube $T_(I, J)^delta$ we can omit $p - q$
relations, that is, for sufficiently small $delta$ we have the equality of tubes
$T_(I, J)^delta (f) = T_(I', J')^delta (f_(k_1), ..., f_(k_q))$, where
$k_1, ..., k_q$ are such that the rows $alpha_(k_1), ..., alpha_(k_q)$ are
linearly independent. On the other hand, clearly
${z^(alpha_(k_1)) dots.c z^(alpha_(k_q)) = 0}
subset {z^(alpha_1) dots.c z^(alpha_p) = 0}$, and our problem is reduced to the
situation when the rank of the matrix is a maximum. Taking account of what we
have said, we can assume that $rank alpha = p$.

Next, by renumbering the variables $z_1, ..., z_n$ we can arrange that the
matrix $alpha' = norm(alpha_(j k))_(j, k = 1, ..., p)$ is nonsingular. Let
$Delta = det alpha'$ be the determinant of the matrix $alpha'$ and $Delta_(j k)$
be the cofactors of the elements $alpha_(j k)$ of this matrix, for which, as we
know,
$
  Delta^(-1) (alpha_(j 1) Delta_(k 1) + dots.c + alpha_(j p) Delta_(k p))
  = delta_(k j),
$ <eq:cofactors>
where $delta_(k j)$ is the Kronecker symbol.

We now find a locally biholomorphic transformation of the variables $w = mu(z)$
under which the functions $f_j$ go into $w^(alpha_j)$:
$
  w^(alpha_j) = u_j (z) z^(alpha_j), wide j = 1, ..., p.
$ <eq:monomial-change>
To this end, for each $j in {1, ..., p}$ we choose in $scr(B)$ a definite branch
of the function $u_j^(1 \/ Delta)$ and set
$
  v_j = u_1^(Delta_(1 j) \/ Delta) dots.c u_p^(Delta_(p j) \/ Delta).
$
Now as the required transformation we take
$
  w = mu(z) = (z_1 v_1 (z), ..., z_p v_p (z), z_(p + 1), ..., z_n).
$
The fact that $mu$ is biholomorphic in some neighborhood $scr(U)$ of the point
$z = 0$ follows from the fact that
$det norm(partial w_i \/ partial z_j)(0) = v_1 (0) dots.c v_p (0) != 0$.
Moreover, from @eq:cofactors we see that
$
  v_1 (z)^(alpha_(j 1)) dots.c v_p (z)^(alpha_(j p)) = u_j (z), wide
  j = 1, ..., p,
$
#source(87)and so
$
  w^(alpha_j) = w_1^(alpha_(j 1)) dots.c w_n^(alpha_(j n))
  = v_1^(alpha_(j 1)) dots.c v_p^(alpha_(j p)) z^(alpha_j)
  = u_j z^(alpha_j),
$
that is, @eq:monomial-change is satisfied. Thus,
$(mu^(-1))^* (f_j) = w^(alpha_j)$, and
$
  mu(T_(I, J)^delta inter scr(U))
  = {w in mu(scr(U)): |w^(alpha_i)| = epsilon_i, i in I,
    |w^(alpha_j)| > epsilon_j, j in J}.
$
For the form $psi in scr(D)^(2n - s) (scr(U))$ we have
$
  integral_(T_(I, J)^delta) psi/z^gamma
  = integral_(mu(T_(I, J)^delta inter scr(U))) (mu^(-1))^* (psi/z^gamma).
$
It is not difficult to see that the inverse $mu^(-1) (w)$ is defined by the
formula
$
  z = mu^(-1) (w)
  = (w_1 tilde(v)_1 (w), ..., w_p tilde(v)_p (w), w_(p + 1), ..., w_n), wide
  tilde(v)_j (0) != 0,
$
and so
$
  (mu^(-1))^* (psi/z^gamma)
  = frac(psi(mu^(-1) (w)), tilde(v)_1^(gamma_1) dots.c tilde(v)_p^(gamma_p))
  w^(-gamma) = frac(tilde(psi)(w), w^gamma).
$
As a result, for any form $psi in scr(D)^(2n - s) (scr(U))$ we obtain the
equality of integrals $I[T_(I, J)^delta](psi \/ z^gamma)
= I[tilde(T)_(I, J)^delta](tilde(psi) \/ w^gamma)$, where
$tilde(T)_(I, J)^delta$ is a tube constructed from the mapping
$(w^(alpha_1), ..., w^(alpha_p)): mu(scr(U)) -> CC^p$, and
$tilde(psi) in scr(D)^(2n - s) (mu(scr(U)))$. Obviously the operation
$psi -> tilde(psi)$ is continuous in the topologies of the seminorms
${p_(alpha beta)^K, K relcomp scr(U)}$,
${p_(alpha beta)^(tilde(K)), tilde(K) relcomp mu(scr(U))}$. Consequently, the
last equality of integrals implies that it is sufficient to prove the theorem
for the case when $u_j equiv 1$, $j = 1, ..., p$, and the supports of the forms
are concentrated in a polydisk with center at the origin on $CC^n$. By changing
the scale we can assume that this is the unit polydisk, and we have reduced the
problem to the case when
$
  f: scr(B) -> CC^p, quad f_j = z^(alpha_j), quad j = 1, ..., p; quad
  rank alpha = p.
$ <eq:monomial-case>
#new-par
#smallcaps[Step] 2. Our problem consists in studying, under the condition
@eq:monomial-case, the limit
$
  R_(I, J)^gamma (psi) = lim_(delta -> 0) integral_(T_(I, J)^delta)
  psi \/ z^gamma, wide psi in scr(D)^(2n - s) (scr(B)),
$ <eq:limit-r-gamma>
where $T_(I, J)^delta = {z in scr(B): |z^(alpha_i)| = epsilon_i, i in I,
  |z^(alpha_j)| > epsilon_j, j in J}$. The form $psi$ consists of terms of type
$
  psi(z) d z_A and d overline(z)_B and (d z and d overline(z))_C,
$ <eq:form-terms>
where $A$, $B$, $C$ are pairwise disjoint subsets of ${1, ..., n}$, and
$abs(A) + abs(B) + 2 abs(C) = 2n - s$. In terms of the multi-indices $A$, $B$,
$C$ we select some forms for which the integrals in @eq:limit-r-gamma are equal
to zero.

#lemma[
  #source(88)If $f: scr(B) -> CC^p$ is a holomorphic mapping satisfying the
  conditions @eq:monomial-case, then for any smooth $(2n - s)$-form $psi$ of
  type @eq:form-terms the integrals $I[T_(I, J)^delta](psi \/ z^gamma)$ vanish
  when either $abs(C) > n - s$ or $abs(C) = n - s$ and
  $det alpha_(I, A union B) = 0$.
] <lem:vanishing-forms>

#proof[
  In fact we show that in both cases the forms
  $d z_A and d overline(z)_B and (d z and d overline(z))_C$ are equal to zero on
  $T_(I, J)^delta$.

  By hypothesis, $rank alpha = p$, so for some subset $S subset {1, ..., n}$ we
  have $det alpha_(I, S) != 0$. Renumbering the variables, we can arrange that
  $S = {1, ..., s}$. We assume that $C inter S = {h_1, ..., h_r}$,
  $C without S = {h_(r + 1), ..., h_(abs(C))}$. We observe that in the polar
  coordinates $rho_j$, $theta_j$ of the variables $z_j$ we have
  $
    (d z and d overline(z))_C
    = (-2i)^(abs(C)) and.big_(j in C) (rho_j d rho_j and d theta_j).
  $ <eq:polar-form>
  Since on $T_(I, J)^delta$ the variables $rho_i$, $i in S$, are functions of
  the remaining $n - s$ variables $rho_j$, $j in.not S$ (see
  @ss:tube-parametrization[subsection]), we have
  $
    and.big_(j in C) d rho_j
    = sum_(j_1, ..., j_r in.not S) g_(j_1 dots.c j_r)
    dot (and.big_(k = 1)^r d rho_(j_k))
    and (and.big_(k = r + 1)^(abs(C)) d rho_(h_k)).
  $ <eq:d-rho-product>
  If $abs(C) > n - s$, then the right-hand side of @eq:d-rho-product contains
  recurring differentials, so the restriction of the form @eq:polar-form to
  $T_(I, J)^delta$ is equal to zero.

  Now suppose that $abs(C) = n - s$, and $det alpha_(I, A union B) = 0$, that
  is, for some nonzero vector $t = (t_1, ..., t_s)$
  $
    sum_(k = 1)^s t_k alpha_(i_k j) = 0, wide j in A union B
  $ <eq:t-relation>
  (here ${i_1, ..., i_s} = I$). Since according to the chosen numbering of the
  variables we have $det alpha_(I, S) != 0$, the sum in @eq:t-relation is
  nonzero for some $j in S$. Clearly, $j in C$. Let
  $l_i = sum_(k = 1)^s t_k alpha_(i_k h_i)$, $1 <= i <= abs(C)$. At least one of
  the numbers $l_i$, say $l_q$, is nonzero. Taking account of @eq:t-relation,
  the relations $rho^(alpha_i) = epsilon_i$, $i in I$, which are satisfied on
  $T_(I, J)^delta$, give
  $
    product_(j = 1)^(abs(C)) rho_(h_j)^(l_j)
    = epsilon_(i_1)^(t_1) dots.c epsilon_(i_s)^(t_s),
  $
  so after taking the logarithm and then taking the differential we deduce that
  on $T_(I, J)^delta$
  $
    d rho_(h_q) = -frac(rho_(h_q), l_q)
    (sum_(j != q) l_j frac(d rho_(h_j), rho_(h_j))).
  $
  This means that $and.big_(j in C) d rho_j$ vanishes on $T_(I, J)^delta$, and
  the lemma is proved.
]

#source(89)#smallcaps[Step] 3 (transition to the case when the matrix $alpha$
does not contain zero columns). According to Lemma~@lem:vanishing-forms it is
sufficient to prove the theorem for forms of type
$
  psi = psi(z) d z_A and d overline(z)_(S without A) and d z[S]
  and d overline(z)[S], wide det alpha_(I, S) != 0,
$ <eq:form-type>
where after renumbering the variables we can suppose that $S = {1, ..., s}$. We
assume that the matrix $alpha$ has a zero column, that is, $alpha_(j k) = 0$,
$j = 1, ..., p$, for some $k in {1, ..., n}$. Then, in view of the conditions
@eq:form-type, $psi = tilde(psi) d z_k and d overline(z)_k$ for some form
$tilde(psi)$. At the same time,
$T_(I, J)^delta = tilde(T)_(I, J)^delta times scr(B)_k$, where
$tilde(T)_(I, J)^delta$ is the projection of $T_(I, J)^delta$ to the plane of
the variables $z_1, ..., [k], ..., z_n$, and $scr(B)_k$ is a unit disk on the
plane of the complex variable $z_k$. Thus,
$
  integral_(T_(I, J)^delta) psi \/ z^gamma
  = integral_(tilde(T)_(I, J)^delta) [integral_(scr(B)_k)
    tilde(psi) d z_k and d overline(z)_k \/ z^gamma].
$
Since $gamma_k = 0$, the inner integral
$
  integral_(scr(B)_k) frac(tilde(psi) d z_k and d overline(z)_k, z^gamma)
  = frac(1, z[k]^gamma) integral_(scr(B)_k)
  tilde(psi) d z_k and d overline(z)_k
$
is a form of type $tilde(tilde(psi)) \/ z[k]^gamma$, where $tilde(tilde(psi))$
is a smooth form of degree $2(n - 1) - s$ whose support lies in $scr(B)[k]$, and
which depends continuously on $psi$ with respect to the seminorms
$p_(alpha beta)^K$. As a result we have arrived at the original problem in a
space of fewer variables, having gotten rid of a zero column of $alpha$. We can
continue this procedure until we have gotten rid of all zero columns of the
matrix.

#smallcaps[Step] 4 (integration over the fibers $[0, 2 pi)^n$ that take part in
the parametrization of the tube $T_(I, J)^delta$). Thus, in addition to the
condition @eq:form-type we can assume that $alpha$ does not contain zero
columns, so we can apply Lemma~@lem:tube-parametrization of
@ss:tube-parametrization[subsection] on the parametrization of the chain
$T_(I, J)^delta$, and our problem is reduced to the study of the limit
$
  lim_(delta -> 0) integral_(T_(I, J)^delta) psi \/ z^gamma
  = lim_(delta -> 0) integral_([0, 2 pi)^n times W_delta)
  nu_delta^* (psi \/ z^gamma),
$ <eq:fiber-limit>
where $psi$ is a form of type @eq:form-type. We observe that for all $j in S$
$
            nu_delta^* (d z_j) & = d rho_j e^(i theta_j)
                                 = underbrace(i rho_j e^(i theta_j), z_j)
                                 d theta_j + e^(i theta_j) d rho_j, \
  nu_delta^* (d overline(z)_j) & = d rho_j e^(-i theta_j)
                                 = -underbrace(
                                   i rho_j e^(-i theta_j), overline(z)_j
                                 ) d theta_j + e^(-i theta_j) d rho_j;
$
where we must take into account the fact that the $rho_j$ are functions of
$rho_q$, $q in.not S$. Since the outer product
$
  d z[S] and d overline(z)[S]
  = plus.minus and.big_(q in.not S) (2i rho_q d theta_q and d rho_q)
$
#source(90)contains all of the differentials $d rho_q$, $q in.not S$, for a form
of type @eq:form-type we have
$
  nu_delta^* (psi \/ z^gamma)
  = {nu_delta^* (psi(z) \/ z^gamma) k rho_1 dots.c rho_n
    e^(i(theta_A - theta_(S without A)))} d theta and d rho[S],
$
where $k = k(A, S)$ is a nonzero constant, $theta_A = sum_(q in A) theta_q$,
$theta_(S without A) = sum_(q in S without A) theta_q$. It is convenient to
write $nu_delta^* (psi \/ z^gamma)$ in the form
$
  nu_delta^* (psi \/ z^gamma)
  = {nu_delta^* (psi(z) Phi(z) \/ z^gamma)} d theta and d rho[S],
$
where
$
  Phi(z) = k product_(q in A) z_q product_(q in S without A) overline(z)_q
  product_(j in.not S) |z_j|.
$ <eq:phi>
Thus,
$
  integral_(T_(I, J)^delta) psi \/ z^gamma = integral_(W_delta)
  tilde(psi)_delta,
$ <eq:w-integral>
where $tilde(psi)_delta = tilde(psi)_delta (rho[S]) d rho[S]$, and
$
  tilde(psi)_delta (rho[S]) = integral_([0, 2 pi]^n)
  nu_delta^* (psi(z) Phi(z) \/ z^gamma) d theta.
$ <eq:psi-tilde>
#new-par
#smallcaps[Step] 5 (boundedness and convergence of the sequence
$tilde(psi)_delta$). We now come to the main step in the proof of the theorem:
we show that the integrals @eq:psi-tilde over the fibers $[0, 2 pi)^n$ are
uniformly bounded and so converge pointwise ($tilde(psi)_delta -> tilde(psi)_0$
as $delta -> 0$), so by Lebesgue's theorem on bounded convergence the required
limit of the integrals @eq:w-integral exists. Here an important role will be
played by the following simple lemma.

#lemma[
  Suppose that $a, b in ZZ^n$, where $b_j != 0$. Then for any function
  $g in C^infinity (CC^n)$ that does not depend on the variable $z_j$ the
  integral
  $
    I = integral_([0, 2 pi)^n) rho^a e^(i b theta) nu_delta^* (g(z)) d theta,
  $
  where $b theta = b_1 theta_1 + dots.c + b_n theta_n$, is equal to zero.
] <lem:fiber-integral>

#proof[
  By the Fubini theorem we represent $I$ as an iterated integral:
  $
    plus.minus integral_([0, 2 pi)^(n - 1)) rho^a e^(i(theta b - theta_j b_j))
    nu_delta^* (g) [integral_0^(2 pi) e^(i b_j theta_j) d theta_j]
    d theta[j].
  $
  By hypothesis, $b_j != 0$, so the inner integral is equal to zero, from which
  we obtain the required result.
]

Returning to the integral @eq:psi-tilde, to the function $psi(z)$ we apply the
special Taylor expansion (see @ss:special-taylor[subsection]) up to order
$gamma - I = (gamma_1 - 1, ..., gamma_n - 1)$. As a result, for the function
$tilde(psi)_delta (rho[S])$ we obtain a representation of the form
$
  & sum_(j = 1)^n [sum_(sigma + tau < gamma_j - 1)
      integral_([0, 2 pi)^n) nu_delta^* (z^(-gamma) z_j^sigma
        overline(z)_j^tau g_(sigma tau)^j (z[j]) Phi(z)) d theta] \
  & quad + integral_([0, 2 pi)^n) nu_delta^* (z^(-gamma) Psi(z) Phi(z))
    d theta = sum I_(sigma tau)^j + I'.
$
#source(91)Each integral $I_(sigma tau)^j$ can be written as follows (see the
definition of $Phi(z)$):
$
  integral_([0, 2 pi)^n) rho^(-(gamma - I)) rho_j^(sigma + tau)
  exp{i(-gamma theta + theta_A - theta_(S without A) + sigma theta_j
      - tau theta_j)} nu_delta^* (g_(sigma tau)^j) d theta.
$
From Lemma~@lem:fiber-integral we conclude that $I_(sigma tau)^j = 0$, since:

if $j in A$, then $b_j = -gamma_j + 1 + sigma - tau != 0$ (we recall that
$sigma + tau < gamma_j - 1$);

if $j in S without A$, then $b_j = -gamma_j - 1 + sigma - tau != 0$;

if $j in.not S$, then $b_j = -gamma_j + sigma - tau != 0$.

Thus,
$
  tilde(psi)_delta (rho[S]) & = I'
  = integral_([0, 2 pi)^n) nu_delta^* (z^(-gamma) Psi(z) Phi(z)) d theta \
  & = sum_(mu + nu = gamma - I) integral_([0, 2 pi)^n)
  k rho^a e^(i b_(mu nu) theta) nu_delta^* (psi_(mu nu) (z)) d theta,
$ <eq:psi-tilde-expansion>
where $a in NN^n$, $b_(mu nu) in ZZ^n$, so
$
  |tilde(psi)_delta (rho[S])|
  <= k(2 pi)^n sum_(mu + nu = gamma - I) sup_scr(B) |psi_(mu nu) (z)|.
$
We recall that in the lemma of @ss:special-taylor[subsection] we asserted that
$psi_(mu nu) (z)$ depends continuously on $psi(z)$ with respect to the seminorms
$p_(alpha beta)^K$, so
$
  sup_(1 >= delta > 0) sup_(rho in W_delta) |tilde(psi)_delta (rho[S])|
  <= sum_(abs(alpha) + abs(beta) < q^scr(B))
  c_(alpha beta)^scr(B) p_(alpha beta)^scr(B) (psi) =: M.
$ <eq:psi-tilde-bound>
#new-par
Thus, the sequence $tilde(psi)_delta$ is uniformly bounded. Let us prove that it
is pointwise convergent. For this we investigate the integrands in
@eq:psi-tilde-expansion, namely the behavior of the sequence
$nu_delta^* (psi_(mu nu)) = psi_(mu nu) (nu_delta (theta, rho[S]))$ as
$delta -> 0$. We recall (see formulas @eq:nu-delta and @eq:radii-solution of
@ss:tube-parametrization[subsection]) that
$
  nu_delta (theta, rho[S]) = (frac(epsilon_I^(delta_1), rho[S]^(beta_1))
    e^(i theta_1), ..., frac(epsilon_I^(delta_s), rho[S]^(beta_s))
    e^(i theta_s), rho_(s + 1) e^(i theta_(s + 1)), ...,
    rho_n e^(i theta_n)).
$
In view of admissibility of the path $epsilon$ for all $k$ from $1$ to $s$, the
sequence $epsilon_I^(delta_k)$ tends to $0$ or $infinity$ as $delta -> 0$, and
the limit of this sequence is the same for any admissible path. If
$epsilon_I^(delta_k) -> 0$, then for fixed $rho[S]$ the sequence of mappings
$nu_delta (theta, rho[S]): [0, 2 pi)^n -> CC^n$ converges to
$nu_0 (theta, rho[S])
= (0, ..., 0, rho_(s + 1) e^(i theta_(s + 1)), ..., rho_n e^(i theta_n))$
uniformly with respect to $theta$. As a result in @eq:psi-tilde-expansion we can
pass to the limit as $delta -> 0$ under the integral sign, which proves the
existence of a pointwise limit of the sequence $tilde(psi)_delta$. If
$epsilon_I^(delta_k) -> infinity$, then for fixed $rho[S]$ and any
$theta in [0, 2 pi)^n$ the images $nu_delta (theta, rho[S])$ lie outside
$overline(scr(B))$ for sufficiently small $delta$. Without any loss we can
assume that $psi_(mu nu) = 0$ outside $overline(scr(B))$. In this case for
sufficiently small $delta$ we have $tilde(psi)_delta (rho[S]) = 0$, so
$tilde(psi)_delta -> 0$.

#smallcaps[Step] 6. For the final investigation of the integrals in
@eq:w-integral we recall that by Lemma~@lem:tube-measure of
@ss:tube-parametrization[subsection] we have two possibilities:

#source(92)
(1) $m(W_delta) -> 0$, in this case, since $tilde(psi)_delta$ is uniformly
bounded (see @eq:psi-tilde-bound),
$
  abs(integral_(W_delta) tilde(psi)_delta) <= M m(W_delta),
$
so
$
  R_(I, J)^gamma (psi) = lim_(delta -> 0) integral_(T_(I, J)^delta)
  psi \/ z^gamma = 0.
$ <eq:limit-zero>
#new-par
(2) $m(W_delta) -> 1$; then $m(scr(B)^+ [S] without W_delta) -> 0$ and
$
  integral_(W_delta) tilde(psi)_delta
  = integral_(scr(B)^+ [S]) tilde(psi)_delta
  - integral_(scr(B)^+ [S] without W_delta) tilde(psi)_delta,
$
from which, in view of the pointwise convergence
$tilde(psi)_delta -> tilde(psi)_0$ and the uniform boundedness of
$tilde(psi)_delta$, we conclude that
$
  R_(I, J)^gamma (psi) = integral_(scr(B)^+ [S]) tilde(psi)_0.
$ <eq:limit-cube>
Since according to @eq:psi-tilde-bound
$
  |tilde(psi)_0| <= sum_(abs(alpha) + abs(beta) < q^scr(B))
  c_(alpha beta)^scr(B) p_(alpha beta)^scr(B) (psi),
$
we have proved the existence and continuity of $R_(I, J)^gamma$. The fact that
$R_(I, J)^gamma$ is independent of the admissible path $epsilon$ follows from
the fact that the limits $lim_(delta -> 0) tilde(psi)_delta = tilde(psi)_0$ and
$lim_(delta -> 0) m(W_delta)$ do not depend on $epsilon$.

#subsection[On the bidimension of $R_(I, J)^gamma$] <ss:bidimension>
We prove that the current $R_(I, J)^gamma$ has bidimension $(n, n - s)$, where
$s = abs(I)$. For this we use the following lemma, which is needed in what
follows.

#lemma[
  Let $Phi$ and $tilde(psi)_delta$ be defined by formulas @eq:phi and
  @eq:psi-tilde of @ss:existence-continuity[subsection], respectively. If for
  some $j in S$ either $psi$ or $Phi$ contains the factor $overline(z)_j$, that
  is, $psi dot Phi = overline(z)_j psi'$, $psi' in C^infinity (scr(B))$, then
  $
    lim_(delta -> 0) integral_(W_delta) tilde(psi)_delta = 0.
  $
] <lem:conjugate-factor>

#proof[
  Since the sequence $tilde(psi)_delta$ is uniformly bounded, we need to
  consider only the case when $m(W_delta) -> 1$ as $delta -> 0$ (see Step 6 in
  @ss:existence-continuity[subsection]). As we remarked in the proof of
  Lemma~@lem:tube-measure of @ss:tube-parametrization[subsection], in this case
  for $j in S$ the sequence $rho_j = rho_j (epsilon(delta), rho[S])$ converges
  to zero as $delta -> 0$.

  We apply to the function $psi'(z)$ the special Taylor expansion up to order
  #source(93) $gamma$ (see @ss:special-taylor[subsection]). This gives
  $
    tilde(psi)_delta (rho[S]) & = sum_(k = 1)^n mat(
                                  delim: "[",
                                  align: #left,
                                  sum_(sigma + tau < gamma_k)
                                  integral_([0, 2 pi)^n) rho^(-gamma)
                                  e^(-i gamma theta) rho_j e^(-i theta_j);
                                  quad times rho_k^(sigma + tau)
                                  e^(i(sigma - tau) theta_k) rho_(s + 1)
                                  dots.c rho_n nu_delta^* (g_(sigma tau)^k)
                                  d theta
                                ) \
                              & quad + integral_([0, 2 pi)^n) rho^(-gamma)
                                e^(-i gamma theta) rho_j e^(-i theta_j)
                                rho_(s + 1) dots.c rho_n nu_delta^* (Psi')
                                d theta \
                              & = sum I_(sigma tau)^k + I'.
  $
  Each integral $I_(sigma tau)^k$ can be written in the form
  $
    integral_([0, 2 pi)^n) rho^a e^(i b theta)
    nu_delta^* (g_(sigma tau)^k (z[k])) d theta, wide a, b in ZZ^n,
  $
  where $b_k = -gamma_k + sigma - tau$ if $j != k$, and
  $b_k = -gamma_k - 1 + sigma - tau$ if $j = k$. In both cases $b_k < 0$, so by
  Lemma~@lem:fiber-integral of @ss:existence-continuity[subsection] the
  integrals $I_(sigma tau)^k$ vanish. Moreover, $I' = sum I'_(mu nu)$, where
  each integral $I'_(mu nu)$ can be written as follows:
  $
    I'_(mu nu) = rho_j integral_([0, 2 pi)^n) rho^(mu + nu - gamma)
    rho_(s + 1) dots.c rho_n e^(i b theta) nu_delta^* (psi'_(mu nu)) d theta,
  $
  where $b in ZZ^n$, and $mu + nu = gamma$. Since
  $sup_scr(B) |psi'_(mu nu)| := M_(mu nu) < infinity$, we have
  $
    |I'| <= Sigma |I'_(mu nu)| <= rho_j (2 pi)^n Sigma M_(mu nu),
  $
  so $I' -> 0$ as $delta -> 0$. Since $|I[W_delta](tilde(psi)_delta)|
  <= I[scr(B)^+ [S]](|tilde(psi)_delta|) = I[scr(B)^+ [S]](|I'|)$, the lemma is
  proved.
]

Finally, we prove that $R_(I, J)^gamma$ has bidimension $(n, n - s)$. Let
$psi = psi(z) d z_A and d overline(z)_(S without A) and d z[S]
and overline(d z)[S]$ (we observe that according to Lemma~@lem:vanishing-forms
of @ss:existence-continuity[subsection], $R_(I, J)^gamma$ can be nonzero only on
forms of the given type). The form $psi$ has bidegree $(n, n - s)$ only in the
case when $A = S$. If $A != S$, then $Phi$ contains a factor $overline(z)_j$,
$j in S$, and by the lemma
$R_(I, J)^gamma (psi) = I[W_delta](tilde(psi)_delta) = 0$. We have thus proved
that the current $R_(I, J)^gamma$ has bidimension $(n, n - s)$, and we have also
completed the proof of the theorem.
