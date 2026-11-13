#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

== Proof of the main theorem <sec:main-theorem>

The aim of this section is the proof of the main theorem, stated in
@sec:main-facts. By means of resolution of singularities the general case will
be reduced to the case of normal intersections, to which we apply the results of
the previous section.

#subsection[Proof of the general part of the main theorem] <ss:general-part>
We recall that we are considering a complex analytic subset $W$ of pure
dimension $n$ of a complex analytic manifold $X$. With a given holomorphic
mapping #source(94)
$
  f = (f_1, ..., f_p): W -> CC^p
$
we associate a semianalytic chain (tube)
$T_(I, J)^delta = T_(I, J)^(epsilon(delta)) (f)$, where $epsilon(delta)$ is an
admissible path in $RR_>^p$.

Here we prove the first (general) part of the main theorem: _the functional
$R_I P_J$ defined by_
$
  R_I P_J (psi) = lim_(delta -> 0) I[T_(I, J)^delta](psi \/ f_1 dots.c f_p),
  wide psi in scr(D)^(2n - abs(I)) (X),
$ <eq:general-limit>
_exists, does not depend on the choice of admissible path $epsilon(delta)$, and
is a current of bidimension $(n, n - abs(I))$._

We observe that this assertion has local character: it is sufficient to prove it
for forms $psi$ with supports in arbitrarily small neighborhoods
$scr(U) subset X$ of points $x in W$. Let us fix a point $x^0 in W$ and choose a
holomorphic function $phi$ in some neighborhood $scr(U) subset X$ of $x^0$ that
is not identically zero on each irreducible component of the germ of $W$ at
$x^0$ and equal to zero on the set of singular points of this germ. If necessary
we reduce the neighborhood of $scr(U)$ so that the analytic set
$A = {x in scr(U) inter W: (phi dot f_1 dots.c f_p)(x) = 0}$ admits a resolution
to normal form (see @ss:resolution) and $scr(U) relcomp X$. Let
$pi: tilde(W) -> scr(U) inter W$ be a resolving mapping, that is, a proper
mapping of the $n$-dimensional manifold $tilde(W)$ that induces an isomorphism
$pi: tilde(W) without pi^(-1) (A) -> scr(U) inter W without A$, and the inverse
image $pi^(-1) (A)$ has a normal intersection in $tilde(W)$. This means that for
each point $y in tilde(W)$ there is a neighborhood $scr(V)_y$ and local
coordinates $w = (w_1, ..., w_n)$, $w(y) = 0$, for which
$
  f_j^* (w) := (f_j compose pi)(w) = u_j (w) w^(alpha_j), wide alpha_j in NN^n,
$ <eq:normal-form>
where the $u_j$ are holomorphic nonvanishing functions in $scr(V)_y$. For
convenience we shall assume that such a neighborhood contains the closure of the
unit polydisk $scr(B)$ with center at $y$ (it is possible to achieve this by
changing the scale). Since the mapping $pi$ is proper, the inverse image
$pi^(-1) (overline(scr(U)) inter W)$ is compact in $tilde(W)$, and so it can be
covered by finitely many polydisks $scr(B)_1, ..., scr(B)_N$ in which
@eq:normal-form is satisfied. Thus, in each polydisk $scr(B)_k$ the integrand
$psi \/ f_1 dots.c f_p$ from @eq:general-limit satisfies
$
  pi^* (psi \/ f_1 dots.c f_p)
  = pi^* (psi) \/ u_1 w^(alpha_1) dots.c u_p w^(alpha_p)
$ <eq:pullback>
(for brevity we denote the local coordinates in each polydisk $scr(B)_k$ by the
one letter $w$).

We now examine the integration set $T_(I, J)^delta (f)$ in @eq:general-limit. We
observe that according to Lemma~@lem:rank-deficient of @ss:tube-parametrization
for any $k$ from 1 to $N$ the sets $T_(I, J)^delta (f^*) inter scr(B)_k$ (here
$f^*$ has the form @eq:normal-form, that is, $f_j^* = u_j w^(alpha_j)$) are
empty for sufficiently small $delta$ if the rows $alpha_i$, $i in I$, are
linearly dependent. On the other hand, by Lemma~@lem:tube-parametrization of
@ss:tube-parametrization this set has real dimension $2n - abs(I)$ if the rows
$alpha_i$, $i in I$, are linearly independent. Hence it follows that the set
$T_(I, J)^delta (f^*) inter pi^(-1) {phi = 0}$, and consequently also its image
$T_(I, J)^delta (f) inter {phi = 0}$, both have real dimension #source(95)
$<= 2n - abs(I) - 2$ for small $delta$. Taking account of the fact that in
@eq:general-limit the form $psi$ has degree $2n - abs(I)$, for the limit
@eq:general-limit we obtain
$
  R_I P_J (psi) = lim_(delta -> 0) I[T_(I, J)^delta (f) inter {phi != 0}](
    psi \/ f_1 dots.c f_p
  ).
$ <eq:general-limit-phi>
#new-par
Let ${eta_k}$ be a smooth partition of unity subordinate to the covering
${scr(B)_k}_(k = 1, ..., N)$ of the set $pi^(-1) (overline(scr(U)) inter W)$.
Since the mapping $pi^(-1)$ is defined and one-to-one on
$T_(I, J)^delta (f) inter {phi != 0}$, from @eq:general-limit-phi and
@eq:pullback we obtain
$
  R_I P_J (psi) & = lim_(delta -> 0) I[pi^(-1) (
                      T_(I, J)^delta (f) inter {phi != 0}
                    )](pi^* (psi \/ f_1 dots.c f_p)) \
                & = sum_(k = 1)^N lim_(delta -> 0)
                  integral_(T_(I, J)^delta (f^*) inter scr(B)_k)
                  eta_k pi^* (psi) \/ u_1 w^(alpha_1) dots.c u_p w^(alpha_p).
$ <eq:general-sum>
To each term of the latter sum we apply the results of the previous section for
the case of normal intersections. According to these results the limit
@eq:general-limit exists and does not depend on the choice of admissible path
$epsilon(delta)$. Moreover, this limit depends continuously on
$eta_k pi^* (psi)$ with respect to the seminorms #room[$p_(alpha beta)^K$],
$K relcomp scr(B)_k$, and consequently on $psi$ with respect to the seminorms
#room[$p_(alpha beta)^K$], $K relcomp scr(U)$ (the latter follows from the
arguments of @ss:main-theorem and the fact that $p_(alpha beta)^K (psi(z))$ is
expressed by the rules of differentiation of a composite function in terms of
$p_(gamma delta)^(pi^(-1) (K)) (pi^* (psi))$ and the derivatives of the mapping
$z = pi(w)$). Since the form $eta_k pi^* (psi)$ has the same bidegree as $psi$,
we obtain the assertion about the bidimension of the current $R_I P_J$.

#subsection[Representation of the principal value by the iterated limit]
<ss:iterated-limit>
We prove property (5) of the main theorem, which consists of the equality
$
  lim_(delta -> 0) integral_(T_(I, J)^(epsilon(delta)))
  psi \/ f_1 dots.c f_p
  = lim_(epsilon_p -> 0) lim_(delta -> 0)
  integral_(T_(I, J)^(epsilon'(delta), epsilon_p)) psi \/ f_1 dots.c f_p,
$ <eq:iterated-limit>
where $epsilon(delta)$ is an admissible path in $RR_>^p$,
$epsilon'(delta) = (epsilon_1 (delta), ..., epsilon_(p - 1) (delta))$,
$I = {1, ..., p - 1}$. According to @eq:general-sum of
@ss:general-part[subsection] it is sufficient to prove this property for the
case of normal intersections, that is, for the case of a mapping
$f: scr(B) -> CC^p$ of the unit polydisk $scr(B) subset CC^n$ having the form
$f_j = u_j z^(alpha_j)$, $j = 1, ..., p$, where the $u_j$ are invertible
functions holomorphic in $scr(B)$. Let us turn to formula @eq:w-integral of
@ss:existence-continuity, according to which our problem reduces to establishing
that
$
  lim_(delta -> 0) integral_(W_delta) tilde(psi)_delta
  = lim_(epsilon_p -> 0) lim_(delta -> 0)
  integral_(W_(epsilon'(delta), epsilon_p)) tilde(psi)_delta .
$ <eq:iterated-reduced>
Here $W_delta$ is defined by formula @eq:w-delta of @ss:tube-parametrization,
$W_(epsilon'(delta), epsilon_p)$ by the same formula with $epsilon_p (delta)$
replaced by $epsilon_p$, which does not depend on $delta$, and the
$tilde(psi)_delta$ are the integrals @eq:psi-tilde of @ss:existence-continuity
over the fibers $[0, 2 pi)^n$. Taking account of the uniform boundedness and
pointwise convergence of the sequence $tilde(psi)_delta$ (see #source(
  96,
)@ss:existence-continuity, step 5), and also the fact that the sequences of
Lebesgue $(n - s)$-measures $m(W_(epsilon'(delta), epsilon_p))$ for each fixed
$epsilon_p$ have one of three possible limits $gamma_(epsilon_p)$ (see
Lemma~@lem:tube-measure of @ss:tube-parametrization), we have
$
  lim_(epsilon_p -> 0) lim_(delta -> 0)
  integral_(W_(epsilon'(delta), epsilon_p)) tilde(psi)_delta
  = lim_(epsilon_p -> 0) cases(
    0\, & gamma_(epsilon_p) = 0\,,
    integral_(scr(B)^+ [S]) tilde(psi)_0\, quad & gamma_(epsilon_p) = 1\,,
    integral_(Gamma_(epsilon_p)) tilde(psi)_0\,
    & gamma_(epsilon_p) = m(Gamma_(epsilon_p))\,,
  )
$ <eq:three-limits>
where $tilde(psi)_0$ is the limit function of the sequence $tilde(psi)_delta$,
and $Gamma_(epsilon_p)$ is the subset of the unit cube
$scr(B)^+ [S] subset RR_+^(n - s)$ defined by the inequality
$rho[S]^(beta'_q) > epsilon_p$. In the first case, when $gamma_(epsilon_p) = 0$,
the repeated limit of the sequence of measures
$
  lim_(epsilon_p -> 0) lim_(delta -> 0) m(W_(epsilon'(delta), epsilon_p))
$ <eq:repeated-measure>
is equal to zero, and in the other two cases it is equal to one. At the same
time, in the first case the repeated limit of the integrals in @eq:three-limits
is equal to zero, and in the other two cases it is equal to
$integral_(scr(B)^+ [S]) tilde(psi)_0$. Since the repeated limit of measures in
@eq:repeated-measure is equal to the limit of the sequence of measures
$m(W_delta)$ (see Lemma~@lem:tube-measure of @ss:tube-parametrization), from
@eq:limit-zero and @eq:limit-cube of @ss:existence-continuity we obtain the
required equality @eq:iterated-reduced.

#subsection[The actions of the operators $d$ and $dbar$ on principal values]
<ss:operators>
Here we prove property (4) of the main theorem. In accordance with
@ss:main-theorem, for a semimeromorphic differential form $lambda$ on $X$ that
has poles on the hypersurfaces ${f_j = 0}_(j = 1, ..., p)$ there is defined a
current $R_I P_J [lambda]$ that acts according to the rule
$R_I P_J [lambda](psi) = R_I P_J (lambda and psi)$.

#proposition[
  Let $I$ be the set of indices from 1 to $p$. For an arbitrary $j in I$ we put
  $I' = I without {j}$. Then
  $
    (-1)^(j + p + 1) d R_(I') P_({j}) [lambda]
    + (-1)^j R_(I') P_({j}) [d lambda] = R_I [lambda].
  $ <eq:d-principal>
  In particular, when $lambda = 1 \/ f_1 dots.c f_p$, it follows that
  $
    (-1)^(j + p + 1) dbar R_(I') P_({j}) = R_I;
  $ <eq:dbar-principal>
  thus, the current $R_f := R_I$ is $dbar$-closed.
] <prop:d-principal>

#proof[
  The boundary of the tube $T_(I', {j})^delta$ specified by the intersection of
  semianalytic chains (see @ss:semianalytic-intersection)
  $
    & {|f_1| = epsilon_1} dots.c {|f_j| > epsilon_j} dots.c
      {|f_p| = epsilon_p} \
    & quad = {|f_j| > epsilon_j} dot {|f_1| = epsilon_1} dots.c [j] dots.c
      {|f_p| = epsilon_p},
  $
  is equal to
  $
    partial T_(I', {j})^delta & = -{|f_j| = epsilon_j} dot {|f_1| = epsilon_1}
                                dots.c [j] dots.c {|f_p| = epsilon_p} \
                              & = (-1)^j T_(I, emptyset)^delta .
  $
  #source(97)Hence by Stokes' formula (@ss:stokes) we have
  $
    (-1)^j I[T_(I, emptyset)^delta](lambda and psi)
    & = I[partial T_(I', {j})^delta](lambda and psi) \
    & = I[T_(I', {j})^delta](d lambda and psi + (-1)^q lambda and d psi),
  $
  where $q = deg lambda$. Going over to the limit as
  $epsilon = epsilon(delta) -> 0$ we obtain
  $
    (-1)^j R_I (lambda and psi) = R_(I') P_({j}) (d lambda and psi)
    + (-1)^q R_(I') P_({j}) (lambda and d psi).
  $
  Since the degree of the form $d psi$ is equal to $2n - p - q + 1$, the last
  term is equal (see @ss:currents) to
  $(-1)^(p + 1) d R_(I') P_({j}) [lambda](psi)$, and formula @eq:d-principal is
  proved. Formula @eq:dbar-principal follows from @eq:d-principal and the fact
  proved in @ss:general-part[subsection] that the bidimension of the current
  $R_I P_J$ is equal to $(n, n - abs(I))$.
]

#subsection[On the supports of currents in the case of normal intersections]
<ss:supports-normal>
In this subsection we prove property (6) of the main theorem on the supports of
the $p$-residue of $R_f$ and the $(p - 1)$-residue of the principal value
$R_(f') P_(f_p)$ for the case of normal intersections. Clearly, the support of
the current $R_I P_J$ lies in a set $frak(S) = frak(S)_(I, J) (f)$ to which the
tube $T_(I, J)^delta$ "tends" as $delta -> 0$. More precisely, we define the set
$frak(S)$#notation-mark($frak(S)$, sort: "~s") as the totality of points
$x in W$, each neighborhood of which has nonempty intersection with
$T_(I, J)^delta$ for all sufficiently small $delta$; here we assume that the
vector-valued function $epsilon(delta)$ that takes part in the definition of the
tube $T_(I, J)^delta = T_(I, J)^(epsilon(delta)) (f)$ is an admissible path.

We shall consider the sets $frak(S) = frak(S)_(I, J) (f)$ only for the cases
corresponding to the $p$-residue ($J = emptyset$) and the $(p - 1)$-residue of
the principal value ($J = {p}$). For these cases we introduce the special
notation
$
  tilde(frak(S)) (f) = frak(S)_({1, ..., p - 1}, {p}) (f),
  wide frak(S) (f) = frak(S)_({1, ..., p}, emptyset) (f).
$
#new-par
We now describe the sets $tilde(frak(S)) (f)$#notation-mark(
  $tilde(frak(S))$,
  sort: "~s~",
) and $frak(S) (f)$ on the assumption that the set of zeros
${f_1 dots.c f_p = 0}$ has only normal intersections; the general case will be
considered in @ss:supports-general[subsection]. It turns out that the sets
$tilde(frak(S))$ and $frak(S)$ coincide with the essential intersections of the
hypersurfaces ${f_j = 0}$, $j = 1, ..., p$. We recall that the notation $V(phi)$
is used for the set of zeros of the function $phi$, and $f'$ is used for the
"shortening" $(f_1, ..., f_(p - 1))$ of the mapping $f = (f_1, ..., f_p)$.
Moreover, it is convenient to denote the tube
$T_(I, emptyset)^(epsilon(delta)) (f)$ by $T^(epsilon(delta))$ and the tube
$T_({1, ..., p - 1}, {p})^(epsilon(delta)) (f)$ by $D^(epsilon(delta))$.

#proposition[
  Let $W$ be a complex analytic manifold of dimension $n$, and let
  $f = (f_1, ..., f_p): W -> CC^p$ be a holomorphic mapping for which the set of
  zeros $V(f_1, ..., f_p)$ has only normal intersections. Then the sets
  $tilde(frak(S)) (f)$ and $frak(S) (f)$ are complex analytic sets in $W$ that
  satisfy the properties

  #roman-text[(a)] $tilde(frak(S)) (f)$ is equal to the union of irreducible
  components of the set $frak(S) (f')$ that are not contained in $V(f_p)$;

  #roman-text[(b)] $frak(S) (f) = tilde(frak(S)) (f) inter V(f_p)$.
] <prop:supports-normal>

#source(98)Before proving the proposition, we introduce some notation and
definitions. Let $M_(p, n) (NN)$ be the set of $(p times n)$-matrices with
elements from the set of natural numbers $NN$. For a matrix
$alpha in M_(p, n) (NN)$ we denote its rows by $alpha_j$; if
$A subset {1, ..., n}$, then $alpha_A$ denotes the matrix consisting of the
columns of the matrix $alpha$ with indices $j in A$, and by $alpha_A [p]$ we
denote the matrix obtained from $alpha_A$ by removing the $p$th row. If
$|A| = p$, then we say that the square matrix $alpha_A$ is normal if it is
nonsingular and by a permutation of the columns it goes over to an upper
triangular matrix, and we say that the $(p times (p - 1))$-matrix $alpha_A$ is
normal if the square matrix $alpha_A [p]$ in it is normal and the last (the
$p$th) row is zero. Finally, for a unit polydisk $scr(B) subset CC^n$ we put
$P_A = {z in scr(B): z_i = 0, i in A}$ with the natural proviso that
$P_emptyset = scr(B)$.

The proof of the proposition will be based on the following lemma.

#lemma[
  Let $alpha in M_(p, n) (NN)$ and let
  $f = (z^(alpha_1), ..., z^(alpha_p)): scr(B) -> CC^p$ be a mapping of the unit
  polydisk $scr(B) subset CC^n$. Then

  #roman-text[(a)]
  $tilde(frak(S)) (f) = union.big{P_A: |A| = p - 1, alpha_A "is normal"}$;

  #roman-text[(b)]
  $frak(S) (f') = union.big{P_A: |A| = p - 1, alpha_A [p] "is normal"}$.
] <lem:monomial-supports>

#proof[
  (a) If $p = 1$, then in the equality (a) both sides are equal to $scr(B)$,
  that is, the assertion is true. Suppose that $1 < p <= n$. We denote the set
  on the left-hand side of (a) by $L$, and the set on the right by $R$. We first
  prove that $L subset R$. Let $x in L$ and let $M = M_x = {i: x_i = 0}$ be the
  set of indices in ${1, ..., n}$ for which the corresponding coordinates of the
  point $x$ are equal to zero. Suppose that $x in.not R$. This implies that
  there is no subset $A subset M$ such that $|A| = p - 1$ and $alpha_A$ is
  normal. It is not difficult to see that in such a case at least one of the
  sets
  $
    I_k = {j in M: alpha_(k j) > 0,
      alpha_(k + 1, j) = dots.c = alpha_(p j) = 0},
    wide k = 1, ..., p - 1,
  $
  say $I_r$, is empty, that is, for all $j in M$ either $alpha_(r j) = 0$ or at
  least one of the numbers $alpha_(r + 1, j), ..., alpha_(p, j)$ is positive.
  Consequently, there are positive integers $k_(r + 1), ..., k_p$ such that
  $
    alpha_(r j) <= k_(r + 1) alpha_(r + 1, j) + dots.c + k_p alpha_(p j),
    wide j in M.
  $ <eq:k-combination>
  We now recall that the points $z$ of the set $D^(epsilon(delta))$ satisfy the
  relations
  $
    |z_M^(alpha_i)| = epsilon_i (delta) \/ abs(z[M]^(alpha_i)), quad
    i = 1, ..., p - 1, quad
    |z_M^(alpha_p)| > epsilon_p (delta) \/ abs(z[M]^(alpha_p)).
  $
  Therefore, in view of @eq:k-combination, on $D^(epsilon(delta))$ we have
  $
    epsilon_r (delta) \/ abs(z[M]^(alpha_r))
    & = |z_M^(alpha_r)|
    >= |z_M^(k_(r + 1) alpha_(r + 1) + dots.c + k_p alpha_p)| \
    & > (frac(epsilon_(r + 1) (delta), |z[M]^(alpha_(r + 1))|))^(k_(r + 1))
    dots.c (frac(epsilon_p (delta), |z[M]^(alpha_p)|))^(k_p)
  $
  #source(99)or
  $
    epsilon_r epsilon_(r + 1)^(-k_(r + 1)) dots.c epsilon_p^(-k_p)
    > |z[M]^(alpha_r - k_(r + 1) alpha_(r + 1) - dots.c - k_p alpha_p)|.
  $ <eq:epsilon-bound>
  The right-hand side of @eq:epsilon-bound is greater than zero for $z = x$ and
  so by continuity it is greater than some $c > 0$ for all $z$ from some
  neighborhood $scr(U)$ of the point $x$. By the admissibility of the path
  $epsilon(delta)$, the left-hand side of @eq:epsilon-bound tends to zero as
  $delta -> 0$, so we conclude that
  $|D^(epsilon(delta))| inter scr(U) = emptyset$ for sufficiently small $delta$.
  This contradicts the fact that $x in L = tilde(frak(S)) (f)$.

  Let us prove the reverse inclusion $R subset L$. Let $x in R$, that is,
  $x in P_A$ for some $A subset {1, ..., n}$ such that $|A| = p - 1$ and
  $alpha_A$ is a normal matrix. By a permutation of the columns of the matrix
  $alpha$ (that is, by renumbering the variables $z_j$) we can arrange that $A$
  coincides with the set ${1, ..., p - 1}$ and $alpha_A [p]$ is an upper
  triangular matrix, as a result of which $D^(epsilon(delta)) (f)$ is defined by
  the relations
  $
    |z_i^(alpha_(i i)) dots.c z_(p - 1)^(alpha_(i p - 1))|
    = epsilon_i (delta) \/ abs(z[A]^(alpha_i)), wide i = 1, ..., p - 1, \
    |z^(alpha_p)| = |z[A]^(alpha_p)| > epsilon_p (delta).
  $
  Clearly, $D^(epsilon(delta)) (f) = union.big V_w$, where $V_w$ is defined by
  the relations
  $
    z_i^(alpha_(i i)) dots.c z_(p - 1)^(alpha_(i p - 1))
    = w_i \/ z[A]^(alpha_i), wide i = 1, ..., p - 1,
  $ <eq:fiber-equations>
  $
    |z[A]^(alpha_p)| > epsilon_p (delta),
  $ <eq:fiber-inequality>
  and $w = (w_1, ..., w_p)$ runs through the distinguished boundary
  ${w: |w_j| = epsilon_j (delta), j = 1, ..., p}$. The system
  @eq:fiber-equations becomes
  $
    z_i^Delta = w_i^(Delta_(i i)) dots.c w_(p - 1)^(Delta_(p - 1 i))
    \/ z[A]^(beta_i), wide i = 1, ..., p - 1,
  $ <eq:fiber-solved>
  where $Delta$ is the determinant of the matrix $alpha_A [p]$, and the
  $Delta_(j k)$ are the cofactors of the elements of this matrix.

  Now let $scr(U)_r$ be an arbitrary neighborhood of the point $x$ of the form
  ${z: norm(z - x) < r}$. In $scr(U)_r$ we choose a point $y$ such that
  $y_p dots.c y_n != 0$. Since $Delta_(i i) > 0$ and $epsilon(delta)$ is an
  admissible path, there is a $delta_0 > 0$ such that when
  $0 < delta < delta_0$
  $
    (epsilon_i (delta)^(Delta_(i i)) dots.c
      epsilon_(p - 1) (delta)^(Delta_(p - 1 i))
      \/ abs(y[A])^(beta_i))^(1 \/ Delta) < r,
    wide i = 1, ..., p - 1,
  $ <eq:small-radius>
  $
    |y[A]^(alpha_p)| > epsilon_p (delta).
  $ <eq:y-inequality>
  We set $zeta = (zeta_A, zeta[A])$, where $zeta[A] = y[A]$, and $zeta_A$ is one
  of the solutions of the system @eq:fiber-equations (equivalent to the system
  @eq:fiber-solved) when $z[A] = y[A]$. In view of @eq:fiber-solved and
  @eq:small-radius we have $|zeta_i - x_i| = |zeta_i| < r$, $i = 1, ..., p - 1$,
  so from the inclusion $y in scr(U)_r$ it follows that $zeta in scr(U)_r$. It
  remains to observe that with @eq:fiber-solved and @eq:y-inequality taken into
  account the point $zeta$ satisfies the relations @eq:fiber-equations and
  @eq:fiber-inequality, so $zeta in |D^(epsilon(delta))|$. Since $r$ is
  arbitrary, we conclude that $x in L = tilde(frak(S)) (f)$.

  #source(100)Equality (b) follows from (a) if we put $alpha_p = 0$: in this
  case for sufficiently small $delta$ we have
  $|D^(epsilon(delta)) (f)| = |T^(epsilon'(delta)) (f')|$, where
  $epsilon' = (epsilon_1, ..., epsilon_(p - 1))$, so
  $tilde(frak(S)) (f) = frak(S) (f')$; at the same time, $alpha_A$ and
  $alpha_A [p]$ are simultaneously normal.
]

#proof(title: [Proof of the proposition.])[
  By hypothesis, for each point $x in W$ there is a coordinate neighborhood
  $(scr(U), z)$ with center at $x$ in which
  $
    f_i|_(scr(U)) = u_i (z) z^(alpha_i), wide i = 1, ..., p,
  $
  where functions $u_i$ are holomorphic and invertible in $scr(U)$, and
  $alpha_i in NN^n$. We choose the scale so that the neighborhood $scr(U)$
  contains the closure of the unit polydisk $scr(B) = {z: norm(z) < 1}$.
  Suppose, as before, that $alpha in M_(p, n) (NN)$ is a matrix with rows
  $alpha_i$. We first show that the sets $tilde(frak(S)) (f)$ and $frak(S) (f)$
  are locally determined by the factors $z^(alpha_i)$ and do not depend on the
  invertible factors $u_i$, and the dependence on the $z^(alpha_i)$ is as in the
  lemma. In other words, we show that there is a neighborhood
  $tilde(scr(B)) subset scr(B)$ of the origin $z = 0$ with the properties
  $
    frak(S) (f') inter tilde(scr(B)) = union.big{P_A inter tilde(scr(B)):
      |A| = p - 1, alpha_A [p] "is normal"},
  $ <eq:local-s-prime>
  $
    tilde(frak(S)) (f) inter tilde(scr(B)) = union.big{
      P_A inter tilde(scr(B)): |A| = p - 1, alpha_A "is normal"
    },
  $ <eq:local-s-tilde>
  $
    frak(S) (f) inter tilde(scr(B)) = union.big{P_A inter tilde(scr(B)):
      |A| = p, alpha_A "is normal"}.
  $ <eq:local-s>
  #new-par
  These equalities are obviously satisfied if $rank alpha[p] < p - 1$, since
  according to the definition of the sets $tilde(frak(S))$, $frak(S)$ and
  Lemma~@lem:rank-deficient of @ss:tube-parametrization all of the sets are
  empty in this case. We therefore assume that $rank alpha[p] = p - 1$, and that
  for definiteness $det alpha_A [p] != 0$, where $A = {1, ..., p - 1}$. In this
  case, following @ss:existence-continuity (see step 1) we can construct a
  biholomorphic mapping $mu: tilde(scr(B))_1 -> scr(B)$ of the form
  $w = mu(z) = (z_1 v_1 (z), ..., z_(p - 1) v_(p - 1) (z), z_p, ..., z_n)$,
  where the $v_j$ are functions invertible in $tilde(scr(B))_1$, and
  $
    (f' compose mu^(-1))(w) = (w^(alpha_1), ..., w^(alpha_(p - 1))).
  $
  By the lemma we have proved
  $
    frak(S) (w^(alpha_1), ..., w^(alpha_(p - 1)))
    = union.big{P_A: |A| = p - 1, alpha_A [p] "is normal"}.
  $
  Going over to the inverse images with respect to the mapping $mu$ in this
  equality, we obtain
  $
    frak(S) (f') & = mu^(-1) [frak(S) (w^(alpha_1), ..., w^(alpha_(p - 1)))] \
                 & = union.big{P_A inter tilde(scr(B))_1: |A| = p - 1,
                     alpha_A [p] "is normal"}
  $
  (here we have used the form of the mapping $mu$, according to which the pieces
  of the complex planes $P_A inter tilde(scr(B))_1$ are mapped onto $P_A$). Thus
  in the notation $tilde(scr(B)) = tilde(scr(B))_1$ we have proved the equality
  @eq:local-s-prime.

  #source(101)If $rank alpha = p$, then in exactly the same way we can prove the
  existence of a neighborhood $tilde(scr(B))_2$ in which @eq:local-s-tilde and
  @eq:local-s are satisfied. Putting
  $tilde(scr(B)) = tilde(scr(B))_1 inter tilde(scr(B))_2$, we obtain
  @eq:local-s-prime–@eq:local-s.

  If $rank alpha = p - 1$, we consider two cases: $alpha_p != 0$ and
  $alpha_p = 0$. In the first case, according to Lemma~@lem:rank-deficient in
  @ss:tube-parametrization, the sets $|T^(epsilon(delta)) (f)| inter scr(B)$ and
  $|D^(epsilon(delta)) (f)| inter scr(B)$ are empty if $delta$ is sufficiently
  small. Consequently, when $tilde(scr(B)) = scr(B)$ the sets on the left-hand
  sides of @eq:local-s-tilde and @eq:local-s are empty. In view of the condition
  $rank alpha = p - 1$, the set on the right-hand side of @eq:local-s is also
  empty. It is not difficult to see that the set on the right-hand side of
  @eq:local-s-tilde is also empty: in fact, in the presence of a normal matrix
  $alpha_A$ the determinant $det alpha_A [p] != 0$ and $alpha_(p i) = 0$,
  $i in A$; consequently, $alpha_(p j) != 0$ for some $j in.not A$; hence
  $det alpha_(A union {j}) != 0$, which is impossible in view of the condition
  $rank alpha = p - 1$.

  In the case $alpha_p = 0$ both sides of @eq:local-s are empty sets if
  $tilde(scr(B)) = scr(B)$. In addition, for sufficiently small $delta$ the
  tubes $|D^(epsilon(delta)) (f)| inter scr(B)$ and
  $|T^(epsilon'(delta)) (f')| inter scr(B)$ coincide, and so
  $tilde(frak(S)) (f) inter scr(B) = frak(S) (f') inter scr(B)$. As a result the
  equality @eq:local-s-tilde reduces to @eq:local-s-prime when
  $tilde(scr(B)) = tilde(scr(B))_1$. This completes the proof of
  @eq:local-s-prime–@eq:local-s and the fact that in the case of normal
  intersections $tilde(frak(S)) (f)$ and $frak(S) (f)$ are analytic sets.

  Let us prove property (a) of the proposition. We first observe that in view of
  the inclusion of tubes
  $|D^(epsilon(delta)) (f)| subset |T^(epsilon'(delta)) (f')|$ we have the
  inclusion $tilde(frak(S)) (f) subset frak(S) (f')$. Moreover, from
  @eq:local-s-tilde and @eq:local-s-prime the sets $tilde(frak(S)) (f)$ and
  $frak(S) (f')$ either have pure dimension $n - p + 1$ or are empty. Therefore
  property (a) is equivalent to the fact that any irreducible component
  $Z subset frak(S) (f')$ satisfies the properties

  (i) $Z subset.not V(f_p) => Z subset tilde(frak(S)) (f)$;

  (ii) $Z subset V(f_p) => Z subset.not tilde(frak(S)) (f)$.

  Let us prove these properties.

  (i) Suppose that $Z subset.not V(f_p)$ and that $x$ is a point of $Z$. We
  choose a coordinate neighborhood $tilde(scr(B))$ with center $x$ so that
  @eq:local-s-prime and @eq:local-s-tilde are satisfied in it, and consider
  $A subset {1, ..., n}$ such that $|A| = p - 1$, $alpha_A [p]$ is a normal
  matrix, and $P_A inter tilde(scr(B)) subset Z$. From the condition
  $Z subset.not V(f_p)$ it follows that $alpha_(p i) = 0$ for all $i in A$, and
  this implies that the matrix $alpha_A$ is normal. Therefore, according to
  @eq:local-s-tilde, $P_A inter tilde(scr(B)) subset tilde(frak(S)) (f)$, that
  is, $Z subset tilde(frak(S)) (f)$.

  (ii) Suppose that $Z subset V(f_p)$, $x in Z inter tilde(frak(S)) (f)$, and
  $tilde(scr(B))$ is a coordinate neighborhood of $x$, as before. We again
  consider an $A$ such that $P_A inter tilde(scr(B)) subset Z$, and
  $alpha_A [p]$ is a normal matrix. By hypothesis,
  $P_A inter tilde(scr(B)) subset Z subset V(f_p)$, so $alpha_(p i) != 0$ for
  some $i in A$. Consequently, $alpha_A$ is not normal, and in view of
  @eq:local-s-tilde, $P_A inter tilde(scr(B)) subset.not tilde(frak(S)) (f)$.
  This means that $Z$ does not lie in $tilde(frak(S)) (f)$, and (ii) is proved.

  Property (b) of the proposition is proved in exactly the same way as (i)
  #source(102) and (ii) by using @eq:local-s-tilde and @eq:local-s. This
  completes the proof of the proposition.
]

#subsection[Supports of currents in the general case] <ss:supports-general>
Let us prove property (6) of the main theorem, which says that the supports of
the currents $R_(f') P_(f_p)$ and $R_f$ lie in the essential intersections
$tilde(V)_e (scr(F))$ and $V_e (scr(F))$ of the sequence of hypersurfaces
$scr(F) = {F_1, ..., F_p}$, $F_j = {f_j = 0}$. In
@ss:supports-normal[subsection] we introduced the sets $tilde(frak(S)) (f)$ and
$frak(S) (f)$, which contain the supports of the currents $R_(f') P_(f_p)$ and
$R_f$ respectively. Therefore property (6) of the main theorem will be proved if
we can establish the equalities $tilde(frak(S)) (f) = tilde(V)_e (scr(F))$,
$frak(S) (f) = V_e (scr(F))$.

#theorem[
  For any holomorphic mapping $f = (f_1, ..., f_p): W -> CC^p$ of a purely
  $n$-dimensional analytic set $W$, the sets $tilde(frak(S)) (f)$ and
  $frak(S) (f)$ are complex analytic sets in $W$ that satisfy the properties

  #roman-text[(a)] $tilde(frak(S)) (f)$ is equal to the union of irreducible
  components of $frak(S) (f')$ that are not contained in $V(f_p)$;

  #roman-text[(b)] $frak(S) (f) = tilde(frak(S)) (f) inter V(f_p)$.
] <th:supports-general>

Thus, the sets $tilde(frak(S)) (f)$ and $frak(S) (f)$ are defined in a recurrent
way and coincide with essential intersections of the sequence of hypersurfaces
$
  scr(F) = {{f_j = 0}, j = 1, ..., p}: tilde(frak(S)) (f)
  = tilde(V)_e (scr(F)), frak(S) (f) = V_e (scr(F)).
$

#proof[
  We first observe that for each open subset $W_1 subset W$ we have
  $tilde(frak(S)) (f|_(W_1)) = tilde(frak(S)) (f) inter W_1$,
  $frak(S) (f|_(W_1)) = frak(S) (f) inter W_1$. Therefore it is sufficient to
  prove the assertion of the theorem for the case when $W$ is a neighborhood of
  an arbitrary point $x$ in which there is a resolution $pi: tilde(W) -> W$ of
  singularities of the set $V(f_1 dots.c f_p dot phi)$ to normal form (here
  $phi$ is a function holomorphic on $W$ whose set of zeros $V(phi)$ contains
  all singular points of $W$ and does not contain an irreducible component of
  $W$). Thus, for the functions $f_j^* = f_j compose pi$ the set
  $V(f_1^* dots.c f_p^*)$ has only a normal intersection in $tilde(W)$, so the
  results of @ss:supports-normal[subsection] can be applied to the mapping
  $f^*: tilde(W) -> CC^p$. In order to use these results, we prove the
  equalities
  $
    pi[frak(S) (f^*)] = frak(S) (f),
    wide pi[tilde(frak(S)) (f^*)] = tilde(frak(S)) (f).
  $ <eq:image-supports>
  Suppose that $z in frak(S) (f)$. Then there are sequences ${z_k}$ in $W$ and
  ${delta_k}$ in $RR_>$ such that $z_k -> z$, $delta_k -> 0$, and
  $z_k in |T^(epsilon(delta_k)) (f)|$ for any $k$ (we recall that
  $T^(epsilon(delta)) (f) = T_(I, emptyset)^(epsilon(delta)) (f)$). Since the
  mapping $pi$ is proper, the inverse image of the compact set ${z_k} union {z}$
  is compact, so there is a sequence $w_m in pi^(-1) {z_(k_m)}$ that converges
  to some element $w in tilde(W)$. Since $pi$ is continuous, $pi(w)$ is equal to
  $z$. In addition, by construction $w_m in |T^(epsilon(delta_(k_m))) (f^*)|$,
  so $w in frak(S) (f^*)$. As a result we have shown that
  $frak(S) (f) subset pi[frak(S) (f^*)]$. The reverse inclusion is obvious, and
  the first equality in @eq:image-supports is proved. The second equality is
  proved in exactly the same way.

  #source(103)The equalities @eq:image-supports together with the result of the
  proposition of @ss:supports-normal[subsection] and Remmert's theorem show that
  $tilde(frak(S)) (f)$ and $frak(S) (f)$ are complex analytic sets.

  Let us prove property (a) of the theorem. We denote by $V_1$ the union of the
  irreducible components of the set $frak(S) (f_1^*, ..., f_(p - 1)^*)$ that are
  contained in $V(f_p^*)$. Then by the proposition of
  @ss:supports-normal[subsection]
  $frak(S) (f'^*) = tilde(frak(S)) (f^*) union V_1$, where
  $f'^* = (f_1^*, ..., f_(p - 1)^*)$. Applying the mapping $pi$ to this
  equality, on the basis of @eq:image-supports we obtain
  $
    frak(S) (f') = tilde(frak(S)) (f) union pi(V_1),
  $ <eq:image-components>
  where $pi(V_1)$ is an analytic set contained in $V(f_p)$. Thus, each
  irreducible component $Z$ of $frak(S) (f')$ is either an irreducible component
  of the set $tilde(frak(S)) (f)$ or lies in $pi(V_1) subset V(f_p)$.
  Consequently, if $Z subset.not V(f_p)$, then $Z subset tilde(frak(S)) (f)$. On
  the other hand, we can show that any irreducible component $Z_1$ of
  $tilde(frak(S)) (f)$ does not lie in $V(f_p)$. Let $x in Z_1$ be a simple
  point in the analytic set $tilde(frak(S)) (f)$. Then there is a neighborhood
  $scr(U)$ of the point $x$ such that
  $tilde(frak(S)) (f) inter scr(U) = Z_1 inter scr(U)$. We set
  $pi_1 := pi|_(pi^(-1) (scr(U))): pi^(-1) (scr(U)) -> scr(U)$ and
  $psi_i := f_i compose pi_1$. According to @eq:image-supports,
  $pi_1 [tilde(frak(S)) (psi)] = tilde(frak(S)) (f) inter scr(U)
  = Z_1 inter scr(U)$. Since we can apply the result of the proposition of
  @ss:supports-normal[subsection] to the mapping $psi$,
  $tilde(frak(S)) (psi) subset.not V(psi_p)$, and so $Z_1 subset.not V(f_p)$.

  We now recall that the set $Z_1$ was chosen as an irreducible component not of
  $frak(S) (f')$, but of $tilde(frak(S)) (f)$. However, since
  $tilde(frak(S)) (f) subset frak(S) (f')$, it is clear that $Z_1$ lies in some
  irreducible component $Z$ of the set $frak(S) (f')$. By hypothesis,
  $Z_1 subset.not V(f_p)$, so $Z subset.not V(f_p)$ also. In this case, by what
  we proved above, $Z subset tilde(frak(S)) (f)$, and necessarily $Z = Z_1$.
  This argument completes the proof of property (a). Property (b) follows from
  its validity in the case of normal intersections:
  $frak(S) (f^*) = tilde(frak(S)) (f^*) inter V(f_p^*)$, and subsequent
  application of the mapping $pi$ with the use of @eq:image-supports:
  $
    frak(S) (f) = pi[frak(S) (f^*)] = pi[tilde(frak(S)) (f^*)]
    inter pi[V(f_p^*)] = tilde(frak(S)) (f) inter V(f_p).
  $
  This completes the proof of the theorem.
]

Since for complete intersections the essential intersections coincide with the
set-theoretical ones, we obtain the following corollary.

#corollary[
  If the hypersurfaces $V(f_i)$, $i = 1, ..., p$, form a complete intersection
  on $W$, then the supports of the currents $R_(f') P_(f_p)$ and $R_f$ lie in
  $V(f_1) inter dots.c inter V(f_(p - 1))$ and
  $V(f_1) inter dots.c inter V(f_p)$ respectively.
] <cor:complete-supports>

#remark[
  In the case when the analytic set $W$ does not have singularities and
  $V(f_j)$, $j = 1, ..., p$, form a complete intersection, we have a stronger
  assertion (see @bib:Coleff1978[p.~45]): _the supports of the currents
  $R_(f') P_(f_p)$ and $R_f$ are equal to the union of certain irreducible
  components of the sets $V(f_1) inter dots.c inter V(f_(p - 1))$ and
  $V(f_1) inter dots.c inter V(f_p)$ respectively._
] <rem:supports-equal>
