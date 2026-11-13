#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

== Complex analytic sets and ideals <sec:analytic-sets>

#subsection([Definitions], note: [(see @bib:Chirka1985a, @bib:Chirka1985b,
  @bib:Herve1966)])
<ss:analytic-definitions>
Let $X$ be a complex analytic manifold. A set $A subset X$ is said to be
(complex) #index-mark("Set", sub: "analytic")_analytic_ if for each point
$a in X$ there is a neighborhood $scr(U) in.rev a$ and holomorphic functions
$f_1, ..., f_N$ in it such that
$A inter scr(U) = {z in scr(U): f_1 (z) = dots.c = f_N (z) = 0}$. Analytic sets
will be denoted mainly by the letters $A$, $V$, $W$, $Z$; the set of zeros of a
holomorphic function $phi$ is sometimes denoted by $V(phi)$#notation-mark(
  $V(phi)$,
  sort: "V phi",
).

A point $a$ of an analytic set $A$ is said to be #index-mark(
  "Point",
  sub: "regular",
)_regular_ if there is a neighborhood $scr(U) in.rev a$ in $X$ such that
$A inter scr(U)$ is a complex submanifold of $scr(U)$; the complex dimension of
$A inter scr(U)$ is called the dimension of $A$ at the point $a$ and denoted by
$dim_a A$. We shall call an analytic set $A$ #index-mark(
  "Set",
  sub: "smooth analytic",
)_smooth at the point $a$_ if $a$ is a regular point. The set of all regular
points of an analytic set $A$ is denoted by $reg A$#notation-mark(
  $reg A$,
  sort: "reg A",
), and its complement by $sng A$#notation-mark(
  $sng A$,
  sort: "sng A",
)\; points of $sng A$ are called #index-mark(
  "Point",
  sub: "singular",
)singular (or critical) points of $A$.

The _dimension_ $dim_a A$ at an arbitrary point $a in A$ is defined as the upper
limit $op(overline("lim")) dim_z A$ with respect to points $z in reg A$ that
converge to $a$. The #index-mark(
  "Dimension of an analytic set",
)_dimension of the analytic set_ itself is the number
$dim A = max_(z in A) dim_z A$. The number $dim X - dim A$ is called the
#index-mark("Codimension of an analytic set")_codimension_ of $A$. The set $A$
is said to be #index-mark(
  "Set",
  sub: "pure-dimensional, analytic",
)_purely $p$-dimensional_ if the dimension of $A$ at each of its points is equal
to $p$. The following fact says that from the viewpoint of dimensions complex
analytic sets have quite a regular structure.

#proposition[
  Let $A$ be an analytic subset of a manifold $X$, let $h$ be a holomorphic
  function on $A$, and let $A' = {z in A: h(z) = 0}$. Then for each point
  $a in A$ either $dim_a A' = dim_a A$ or $dim_a A' = dim_a A - 1$ (that is,
  adding one holomorphic relation $h(z) = 0$ can only lower the dimension by
  one).
] <prop:dimension-drop>

An analytic set $A$ of codimension $p$ is called a #index-mark(
  "Intersection",
  sub: "complete",
)_complete intersection_ if in a neighborhood of each of its points it is
specified by the zeros of $p$ holomorphic functions. From the proposition it
follows that a complete intersection #source(21) is a pure-dimensional set. We
shall sometimes call a holomorphic mapping $f: X -> CC^p$ a complete
intersection if the set of zeros $f^(-1) (0)$ of this mapping is a complete
intersection.

We say that a complex analytic set $A subset X$ of codimension 1 has
#index-mark("Intersection", sub: "normal")_normal intersections_ if any point
$x in X$ has a neighborhood $scr(U)$ with local coordinates $z_1, ..., z_n$ such
that
$
  scr(U) inter A = {z in scr(U): z_1 dots.c z_q = 0, q <= n}.
$

#subsection[Local description of analytic sets] <ss:local-description>
Let $A$ be a locally closed set in a complex analytic manifold $X$ and
$f: A -> Y$ be a proper mapping into another complex analytic manifold $Y$ such
that the inverse image of each point of $Y$ consists of finitely many points.
The triple $(A, f, Y)$ is called an #index-mark("Covering, analytic")_analytic
covering_ over $Y$ if

1) there is an analytic set $sigma subset Y$ of dimension $< dim Y$ and a
positive integer $r$ such that $A without f^(-1) (sigma)$ is a complex manifold
in $X$ and $f|_(A without f^(-1) (sigma))$ is a locally biholomorphic mapping
onto $Y without sigma$, each fiber of which consists of $r$ points;

2) the set $f^(-1) (sigma)$ is nowhere dense in $A$.

The set $sigma$ is said to be #index-mark(
  "Set",
  sub: "discriminant",
)_discriminant_ for the mapping $f$. We shall also call $f$, and sometimes $A$,
an analytic covering.

#theorem[
  Let $A$ be a purely $(n - p)$-dimensional analytic set in a neighborhood of
  $0 in CC^n$. Resorting to a nondegenerate linear transformation, we can choose
  a system of coordinates $z_1, ..., z_n$ in $CC^n$ so that in some neighborhood
  $scr(U)$ of the form $scr(U)' times scr(U)''$ (here $scr(U)'$ is a
  neighborhood of zero in the space $CC^p$ of the variables $z_1, ..., z_p$, and
  $scr(U)''$ is a neighborhood of zero in the space $CC^(n - p)$ of the
  variables $z_(p + 1), ..., z_n$) the projection
  $pi: A inter scr(U) -> scr(U)''$ is an analytic covering.
] <th:analytic-covering>

In the case when $A$ is one dimensional, we shall assume that $scr(U)''$ is a
disk in the $z_n$-plane; for any $z_n in scr(U)'' without {0}$ the inverse image
$pi^(-1) (z_n)$ consists of the same number $r$ of points $p^((nu)) (z_n)$,
$nu = 1, ..., r$. Each vector function $p^((nu)) (z_n)$ is holomorphically
continued by any arc into $scr(U)'' without {0}$ and is represented there by a
Puiseux series in fractional powers of $z_n$. We shall call one-dimensional
analytic sets #index-mark(
  "Curve",
  sub: "analytic",
)_analytic curves,_ and the vector-functions $p^((nu)) (z_n)$ the #index-mark(
  "Branch of a curve",
)_branches of the curve_ at the origin.

#subsection[Resolution of singularities] <ss:resolution>
We mention the local variants of Hironaka's theorem @bib:Hironaka1964 on the
resolution of singularities of analytic sets. The problem of #index-mark(
  "Resolution of singularities",
)_resolving singularities_ of an analytic set $A$ consists in constructing a
proper holomorphic mapping $pi: tilde(A) -> A$ of some manifold $tilde(A)$ onto
$A$ that is biholomorphic over $A without sigma$, where $sigma$ is a nowhere
dense analytic subset of $A$ containing the set of singular points $sng A$.

#source(22) The problem of an _embedded_ resolution of singularities consists in
constructing, for an analytic subset $A$ of a manifold $X$, a proper holomorphic
mapping $pi: Y -> X$ of a manifold $Y$ that biholomorphically maps
$Y without pi^(-1) (A)$ onto $X without A$, where $pi^(-1) (A)$ is a normal
intersection.

Hironaka's theorem asserts that for any point of an analytic set $A$ there is a
neighborhood in which there is both a resolution and an embedded resolution of
singularities. In addition, the following fact is true. Let $A$ be an analytic
subset of $X$ and let $phi$ be a holomorphic function in $X$ that is equal to
zero on the set $sng A$. Then for any point $a in A$ there is a neighborhood
$scr(U) subset A$ and a proper holomorphic mapping $pi: tilde(scr(U)) -> scr(U)$
of the manifold $tilde(scr(U))$ that is biholomorphic over
$scr(U) without {phi = 0}$, and the set $pi^(-1) (scr(U) inter {phi = 0})$ is a
normal intersection in $tilde(scr(U))$.

#subsection[Ideals in rings of holomorphic functions] <ss:ideals>
We shall consider the following rings connected with holomorphic functions: the
ring $scr(O) (G)$#notation-mark($scr(O) (G)$, sort: "O G") of functions
holomorphic in a domain $G subset CC^n$; the ring of polynomials
$CC[z] = CC[z_1, ..., z_n]$#notation-mark($CC[z]$, sort: "C z")\; the ring
$scr(O)_a$#notation-mark($scr(O)_a$, sort: "O a") of germs of holomorphic
functions at a point $a in CC^n$. The germ of a function $g$ will be denoted by
the same letter $g$. If $f = (f_1, ..., f_r)$ is the totality of elements of one
of the rings mentioned above, then the ideal generated by $f$ is denoted by
$I_G (f)$#notation-mark($I_G (f)$, sort: "I G f") in the ring $scr(O) (G)$, by
$I(f)$#notation-mark($I(f)$, sort: "I f") in the ring $CC[z]$, and by
$I_a (f)$#notation-mark($I_a (f)$, sort: "I a f") in the ring $scr(O)_a$. We
observe that the rings $CC[z]$ and $scr(O)_a$ are Noetherian.

We recall that an ideal $frak(S)$ of a ring $K$ is said to be _prime_ if for any
two elements $a, b in K$ it follows from the condition $a dot.c b in frak(S)$
that at least one of the elements $a, b$ belongs to $frak(S)$. An ideal
$I subset K$ is said to be #index-mark(
  "Ideal",
  sub: "primary",
)_primary_ if for any two elements $a, b in K$ it follows from the condition
$a dot.c b in I$, $a in.not I$, that some power $b^q$ belongs to $I$. The
radical of a primary ideal $I$ is prime; it is called the #index-mark(
  "Ideal",
  sub: "prime associated with primary",
)_prime ideal associated with the primary ideal $I$._

Let $K$ be a Noetherian ring, let $I$ be a primary ideal of $K$, and let
$frak(S)$ be the prime ideal associated with $I$. Then for some positive integer
$rho$ the power $frak(S)^rho$ of the ideal $frak(S)$ belongs to $I$. The
smallest number $rho$ with the property $frak(S)^rho subset I$ is called the
#index-mark("Order", sub: "of a primary ideal")_order of the primary ideal $I$._

Let us give some results from ideal theory that can be found in the book
@bib:VanDerWaerden1971 by van der Waerden. It is well known that in a Noetherian
ring any ideal $I$ decomposes into an intersection $I^1 inter dots.c inter I^l$
of primary ideals; this intersection can be chosen to be minimal, that is, no
ideal $I^j$ contains the intersection of the others. Each ideal of a minimal
decomposition is called a #index-mark(
  "Ideal",
  sub: "primary component",
)_primary component of the ideal $I$._ For certain ideals of the ring $CC[z]$
this assertion can be made more precise by giving it a geometrical nuance. We
denote by $V(I)$ the set ${z in CC^n: g(z) = 0 " for all " g in I}$, which we
call the #index-mark(
  "Set",
  sub: "of zeros of an ideal",
)_set of zeros of the ideal $I subset CC[z]$._ From Hilbert's theorem on roots
it follows that the ideal $I subset CC[z]$ is primary only in the case when
$V(I)$ is an irreducible algebraic set. We observe that if $I = inter.big I^j$,
then $V(I) = union.big V(I^j)$. Therefore to any isolated point $a$ of the set
$V(I)$ in #source(23) an incontractible decomposition of the ideal $I$ there
corresponds a primary ideal $I^0$ for which $V(I^0) = {a}$. The prime ideal
associated with $I^0$ is the ideal
$frak(m) = I(z_1 - a_1, ..., z_n - a_n)$#notation-mark(
  $frak(m)$,
  sort: "~m",
), where $a_1, ..., a_n$ are the coordinates of a point $a in CC^n$. Here $I^0$
is equal to $chevron.l I, frak(m)^rho chevron.r$, the ideal generated in $CC[z]$
by the set $I union frak(m)^rho$, where $rho$ is the order of the primary ideal
$I^0$.

Let the ideal generated by the system of polynomials $f = (f_1, ..., f_r)$ be
denoted by $I(f)$. This system also generates the ideal $I_a (f)$ in the ring
$scr(O)_a$.

#theorem(title: [#index-mark(
    "Theorem",
    sub: "of Lasker and Noether",
    target: <th:lasker-noether>,
  )Lasker-Noether])[
  If the algebraic set $V = {f_1 = dots.c = f_r = 0}$ is discrete, then a given
  polynomial $h$ belongs to the ideal $I(f)$ if and only if $h in I_a (f)$ for
  all $a in V$.
] <th:lasker-noether>

We observe that if $a$ is an isolated zero of the system $f$, then the ideal
$I_a (f) subset scr(O)_a$ is primary; for this we have the following result.

#proposition[
  Let $a$ be an isolated zero of the system of polynomials $f$ and let $I^0$ be
  the primary component of the ideal $I(f)$ for which $V(I^0) = {a}$. Then the
  order of the primary ideal $I_a (f) subset scr(O)_a$ coincides with the order
  of the ideal $I^0 subset CC[z]$. In particular, it follows that
  $I_a (f) = I_a (P)$, where $P = (P_1, ..., P_s)$ is the system of generators
  of the ideal $I^0$.
] <prop:primary-order>
