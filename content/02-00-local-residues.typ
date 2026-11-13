#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

#heading(level: 1)[Residues Associated with Mappings $f: CC^n -> CC^n$ \
  (Local Residues)] <ch:local-residues>

#source(25)
In the theory of functions of one complex variable the Cauchy residue is defined
in two equivalent ways. Namely, if $a$ is an isolated singular point of a
holomorphic function $g(z)$, then its residue at the point $a$ is determined by
an integral or a coefficient in the Laurent series:
$
  res_a (g) = (2 pi i)^(-1) integral_(abs(z - a) = epsilon) g(z) d z
  = c_(-1).
$
#new-par
In this connection we note that to a function of one variable with an isolated
singular point there corresponds a uniquely defined Laurent series. For
functions of several variables there is no analogous assertion. Consider, for
example, a rational function of two variables $g(z, w) = h\/z w (z - w)$, where
$h$ is a polynomial. The analog of the singular point $a$ here is the family of
three lines ${z = 0}$, ${w = 0}$, ${z - w = 0}$, which meet at the origin. We
integrate the function $g$ over the following two-dimensional contours (cycles):
$
  Gamma_1 & = {|z| = epsilon_1, quad |w| = epsilon_2 > epsilon_1}, \
  Gamma_2 & = {|z| = delta_1, quad |w| = delta_2 < delta_1}.
$
For this we expand the function $g$ over the cycles $Gamma_j$ in Laurent series:
$
  g|_(Gamma_1) = -h/(z w^2) sum_(k >= 0) (z/w)^k, wide
  g|_(Gamma_2) = h/(z^2 w) sum_(k >= 0) (w/z)^k.
$
These series converge uniformly on $Gamma_1$ and $Gamma_2$ respectively, and as
a result we obtain their term-by-term integration:
$
  (2 pi i)^(-2) integral_(Gamma_1) g d z and d w
  = -frac(partial h, partial w) (0, 0), wide
  (2 pi i)^(-2) integral_(Gamma_2) g d z and d w
  = frac(partial h, partial z) (0, 0).
$
#new-par
It is obvious from this example that while on the complex plane only one contour
(the small neighborhood $|z - a| = epsilon$) and a unique Laurent series are
associated with a singular point $a$, in the multidimensional case in an
arbitrarily small neighborhood of a singular point of the function $g(z, w)$
there are several independent cycles (in our example, $Gamma_1$ and $Gamma_2$)
and distinct #source(26) Laurent expansions, which approximate $g$ not in the
whole neighborhood but only in certain "conical domains" (in our example in
$scr(U)_1 = {|z| < |w|}$ and $scr(U)_2 = {|z| > |w|}$).

Nevertheless, there is a class of meromorphic functions of several variables
with which a definite residue (among several possible ones) is associated in a
natural way in a neighborhood of a singular point. This is the so-called _class
of local residues_ associated with holomorphic mappings.

A local residue is associated with a holomorphic mapping $f = (f_1, ..., f_n)$
from the space $CC^n$ into itself that has a point $a in CC^n$ as an isolated
zero. In a neighborhood of $a$ this mapping determines an $n$-dimensional cycle
("tube")
$Gamma_a = {z in scr(U)_a: |f_j (z)| = epsilon_j, j = 1, ..., n}$#notation-mark(
  $Gamma_a$,
  sort: "Gamma a",
), an analog of a circle in the one-dimensional case. Then the local residue of
a meromorphic function of the form $g = h\/f_1 dots.c f_n$ (or the form
$omega = g d z_1 and dots.c and d z_n$) is defined, up to the conventional
factor $(2 pi i)^(-n)$, as an integral over the cycle $Gamma_a$ and denoted by
$res_a ""_f (h)$ or $res_a omega$#notation-mark(
  $res_a omega$,
  sort: "res a",
). We observe that while in a one-dimensional Cauchy residue the contour of
integration---a circle---universally serves all meromorphic functions with a
singularity at the center of this circle, in the multidimensional case the cycle
$Gamma_a$ is determined in a special way depending on the denominator of the
meromorphic function $g$. In all other respects the local residue associated
with a holomorphic mapping is an exact analog of the Cauchy residue of a
meromorphic function of one complex variable.
