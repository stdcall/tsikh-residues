#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

#heading(level: 2, numbering: none)[Appendix] <app:residual-currents>

#subsection[Averaging and symmetrization of residual currents and smooth
  values] <ss:averaging>
We have regarded residual currents as limits of integrals over tubes
${|f_j| = epsilon_j}$ for which the radii tend to zero along admissible paths.
This choice of tubes guarantees the existence of the limits, but imposes a
rather unnatural dependence on the ordering of the components $f_j$ (see the
example from #source(115) the introduction to this chapter). Only in the case
when the hypersurfaces ${f_j = 0}$ form a complete intersection is the residual
current skew-symmetric with respect to the ordering of the $f_j$ (see
@bib:Coleff1978). In order to achieve a similar situation in the case of
incomplete intersections we can proceed as follows: consider integrals over
tubes with a wider class of admissible paths, and then perform an averaging.
From the proof of the existence of a residual current it is obvious (see
§§@sec:normal-intersections[n], @sec:main-theorem[n]) that for any fixed form
$psi$ the value $R_f (psi)$ does not change if in the definition of a tube an
admissible path is replaced by a "parabolic" path
$epsilon(delta) = (delta^(t_1), ..., delta^(t_p))$, where the $t_j$ are fixed
positive real numbers with the property $t_1 >> dots.c >> t_p$. We therefore
widen the class of admissible paths if we take the totality of "parabolic" paths
for which the exponents $t = (t_1, ..., t_p)$ run through the unit simplex in
the space $RR^p$. Such a definition of the required current is based on the
following observation. If $chi: RR -> [0, 1]$ is a smooth function such that
$chi(x) = 0$ if $x <= 1/2$ and $chi(x) = 1$ if $x >= 1$, then for any
holomorphic function $f$ on the manifold $X$ and any form
$psi in scr(D)^(n, n - 1) (X)$ by Stokes' formula we have
$
  lim_(delta -> 0) integral_(abs(f) = delta) psi/f
  = lim_(delta -> 0) integral_(abs(f) = delta) frac(chi(abs(f) \/ delta), f) psi
  = lim_(delta -> 0) integral_X frac(dbar chi(abs(f) \/ delta), f) psi.
$
Consequently, from an integral over a tube we can go over to an integral over a
manifold (in @ss:weil-modification a similar transition will be made for the
case when $f: X -> CC^p$ is a complete intersection).

Now let $f: X -> CC^p$ and $g: X -> CC^q$ be holomorphic mappings from a
manifold $X$ of dimension $n$. We denote the simplex
${t in RR^(p + 1): t_j >= 0, sum t_j <= 1}$ in the space $RR^(p + 1)$ by
$Delta_(p + 1)$. For any point $t in Delta_(p + 1)$ and any form
$psi in scr(D)^(n, n - p) (X)$ we set
$
  R_f P_g (psi)(t) = & lim_(delta -> 0) integral_X
                       frac(dbar chi(abs(f_1) \/ delta^(t_1)), f_1)
                       and dots.c and
                       frac(dbar chi(abs(f_p) \/ delta^(t_p)), f_p) \
                     & and frac(
                         chi(abs(g_1 dots.c g_q) \/ delta^(t_(p + 1))),
                         g_1 dots.c g_q,
                       ) psi.
$ <eq:averaging-limit>
#new-par
The limit @eq:averaging-limit has the following properties (see
@bib:Passare1985). _For almost all $t in Delta_(p + 1)$ the limit
@eq:averaging-limit exists, does not depend on the choice of the function $chi$,
and depends continuously on $psi$ with respect to seminorms in
$scr(D)^(n, n - p) (X)$. In addition, for each point $z^0 in X$ there is a
neighborhood $scr(U)$ such that the space $RR^(p + 1)$ (respectively, the
simplex $Delta_(p + 1)$) splits into finitely many cones $E_0, E_1, ..., E_N$
(here $E_0$ is the union of finitely many hypersurfaces, and $E_1, ..., E_N$ are
open and convex) such that the functions $R_f P_g (psi)(t)$ are constant on each
cone $E_j$, $j = 1, ..., N$, if $supp psi subset scr(U)$._

Thus, the limit @eq:averaging-limit is an integrable function on
$Delta_(p + 1)$, so we can define its average
$
  (R_f P_g)_c (psi) = (p + 1)! integral_(Delta_(p + 1))
  R_f P_g (psi)(t) d m,
$ <eq:averaged-current>
#source(116)where $m$ is the measure of the space $RR^(p + 1)$, and
$1 \/ (p + 1)!$ is the volume of the simplex $Delta_(p + 1)$. _The functional
@eq:averaged-current is a current of bidimension $(n, n - p)$ with support
$frak(S) = f^(-1) (0)$. This current depends skew-symmetrically on the order of
succession of the components $f_j$ of the mapping $f$, and $(R_f)_c$ coincides
with the residual current $R_f$ if $f$ is a complete intersection (see
@bib:Passare1985)._

#remark[
  The example of the mapping $f = (z_1, z_1 z_2)$ shows that neither the
  residual current $R_f$ nor the averaged residual current $(R_f)_c$ has the
  nondegeneracy property (see @ss:nondegeneracy) in the case of incomplete
  intersections. Therefore there remains the problem of defining a residual
  current for which the property of nondegeneracy is satisfied.
] <rem:averaged-nondegeneracy>
