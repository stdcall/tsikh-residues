#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

#heading(
  level: 2,
)[Properties of residual currents in the case of complete intersections]
<sec:residual-currents>

#subsection[Equality of the currents $R_(f') P_(f_p) [f_p]$ and $R_(f')$]
<ss:nonpolar-principal-value>
#source(104)The first property we mention here generalizes the following obvious
fact: for any form $psi in scr(D)^(2n) (CC^n)$ and any entire function $f$ we
have
$
  lim_(epsilon -> 0) integral_(abs(f) > epsilon) psi = integral_(CC^n) psi.
$
In other words, the result of integrating the form $psi$ in the sense of
principal value with respect to the hypersurface $F = {f = 0}$ coincides with
the result of the usual integration if $F$ is nonsingular for $psi$. Less
obvious is the question of the equality
$
  lim_(epsilon_1, epsilon_2 -> 0)
  integral_(abs(f_1) = epsilon_1 \ abs(f_2) > epsilon_2) psi \/ f_1
  = lim_(epsilon_1 -> 0) integral_(abs(f_1) = epsilon_1) psi \/ f_1, wide
  psi in scr(D)^(2n - 1) (CC^n),
$
even when $f_1$ and $f_2$ do not have common factors, although as in the
previous case the integrand $psi \/ f_1$ does not have poles on the hypersurface
$F_2 = {f_2 = 0}$. In the notation we have adopted, the latter equality is
written in the form $R_(f_1) P_(f_2) [f_2](psi) = R_(f_1) (psi)$. Let us take up
the proof of equalities of this type.

Let $W$ be a complex analytic subset of pure dimension $n$ in the manifold $X$.
We recall that a holomorphic mapping $f: W -> CC^p$ is said to be a complete
intersection if the set of zeros $f^(-1) (0)$ of this mapping has dimension
$n - p$. Let us fix $j in {1, ..., p}$ and denote the supplementary set
${1, ..., [j], ..., p}$ by $I$.

#proposition[
  Let $f: W -> CC^p$ be a complete intersection. Then we have equality of
  currents $R_I P_({j}) [f_j] = R_I$, that is, for each form
  $psi in scr(D)^(2n - p + 1) (X)$
  $
    & lim_(delta -> 0) I[T_(I, {j})^delta (f)](
        psi \/ f_1 dots.c [j] dots.c f_p
      ) \
    & quad = lim_(delta -> 0) I[T_(I, emptyset)^delta (f)](
        psi \/ f_1 dots.c [j] dots.c f_p
      ).
  $
  In particular, when $j = p$ we obtain $R_(f') P_(f_p) [f_p] = R_(f')$.
] <prop:nonpolar-principal-value>

The assertion we have just stated immediately implies a fact about currents with
respect to a sequence of hypersurfaces (for their definition see
@ss:main-theorem):

#corollary[
  Suppose that the sequence of hypersurfaces $scr(F) = {F_1, ..., F_p}$ forms a
  complete intersection in $W$ and that $scr(F)[j] = {F_1, ..., [j], ..., F_p}$.
  If the semimeromorphic differential form $lambda$ has poles only on
  $union.big scr(F)[j]$, then
  $R_(scr(F)[j]) P_(F_j) [lambda] = R_(scr(F)[j]) [lambda]$, that is, the sign
  of the principal value with respect to the nonpolar hypersurface $F_j$ can be
  omitted.
] <cor:nonpolar-principal-value>

#proof(title: [Proof of the proposition.])[
  According to property (3) of the main theorem it is sufficient to prove the
  required equality $R_I P_({j}) (f_j psi) = R_I (psi)$ for #source(105) forms
  $psi$ of bidegree $(n, n - s)$, where $s = |I| = p - 1$. Moreover, the result
  of the proposition has local character, so we can assume that the support of
  $psi$ is concentrated in a neighborhood $scr(U) subset X$ such that in
  $W inter scr(U)$ the set ${phi(z) f_1 (z) dots.c f_p (z) = 0}$ is resolvable
  to the normal form (here $phi$ is a holomorphic function in $scr(U)$ that is
  equal to zero at singular points of $W$ and not identically equal to zero on
  each irreducible component of $W inter scr(U)$). If
  $pi: tilde(W) -> W inter scr(U)$ is a resolving mapping, then by formula
  @eq:general-sum of @ss:general-part the value of $R_I P_({j}) (f_j psi)$ is
  equal to the sum of finitely many terms of the form
  $
    lim_(delta -> 0) integral_(T_(I, {j})^delta (f^*))
    frac(a(w), w^gamma) pi^* (psi),
  $
  where $f^* = f compose pi$, $w$ are local coordinates on the manifold
  $tilde(W)$, and $a(w) = eta_k \/ u_1 dots.c [j] dots.c u_p$ is a smooth
  function with support from a neighborhood of the point $w = 0$; the mapping
  $f^*$ has coordinates
  $
    f_i^* (w) & = u_i (w) w^(alpha_i), wide i = 1, ..., p, \
      w^gamma & = w^(alpha_1) dots.c [j] dots.c w^(alpha_p).
  $ <eq:resolved-coordinates>
  #new-par
  For $R_I (psi)$ there is an analogous expansion as a sum of finitely many
  terms with $T_(I, {j})^delta$ replaced by $T_(I, emptyset)^delta$ (here and
  everywhere below the tubes are constructed with respect to the mapping $f^*$,
  so the dependence on $f^*$ is omitted). Consequently, taking account of the
  fact that $a(w) pi^* (psi)$ has the form
  $sum (psi_S (w) d w and d overline(w) [S], |S| = p - 1)$, it is sufficient to
  prove that
  $
    lim_(delta -> 0) integral_(T_(I, {j})^delta) omega
    = lim_(delta -> 0) integral_(T_(I, emptyset)^delta) omega,
  $ <eq:tube-limits>
  where $omega = w^(-gamma) psi_S (w) d w and d overline(w) [S]$, $psi_S (w)$ is
  a smooth function with support in some neighborhood $scr(B)$ of the point
  $w = 0$, and $S subset {1, ..., n}$, $|S| = p - 1$. On the basis of
  @ss:existence-continuity (see Step 1) we can assume that in
  @eq:resolved-coordinates all $u_i equiv 1$, and $scr(B)$ is a unit polydisk;
  in addition, for definiteness we shall assume that $S = {1, ..., p - 1}$.

  According to Lemma~@lem:rank-deficient of @ss:tube-parametrization both sides
  of @eq:tube-limits are equal to zero if $det alpha_(I, S) = 0$ (here
  $alpha_(I, S) = (alpha_(i k))_(i in I, k in S)$). We assume that
  $det alpha_(I, S) != 0$. In view of the condition $u_i equiv 1$, to the tubes
  $T_(I, {j})^delta$ and $T_(I, emptyset)^delta$ we can apply
  Lemma~@lem:tube-parametrization of @ss:tube-parametrization about their
  parametrizations:
  $
    nu_delta: [0, 2 pi)^n times W_delta -> T_(I, {j})^delta, wide
    nu_delta: [0, 2 pi)^n times W'_delta -> T_(I, emptyset)^delta,
  $
  where $W_delta$ and $W'_delta$ are open subsets of the unit cube
  $scr(B)[S] subset RR_+^(n - s)$, and $W_delta subset W'_delta$ (we observe
  that the parametrizing mapping $nu_delta$ is the same for both tubes, since
  for any tube $T_(I, J)^delta$ it depends only on the set $I$). The result of
  integration over fibers $[0, 2 pi)^n$ reduces @eq:tube-limits to the equality
  $
    lim_(delta -> 0) integral_(W_delta) tilde(psi)_delta
    = lim_(delta -> 0) integral_(W'_delta) tilde(psi)_delta,
  $ <eq:cube-limits>
  #source(106)where $tilde(psi)_delta = tilde(psi)_delta (rho[S]) d rho[S]$ is
  the form defined by formula @eq:psi-tilde in @ss:existence-continuity.
  According to @ss:existence-continuity (see Step 5) the sequence
  $tilde(psi)_delta$ is uniformly bounded and converges, so @eq:cube-limits
  holds if the Lebesgue $(n - s)$-measures of the sets $W_delta$ and $W'_delta$
  tend to the same limit as $delta -> 0$. Let us consider the situation when
  these limits are different, namely when
  $
    lim_(delta -> 0) m(W_delta) < lim_(delta -> 0) m(W'_delta).
  $ <eq:measure-limits-differ>
  We show that in such a situation both limits in @eq:cube-limits are equal to
  zero. We observe that by Lemma~@lem:tube-measure of @ss:tube-parametrization
  the condition @eq:measure-limits-differ leads to a unique possibility:
  $m(W_delta) -> 0$, $m(W'_delta) -> 1$, hence the left-hand side of
  @eq:cube-limits is equal to zero. Consequently, we need to show that under the
  condition
  @eq:measure-limits-differ
  $
    lim_(delta -> 0) integral_(W'_delta) tilde(psi)_delta = 0.
  $
  We first observe that under the condition @eq:measure-limits-differ
  $alpha_(j k) != 0$ for at least one $k in S = {1, ..., p - 1}$. In fact, on
  the assumption that $alpha_(j k) = 0$, $k in S$, we would have the equality
  $W_delta = {rho[S] in W'_delta: rho[S]^(alpha_j) > epsilon_j}$, hence despite
  @eq:measure-limits-differ
  $
    lim_(delta -> 0) m(W'_delta without W_delta)
    = lim_(delta -> 0) m(scr(B)^+ [S] inter {rho[S]^(alpha_j) < epsilon_j}) = 0.
  $
  Thus, $alpha_(j r) != 0$ for some $r in S$. Let us consider the piece of the
  complex plane $P_S = {w in scr(B): w_k = 0, k in S}$. Since the determinant of
  the matrix $alpha_(I, S)$ is not equal to zero, in each row of this matrix
  there is a nonzero element, so
  $P_S subset {w^(alpha_1) = dots.c [j] dots.c = w^(alpha_p) = 0}
  = inter.big_(i in I) pi^(-1) ({f_i = 0})$. In view of the condition
  $alpha_(j r) != 0$, $r in S$, we have $P_S subset pi^(-1) ({f_j = 0})$, that
  is, $pi(P_S) subset inter.big_(j = 1)^p {f_j = 0}$. By the condition of
  completeness of the intersection, the last set has dimension $n - p$. Now,
  using the essential fact that under the mapping $pi$ the image of the
  $(n - p + 1)$-dimensional set $P_S$ goes over to an analytic set of lower
  dimension, we prove the required equality
  $
    lim_(delta -> 0) integral_(W'_delta) tilde(psi)_delta
    := lim_(delta -> 0) integral_(T_(I, emptyset)^delta)
    w^(-gamma) psi_S (w) d w and d overline(w) [S] = 0.
  $ <eq:vanishing-limit>
  For this we return to the original fundamental form
  $psi in scr(D)^(n, n - p + 1) (X)$, which we write as
  $psi = sum_beta xi_beta and overline(omega)_beta$, where $xi_beta$ are
  $(n, 0)$-forms with coefficients of class $C^infinity$, and $omega_beta$ are
  holomorphic forms of type
  $d z_(beta_1) and dots.c and d z_(beta_(n - p + 1))$. In our situation,
  $dim pi(P_S) < n - p + 1$, therefore
  $
    pi^* (omega_beta)|_(P_S) = pi^* (omega_beta|_(pi(P_S))) = pi^* (0) = 0.
  $
  On the other hand,
  $
    pi^* (omega_beta)|_scr(B)
    = sum_(abs(M) = p - 1) phi_M^beta (w) d w[M],
  $
  #source(107)where $phi_M^beta$ are holomorphic functions on $scr(B)$.
  Restriction of the last form to the plane $P_S$ gives
  $
    pi^* (omega_beta)|_(P_S) = phi_S^beta (w)|_(P_S) d w[S] = 0.
  $
  By a holomorphic variant of the Hadamard lemma in a polydisk we conclude that
  $
    phi_S^beta (w) = sum_(i = 1)^(p - 1) w_i phi_(S, i)^beta (w), wide
    phi_(S, i)^beta in scr(O) (scr(B)).
  $ <eq:hadamard-lemma>
  The lifting $pi^* (psi)$ of the original form $psi$ has the form
  $
    sum_beta pi^* (xi_beta and overline(omega)_beta)
    = sum_beta pi^* (xi_beta) and overline(pi^* (omega_beta)).
  $
  Therefore the term $psi_S (w) d w and d overline(w) [S]$ of the form
  $a(w) pi^* (psi)$ of interest to us is
  $
    psi_S (w) d w and d overline(w) [S]
    = a(w) sum_beta pi^* (xi_beta) and overline(phi_S^beta) d overline(w) [S].
  $
  Consequently, in view of @eq:hadamard-lemma
  $
    psi_S (w) = sum_(i = 1)^(p - 1) overline(w)_i hat(psi)_i, wide
    hat(psi)_i in scr(D)^0 (scr(B)).
  $
  According to the lemma of @ss:bidimension,
  $
    lim_(delta -> 0) integral_(T_(I, emptyset)^delta)
    w^(-gamma) dot.c (overline(w)_i hat(psi)_i) d w and d overline(w) [S] = 0,
  $
  so from the additivity of the integral we obtain @eq:vanishing-limit and
  correspondingly the result of the proposition.
]

#subsection[A variant of Leray's residue formula for polar sets with
  singularities] <ss:leray-residue-formula>
It is obvious that for any smooth 1-form $psi = psi(z) d z$ on the complex plane
we have
$
  lim_(epsilon -> 0) integral_(abs(z) = epsilon) psi \/ z = 2 pi i psi(0)
  = 2 pi i lr(frac(psi, d z) |)_(z = 0),
$
that is, the residue at zero of the semimeromorphic form $psi \/ z$ is equal to
$2 pi i$ times the value of the function $psi \/ d z$ at the point 0. The
multidimensional analog of this equality is Leray's residue formula
(@bib:Leray1959[§21]) for semimeromorphic forms with nonsingular polar sets. We
give Leray's residue formula in a version convenient for us, when the role of
the point $z = 0$ is played by a nonsingular complex hypersurface $Z$ in a
domain $G subset CC^n$, that is, the surface $Z$ given by the zeros of a
function $f in scr(O) (G)$ such that $d f|_Z != 0$. Then for any semimeromorphic
form $psi \/ f$, $psi in scr(D)^(n, n - 1) (G)$ we have
$
  lim_(epsilon -> 0) integral_(abs(f) = epsilon) psi \/ f
  = 2 pi i integral_Z psi \/ d f.
$ <eq:leray-formula>
#source(108)Here $psi \/ d f$ (the so-called _residue-form_ for the
semimeromorphic form $psi \/ f$) is a form on a manifold $Z$ of bidegree
$(n - 1, n - 1)$, whose restriction to each open set
$scr(U)_j = {z in Z: f'_(z_j) != 0}$ is defined as follows:
$
  psi \/ d f|_(scr(U)_j)
  = frac((-1)^(j - 1), f'_(z_j)) (psi \/ d z_j)|_(scr(U)_j), wide
  j = 1, ..., n.
$ <eq:residue-form>
We observe that in @eq:residue-form the ratios $psi \/ d z_j$ are defined, since
$psi$, being a form of bidegree $(n, n - 1)$, contains the product of all
differentials $d z_j$. It is not difficult to verify that the form $psi \/ d f$
thus constructed in each $scr(U)_j$ is a globally defined differential form on
the union $scr(U) = union.big_(j = 1)^n scr(U)_j$. In view of the fact that the
differential $d f$ is not equal to zero on $Z$, this union coincides with $Z$.

Here we reduce the generalization of @eq:leray-formula to the case when the
polar set $Z$ admits singularities. In this case the union $scr(U)$ does not
coincide with $Z$. In @ss:minimal-system we shall show that if $f$ is the
minimal defining function for $Z$ (that is, it divides every other function $g$
that vanishes on $Z$), then $scr(U)$ coincides with the set of regular points of
$Z$. Thus, for the minimal defining function $f$ the form $psi \/ d f$,
constructed from @eq:residue-form, is smooth at regular points of $Z$ and is
semimeromorphic on the whole hypersurface $Z$. The polar set of $psi \/ d f$
lies in the set $scr(J) = {z in Z: d f = 0} = sng Z$. We observe that for any
form $psi$, compactly supported in $G$, in the space $CC^n$ we can choose
coordinates $z_1, ..., z_n$ so that the sets
$scr(J)_k = {z in Z: f'_(z_k) = 0}$, $k = 1, ..., n$, are nowhere dense in
$Z inter supp psi$.

We show that for singular hypersurfaces $Z$ the #index-mark(
  "Formula",
  sub: "Leray residue",
)residue formula @eq:leray-formula remains true if the integral over $Z$ on the
right is replaced by the principal value, that is,
$
  lim_(epsilon -> 0) integral_(abs(f) = epsilon) psi \/ f
  = 2 pi i lim_(delta -> 0) integral_(Z inter {abs(f'_(z_k)) > delta})
  psi \/ d f.
$ <eq:leray-singular>
Here the limit on the left is the residue on $G$ with respect to the
hypersurface $Z$, and the limit on the right is the principal value on $Z$ with
respect to $scr(J)_k$. Since the form $psi \/ d f$ has poles on
$scr(J) subset scr(J)_k$, the principal value with respect to $scr(J)_k$
coincides with the principal value with respect to $scr(J)$ (see
@ss:main-theorem). Consequently, @eq:leray-singular can be written in the form
$R_f (psi) = 2 pi i (-1)^(k - 1) P_(Z; f'_(z_k)) (psi \/ d z_k)$ or
$R_({Z}) [psi \/ f] = (2 pi i) P_(Z; {scr(J)}) [psi \/ d f]$.

We prove a formula of the form @eq:leray-singular for a surface $Z$ of arbitrary
codimension. Let $f = (f_1, ..., f_p): G -> CC^p$ be a holomorphic mapping of a
domain $G subset CC^n$, and let $Z = f^(-1) (0)$ be a complete intersection:
$dim Z = n - p$. From a smooth form $psi$ of bidegree $(n, n - p)$ we construct
a _multiple residue-form_ $psi \/ d f := psi \/ d f_1 and dots.c and d f_p$ of
the semimeromorphic form $psi \/ f := psi \/ f_1 dots.c f_p$ as follows. For any
set $I = {i_1, ..., i_p} subset {1, ..., n}$ we consider the set
$scr(U)_I = {z in Z: J_I (z) != 0}$, where $J_I = partial f \/ partial z_I$ is
the #source(109) Jacobian of $f$ with respect to the group of variables
$z_(i_1), ..., z_(i_p)$. Then we set
$
  psi \/ d f|_(scr(U)_I)
  = frac(epsilon(I), J_I) (psi \/ d z_I)|_(scr(U)_I), wide |I| = p,
$ <eq:multiple-residue-form>
where $d z_I = d z_(i_1) and dots.c and d z_(i_p)$, and the sign of $epsilon(I)$
is chosen from the condition $epsilon(I) d z_I and d z[I] = d z$. If for at
least one set $I$ the Jacobian $J_I$ is not equal to zero almost everywhere on
$Z$, then the form $psi \/ d f$ constructed in the domains $scr(U)_I$ is a
semimeromorphic form on $Z$ of bidegree $(n - p, n - p)$ with poles on
$scr(J) = inter.big_(abs(I) = p) scr(J)_I$, where
$scr(J)_I = Z without scr(U)_I$.

#theorem[
  Let $f: G -> CC^p$ be a holomorphic mapping of a domain $G subset CC^n$, and
  suppose that the Jacobian $J_I = partial f \/ partial z_I$ with respect to
  some group of variables $z_(i_1), ..., z_(i_p)$ is nonzero almost everywhere
  on $Z = f^(-1) (0)$. Then for any form $psi in scr(D)^(n, n - p) (G)$ we have
  $
    R_scr(F) [psi \/ f_1 dots.c f_p]
    = (2 pi i)^p P_(Z; {scr(J)}) [psi \/ d f_1 and dots.c and d f_p],
  $
  where $scr(F) = {F_1, ..., F_p}$, $F_j = {z in G: f_j (z) = 0}$, and the $f_j$
  are the components of the mapping $f$.
] <th:leray-singular>

#proof[
  From the definition of the form $psi \/ d f$ it is sufficient to prove the
  equality
  $
    R_f (psi) = (2 pi i)^p epsilon(I) P_(Z; J_I) (psi \/ d z_I).
  $ <eq:leray-jacobian>
  #new-par
  By the condition of the theorem the mapping $(f, J_I): G -> CC^(p + 1)$ is a
  complete intersection. Therefore according to
  @ss:nonpolar-principal-value[subsection] and property (5) of the main theorem
  we have
  $
    R_f (psi) = R_f P_(J_I) (J_I psi)
    = lim_(r -> 0) lim_(delta -> 0) I[T^(delta, r)](psi \/ f),
  $ <eq:jacobian-limits>
  where $T^(delta, r) = {z in G: |f_j (z)| = epsilon_j (delta), j = 1, ..., p;
    |J_I (z)| > r}$. We observe that $T^(delta, r)$ is the tube
  $T_({1, ..., p}, emptyset)^(epsilon(delta)) (f|_(D^r))$, constructed by
  restricting the mapping $f$ to the domain $D^r = {z in G: |J_I (z)| > r}$.
  Therefore for any fixed $r > 0$ the inner limit in @eq:jacobian-limits is the
  $p$-residue $R_(D^r; f) (psi)$ with respect to the restriction of $f$ to
  $D^r$. Since for any $r > 0$ the domain $D^r$ does not contain singular points
  of the analytic set $Z$, by the compound residue formula (see
  @bib:Aizenberg1979b[p.~151])
  $
    R_(D^r; f) (psi) = lim_(delta -> 0) I[T^(delta, r)](psi \/ f)
    = (2 pi i)^p epsilon(I) integral_(Z inter D^r) frac(psi \/ d z_I, J_I).
  $
  #new-par
  Going over to the limit as $r -> 0$ in this equality and taking into account
  that $R_(D^r; f) (psi)$ is the inner limit in @eq:jacobian-limits, we obtain
  @eq:leray-jacobian. This proves the theorem.
]

#subsection[Nondegeneracy of the residue current] <ss:nondegeneracy>
#source(110)#index-mark(
  "Nondegeneracy of the residual current",
  target: <ss:nondegeneracy>,
)We prove a generalization of local duality from @ss:local-duality to the case
of complete intersections of any dimension.

For a holomorphic mapping $f = (f_1, ..., f_p): G -> CC^p$ of a domain
$G subset CC^n$ we denote by $I_G (f)$ the ideal in $scr(O) (G)$ generated by
the functions $f_1, ..., f_p$.

#theorem[
  Let $G$ be a domain of holomorphy in $CC^n$ and let $f: G -> CC^p$ be a
  holomorphic mapping that is a complete intersection: $dim f^(-1) (0) = n - p$.
  Then the function $h$ of $scr(O) (G)$ belongs to the ideal $I_G (f)$ if and
  only if the current $R_f [h]$ is zero, that is, $R_f (h psi) = 0$ for any form
  $psi in scr(D)^(n, n - p) (G)$.
] <th:nondegeneracy>

#remark[
  In fact we prove that the function $h$ belongs to the ideal $I_G (f)$ if
  $R_f (h psi) = 0$ for all forms $psi in scr(D)^(n, n - p) (G)$ that are
  $dbar$-closed in neighborhoods of the compact sets
  $supp psi inter f^(-1) (0)$. In the case when $p = n$ and $G$ is a
  neighborhood of an isolated zero $a$ of the mapping $f$, the forms $psi$ are
  of type $psi(z) d z$ and are holomorphic in some neighborhood of $a$.
  Consequently, in this case we arrive at the theorem of local duality.
] <rem:local-duality>

#proof[
  Suppose that $h in scr(O) (G)$ and $R_f [h] = 0$. For the proof of the
  inclusion $h in I_G (f)$ we use a theorem of Cartan, according to which it is
  sufficient to establish that for each $a in G$ the function $h$ belongs to the
  ideal $I_a (f)$ generated in the local ring $scr(O)_a$ by the functions
  $f_1, ..., f_p$. For points $a in.not Z = f^(-1) (0)$ the ideal $I_a (f)$
  coincides with the ring $scr(O)_a$, so we need to consider only points
  $a in Z$.

  Let us fix a point $a in Z$ and supplement the system $f_1, ..., f_p$ by
  functions $f_(p + 1), ..., f_n$ holomorphic in some neighborhood
  $scr(U) = scr(U)_a$ so that the mapping $(f_1, ..., f_n): scr(U) -> CC^n$ has
  a unique zero in the closure $overline(scr(U))$, namely the point $a$. Such
  complementary functions can be constructed as follows: using the theorem on
  local description (see @ss:local-description) of an analytic set $Z$ of
  dimension $n - p$, we choose a coordinate system and a neighborhood $scr(U)$
  with center at $a$ so that the projection $pi|_Z$ onto the coordinate space of
  the variables $z_(p + 1), ..., z_n$ is an analytic covering; in these
  coordinates it is sufficient to put $f_j = z_j$, $j = p + 1, ..., n$.

  For sufficiently small $r$ the polyhedron
  $Pi^r = {zeta in scr(U): |f_j (zeta)| < r, j = 1, ..., n}$ is relatively
  compact in $scr(U)$ (see @ss:integral-definition). Therefore to the domain
  $scr(U)$ and the mapping $(f_1, ..., f_n): scr(U) -> CC^n$ we can apply the
  result of a consequence of Weil's integral formula (see
  @ss:weil-modification), according to which for a function
  $h in scr(O) (G) subset scr(O) (scr(U))$ we have the representation
  $
    h(z) = (2 pi i)^(-n) integral_(T^epsilon)
    h(zeta) psi_z (zeta) \/ f(zeta) + phi(z), wide
    z in Pi = Pi^(r - delta),
  $ <eq:weil-consequence>
  where $phi$ is an element of the ideal $I_Pi (f)$, ${psi_z (zeta)}_(z in Pi)$
  is a family of $dbar$-closed differential forms from
  $scr(D)^(n, n - p) (scr(U))$ whose supports lie in the set
  $M = {zeta in scr(U): |f_j (zeta)| <= r, j = p + 1, ..., n}$, and $T^epsilon$
  is the tube $T^epsilon (f) = {zeta in scr(U): |f_j (zeta)| = epsilon,
    j = 1, ..., p}$#source(111), $epsilon = r - delta$. We set
  $
    D_epsilon = {zeta in scr(U): |f_j (zeta)| <= epsilon, j = 1, ..., p},
  $
  and let $chi(zeta)$ be a smooth function in $scr(U)$ that is equal to one in
  $D_(epsilon_0)$ and zero outside $D_(epsilon_0 + delta)$, where $epsilon_0$ is
  a fixed number between 0 and $r - delta$. Then clearly the form
  $tilde(psi)_z (zeta) = chi dot.c psi_z (zeta)$ is equal to zero outside the
  compact set
  $M inter D_(epsilon_0 + delta) subset M inter D_r = overline(Pi^r)$ and to the
  form $psi_z (zeta)$ on $D_epsilon$ for all $epsilon < epsilon_0$. Thus the
  representation @eq:weil-consequence for the function $h$ is preserved if
  $psi_z (zeta)$ is replaced by $tilde(psi)_z (zeta)$, and $epsilon$ is assumed
  to be less than $epsilon_0$. In addition, since the support $tilde(psi)_z$ is
  compact, and the form $tilde(psi)_z \/ f$ is $dbar$-closed and therefore
  closed (we recall that the bidegree of $psi_z$ is $(n, n - p)$), the integrals
  over all tubes $T^epsilon$ are equal. As a result we can pass to the limit as
  $epsilon -> 0$, as a result of which we obtain
  $
    h(z) = (2 pi i)^(-n) R_f (h tilde(psi)_z) + phi(z), wide phi in I_Pi (f).
  $
  By hypothesis $R_f (h tilde(psi)_z) = 0$ for all $z in Pi$, so
  $h = phi in I_Pi (f)$ and a fortiori $h in I_a (f)$. This proves the
  implication $R_f [h] = 0 => h in I_G (f)$.

  The reverse implication is a generalization of the proposition in
  @ss:integral-definition to residual currents with respect to the mappings
  $f: G -> CC^p$, $p < n$, and of course it holds for arbitrary domains
  $G subset CC^n$. Thus, suppose that $h in I_G (f)$, that is,
  $h = q_1 f_1 + dots.c + q_p f_p$, where $q_j in scr(O) (G)$. In view of the
  additivity of the residual current it is sufficient to establish the required
  equality $R_f [h] = 0$ for each term $q_j f_j$, $j in {1, ..., p}$. We put
  $I = {1, ..., p}$, $I' = I without {j}$. Then
  $
    R_f [q_j f_j](psi) & = R_f (q_j f_j psi) = R_I (q_j f_j psi)
    & quad #[(see @ss:operators formula @eq:dbar-principal)] \
    & = plus.minus dbar R_(I', {j}) (q_j f_j psi)
    & #[(see @ss:nonpolar-principal-value[subsection])] \
    & = plus.minus dbar R_(I', emptyset) (q_j psi) = 0
    & #[(see @ss:operators formula @eq:dbar-principal)]
  $
  #new-par
  This proves the theorem.
]
