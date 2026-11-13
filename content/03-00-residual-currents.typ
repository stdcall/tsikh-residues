#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

#heading(level: 1)[Residues Associated with Mappings $f: CC^n -> CC^p$ \
  (Residual Currents and Principal Values)] <ch:residual-currents>

#source(75)
We are concerned with the integration of semimeromorphic differential forms with
singularities on hypersurfaces (divisors) ${f_j = 0}$, where the $f_j$ are the
components of a holomorphic mapping $f$ of the Euclidean space $CC^n$ into the
space $CC^p$ ($p <= n$) or, in a more general situation, from an analytic set
into $CC^p$. Thus, integrable forms are of type $omega = psi \/ f_1 dots.c f_p$,
where the numerator $psi$ is a smooth form. Integration of such forms will be
carried out over special chains, determined by the mapping
$f = (f_1, ..., f_p)$, namely over "tubes"
$T^epsilon = T^epsilon (f) = {|f_1| = epsilon_1, ..., |f_p| = epsilon_p}$. In
the definition of the local residues considered in the previous chapter (the
case when $p = n$ and $f^(-1) (0)$ is discrete) such tubes are compact, which is
no longer true when $p < n$. Therefore it is natural to integrate forms with
compact supports over tubes. Moreover, the tube $T^epsilon$ is defined by $p$
real equations in $CC^n$ and so it usually has real dimension $2n - p$.
Consequently, the forms $omega$ must have degree $2n - p$. For nonclosed forms
$omega$ the integrals over tubes $T^epsilon$ with different $epsilon$ are in
general distinct. Therefore in order to define the residue of $omega$ with
respect to the mapping $f$ it would seem to be sufficient to pass to the limit
as $epsilon = (epsilon_1, ..., epsilon_p) -> 0$. However, here we run into the
fact that for $p > 1$ the limits may depend on the way the radii $epsilon_j$ of
the tube $T^epsilon$ tend to zero. For example, for the mapping
$f = (z_1 z_2, z_2): CC^2 -> CC^2$ the tube
$T^(epsilon(delta)) = {|z_1 z_2| = delta, |z_2| = delta^2}$ disappears (goes off
to infinity) as $delta -> 0$, and the tube
$T^(epsilon'(delta)) = {|z_1 z_2| = delta^2, |z_2| = delta}$ is equal to the
distinguished boundary ${|z_1| = delta, |z_2| = delta}$, and it is clear that
for any form $psi = psi(z) d z_1 and d z_2$ with compact support we have
$
  lim_(delta -> 0) integral_(T^(epsilon(delta))) psi/(f_1 f_2) = 0, wide
  lim_(delta -> 0) integral_(T^(epsilon'(delta))) psi/(f_1 f_2)
  = (2 pi i)^2 frac(partial psi, partial z_2) (0).
$
#new-par
This difficulty can be removed if we make $epsilon$ tend to zero along a special
(admissible) path in $RR_>^p$ by choosing
$epsilon = epsilon(delta)$#notation-mark(
  $epsilon(delta)$,
  sort: "epsilon delta",
) so that as $delta -> 0$ each coordinate $epsilon_j (delta)$ tends to zero
faster than any power $epsilon_(j + 1)^q (delta)$, $q in NN$, of the last
coordinate. We shall prove that under such a choice of path $epsilon(delta)$ for
any #source(76) holomorphic mapping $f = (f_1, ..., f_p)$ (in particular, for
any dimension $f^(-1) (0)$) the limit
$
  R_f (psi) := lim_(delta -> 0) I[T^(epsilon(delta)) (f)](
    psi \/ f_1 dots.c f_p
  ), wide psi in scr(D)^(2n - p) (CC^n)
$
exists where $I[T]$ is an integral with respect to $T$. Moreover, this limit
does not depend on the choice of admissible path $epsilon(delta)$, and the
functional $R_f$ is a current, that is, it depends continuously on $psi$ in the
corresponding topology. $R_f$ is called a residual current.

With a residual current there is associated another current---the principal
value. It is constructed from the mapping $f = (f_1, ..., f_p): CC^n -> CC^p$ as
follows:
$
  R_(f') P_(f_p) (psi) := lim_(delta -> 0) I[D^(epsilon(delta)) (f)](
    psi \/ f_1 dots.c f_p
  ), wide psi in scr(D)^(2n - p + 1) (CC^n),
$
where $D^(epsilon(delta)) (f) = {|f_j| = epsilon_j (delta), j = 1, ..., p - 1,
  |f_p| > epsilon_p (delta)}$, $epsilon(delta)$ is an admissible path in
$RR_>^p$, and $f' = (f_1, ..., f_(p - 1))$. We shall also prove that the
functional $R_(f') P_(f_p)$ exists, does not depend on the choice of admissible
path, and is a current.

The connection between the principal value $R_(f') P_(f_p)$ and the residual
current $R_f$ (here $f' = (f_1, ..., f_(p - 1))$) is based on Stokes's formula
and is expressed by $plus.minus dbar R_(f') P_(f_p) = R_f$. There is another
connection between the residual current $R_f$ and the principal value on the
analytic set $f^(-1) (0)$, which is expressed by a formula (see
@ss:leray-residue-formula) that generalizes a variant of Leray's residue formula
to the case of polar sets with singularities. This formula enables us to state
in the next chapter a criterion for the extendability of a holomorphic function
with an analytic subset.

In this chapter we shall prove the existence of residual currents and principal
values and also their main properties. We shall consider more general currents,
which include both residual currents and principal values. Their construction is
as follows: the set ${1, ..., p}$ is partitioned into two disjoint subsets $I$
and $J$ and by means of the mapping $f = (f_1, ..., f_p): CC^n -> CC^p$ we
construct the limit
$
  lim_(delta -> 0) I[T_(I, J)^(epsilon(delta))](psi \/ f_1 dots.c f_p), wide
  psi in scr(D)^(2n - abs(I)) (CC^n),
$
where $epsilon(delta)$ is an admissible path in $RR_>^p$, and
$T_(I, J)^(epsilon(delta))$#notation-mark($T_(I, J)^delta$, sort: "T I J") is
the tube characterized by the conditions $|f_i| = epsilon_i (delta)$, $i in I$,
$|f_j| > epsilon_j (delta)$, $j in J$.

The way of presenting this chapter is as follows. In @sec:main-facts we state
the main facts. Their proofs will be given in the next two sections, where in
@sec:normal-intersections we consider the case of normal intersections, and in
@sec:main-theorem the general case is reduced to normal intersections by
resolution of singularities. Next we consider currents associated with complete
intersections: $dim f^(-1) (0) = n - p$; in their properties they are very close
to local residues of the previous #source(77) chapter. Section
@sec:fibered-residues[n] is devoted to local residues with respect to incomplete
intersections; here we state a theorem on the fibering of a residual current
with respect to complete intersections into local residues.

Our presentation relies mainly on the work of Coleff and Herrera @bib:Coleff1978
and Pettersson (Passare) @bib:Pettersson1984.
