#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

== Local and fibered residues <sec:fibered-residues>

#subsection[Local residues with respect to incomplete intersections]
<ss:incomplete-intersections>
Here we consider local residues that are more general than those in
Chapter~@ch:local-residues. In the terminology adopted in @ss:main-theorem they
are $n$-residues on an $n$-dimensional analytic set $W$ of the manifold $X$,
that is, residues $R_scr(F) [lambda]$ with respect to a sequence of
hypersurfaces $scr(F) = {F_1, ..., F_n}$ of $W$. If $lambda$ is a
semimeromorphic form of bidegree $(n, 0)$ with poles on $union.big scr(F)$, then
according to the corollary of the main theorem of @ss:main-theorem
$R_scr(F) [lambda]$ is a current of bidimension $(0, 0)$, that is, a generalized
function with support on the essential intersection $V_e (scr(F))$. From the
recurrent definition of the essential intersection of a sequence $scr(F)$
consisting of $n = dim W$ surfaces it is obvious that $V_e (scr(F))$ is a
discrete or empty set.

#source(112)Suppose that $a in V_e (scr(F))$ and that $scr(U)$ is a neighborhood
of the point $a$ in $X$ that does not contain other points of essential
intersection. We choose a function $psi in scr(D)^0 (scr(U))$ such that
$psi equiv 1$ in some neighborhood of $a$, and define the number
$
  res_a ""_scr(F) lambda = res_a ""_(W; scr(F)) lambda
  = (2 pi i)^(-n) R_scr(F) [lambda](psi),
$ <eq:sequence-local-residue>
which we call the _local residue of the form $lambda$ with respect to the
sequence of hypersurfaces $scr(F)$ at the point $a$_. Since the intersection
$scr(U) inter supp R_scr(F) [lambda]$ consists of the point $a$ (we recall once
again that the support of a residual current lies in the essential intersection
$V_e (scr(F))$), the local residue does not depend on the choice of $scr(U)$ and
$psi$ and is equal to the limit
$
  lim_(delta -> 0) (2 pi i)^(-n) I[scr(U) inter T^delta](lambda),
$
where
$T^delta = T^(epsilon(delta)) (f) = {|f_j| = epsilon_j (delta), j = 1, ..., n}$,
the $f_j$ are the functions that determine $F_j inter scr(U)$, and
$epsilon(delta)$ is an admissible path. Hence it is obvious that if $W$ is a
nonsingular analytic set, the intersection $inter.big scr(F)$ is discrete, and
$omega$ is a meromorphic $n$-form with poles on $union.big scr(F)$, then the
residue $res_a ""_scr(F) omega$ defined by @eq:sequence-local-residue coincides
with the local residue considered in @ss:divisors. In fact, in this case $omega$
is a closed form, and the tubes $scr(U) inter T^delta$ are homologous to each
other for all sufficiently small $delta$.

For local residues with respect to incomplete intersections on analytic sets we
also have a theorem on the total sum of residues that generalizes the theorem in
@ss:total-sum-theorem.

#theorem[
  If $W$ is a compact analytic set of dimension $n$ in a manifold $X$, and
  $scr(F) = {F_1, ..., F_n}$ is a sequence of hypersurfaces in $W$, then for any
  meromorphic $n$-form $omega$ with poles on $union.big scr(F)$ we have
  $
    sum_(a in V_e (scr(F))) res_a ""_scr(F) omega = 0.
  $
] <th:sequence-total-sum>

#proof[
  Using the compactness of $W$, it is easy to construct a decomposition of unity
  of the form $1 equiv sum (psi_a: a in V_e (scr(F)))$, where $psi_a$ are smooth
  functions in $X supset W$ with compact supports, $psi_a equiv 1$ in some
  neighborhood of $a$, and $psi_a (b) = 0$ for all
  $b in V_e (scr(F)) without {a}$. Then from the definition of a local residue
  we have
  $
    sum_(a in V_e (scr(F))) res_a ""_scr(F) omega
    = sum_(a in V_e (scr(F))) (2 pi i)^(-n) R_scr(F) [omega](psi_a)
    = (2 pi i)^(-n) R_scr(F) [omega](1).
  $
  We use formula @eq:d-principal in @ss:operators, putting $j = p = n$ in it:
  $
    R_scr(F) [omega](1) = -(d R_(scr(F)') P_(F_n) [omega])(1)
    + (-1)^n R_(scr(F)') P_(F_n) [d omega](1).
  $
  Since $(d R_(scr(F)') P_(F_n) [omega])(1)
  = -R_(scr(F)') P_(F_n) [omega](d 1) = 0$, and the form $omega$ is closed
  ($d omega = 0$), we obtain $R_scr(F) [omega](1) = 0$. This proves the theorem.
]

#subsection[On the calculation of a residual current by means of fibered local
  residues] <ss:fibered-local-residues>
#source(113)As usual, let $scr(F) = {F_1, ..., F_p}$ be a sequence of
hypersurfaces in an analytic set $W subset X$ of pure dimension $n$. We assume
that $Z = inter.big scr(F)$ is a complete intersection: $dim Z = n - p$. In the
case $W = CC^n$ there arises the natural idea of calculating the residual
current $R_scr(F) [lambda]$ by fibering it into local residues. It consists in:
(1) drawing at each point $y in Z$ a transversal plane $L_y$, that is, a plane
of supplementary dimension $p$ such that $y$ is an isolated point of
$L_y inter Z$; (2) calculating the local residues at points $y in Z$ with
respect to $scr(F)_y = {L_y inter F_1, ..., L_y inter F_p}$, and as a result
obtaining a differential form on $Z$; (3) "in some way" integrating the
resulting form over $Z$.

Let us explain what we have said by the example when $p = 1$ and $lambda$ is the
form $lambda = d z_1 and d z' and d overline(z)' \/ f$, where $f$ is a
polynomial in $z in CC^n$ without multiple factors and having the same number of
zeros (counting multiplicities) with respect to $z_1$ for each fixed
$z' = z[1] in CC^(n - 1)$. In this example $Z = {f = 0}$, $scr(F) = {Z}$. In
order to calculate the value
$
  R_(CC^n; scr(F)) [lambda](psi)
  = lim_(epsilon -> 0) integral_(abs(f) = epsilon) frac(psi d z_1, f)
  and d z' and overline(d z)', wide psi in scr(D)^0 (CC^n)
$
we use a method motivated by the Fubini theorem. Through each point
$y = (y_1, y')$ we draw the complex line $L_y = {z' = y'}$ and in this line we
find the residue $r(y) = res_(y_1) (psi d z_1 \/ f)$. It is not difficult to see
that $r(y)$ is a semimeromorphic function on $Z$ with polar set
$scr(J) = {y in Z: f'_(z_1) (y) = 0}$, so the "iterated" integral
$I[Z](r d z' and overline(d z)')$ may not exist. However, as we know, there is a
principal value $P_(Z; {scr(J)}) [r d z' and overline(d z)']$, which according
to @ss:leray-residue-formula is equal to the original value
$R_(CC^n; scr(F)) [lambda](psi)$.

In this example the form $psi d z_1 \/ f$ has been contracted to the fibers
(straight lines) $z' = const$, in which the fibered residues $r(y)$, $y in Z$,
have been calculated. In fact these fibered residues have been associated with
the projection $pi: CC^n -> CC^(n - 1)$.

We now consider the more general situation, starting from a holomorphic mapping
$pi: W -> T$ from $W$ to an analytic set $T$ of pure dimension $n - p$. We
assume that for any point $t in T$
$
  dim pi^(-1) (t) = p,
$ <eq:fiber-dimension>
$
  dim(pi compose i)^(-1) (t) = 0,
$ <eq:fiber-discrete>
where $i$ is an embedding of the set $Z = inter.big scr(F)$ into $W$.

Let $T_*$ be the set of regular points of $T$. We put
$tilde(W) = W inter pi^(-1) (T_*)$ and for each point $y in tilde(W)$ consider
the subset $L_y = pi^(-1) (pi(y)) subset W$. According to @eq:fiber-dimension,
$L_y$ has dimension $p$, and from @eq:fiber-discrete it is obvious that the
family of hypersurfaces $scr(F)_y = {L_y inter F_1, ..., L_y inter F_p}$ has
discrete intersection in $L_y$. Let $lambda$ be a semimeromorphic form of degree
$p$ on $W$ with poles #source(114) $F_1, ..., F_p$, and $i_y^* (lambda)$ be the
restriction of this form to $L_y$. Clearly, $i_y^* (lambda)$ is a
semimeromorphic form on $L_y$ with poles $L_y inter F_1, ..., L_y inter F_p$. We
can therefore define the local residue
$
  [scripts(res)_(scr(F); pi) lambda](y)
  = res_y ""_(L_y; scr(F)_y) i_y^* (lambda), wide y in tilde(W),
$ <eq:fibered-residue>
which we call the #index-mark("Residue", sub: "fibered")_fibered residue of
$lambda$_ associated with the mapping $pi$. The main properties of a fibered
residue are contained in the following theorem.

#theorem[
  Let $scr(F) = {F_1, ..., F_p}$ be a sequence of hypersurfaces in $W$ that form
  a complete intersection: $dim inter.big scr(F) = n - p$, and let $pi: W -> T$
  be a holomorphic mapping with the properties @eq:fiber-dimension and
  @eq:fiber-discrete. Then

  #roman-text[(i)] for any semimeromorphic $p$-form $lambda$ with poles on
  $union.big scr(F)$ the fibered residues
  $[scripts(res)_(scr(F); pi) lambda](y)$ form a semimeromorphic function on
  $Z = inter.big scr(F)$;

  #roman-text[(ii)] if $lambda$ has compact support, and $scr(J)$ is a polar set
  for a function of fibered residues, then for any form
  $xi in scr(D)^(2(n - p)) (T)$
  $
    R_(W; scr(F)) [lambda and pi^* (xi)]
    = P_(Z; {scr(J)}) [[scripts(res)_(scr(F); pi) lambda] and pi^* (xi)].
  $
] <th:fibered-residues>

We shall not prove this theorem, and refer the reader to the book
@bib:Coleff1978.

Let us give some explanations of the theorem. In (i) it is asserted that the
function of fibered residues $r(y) = [scripts(res)_(scr(F); pi) lambda](y)$ is
semimeromorphic, although from its definition this function takes a finite value
at each point. Here we have in mind the following: the function $r(y)$ is smooth
on an everywhere dense subset $scr(U) subset reg Z$, and $r|_scr(U)$ is the
trace of a semimeromorphic function with poles on an analytic set
$scr(J) subset Z without scr(U)$.

The assertion (i) should be compared with the results of @sec:parameter. There
we actually considered the fibered residues
$r = scripts(res)_(scr(F); pi) lambda$, where $scr(F)$ is the family of
hypersurfaces $F_j = {f_j (z, t) = 0}$, $j = 1, ..., n$, in the manifold
$X times CC^m$, and $pi: X times CC^m -> CC^m$ is a projection. However, in
@sec:parameter it was assumed that $r$ depends on the parameter $t$, and not on
the point $y = (z, t) in Z = inter.big scr(F)$ lying in the fiber
$Z inter pi^(-1) (t)$.

The assertion (ii) enables us to calculate the residual currents with respect to
arbitrary complete intersections (more precisely, to lower the multiplicity of
integration), but integrable forms are chosen in a rather special way that
depends on the mapping $pi$. In this aspect the theorem of
@ss:leray-residue-formula is a sharpening of assertion (ii) in the case when the
hypersurfaces $F_1, ..., F_p$ at smooth points of $inter.big scr(F)$ intersect
with multiplicity one (we recall that in @ss:leray-residue-formula it is
required that $d f_1 and dots.c and d f_p|_(reg inter.big scr(F)) != 0$, where
${f_j = 0} = F_j$).
