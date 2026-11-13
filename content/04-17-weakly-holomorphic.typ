#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

#heading(level: 2)[Weakly holomorphic functions on complete intersections; \
  their holomorphic extension]
<sec:weakly-holomorphic>

Let us apply the results about residues to the analysis of the properties of
weakly holomorphic functions on analytic sets that are complete intersections. A
#index-mark("Function", sub: "weakly holomorphic")_weakly holomorphic function_
on an analytic set $A$ is a function $h$ that is defined and holomorphic at
regular points of $A$ and is locally bounded on $A$. This definition of a
holomorphic function can be called intrinsic, since it does not use the fact
that $A$ is embedded in an ambient manifold. Extrinsically defined functions are
functions on an analytic set $A$ that are restrictions of holomorphic functions
in the ambient manifold; we shall call them #index-mark(
  "Function",
  sub: "strongly holomorphic",
)_strongly holomorphic functions_. Thus, a weakly holomorphic function is
strongly holomorphic if it admits a holomorphic extension to the ambient
manifold. Let us give a couple of simple examples. As the analytic set $A$ we
take the union of complex coordinate lines of the space $CC^2$, that is,
$A = {z_1 dot z_2 = 0}$. The function $h$ that is equal to one on the line
${z_1 = 0}$ and minus one on the line ${z_2 = 0}$ is weakly holomorphic on $A$
and does not admit a holomorphic (even continuous) extension to $CC^2$. However,
it is the restriction of the meromorphic function $(z_2 - z_1) \/ (z_2 + z_1)$.
Another example: let $A = {z_1^2 = z_2^3}$ be a semicubic parabola in $CC^2$,
which admits the parametrization $z = phi(t) = (t^3, t^2)$. The mapping $phi$
maps the complex plane of the variable $t$ one-to-one onto the parabola $A$, and
the inverse $h = t = phi^(-1) (z)$ is a weakly holomorphic function on $A$.
Clearly, there is no holomorphic function $g(z_1, z_2)$ with the property
$g|_A = g(t^3, t^2) = t$. At the same time the function $h = t$ is the
restriction of the meromorphic function $z_1 \/ z_2$.

In these examples it was no accident that weakly holomorphic functions on an
analytic set are represented by restriction of meromorphic functions in the
ambient space. A well-known theorem of Oka asserts that at least locally this
fact holds for any analytic set: at each point $a in A$ the germ $h_a$ of a
weakly holomorphic function $h$ is equal to the restriction to $A$ of the germ
$phi_a \/ psi_a$ of a meromorphic function (in other words, in some
full-dimensional neighborhood $scr(U)_a$ of each point $a in A$ there is a
function $psi in scr(O) (scr(U)_a)$, that does not vanish identically on each
irreducible component of the germ $A_a$ of the analytic set $A$, such that the
product $psi dot h$ can be extended #source(130) holomorphically to some
function $phi in scr(O) (scr(U)_a)$). Clearly, the restriction to $A$ of a
meromorphic function on $X$ (or on some full-dimensional neighborhood of a point
$a in A$) does not always give a weakly holomorphic function. The answer to the
question of which meromorphic functions have restrictions that give weakly
holomorphic functions leads us into the language of algebraic geometry.
According to a result of Cartan, weakly holomorphic functions on $A$ can be
characterized as continuous functions on $reg A$ such that in some neighborhood
$scr(U)_a inter A$ of each point $a in A$ an algebraic equation
$h^m + b_1 h^(m - 1) + dots.c + b_m = 0$ is satisfied, where $scr(U)_a$ is a
full-dimensional neighborhood in $X$, and $b_j in scr(O) (scr(U)_a)$. The ring
of germs of strongly holomorphic functions at a point $a$ on $A$ can be
identified with the quotient ring $scr(O)_a (A) := scr(O)_a (X) \/ I_a (A)$,
where $scr(O)_a (X)$ is the ring of germs of holomorphic functions at the point
$a$ on $X$, and $I_a (A)$ is the ideal of germs that vanish on the germ $A_a$ of
the analytic set $A$ at the point $a$. Now on the basis of the results of Oka
and Cartan we can say that germs of weakly holomorphic functions on $A$ are
elements of the field of quotients $scr(M)_a (A)$ of the ring $scr(O)_a (A)$
that are integral with respect to $scr(O)_a (A)$. Moreover, in the algebraic
language an analytic set $A$ is said to be #index-mark(
  "Set",
  sub: "normal analytic",
)_normal_ at a point $a$ if the ring $scr(O)_a (A)$ is integrally closed, that
is, if any element of the ring of fractions $scr(M)_a (A)$ of the ring
$scr(O)_a (A)$ that is integral with respect to $scr(O)_a (A)$ belongs to the
ring $scr(O)_a (A)$. In our original terms the normality of $A$ at $a$ means
that any weakly holomorphic function in some neighborhood of the point $a$ on
$A$ can be holomorphically extended to a full-dimensional neighborhood of this
point.

The aim of this section is to investigate more completely the properties of
weakly holomorphic functions on complete intersections. In particular, we
sharpen Oka's theorem: in the language of residual currents and principal values
we state a criterion for (local) holomorphic extendability of weakly holomorphic
functions. As a corollary, we obtain a result of Oka and Abhyankar on the
normality of complete intersections with a thin set of singularities. Next we
give integral representations for weakly holomorphic functions on $A$ with
integration over the distinguished boundary of a polyhedron of $A$.

Before starting a direct investigation of weakly holomorphic functions, we
consider the problem of the analytic description of singular points of complete
intersections and a minimal defining system of functions for complete
intersections.

#subsection[A minimal defining system] <ss:minimal-system>
Let $A$ be an analytic subset of a manifold $X$. A system $f = (f_1, ..., f_p)$
of holomorphic functions on $X$ is said to be #index-mark(
  "System",
  sub: "defining",
)_defining_ for $A$ if the set of its zeros $f^(-1) (0)$ is equal to $A$. A
defining system $f$ of an analytic set is said to be #index-mark(
  "System",
  sub: "minimal defining",
)_minimal_ if for any point $a in A$ the system $f$ "divides" in the local ring
$scr(O)_a$ any germ $g in scr(O)_a$ that vanishes on the germ $A_a$ of $A$ at
$a$. In other words, $f$ is minimal for $A$ if for any #source(131) point
$a in A$
$
  g|_(A_a) = 0 => g = q_1 f_1 + dots.c + q_p f_p, wide q_j in scr(O)_a.
$ <eq:minimal-division>

#proposition[
  A defining system $f = (f_1, ..., f_p)$ of an analytic set $A$ of codimension
  $p$ is minimal if and only if the set
  $
    scr(J) = {z in A: (d f_1 and dots.c and d f_p)_z = 0}
  $
  is nowhere dense in $A$. If the system $f$ is minimal for $A$, then the set
  $scr(J)$ coincides with the set of singular points $sng A$.
] <prop:minimal-system>

#proof[
  The assertions are local, so we shall assume that $f$ is a defining system of
  functions for the analytic set $A = f^(-1) (0)$, concentrated in some
  neighborhood of $0 in CC^n$, $n >= p$. Since $A$ has codimension $p$ and is
  specified by $p$ functions, by the proposition of @ss:analytic-definitions it
  is purely $(n - p)$-dimensional. Consequently, according to the theorem on the
  local description of analytic sets (see @ss:local-description) we can choose
  the coordinate system $z_1, ..., z_n$ in $CC^n$ so that in some neighborhood
  $scr(U) = scr(U)' times scr(U)''$ (here $scr(U)'$ is a neighborhood of zero in
  the space $CC^p$ of variables $z' = (z_1, ..., z_p)$, and $scr(U)''$ is a
  neighborhood of zero in the space $CC^(n - p)$ of variables
  $z'' = (z_(p + 1), ..., z_n)$) the projection $pi: A inter scr(U) -> scr(U)''$
  is an analytic covering.

  This proposition consists of three assertions, each to be proved separately.

  (i) _The system $f$ is minimal $=> scr(J)$ is nowhere dense._ Let $f$ be a
  minimal defining system for $A$. We assume that the set $scr(J)$ has nonempty
  interior on $A$, that is, it consists of certain irreducible components of
  $A$. Then the Jacobian $J = partial f \/ partial z'$ is identically zero on
  certain irreducible components of $A$, whose union we denote by $A_1$; let
  $A_2$ be the union of the remaining irreducible components of $A$. We choose a
  holomorphic function $phi$ in the domain $scr(U)$ that is identically zero on
  $A_2$ and nonzero at some point $a in A_1$ (if $A_2 = emptyset$, we put
  $phi equiv 1$), and consider the function $g = phi dot J$. The function $g$ is
  holomorphic in $scr(U)$ and is equal to zero on $A$. In addition, by the
  logarithmic residue formula (see Proposition~@prop:logarithmic-residue of
  @ss:geometric-trace) we have $res_(a') ""_(f') (g) = mu dot phi(a)$, where
  $f' = f(z', a'')$ is a holomorphic mapping that has an isolated zero at the
  point $z' = a'$ (since $pi$ is a covering), and $mu$ is the multiplicity of
  $f'$ at $a'$. Since $mu dot phi(a) != 0$, the proposition from
  @ss:integral-definition shows that $g$ does not belong to the ideal
  $I_(a') (f')$, and so it does not satisfy property @eq:minimal-division. We
  obtain a contradiction with the minimality of $f$.

  (ii) _The set $scr(J)$ is nowhere dense $=> f$ is minimal._ We choose a system
  of coordinates $z_1, ..., z_n$ so that in the previous notation the Jacobian
  $J = partial f \/ partial z'$ is nonzero almost everywhere on $A$, and the
  projection $pi: A inter scr(U) -> scr(U)''$ is an analytic covering, and so
  the system of functions $f' = f(z', 0'')$ has the point $z' = 0'$ as an
  isolated common zero.

  Suppose that $g in scr(O) (scr(U))$ and that $g|_(A inter scr(U)) equiv 0$. In
  accordance with the division theorem (see @ss:division-with-remainder) for $g$
  we write the expansion
  $
    g = c_1 (z'') e_1 (z') + dots.c + c_k (z'') e_k (z') + phi, wide
    phi in I_0 (f),
  $ <eq:minimal-expansion>
  #source(132)where the functions ${e_j (z')}$ represent a basis of the local
  algebra $Q_(f', 0')$, and the coefficients $c_j (z'')$ are holomorphic and
  uniquely determined by $g$.

  We denote the discriminant set of the projection $pi$ by $sigma$ and choose an
  arbitrary point $a'' in scr(U)'' without sigma$. We observe that all of the
  inverse images $z^((nu)) (a'') in pi^(-1) (a'')$ of this point are distinct
  (note that the number of such inverse images is equal to the multiplicity of
  the mapping $f'$ at the point $0'$) and $p^((nu)) = z'^((nu)) (a'')$ are
  simple roots of the system of equations $f(z', a'') = 0$. Since
  $g(p^((nu)), a'') = 0$, it follows that $g(z', a'')$ belongs to the ideals
  $I_(p^((nu))) (f(z', a''))$ of the ring $scr(O)_(p^((nu))) (z')$. Hence the
  proposition of @ss:integral-definition shows that the function $g(z', a'')$ is
  orthogonal to all functions $h in scr(O) (scr(U))$ with respect to the
  bilinear form
  $
    B_(a'') (g, h) = (2 pi i)^(-p) integral_(Gamma^delta (f(z', a'')))
    frac(g(z', a'') h(z', a'') d z', f_1 (z', a'') dots.c f_p (z', a'')),
  $ <eq:bilinear-form>
  where $delta$ is sufficiently small. Suppose that $epsilon$ is so small that
  $Pi^epsilon (f') relcomp scr(U)'$. If the point $a''$ is close to $0''$, then
  on the distinguished boundary $Gamma^epsilon (f')$ of this polyhedron we have
  the inequalities $abs(f_j) > abs(f_j (z', a'') - f'_j)$, $j = 1, ..., p$, so
  by the lemma of @ss:boundary-representation the cycle
  $Gamma^delta (f(z', a''))$ in @eq:bilinear-form can be replaced by
  $Gamma^epsilon (f')$. Consequently, when $a'' = 0''$ the right-hand side of
  @eq:bilinear-form gives the local residue $res_(0') ""_(f') (g dot h)$. From
  the local duality theorem we conclude that the matrix $B_(0'') (e_i, e_j)$ is
  nonsingular. By the continuity with respect to $a''$, the matrix
  $B_(a'') (e_i, e_j)$ is nonsingular also for points $a''$ close to $0''$.
  Since the class $hat(g)(z', a'')$ of the function $g(z', a'')$ in the quotient
  ring $scr(O) (scr(U)') \/ I(f(z', a''))$ is orthogonal to all $hat(e)_j$, we
  deduce that in @eq:minimal-expansion the coefficients $c_j (a'')$ are equal to
  zero if $a''$ is sufficiently close to $0''$ and lies in
  $scr(U)'' without sigma$. By the uniqueness theorem, $c_j equiv 0$, and
  $g = phi in I_0 (f)$. We have thereby proved property @eq:minimal-division,
  that is, the minimality of $f$.

  (iii) We prove that _if the system $f$ is minimal for the analytic set
  $A = f^(-1) (0)$, then the set $scr(J) = {f = d f = 0}$_ (here $d f$ denotes
  the exterior product $d f_1 and dots.c and d f_p$) _coincides with the set of
  singular points_ $sng A$. The inclusion $sng A subset scr(J)$ follows from the
  implicit function theorem, so it is sufficient to establish that
  $reg A subset A without scr(J)$. We assume that at some regular point $a in A$
  the exterior product $(d f)_a$ is equal to zero. We "straighten" the analytic
  set $A$ in a neighborhood of $a$, that is, we make a biholomorphic change of
  variables $z -> w$ taking the point $z = a$ into the point $w = 0$, and
  satisfying the property that the piece of $A$ in a neighborhood of $a$ takes
  the form $A^* = (f^*)^(-1) (0) = {w_1 = dots.c = w_p = 0}$, where
  $f^* (w) = f(z(w))$. Under such a change the exterior products $(d f)_z$ and
  $(d f^*)_(w(z))$ vanish simultaneously, so taking account of our assumption,
  $(d f^*)_0 = 0$. At the same time, in view of the minimality of $f$, by what
  we proved above $scr(J) inter scr(U)_a$ goes over to the set $scr(J)^*$, which
  is nowhere dense in $A^*$. Consequently, #source(133) there is a sequence of
  points ${w^((k))} subset A^*$ that converges to $0$ such that
  $(d f^*)_(w^((k))) != 0$. Since the points $w^((k))$ have the form
  $(0', w''^((k)))$, what we said above implies that in some ball
  $scr(B)_(0') subset CC^p$ with centre at $0'$ the system of equations
  $f^* (w', w''^((k))) = 0$ has a unique root $w' = 0$ in $scr(B)_(0')$ (since
  $(f^*)^(-1) (0) = {w' = 0}$) of multiplicity 1 for each fixed value of the
  parameter $w''^((k))$, and for the limiting value
  $0'' = lim_(k -> infinity) w''^((k))$ the system $f^* (w', 0'') = 0$ has the
  multiple root $w' = 0$. We reach a contradiction with Rouché's principle (see
  @ss:geometric-multiplicity) and complete the proof of the proposition.
]

#subsection[The universal denominator] <ss:universal-denominator>
Let $A$ be a complex analytic set in $CC^n$. By Oka's theorem, locally at each
point $a in A$ for weakly holomorphic functions on $A$ there is a #index-mark(
  "Universal denominator",
)_universal denominator_, that is, a function $J$ holomorphic in a
full-dimensional neighborhood $scr(U)$ of $a$ such that

(a) $J$ does not vanish identically on any irreducible component of the analytic
set $A$ at the point $a$;

(b) for any function $h$ on $A$ that is weakly holomorphic in a neighborhood of
$a$ the product $tilde(h) = h dot J$ can be extended holomorphically to a
full-dimensional neighborhood of $a$, that is, locally the weakly holomorphic
functions are represented by meromorphic functions $tilde(h) \/ J$ with a unique
(universal) denominator $J$.

We show that if the analytic set $A$ is a complete intersection, then the
universal denominator can be constructed very simply.

#theorem[
  Let $G$ be a domain in $CC^n$ and
  $A = {z in G: f_1 (z) = dots.c = f_p (z) = 0}$, $(f_j in scr(O) (G))$ be an
  analytic subset of $G$ of pure dimension $n - p$. For any set of indices
  $I = (i_1, ..., i_p) subset (1, ..., n)$ the Jacobian
  $J_I = partial f \/ partial z_I
  = partial (f_1, ..., f_p) \/ partial (z_(i_1), ..., z_(i_p))$ has the property
  that for any weakly holomorphic function $h$ on $A$ the product $h dot J_I$
  locally at each point $a in A$ can be holomorphically extended to some
  full-dimensional neighborhood. Consequently, if the Jacobian $J_I$ is not
  identically zero on each irreducible component of $A$, then it is a universal
  denominator at each point; in the case when $G$ is a domain of holomorphy,
  $J_I$ is a global universal denominator.
] <th:universal-denominator>

#proof[
  Let $h$ be a weakly holomorphic function on $A$. We prove that for each point
  $a in A$ the product $h dot J_I$ can be holomorphically extended to some
  full-dimensional neighborhood of $a$. Without loss of generality we can assume
  that $a = 0$. By hypothesis the dimension of $A$ is equal to $n - p$, so by
  the theorem on the local description by a nonsingular linear transformation of
  the coordinate system we can arrange that in some neighborhood
  $scr(U) = scr(U)' times scr(U)''$ ($scr(U)'$ is a neighborhood of zero in
  $CC^p$ of the variables $z' = (z_1, ..., z_p)$ and $scr(U)''$ is a
  neighborhood of zero in $CC^(n - p)$ of the variables
  $z'' = (z_(p + 1), ..., z_n)$) the projection $pi: A inter scr(U) -> scr(U)''$
  is an analytic covering. Consequently, for all
  $z'' in scr(U)'' without sigma$, where $sigma$ is an analytic subset of
  $scr(U)''$, the inverse image $pi^(-1) (z'')$ consists of the same number $m$
  of distinct points #source(134) $z^((nu)) (z'')$, $nu = 1, ..., m$, that
  depend holomorphically on $z'' in scr(U)'' without sigma$. For the functions
  $f_j$ defining $A$ we write out the Hefer expansions (see
  @ss:weil-representation)
  $
    f_j (zeta', z'') - f_j (z', z'')
    = sum_(q = 1)^p P_(j q) (z', zeta', z'') (zeta_q - z_q), wide
    j = 1, ..., p.
  $ <eq:denominator-hefer>
  Let $H(z', zeta', z'')$ be the determinant of the matrix consisting of the
  coefficients $P_(j q)$ of these expansions. Consider the function
  $
    tilde(h) (z) = sum_(nu = 1)^m h(z^((nu)) (z'')) dot
    H(z', z'^((nu)) (z''), z'').
  $
  This function is holomorphic in some neighborhood of zero. In fact, the
  holomorphy in $z'$ follows from the holomorphy of the coefficients $P_(j q)$,
  and the holomorphy in $z''$ follows from the fact that $tilde(h) (z)$ is a
  holomorphic symmetric function with respect to the vector-valued functions
  $z^((nu)) (z'')$, holomorphic in $scr(U)'' without sigma$, to which we can
  apply Riemann's theorem on the removal of singularities of $sigma$ (here we
  use the fact that $h$ is weakly holomorphic). Next, the restriction
  $tilde(h)|_A$ coincides with $h dot J'$ almost everywhere (here
  $J' = partial f \/ partial z'$), since for each
  $z = z^((j)) (z'') in A inter pi^(-1) (scr(U)'' without sigma)$ the
  determinant $H(z'^((j)) (z''), z'^((nu)) (z''), z'')$ is equal to the value of
  the Jacobian $J'$ at the point $z^((j)) (z'')$ if $j = nu$ and is equal to
  zero if $j != nu$. Thus, $tilde(h) (z)$ is a holomorphic extension for
  $h dot J'$ in some neighborhood of zero. Hence it follows immediately that
  $h dot J_I$ can be extended holomorphically to a neighborhood of zero for the
  Jacobian $J_I = partial f \/ partial z_I$ in any variables
  $z_I = (z_(i_1), ..., z_(i_p))$. In fact, we choose independent linear forms
  $l_j (z)$ so that in the basis ${w_j = l_j (z), j = 1, ..., n}$ the
  projections $pi_k: A inter scr(U) -> CC_(k^c)^(n - p)$ of the analytic set
  $A inter scr(U)$ into all subspaces of the variables $w_(k^c)$
  ($k^c = (1, ..., n) without k$, $k = (k_1, ..., k_p)$) are analytic coverings.
  Then by what we have proved, the functions $h dot partial f \/ partial w_k$
  can be extended holomorphically from $A$, and therefore the functions
  $
    (h dot J_I)(z) = h(z) sum frac(partial f, partial w_k) (l(z)) dot
    frac(partial w_k, partial z_I)
  $
  can also be extended holomorphically.

  Now let $G$ be a domain of holomorphy. The fact that $J_I$ is a global
  universal denominator, that is, for any weakly holomorphic function $h$ on $A$
  the product $g = h dot J_I$ can be extended holomorphically to the entire
  domain $G$, is deduced from the coherence of the sheaf of ideals $I(A)$ of the
  analytic set $A$ and Theorem B of Cartan on the triviality of the cohomology
  group $H^1 (G, I(A))$ (see @bib:Gunning1965[p.~243]). In fact, we cover $G$ by
  open balls $scr(U)_alpha$ such that if $scr(U)_alpha inter A != emptyset$,
  then $g$ can be extended in $scr(U)_alpha$ to some holomorphic function
  $g_alpha$. If the ball $scr(U)_alpha$ does not intersect $A$, we take
  $g_alpha$ to be identical to the zero function. Then the difference
  $h_(alpha beta) = g_alpha - g_beta$ #source(135) vanishes on
  $A inter (scr(U)_alpha inter scr(U)_beta)$, and the family ${h_(alpha beta)}$
  forms a 1-cocycle for the covering ${scr(U)_alpha}$ of the domain $G$ with
  coefficients in the sheaf $I(A)$. By the triviality of this cohomology group
  and the acyclicity of the covering ${scr(U)_alpha}$, we have
  $h_(alpha beta) = phi_beta - phi_alpha$, where
  $phi_alpha in scr(O) (scr(U)_alpha)$, and
  $phi_alpha|_(A inter scr(U)_alpha) equiv 0$. It is now clear that the set of
  functions ${g_alpha + phi_alpha}$ forms a global holomorphic function in $G$,
  which is the extension of the function $g$.
]

#subsection[Extension of weakly holomorphic functions] <ss:weakly-extension>
Let us consider the problem of the holomorphic extendability of weakly
holomorphic functions from analytic subsets that are complete intersections. We
shall consider only questions of local extendability. Let $A$ be an analytic
subset of a domain $G$ of the space $CC^n$. We assume that $A$ is purely
$(n - p)$-dimensional and is specified by a minimal defining system
$f = (f_1, ..., f_p)$. Let $h$ be a weakly holomorphic function on $A$. If $h$
admits a holomorphic extension $h'$ in $G$, then there exists a residual current
$h' R_f = R_f [h']$ that acts according to the formula (see @sec:main-facts)
$
  h' R_f (psi) = lim_(delta -> 0) integral_(T^delta) h' psi \/ f_1 dots.c f_p,
  wide psi in scr(D)^(2n - p) (G),
$ <eq:residual-extension>
where $T^delta$ is the tube defined by the mapping $f$. As we know (see
@ss:main-theorem) the support of a residual current lies on the analytic set
$A = f^(-1) (0)$, so there is the hope of defining a current $h R_f$ for any
weakly holomorphic function $h$, which would coincide with the current
@eq:residual-extension in the case when $h$ admits a holomorphic extension to a
function $h'$. To define such a current we apply Leray's residue formula from
@ss:leray-residue-formula to @eq:residual-extension. For any form
$psi in scr(D)^(n, n - p) (G)$ we obtain
$
  h' R_f (psi)
  = (2 pi i)^p P_(A; {scr(J)}) [h psi \/ d f_1 and dots.c and d f_p],
$ <eq:leray-extension>
where $P_(A; {scr(J)})$ is the principal value on the analytic set $A$ with
respect to $scr(J) = {f = d f = 0}$ (here $d f = d f_1 and dots.c and d f_p$).
We observe that Leray's residue formula can be applied in our situation, since
in view of the minimality of $f$ the set $scr(J)$ is nowhere dense on $A$ (see
@ss:minimal-system[subsection]). By the definition of the form $psi \/ d f$, in
the part of $A$ where the Jacobian $J = partial f \/ partial z_I$ is not
identically zero, the right-hand side of @eq:leray-extension is written in the
form (see formula @eq:leray-jacobian of @ss:leray-residue-formula)
$
  (2 pi i)^p epsilon(I) lim_(delta -> 0)
  integral_(A inter {abs(J) > delta}) frac(h, J) psi \/ d z_I.
$ <eq:principal-extension>
Here we can say that we have been lucky: the limit exists even when $h$ is a
weakly holomorphic function on $A$, since on the basis of the theorem of
@ss:universal-denominator[subsection] it is represented by the fraction
$tilde(h) \/ J$ with the same denominator with respect to which the principal
value in @eq:principal-extension is taken. Thus, for any weakly holomorphic
function $h$ on $A$ the right-hand side of @eq:leray-extension defines a
current, which we denote by $(h R_f)^0$. In the case when $h$ admits a
holomorphic extension to a function $h'$, this current coincides with the
current @eq:residual-extension. It #source(136) plays an important role in the
analysis of holomorphic extendability of the function $h$.

#theorem[
  Let $A = {z in G: f_1 (z) = dots.c = f_p (z) = 0}$ be a complete intersection
  of dimension $n - p$ in a domain $G subset CC^n$, and $f = (f_1, ..., f_p)$ be
  a minimal defining system for $A$. Then a weakly holomorphic function $h$ on
  $A$ can be locally holomorphically extended from $A$ if and only if the
  current $(h R_f)^0$ defined by the right-hand side of @eq:leray-extension is
  $dbar$-closed.
] <th:extension-criterion>

#proof[
  Suppose that $a in A$ and that $h$ is a weakly holomorphic function on $A$. If
  $h$ can be extended in some neighborhood $scr(U)_a subset G$ to a holomorphic
  function $h'$, then $(h R_f)^0 = h' R_f$. By property (4) of the theorem in
  @ss:main-theorem the current $R_f$ is $dbar$-closed, hence
  $dbar (h R_f)^0 = dbar h' and R_f + h' dbar R_f = 0$.

  We now assume that $dbar (h R_f)^0 = 0$. This implies that for any form
  $psi in scr(D)^(n, n - p - 1) (scr(U)_a)$ we have
  $[dbar P_(A; {scr(J)})] (h psi \/ d f) = 0$. According to property (4) of the
  theorem of @ss:main-theorem the result of the action of $dbar$ on the
  principal value is a residual current. Therefore, taking account of the fact
  that in some coordinate system the weakly holomorphic function $h$ is
  represented by the fraction $tilde(h) \/ J$ (see
  @ss:universal-denominator[subsection]), we obtain
  $
    [dbar P_(A; {scr(J)})] (frac(tilde(h), J) dot frac(psi, d f))
    = -lim_(r -> 0) integral_(A inter {abs(J) = r})
    frac(tilde(h), J) dot frac(psi, d f) = 0.
  $
  To the integral under the limit sign we apply the compound residue formula (in
  the reverse order, in contrast to what we did in @ss:leray-residue-formula).
  We obtain
  $
    lim_(r -> 0) lim_(epsilon -> 0) integral_(T^(epsilon, r))
    tilde(h) psi \/ f_1 dots.c f_p dot J = 0,
  $ <eq:compound-limit>
  where $T^(epsilon, r) = T^(epsilon, r) (f, J)$ is the tube in $scr(U)_a$
  constructed from the mapping $(f, J): scr(U)_a -> CC^(p + 1)$. Taking account
  of the arbitrariness of the function $psi$, we can write @eq:compound-limit in
  the form $tilde(h) R_(f, J) = 0$, where $R_(f, J)$ is a residual current in
  $scr(U)_a$ with respect to the mapping $(f, J)$, which is a complete
  intersection. According to the theorem of @ss:nondegeneracy the germ of
  $tilde(h)$ belongs to the ideal generated in the ring $scr(O)_a$ by the
  functions $f_1, ..., f_p, J$:
  $
    tilde(h) = q_1 f_1 + dots.c + q_p f_p + h' J, wide q_j, h' in scr(O)_a.
  $
  Therefore
  $h = (tilde(h) \/ J)|_A = (q_1 f_1 + dots.c + q_p f_p) \/ J|_A + h'|_A$. This
  implies that on the everywhere dense subset $scr(U)_a inter A inter {J != 0}$
  of the analytic set $scr(U)_a inter A$ the functions $h$ and $h'$ coincide.
  Thus, $h'$ is a holomorphic extension of $h$ to some neighborhood of the point
  $a$. This proves the theorem.
]

Let us give some corollaries of the theorem.

#corollary[
  Suppose that the analytic set $A = f^(-1) (0)$ is the same as in the theorem.
  If the function $h$ is weakly holomorphic on $A$ and can be #source(137)
  extended to some full-dimensional neighborhood of a point $a in A$ to a smooth
  function $h'$ of class $C^N$, where $N$ is a sufficiently large positive
  integer, then $h$ also admits a holomorphic extension in a neighborhood of
  $a$.
] <cor:smooth-extension>

#proof[
  Since the residual current $R_f$ has finite order in some neighborhood
  $scr(U)_a$ of the point $a$, its restriction to $scr(U)_a$ is defined on forms
  of smoothness $N$, where $N$ is a sufficiently large integer, and consequently
  the current $h' R_f$ is defined. Moreover, the Leray residue formula from
  @ss:leray-residue-formula holds for continuous forms $psi$, therefore
  @eq:leray-extension holds for the function $h'$, so $(h R_f)^0 = h' R_f$.
  Since $R_f$ is $dbar$-closed, we have
  $
    [dbar (h R_f)^0](psi) = [dbar (h' R_f)](psi) = R_f (dbar h' and psi).
  $
  But the differential $dbar h'$ is equal to zero at regular points of $A$, so
  by Leray's residue formula the current $(h R_f)^0$ is $dbar$-closed, and by
  the theorem $h$ admits a holomorphic extension.
]

#corollary[
  Suppose that the analytic set $A = f^(-1) (0)$ is the same as in the theorem.
  In order that $A$ should be normal (see the introductory part of this section)
  it is necessary and sufficient that the singular part $sng A$ should be a
  subset of $A$ of codimension $>= 2$.
] <cor:normality>

#proof[
  Suppose that $codim (sng A) >= 2$. According to @ss:minimal-system[subsection]
  this implies that the set $scr(J) = {z in A: d f = 0}$ has dimension
  $<= n - p - 2$. Let us choose an arbitrary point $a in A$ and coordinates in
  $CC^n$ so that the Jacobian $J = partial f \/ partial z'$ (here
  $z' = (z_1, ..., z_p)$) is not identically zero on $A inter scr(U)_a$. Let $h$
  be an arbitrary weakly holomorphic function on $A$. By the definition of the
  current $(h R_f)^0$ and property (4) of the theorem of @ss:main-theorem, for
  each form $psi in scr(D)^(n, n - p - 1) (scr(U)_a)$ we have
  $
    [dbar (h R_f)^0](psi) & = (2 pi i)^p [dbar P_(A; {scr(J)}) (h psi \/ d f)] \
    & = -(2 pi i)^p R_(A; {scr(J)}) (h psi \/ d f) := -(2 pi i)^p
    lim_(delta -> 0) integral_(A inter {abs(J) = delta}) h psi \/ d f.
  $
  Since $h$ is bounded on $A inter supp psi$, the form $h psi \/ d f$ is bounded
  almost everywhere on ${z in A: J = 0}$. Hence with the help of the theorem of
  @ss:fibered-local-residues we deduce that
  $R_(A; {scr(J)}) (h psi \/ d f) = 0$, and by the theorem $h$ can be
  holomorphically extended to a full-dimensional neighborhood of $a$. Taking
  account of the fact that $h$ is arbitrary, we deduce that $A$ is normal.
]

We shall not dwell on the proof of the converse statement. We just mention that
it is true not only for complete intersections, but also for any analytic set
(see @bib:Shafarevich1972).

On the basis of Corollary~@cor:normality it is not difficult to give an example
of an analytic set that is not a complete intersection: such is any nonnormal
analytic set for which the set of singular points has codimension $>= 2$. For
example, #source(138) we put $A = Phi(CC^2)$, where $Phi: CC^2 -> CC^4$ is a
polynomial mapping of the form
$
  Phi(x, y) = (x, x y, y(y - 1), y^2 (y - 1)).
$
#new-par
It is easy to see that only the point $0 in A subset CC^4$ has two inverse
images: $a = (0, 0)$ and $b = (0, 1)$, and all other points of $A$ have one
inverse image each. Consequently, $A$ is a surface in $CC^4$ that is everywhere
smooth, except for a unique point of self-intersection 0. Clearly, for any
entire function $g(x, y)$ the function $h = g(Phi^(-1) (z))$, $z in A$, is
weakly holomorphic on $A$, and if $g$ takes distinct values at the points $a$
and $b$, then $h$ is discontinuous on $A$ and does not admit a holomorphic
extension from $A$. Thus, $A$ is not normal, it has dimension 2, and the
dimension of the set of singular points of $A$ is equal to 0. We observe that
$A$ can be defined by three equations in $CC^4$:
$
  z_1 z_4 = z_2 z_3, wide z_3^3 = z_4 (z_4 - z_3), wide
  z_1^2 z_3 = z_2 (z_2 - z_1).
$
#subsection[Integral representations of weakly holomorphic functions]
<ss:weakly-representations>
We give integral formulas for functions that are weakly holomorphic in special
analytic polyhedra on analytic sets. We note that a polyhedron on an analytic
set $A subset CC^n$ defined by coordinate functions of the space $CC^n$ is no
simpler in a geometrical respect than is any other analytic polyhedron on $A$,
since $A$ itself is "twisted." Therefore on an analytic set the distinction
between the integral representations of Cauchy, Weil, and Bishop fades still
more. We first give an integral formula on analytic sets, starting from Bishop's
formula.

Consider the analytic subset $A = {z in G: f_1 (z) = dots.c = f_p (z) = 0}$ of a
domain $G subset CC^n$. We assume that the dimension of $A$ is equal to $n - p$
and that the system $f = (f_1, ..., f_p)$ is minimal for $A$ (see
@ss:minimal-system[subsection]). Using this system, we define a special analytic
polyhedron on $A$:
$
  Pi = Pi_A^r (g) = {z in A: |g_j (z)| < r_j, j = 1, ..., n - p}.
$
As usual, we assume that $Pi$ is relatively compact in $A$. In such a case there
is a full-dimensional neighborhood $scr(U) (Pi)$ in which the mapping
$(f, g) = (f_1, ..., f_p, g_1, ..., g_(n - p))$ is finite, and for this mapping
we can construct a function $B(zeta, z)$, as in @ss:bishop. Under these
conditions, the following theorem is true.

#theorem[
  If the distinguished boundary $Gamma = Gamma_A^r (g)$ of the polyhedron $Pi$
  does not contain critical points of $A$, then for any weakly holomorphic
  function $h$ on $A$ we have the integral representation
  $
    h(z) = integral_Gamma h(zeta) K(zeta, z), wide z in Pi without sng A
  $ <eq:bishop-weakly>
  with holomorphic kernel
  $
    K(zeta, z) = frac(B(zeta, z), (2 pi i)^(n - p) B(z, z))
    [and.big_(k = 1)^(n - p) d g_k mid(slash)
      product_(k = 1)^(n - p) (g_k (zeta) - g_k (z))].
  $
] <th:bishop-weakly>

#proof[
  #source(139)By Laplace's formula, the Jacobian
  $J = partial (f, g) \/ partial z$ is equal to the sum of the products of the
  determinants $partial f \/ partial z_I$ ($abs(I) = p$) and the corresponding
  algebraic complements. Therefore, according to
  @ss:universal-denominator[subsection] the function $h dot J$ can be
  holomorphically extended to some function $tilde(h)$ that is holomorphic in
  the full-dimensional neighborhood
  $
    tilde(Pi) = {zeta: |f_j (zeta)| < epsilon_j, j = 1, ..., p;
      |g_k (zeta)| < r_k, k = 1, ..., n - p},
  $
  where the $epsilon_j$ are sufficiently small (here we have global
  extendability for $h dot J$, since $tilde(Pi)$ is a domain of holomorphy).
  Then by Bishop's formula (see @ss:bishop)
  $
    frac(tilde(h) (z), J(z)) = frac(1, (2 pi i)^n B(z, z))
    integral_(tilde(Gamma)) frac(
      tilde(h) (zeta) B(zeta, z) d zeta,
      product_(j = 1)^p [f_j (zeta) - f_j (z)]
      product_(k = 1)^(n - p) [g_k (zeta) - g_k (z)]
    ),
  $ <eq:bishop-extension>
  where $tilde(Gamma)$ is the distinguished boundary of the polyhedron
  $tilde(Pi)$. We observe that $J d zeta = d f and d g$ (here $d f$ denotes the
  exterior product $d f_1 and dots.c and d f_p$, and $d g$ denotes the product
  $d g_1 and dots.c and d g_(n - p)$), and for $z in A$ we have $f_j (z) = 0$,
  $j = 1, ..., p$. Therefore for $z in Pi$ formula @eq:bishop-extension gives
  $
    h(z) = frac(1, (2 pi i)^n B(z, z)) integral_(tilde(Gamma))
    frac(d f, product_(j = 1)^p f_j (zeta)) and
    frac(
      (tilde(h) \/ J) B(zeta, z) d g,
      product_(k = 1)^(n - p) [g_k (zeta) - g_k (z)]
    ).
  $
  Since the distinguished boundary $Gamma$ does not contain critical points of
  $A$, the cycle $tilde(Gamma)$ is a Leray multiple coboundary (see
  @bib:Aizenberg1979b[p.~149]) of the cycle $Gamma$, so by the compound residue
  formula, the last formula implies @eq:bishop-weakly.
]

Starting from Weil's integral representation, we can obtain a representation for
weakly holomorphic functions that is analogous to @eq:bishop-weakly. Suppose, as
before, that $A = f^(-1) (0)$, and that the Jacobian
$J = partial f \/ partial z'$ in the variables $z' = (z_1, ..., z_p)$ is not
identically zero on each irreducible component of $A$. We suppose that the
polyhedron $Pi = {z in A: |z_j| < r_j, j = p + 1, ..., n}$ is relatively compact
in $A$. We denote by $H$ the determinant of the matrix formed from the Hefer
expansions of the functions $f_1, ..., f_p, z_(p + 1), ..., z_n$. In this case
for any weakly holomorphic function $h$ in $overline(Pi)$ we have the integral
representation
$
  h(z) = frac(1, (2 pi i)^(n - p) J(z)) integral_Gamma
  frac(h(zeta) H(zeta, z) d zeta'', zeta'' - z''), wide
  z in Pi without sng A,
$ <eq:weil-weakly>
where $Gamma$ is the distinguished boundary of $Pi$, not containing critical
points of $A$, and
$zeta'' - z'' = (zeta_(p + 1) - z_(p + 1)) dots.c (zeta_n - z_n)$.

Let us find an integral representation for a generating function. In the
notation used in @eq:weil-weakly the following theorem is true.

#theorem[
  A weakly holomorphic function $h$ in a closed polyhedron
  $overline(Pi) subset A$ can be holomorphically extended to a full-dimensional
  neighborhood of $Pi$ #source(140) if and only if
  $
    h(z) = frac(1, (2 pi i)^(n - p)) integral_Gamma
    frac(h(zeta) H(zeta, z) d zeta'', J(zeta) (zeta'' - z'')), wide
    z in Pi without sng A.
  $ <eq:weil-extension>
  In other words, for strongly holomorphic functions in the integral
  representation @eq:weil-weakly the Jacobian $J$ can be taken under the
  integral sign; as a result we arrive at the integral @eq:weil-extension, which
  is holomorphic in $z$ in some full-dimensional neighborhood of $Pi$ and
  therefore brings about a holomorphic extension of the strongly holomorphic
  function $h$, using only the values of this function on $A$, more precisely,
  on the distinguished boundary of $Pi$.
] <th:weil-extension>

#proof[
  Suppose that $h$ is extended to a holomorphic function $h'$ in some
  neighborhood $scr(U)$ of the polyhedron $Pi$. Then by Weil's formula
  $
    h(z) = frac(1, (2 pi i)^n) integral_(tilde(Gamma))
    frac(
      h'(zeta) H(zeta, z) d zeta' and d zeta'',
      f_1 (zeta) dots.c f_p (zeta) dot (zeta'' - z'')
    ), wide
    z in Pi,
  $ <eq:weil-extension-formula>
  where $tilde(Gamma)$ is the distinguished boundary of
  $tilde(Pi) = tilde(Pi)^(epsilon, r) (f_1, ..., f_p, z_(p + 1), ..., z_n)$, and
  $epsilon$ is so small that $tilde(Pi) relcomp scr(U)$. Taking account of the
  equality $d zeta' and d zeta'' = d f and d zeta'' \/ J$, as in the proof of
  Theorem~@th:bishop-weakly, by the compound residue formula from
  @eq:weil-extension-formula we obtain @eq:weil-extension.

  Conversely, if the weakly holomorphic function $h$ is represented by the
  integral @eq:weil-extension, then this integral, being holomorphic in some
  neighborhood of the polyhedron $Pi$, is also an extending function for $h$.
]

#remark[
  By means of @eq:weil-extension we can extract information on the extending
  function from properties of $h$ defined on $A$. For example, if
  $A = {f(z_1, z_2) = 0}$ is an algebraic curve in $CC^2$ and $h$ is a strongly
  holomorphic function on $A$ that has power growth as $z|_A -> infinity$, then
  $h$ admits a polynomial extension in $CC^2$. To verify this we expand the
  polynomial $H(zeta, z)$ in a sum $sum c_j (zeta) e_j (z)$ of polynomials with
  separated variables. We also observe that for any fixed $z in CC^2$ there is a
  number $r^0$ such that for all $r > r^0$ the cycles
  $Gamma_r = {zeta in A: |zeta_2| = r}$ are homologous to each other in a
  neighborhood of the domain of regularity of the integrand in
  @eq:weil-extension (it is sufficient to choose $r^0$ so that all of the
  singular points of $A$ are inside the contour $Gamma_(r^0)$ and the point $z$
  is in the domain $G_(r^0) = {z in CC^2: |z_2| < r^0}$). Since the functions
  $h c_j \/ J$ have power growth as $zeta|_A -> infinity$, from the expansion of
  the fraction $(zeta_2 - z_2)^(-1)$ into a geometric progression for
  $(zeta, z) in Gamma_r times G_r$ we deduce that when $r >> 1$ the integrals
  $
    integral_(Gamma_r) frac(h(zeta) c_j (zeta) d zeta_2, J(zeta) (zeta_2 - z_2))
    = sum_k [lim_(r -> infinity) integral_(Gamma_r)
      frac(h(zeta) c_j (zeta) d zeta_2, J(zeta) zeta_2^(k + 1))] z_2^k
  $
  are polynomials in $z_2$. Therefore the integral @eq:weil-extension is a
  polynomial in $z = (z_1, z_2)$.
] <rem:polynomial-extension>

#remark[
  #source(141)The theorem remains true if in @eq:weil-extension we write the
  integral @eq:bishop-weakly with the function $B(zeta, zeta)$ inserted under
  the integral sign. It follows from @ss:bishop that the restriction of
  $B(zeta, zeta)$ to $A$ depends only on $zeta''$. This can simplify the
  investigation of the extending function, specified in the form of an integral,
  analogous to @eq:weil-extension.
] <rem:bishop-weight>

#subsection[Application to lowering the order of the poles of rational
  differential forms in $CC^2$] <ss:lowering-poles>
In the investigation of residues of meromorphic forms there arises the important
problem of lowering the order of poles (see @bib:Leray1959[Chapter~4],
@bib:Aizenberg1979b[§17]). In @bib:Atiyah1973[Theorem~6.2], it was proved that
any rational differential form in the projective space $PP_2$ is cohomologous to
a form with a pole of the second order. Here on the basis of the criterion of
extendability for weakly holomorphic functions (see
@ss:weakly-extension[subsection]) we show that in the space $CC^2$ the order of
a pole of any rational differential 2-form is lowered to the first order.

Let
$
  omega = frac(P(z_1, z_2), Q(z_1, z_2)) d z_1 and d z_2
$ <eq:rational-form>
be a rational differential form in variables $(z_1, z_2) in CC^2$. We expand the
polynomial $Q$ into a product of irreducible polynomials:
$Q = Q_1^(k_1) dots.c Q_m^(k_m)$. Let $f = Q_1 dots.c Q_m$ be the product of the
corresponding factors to the first degree. Then we can write @eq:rational-form
in the form
$
  omega = frac(P_* (z_1, z_2), f^k (z_1, z_2)) d z_1 and d z_2,
$ <eq:rational-form-reduced>
where $k$ is the largest number in the set ${k_1, ..., k_m}$.

#theorem[
  Any form $omega$ of type @eq:rational-form-reduced outside its polar set
  $A = {f = 0}$ is cohomologous to a meromorphic differential form with a pole
  of the first order on $A$, that is, a form of type
  $omega' = h d z_1 and d z_2 \/ f$, where $h$ is an entire function.
] <th:lowering-poles>

#proof[
  Let $A_* = A without sng A$ be the set of regular points of the complex
  algebraic curve $A$. We choose a coordinate system in $CC^2$ so that the
  partial derivative $f'_(z_2)$ is not identically zero on each irreducible
  component of $A$. In connection with the manifold $X := CC^2 without sng A$
  and its submanifold $A_*$ (that is, in connection with the pair $(X, A_*)$) we
  write the #index-mark(
    "Sequence",
    sub: "Leray",
  )_Leray exact cohomology sequence_ (@bib:Leray1959[p.~56])
  $
    H^2 (X) xto(i^*) H^2 (X without A_*) xto(delta^*) H^1 (A_*)
    xto(overline(omega)^*) H^3 (X).
  $ <eq:leray-sequence>
  Here $i^*$ is induced by the embedding $i: X without A_* subset X$, and the
  homomorphism $delta^*$ means transition to the residue-class:
  $delta^* [omega] = Res [omega]$. Moreover, $overline(omega)^*$ is conjugate to
  the homomorphism $overline(omega)$ that associates with the homology class
  $[gamma] in H_3 (X)$ of the three-dimensional cycle $gamma$ the
  one-dimensional homology #source(142) class $[gamma inter A_*] in H_1 (A_*)$
  of the intersection of $gamma$ and $A_*$. Thus, for any 1-form $chi$ on $A_*$
  we have
  $
    (overline(omega)^* [chi], [gamma]) = ([chi], overline(omega) [gamma])
    := integral_(gamma inter A_*) chi, wide [gamma] in H_3 (X).
  $ <eq:residue-pairing>
  We prove the assertion of the theorem using the following fact.
]

#lemma[
  The residue-class $delta^* [omega]$ of the form @eq:rational-form-reduced
  contains a form of type
  $
    chi = (h d z_1 \/ f'_(z_2))|_(A_*),
  $ <eq:chi-form>
  where $h$ is an entire function.
] <lem:residue-class>

To prove the stated assertion we need the following lemma.

#lemma[
  Let $frak(R)$ be a complex one-dimensional manifold obtained from a compact
  Riemann surface by removing a nonempty finite set of points, and let ${b_j}$
  be a finite set of points of $frak(R)$. Then the cohomology group
  $H^1 (frak(R) without union.big b_j)$ is generated by meromorphic 1-forms with
  first order poles at the points $b_j$.
] <lem:riemann-cohomology>

#proof(title: [Proof of Lemma~@lem:riemann-cohomology.])[
  Let $phi$ be an arbitrary closed differential 1-form on
  $frak(R) without union.big b_j$, and let $r_j$ be its residues at the points
  $b_j$. It is well known (see, for example, @bib:Griffiths1978a[p.~233]) that
  the Mittag-Leffler theorem is true for forms on $frak(R)$: there is a
  meromorphic differential 1-form $alpha$ with poles of the first order at the
  points $b_j$ and residues $r_j$ at these points. Hence, in the Leray
  cohomology sequence for the pairs $(frak(R), union.big b_j)$
  $
    H^1 (frak(R)) xto(i^*) H^1 (frak(R) without union.big b_j)
    xto(delta^*) H^0 (union.big b_j)
  $
  the images $delta^* [phi]$ and $delta^* [alpha]$ coincide, and by the
  exactness of this sequence the form $phi$ is cohomologous to a form of type
  $alpha + alpha_1$, where $alpha_1$ is a differential 1-form that is regular
  and closed on $frak(R)$. Using the fact that $frak(R)$ is a Stein manifold
  ($frak(R)$ is a noncompact Riemann surface), we replace $alpha_1$ by a
  holomorphic 1-form on $frak(R)$ cohomologous to it. As a result we deduce that
  $phi$ is cohomologous to a meromorphic 1-form with poles of the first order at
  $b_j$.
]

#proof(title: [Proof of Lemma~@lem:residue-class.])[
  Let us choose an arbitrary closed differential 1-form $psi$ on the set $A_*$
  that belongs to the class $delta^* [omega]$. In order to prove that $psi$ is
  cohomologous to a form of type @eq:chi-form, we need to investigate its
  behavior near singular points of the curve $A$. We do this by considering a
  normalization of $A$, that is, a one-dimensional complex manifold $frak(R)$
  having the following property: there is a mapping $pi: frak(R) -> A$ and a
  finite set of points ${b_j}$ in $frak(R)$ such that $pi$ biholomorphically
  maps the complement $frak(R) without union.big b_j$ onto the set of regular
  points $A_*$, and maps the set ${b_j}$ onto the set of singular points
  $sng A$. We observe that $frak(R)$ is obtained from the compact Riemann
  surface $overline(frak(R))$, the normalization of the closure
  $overline(A) subset PP_2$, by removing a nonempty finite set of points. The
  pull-back $pi^* psi$ of the form $psi$ is a regular form on
  $frak(R) without union.big b_j$, so #source(143) by
  Lemma~@lem:riemann-cohomology $pi^* psi$ is cohomologous to some meromorphic
  1-form $phi$ with first order poles at the points $b_j$. Since the restriction
  $pi|_(frak(R) without union.big b_j)$ is biholomorphic, the form
  $chi := (pi^(-1))^* phi$ is cohomologous to the original form $psi$ on $A_*$.

  We observe that the form $pi^* (d z_1 \/ f'_(z_2))$ has poles at each point
  $b_j$ that projects into a singular point of the curve $A$. In order to verify
  this we recall that by Corollary~@cor:normality of
  @ss:weakly-extension[subsection] in a neighborhood $scr(V)_a subset A$ of each
  singular point $a in A$ there is a weakly holomorphic function $l$ that does
  not extend to a full-dimensional neighborhood. The pull-back $pi^* l$ is
  holomorphic in a neighborhood of $b_j$ in the normalization, and by the
  theorem of @ss:weakly-extension[subsection] the residue of the form
  $pi^* (l lambda d z_1 \/ f'_(z_2))$, where $lambda$ is a smooth function in a
  full-dimensional neighborhood of the point $a$, is not equal to zero. Hence we
  have verified what we said.

  Now, taking account of the fact that the form $phi$ has only poles of the
  first order at the points $b_j$, we conclude that it admits a representation
  $phi = tilde(h) pi^* (d z_1 \/ f'_(z_2))$, where $tilde(h)$ is a holomorphic
  function on $frak(R)$. The function $tilde(h)$ "descends" to a weakly
  holomorphic function $h := (pi^(-1))^* tilde(h)$ on the curve $A$. As a result
  we can conclude that the form $psi$ is cohomologous to a form of type
  $
    chi = (pi^(-1))^* phi = h d z_1 \/ (f'_(z_2))|_(A_*),
  $ <eq:chi-pullback>
  whose numerator is a weakly holomorphic function on $A$.

  To complete the proof of Lemma~@lem:residue-class it remains to show that the
  function $h$ in @eq:chi-pullback extends holomorphically to the entire space
  $CC^2$. In this we are helped by the fact that $chi in delta^* [omega]$, and
  also the theorem of @ss:weakly-extension[subsection], according to which $h$
  extends holomorphically to $CC^2$ if for each point $a in sng A$ the
  conditions
  $
    integral_(A_a inter {abs(f'_(z_2)) = delta}) lambda chi = 0, wide
    lambda in scr(O) (scr(U)_a)
  $ <eq:extension-conditions>
  are satisfied, where $A_a = A inter scr(U)_a$, and $delta$ is sufficiently
  small (in order to follow the theorem of @ss:weakly-extension[subsection]
  exactly, we should have put the limit sign as $delta -> 0$ before the integral
  in @eq:extension-conditions and taken the $lambda$ as smooth functions;
  however, it is easy to verify that it is sufficient to take the $lambda$ as
  holomorphic). Obviously the integration set in @eq:extension-conditions
  coincides with the intersection $gamma_a inter A_*$, where $gamma_a$ is the
  boundary of the polyhedral neighborhood
  ${abs(f) < epsilon, abs(f'_(z_2)) < delta}$ of the point $a$, and the
  intersection $gamma_a inter A_*$ consists of $r_a$ closed real curves $C_j$,
  $j = 1, ..., r_a$ ($r_a$ is the number of local irreducible components of
  $A_a$ at the point $a$). The inverse image $pi^(-1) (a)$ consists of $r_a$
  points $b_1, ..., b_(r_a)$, and $pi^(-1) (C_j)$ are circles on the
  normalization $frak(R)$ surrounding the points $b_j$. Since $pi^* chi$ has
  first order poles at the points $b_j$, and $(pi^* lambda)(b_j) = lambda(a)$
  for #source(144) all $j$ from 1 to $r_a$, we have
  $
    integral_(gamma_a inter A_*) lambda chi
    = sum_(j = 1)^(r_a) integral_(C_j) lambda chi
    = sum_(j = 1)^(r_a) integral_(pi^(-1) (C_j)) (pi^* lambda)(pi^* chi)
    = lambda(a) sum_(j = 1)^(r_a) res_(b_j) (pi^* chi).
  $ <eq:residue-sum>
  In the special case when $lambda equiv 1$, formula @eq:residue-pairing and the
  exactness of the sequence @eq:leray-sequence yield
  $
    integral_(gamma_a inter A_*) chi = (overline(omega)^* [chi], [gamma_a])
    = (overline(omega)^* delta^* [omega], [gamma_a]) = 0.
  $
  Hence by @eq:residue-sum we verify the truth of @eq:extension-conditions, and
  as a result $h$ extends to an entire function, which completes the proof of
  Lemma~@lem:residue-class.
]

Returning to the proof of the theorem, we observe that
$
  (h d z_1 \/ f'_(z_2)) and (d f \/ f) = h d z_1 and d z_2 \/ f =: omega'.
$
This means that $delta^* [omega'] = chi$, where $chi$ is the form @eq:chi-form,
that is, $delta^* [omega] = delta^* [omega']$. But since in the exact sequence
@eq:leray-sequence $H^2 (X) = H^2 (CC^2 without sng A) tilde.eq 0$, we obtain
the equality $[omega] = [omega']$. This proves the theorem.

#remark[
  Let us consider the question of when we can take the form $omega'$ in the
  theorem to be rational, that is, $h$ to be a polynomial. We recall that the
  entire function in @eq:chi-form is none other than the extension of the weakly
  holomorphic function $h$ from @eq:chi-pullback. According to
  Remark~@rem:polynomial-extension in @ss:weakly-representations[subsection],
  this extension can be chosen to be polynomial if the form @eq:chi-pullback has
  a polar singularity at infinity. But the form @eq:chi-pullback is
  $chi = (pi^(-1))^* phi$, where $pi: frak(R) -> A$ is a mapping of the
  normalization $frak(R)$ of the curve $A$. In addition, $frak(R)$ is obtained
  from the normalization $overline(frak(R))$ of the closure
  $overline(A) subset PP_2$ by removing points that correspond to points at
  infinity on $overline(A)$. Therefore we can choose $h$ to be a polynomial if
  the one-dimensional cohomologies of the punctured compact Riemann surface
  $overline(frak(R))$ are realized by meromorphic 1-forms with poles at the
  punctured points. According to the algebraic de Rham theorem (see
  @bib:Grothendieck1966 or @bib:Atiyah1973) this holds when $frak(R)$ is an
  affine curve.
] <rem:rational-form>
