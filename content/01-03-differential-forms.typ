#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

== Differential forms and currents <sec:differential-forms>

#subsection[Differential forms] <ss:differential-forms>
As a rule we shall consider differential forms on a complex analytic manifold
$X$. By a smooth differential form we shall understand a form whose coefficients
are complex-valued functions of class $C^infinity$. We shall denote the space of
such forms of degree $r$ by $scr(E)^r (X)$#notation-mark(
  $scr(E)^r (X)$,
  sort: "E r X",
), and the space of smooth forms of bidegree $(p, q)$ by
$scr(E)^(p, q) (X)$#notation-mark($scr(E)^(p, q) (X)$, sort: "E p q X"). If the
complex dimension of $X$ is equal to $n$, then any form
$psi in scr(E)^(p, q) (X)$ in each coordinate neighborhood
$(scr(U), z = (z_1, ..., z_n))$ admits a representation of the form
$
  psi = sum_(abs(I) = p, abs(J) = q) psi_(I, J) (z) d z_I and d overline(z)_J,
$
where the coefficients $psi_(I, J)$ are smooth functions in $scr(U)$,
$d z_I = and.big_(i in I) d z_i$#notation-mark($d z_I$, sort: "d z I"),
$d overline(z)_J = and.big_(j in J) d overline(z)_j$#notation-mark(
  $d overline(z)_J$,
  sort: "d z J",
), and the notations $|I|$ and $|J|$ are used for the cardinalities of the sets
$I, J subset {1, ..., n}$. A form $psi$ of bidegree $(p, 0)$ is called a
holomorphic form of degree $p$ if its coefficients are holomorphic; we denote
the totality of such forms by $Omega^p (X)$#notation-mark(
  $Omega^p (X)$,
  sort: "Omega p X",
).

Let $A$ be a hypersurface in $X$, that is, an analytic subset of pure dimension
$n - 1$ (see @ss:analytic-definitions), which in some coordinate neighborhood
$scr(U)_a$ of each point $a in X$ is given by a holomorphic equation:
$A inter scr(U)_a = {z: f_a (z) = 0}$. A differential form
$phi in scr(E)^r (X without A)$ is said to be #index-mark(
  "Form",
  sub: "semimeromorphic",
)_semimeromorphic_ with polar #source(19) set $A$ if there is a positive integer
$k$ such that the product $f_a^k dot.c phi$ belongs to $scr(E)^r (scr(U)_a)$ for
any $a in A$. If these products belong to $Omega^r (scr(U)_a)$, then $phi$ is
said to be #index-mark("Form", sub: "meromorphic")_meromorphic._ Thus, the form
$phi$ is semimeromorphic (meromorphic) if it can be locally represented by
fractions $psi_a \/ f_a^k$, where $psi_a$ is a smooth (holomorphic) form, and
$f_a = 0$ is a local equation for a polar set.

With each smooth mapping $f: X -> Y$ of analytic (smooth) manifolds there is
associated a mapping $f^\#: scr(E)^r (Y) -> scr(E)^r (X)$#notation-mark(
  $f^\#$,
  sort: "f #^",
) of spaces of smooth forms of degree $r$ that acts according to the rule:
$(f^\# (psi))(x) = psi(f(x))$, where $psi = psi(y) in scr(E)^r (Y)$.

We shall integrate differential forms along singular smooth chains and
semianalytic chains. If the form $psi$ has degree $r$, then for any singular
smooth chain $gamma$ of dimension $r$ on $X$ we have the formula for change of
variables $integral_gamma f^\# (psi) = integral_(f_\# (gamma)) psi$ (for the
definition of $f_\#$ see @ss:notation).

We shall also denote the integral of the form $psi$ along the chain $gamma$ by
$I[gamma](psi)$#notation-mark($I[thin]$, sort: "I [ ]").

#subsection[Stokes' formula on semianalytic sets] <ss:stokes>
Let $X$ be a real analytic manifold and $alpha = [M, c]$ be a semianalytic chain
in $X$ of dimension $r$. In contrast to singular chains, semianalytic chains
(more precisely, their supports) are not necessarily compact, so we shall
integrate forms with compact supports over such chains. We denote the set of
smooth forms of degree $r$ with compact supports in $X$ by
$scr(D)^r (X)$#notation-mark($scr(D)^r (X)$, sort: "D r X"). The integral of a
form $psi in scr(D)^r (X)$ over the semianalytic chain $alpha$ is defined as the
integral
$
  I[alpha](psi) = integral_((M^*, c^*)) psi
$
over the set of smooth points $M^*$ of the support $M$ with the orientation and
multiplicity induced by the class $c$.

If $N$ is a semianalytic subset of $M$ of dimension $< r$, then
$I[alpha](psi) = I[(M without N, c')](psi)$, where $c'$ is the restriction of
$c$ to $M without N$.

For integrals over semianalytic chains we have #index-mark(
  "Formula",
  sub: "of Stokes",
)Stokes' formula (see @bib:Herrera1966):
$
  I[alpha](d nu)#notation-mark($d$, sort: "d") = I[partial alpha](nu).
$

#subsection[Currents] <ss:currents>
If $X$ is a manifold of class $C^infinity$, then a #index-mark(
  "Current",
)current on $X$ of dimension $r$ is a linear continuous functional $T$ on the
vector space $scr(D)^r (X)$ with strong topology: $psi^((j)) xto(scr(D)) psi$ if
in any coordinate neighborhood the corresponding coefficients converge uniformly
on compact subsets together with all their derivatives and there is a compact
set $K subset X$ such that all supports $supp psi^((j))$ are contained in $K$.
We consider currents only on complex analytic manifolds $X$, where in local
coordinates $z$ the forms $psi in scr(D)^r (X)$ are written as
$sum_(abs(I) + abs(J) = r) psi_(I, J) (z) d z_I and d overline(z)_J$ (compare
with @ss:differential-forms[subsection]). The continuity of the functional $T$
in the #source(20) above topology is equivalent to its continuity with respect
to seminorms#notation-mark($p_(alpha beta)^K$, sort: "p K alpha beta")
$
  p_(alpha beta)^K (psi) = sum_(abs(I) + abs(J) = r) sup_(z in K)
  lr(
    |frac(partial^(|alpha + beta|), partial z^alpha partial overline(z)^beta)
    psi_(I, J) (z)|
  ),
$
where $K$ is a compact set in the coordinate neighborhood with coordinates $z$
(the assertion for currents of arbitrary dimension is proved as in the case of
generalized functions (see @bib:Vladimirov1979, p.~22)).

On the set of currents of dimension $r + 1$, operators $d$ and
$dbar$#notation-mark($dbar$, sort: "d bar") are defined by the formulas
$
  d T(psi) = (-1)^(r + 1) T(d psi), quad
  dbar T(psi) = (-1)^(r + 1) T(dbar psi),
$
where $psi in scr(D)^r (X)$, $d psi$ is the total differential of $psi$, and
$dbar psi$ is the differential of this form with respect to the variables
$overline(z)_1, ..., overline(z)_n$ ($n = dim X$).
