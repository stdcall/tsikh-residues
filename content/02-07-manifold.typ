#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

== Dependence between local residues on a manifold <sec:manifold>

In this section we shall prove for local residues an analog of the theorem on
the vanishing of the sum of all Cauchy residues for a meromorphic form on a
Riemann sphere (a compact Riemann surface).

#subsection[Local residue with respect to a system of divisors] <ss:divisors>
#source(43)Let $X$ be a complex analytic manifold of complex dimension $n$. We
recall that a subset $V subset X$ is called a _hypersurface_ if for each point
$a in X$ there is a neighborhood $scr(U) = scr(U)_a$ and a function
$phi in scr(O) (scr(U))$ such that $V inter scr(U) = {z in scr(U); phi(z) = 0}$.
Thus, a hypersurface is a closed analytic subset of $X$ of dimension $n - 1$. A
#index-mark("Divisor")_divisor_ $F$ on the manifold $X$ is any formal locally
finite linear combination $F = sum (n_alpha V_alpha, n_alpha in ZZ)$ of
irreducible hypersurfaces $V_alpha subset X$; local finiteness means that each
point in $X$ has a neighborhood that intersects only finitely many hypersurfaces
$V_alpha$ for which $n_alpha != 0$. A divisor is said to be #index-mark(
  "Divisor",
  sub: "effective",
)_effective_ if all the $n_alpha >= 0$. For the support of the divisor $F$, that
is, the set $union.big {V_alpha: n_alpha != 0}$, we shall keep the same notation
$F$.

Let $F_1, ..., F_n$ be a system of effective divisors in $X$ with discrete
intersection $Z = F_1 inter dots.c inter F_n$. Consider a meromorphic
differential $n$-form $omega$ on $X$ with polar divisor $F_1 + dots.c + F_n$.
This means that in some neighborhood $scr(U)$ of each point $a in X$ the form
$omega$ can be represented as $omega = h d z \/ f_1 dots.c f_n$, where
$h, f_1, ..., f_n in scr(O) (scr(U))$, and the $f_j$ locally determine the
$F_j$, that is,
$F_j|_(scr(U)) = sum (n_(j alpha) V_(j alpha): n_(j alpha) > 0)$, where
$V_(j alpha) = {g_(j alpha) = 0}$, the $g_(j alpha)$ are irreducible germs in
$scr(O)_a$, and $f_j = product_alpha g_(j alpha)^(n_(j alpha))$. Thus at each
point $a in Z$ for the form $omega$ there is defined a local residue as the
integral $(2 pi i)^(-n) integral_(Gamma_a^epsilon (f)) omega$. We denote this
residue by $res_a ""_scr(F) omega$#notation-mark(
  $res_a ""_scr(F) omega$,
  sort: "res a scr F omega",
) and call it the #index-mark(
  "Residue",
  sub: "local with respect to a system of divisors",
)_local residue of $omega$ with respect to the system of divisors_
$scr(F) = {F_1, ..., F_n}$. We observe that the local residue is thus well
defined (that is, the definition does not depend on the choice of the defining
functions $f_j$ of the divisors $F_j$), since the following lemma holds.

#lemma[
  Let $f = (f_1, ..., f_n)$ and $g = (h_1 f_1, ..., h_n f_n)$ be holomorphic
  mappings in some neighborhood of a point $a in CC^n$, where $h_j (a) != 0$,
  $j = 1, ..., n$, and the mapping $f$ has an isolated zero at the point $a$.
  Then the local cycles $Gamma_a^epsilon (f)$ and $Gamma_a^epsilon (g)$ are
  homologous to each other outside the set ${f_1 dots.c f_n = 0}$.
] <lem:divisor-cycles>

#proof[
  Let $scr(U)$ be a bounded neighborhood of the point $a$ for which
  $overline(scr(U)) inter f^(-1) (0) = {a}$ and $h_j|_(overline(scr(U))) != 0$,
  $j = 1, ..., n$. If $norm(f) = max_j |f_j|$ is the polydisk norm, then the
  numbers
  $
    r := min_(partial scr(U)) norm(f) quad "and" quad
    s := min_(t in [0, 1]) min_j min_(z in overline(scr(U)))
    (t + (1 - t)|h_j (z)|)
  $
  are positive. Putting $epsilon = s r \/ 2$, we deduce that the $(n + 1)$-chain
  $c = {z in scr(U): (t + (1 - t)|h_j|)|f_j| = epsilon, j = 1, ..., n,
    t in [0, 1]}$
  is compact in $scr(U)$, it does not intersect the set of zeros
  ${f_1 dots.c f_n = 0}$, and in addition $partial c = c|_(t = 1) - c|_(t = 0)
  = Gamma_a^epsilon (f) - Gamma_a^epsilon (g)$. This proves the lemma.
]

#subsection[Theorem on the total sum of residues] <ss:total-sum-theorem>

#theorem[
  #index-mark(
    "Theorem",
    sub: "on the total sum of residues",
    target: <th:total-sum>,
  )If $X$ is a compact complex analytic manifold of dimension $n$ and
  $scr(F) = {F_1, ..., F_n}$ is a system of effective divisors in $X$ with
  discrete #source(44) intersection $Z = F_1 inter dots.c inter F_n$, then for
  any meromorphic differential form $omega$ with poles on $F_1, ..., F_n$ we
  have
  $
    sum_(a in Z) res_a ""_scr(F) omega = 0.
  $
] <th:total-sum>

#proof[
  One of the possible proofs is as follows. Let us represent the local residues
  $res_a omega$ as integrals $integral_(partial scr(B)_a) eta_omega$ over the
  boundaries of balls $scr(B)_a$ enclosing the point $a in Z$ (see the
  proposition in @ss:boundary-representation). Then we use the homology
  $sum_(a in Z) partial scr(B)_a ~ 0$, which is obviously satisfied in the
  domain $X without Z$ if $X$ is compact. Hence the assertion of the theorem
  would follow from Stokes's theorem if it were known that the forms
  $eta_omega$, locally defined in neighborhoods $scr(B)_a$, could be continued
  to a single form with singular set $Z$. The proof of the latter fact is not at
  all simple. We give a topological proof, namely we establish that the sum of
  the local cycles $Gamma_a$ is homologous to zero in the domain of regularity
  of the form $omega$:
  $
    sum_(a in Z) Gamma_a ~ 0 quad "in " X without (F_1 union dots.c union F_n).
  $ <eq:cycles-sum>
  Let us introduce the notation
  $
    F^k = F_1 inter dots.c inter F_k, quad
    attach(F, bl: k) = F_(k + 1) union dots.c union F_n, wide
    k = 1, ..., n - 1; \
    F^0 = attach(F, bl: 0) = F_1 union dots.c union F_n = F; wide
    L_k = F^k inter attach(F, bl: k),
  $
  for which $L_0 = F$, $L_(n - 1) = Z$,
  $
    L_k = (attach(F, bl: k) inter F^(k - 1)) inter F^k, quad
    L_(k - 1) = (attach(F, bl: k) inter F^(k - 1)) union F^k.
  $
  Taking account of the connection between $L_k$ and $L_(k - 1)$ (one of them is
  the intersection and the other is the union of the same sets), we can
  construct the connecting homomorphisms
  $
    partial_*^k: H_(n + k) (X without L_k)
    -> H_(n + k - 1) (X without L_(k - 1)), wide k = 1, ..., n - 1,
  $
  that occur in the Mayer-Vietoris exact sequence (see @ss:mayer-vietoris). We
  thus construct a composition of homomorphisms
  $partial_* = partial_*^1 compose dots.c compose partial_*^(n - 1):
  H_(2n - 1) (X without L_(n - 1)) -> H_n (X without L_0)$, that is, the
  homomorphism $partial_*: H_(2n - 1) (X without Z) -> H_n (X without F)$. For
  the proof of @eq:cycles-sum we find in $X without Z$ a family of
  $(2n - 1)$-dimensional cycles ${h_a}_(a in Z)$ such that
  $
    partial_* h_a = Gamma_a, wide a in Z,
  $ <eq:connecting-h>
  $
    sum_(a in Z) h_a ~ 0 quad "in " X without Z.
  $ <eq:h-sum>
  For $h_a$ we take the boundary $partial gamma_(2n)$ of the polyhedron
  $gamma_(2n) = {z in scr(U)_a: |f_j (z)| <= epsilon_j, j = 1, ..., n}$. We
  specify the orientation of $gamma_(2n)$ by the order of the #source(45)
  parameters $r_1, theta_1, ..., r_n, theta_n$, for which
  $f_j = r_j e^(i theta_j)$. The boundary $partial gamma_(2n)$ has the form
  $gamma_(2n - 1) + gamma'_(2n - 1)$, where
  $
    gamma_(2n - 1) = {z in scr(U)_a: |f_j| <= epsilon_j, j = 1, ..., n - 1;
      f_n = epsilon_n e^(i theta_n)}.
  $
  The orientation of $gamma_(2n - 1)$ induced by the orientation of the chain
  $gamma_(2n)$ is determined by the order of the parameters
  $r_1, theta_1, ..., r_(n - 1), theta_(n - 1), theta_n$. The boundary
  $partial gamma_(2n - 1)$ has the form $gamma_(2n - 2) + gamma'_(2n - 2)$,
  where
  $
    gamma_(2n - 2) = {z in scr(U)_a: & |f_j| <= epsilon_j, j = 1, ..., n - 2, \
                                     & f_(n - 1) = epsilon_(n - 1)
                                       e^(i theta_(n - 1)),
                                       f_n = epsilon_n e^(i theta_n)},
  $
  and its orientation induced by the orientation of the face $gamma_(2n - 1)$ is
  determined by the order of the parameters
  $r_1, theta_1, ..., r_(n - 2), theta_(n - 2), theta_(n - 1), theta_n$.
  Continuing these arguments, we construct a family of $(n + k)$-chains
  $
    gamma_(n + k) = {z in scr(U)_a: |f_1| <= epsilon_1, ..., |f_k| <= epsilon_k,
      |f_(k + 1)| = epsilon_(k + 1), ..., |f_n| = epsilon_n}, & \
                                               k = n, ..., 1, &
  $
  for which $partial gamma_(n + k + 1) = gamma_(n + k) + gamma'_(n + k)$,
  $partial gamma_(n + 1) = Gamma_a$. It is easy to see that the support
  $|gamma_(n + k)| subset X without attach(F, bl: k) inter F^(k - 1)$ and
  $|gamma'_(n + k)| subset X without F^k$, so
  $|partial gamma_(n + k + 1)| subset X without L_k$. But from the definition of
  the connecting homomorphism $partial_*^k$ it thus follows that
  $partial_*^k [partial gamma_(n + k + 1)] = [partial gamma_(n + k)]$. As a
  result, $partial_* h_a = partial_*^1 compose dots.c compose partial_*^(n - 1)
  [partial gamma_(2n)] = Gamma_a$, so @eq:connecting-h is proved; @eq:h-sum
  follows from the fact that $X$ is compact.
]

The theorem we have proved enables us to state some connections between local
residues of the form $omega$ whose polar set consists of more than $n = dim X$
divisors. Namely, let $F_1, ..., F_m$ be effective divisors in $X$ such that
$Z_alpha: F_(alpha_1) inter dots.c inter F_(alpha_n)$ is discrete for any
$alpha = {alpha_1, ..., alpha_n} subset {1, ..., m}$ and
$Z_alpha inter Z_beta = emptyset$ for $alpha != beta$. Then to the meromorphic
form $omega$ with polar divisor $F_1 + dots.c + F_m$ at each point
$a in Z_alpha$ there corresponds the local residue
$
  res omega = scripts(res)_alpha omega = res_a ""_f (h d z),
$
where $h d z \/ f_1 dots.c f_n$ is a local representation of $omega$ ($f_j$ is
the defining function of the divisor $F_(alpha_j)$ in a neighborhood of the
point $a$). To each set of divisors $F_alpha = {F_(alpha_1), ..., F_(alpha_n)}$
there corresponds the sum of residues
$
  Res_alpha omega = Res_(scr(F)_alpha) omega
  = sum_(a in Z_alpha) res_a ""_(scr(F)_alpha) omega.
$
We observe that the sum of the residues $Res_alpha omega$ is skew-symmetric with
respect to $alpha_1, ..., alpha_n$. Under these conditions with respect to
$omega$ the following assertion holds.

#proposition[
  For each set $alpha' = {alpha_1, ..., alpha_(n - 1)} subset {1, ..., m - 1}$
  $
    sum_(j in {1, ... [alpha'] ..., m}) Res_((alpha', j)) omega = 0.
  $ <eq:residue-relations>
  #source(46)In particular, when $m = n + 1$, for any $k$ from 1 to $n$
  $
    Res_((1, ..., n)) omega
    = (-1)^(n - k - 1) Res_((1, ... [k], ..., n + 1)) omega.
  $ <eq:residue-relations-n1>
] <prop:residue-relations>

#proof[
  The proof is obtained by applying the theorem to the system of $n$ divisors
  $tilde(scr(F)) = (tilde(F)_1, ..., tilde(F)_n)$, where
  $
    tilde(F)_1 = F_(alpha_1), ..., tilde(F)_(n - 1) = F_(alpha_(n - 1)), wide
    tilde(F)_n = F_1 + dots.c + [alpha'] + dots.c + F_m.
  $
  In fact, the intersection $tilde(Z)$ of these divisors is equal to the union
  of the sets $Z_((alpha', j))$ over all $j in {1, ..., [alpha'], ..., m}$, so
  by grouping terms in the identity
  $
    Res_(tilde(scr(F))) omega = sum_(a in tilde(Z)) res_a omega = 0
  $
  we arrive at @eq:residue-relations.
]

It is obvious from the proof that for any partition of the set ${1, ..., m}$
into $n$ disjoint subsets $J_1, ..., J_n$ we also have the relation
$
  sum_(j_1 in J_1, ..., j_n in J_n) Res_((j_1, ..., j_n)) omega = 0.
$
However, any such relation is a consequence of the relations
@eq:residue-relations (see @bib:Yuzhakov1985a).

#subsection[Some corollaries] <ss:corollaries>
Let us apply the theorem on the total sum of residues to the calculation of the
sum of all residues with respect to a polynomial mapping $f: CC^n -> CC^n$. If
$n = 1$, then the sum of the residues of the form $omega = h d z \/ f$ over all
zeros of the polynomial $f$ is equal to its residue with the opposite sign at
the point at infinity. Let us give the multidimensional analog of this
assertion. We embed the space $CC^n$ with coordinates $z = (z_1, ..., z_n)$ into
the projective space $PP_n$#notation-mark(
  $PP_n$,
  sort: "P n",
) as a subset ${[xi]: xi_0 != 0}$, where $xi = (xi_0, xi_1, ..., xi_n)$ are
homogeneous coordinates and $[xi]$ is a point of $PP_n$; consequently, we can
assume that $z_j = xi_j \/ xi_0$. As a result, $PP_n = CC^n union {xi_0 = 0}$.
We shall regard $CC^n$ as the finite (or affine) part, and the hyperplane
(divisor) ${xi_0 = 0}$ as the part at infinity of $PP_n$. As a result of the
embedding $CC^n subset PP_n$ the form $omega = h d z \/ f_1 dots.c f_n$ defined
in $CC^n$ can be continued to a rational form in $PP_n$ (as a result of the
change of variables $z_j = xi_j \/ xi_0$) as follows:
$
  omega = tilde(h) (xi) sigma(xi) \/ xi_0^q tilde(f)_1 (xi) dots.c
  tilde(f)_n (xi),
$ <eq:projective-form>
where $sigma(xi)$ is the standard form
$sum_(nu = 0)^n (-1)^nu xi_nu d xi_0 and dots.c [nu] dots.c and d xi_n$,
$q = deg h + n + 1 - deg f_1 - dots.c - deg f_n$, and
$tilde(h), tilde(f)_1, ..., tilde(f)_n$ are homogeneous polynomials in $xi$,
which are obtained from the original polynomials by the rule
$h(z) -> tilde(h) (xi) = xi_0^(deg h) h(xi_1 \/ xi_0, ..., xi_n \/ xi_0)$
($tilde(h)$#notation-mark($tilde(h)$, sort: "h") will be called the
"homogenization" of $h$). Thus, if $q > 0$, then the divisor
$F_0 = {xi_0^q = 0}$ along with the divisors $F_j = {tilde(f)_j = 0}$,
$j = 1, ..., n$, is polar for $omega$. Therefore #source(47) in the case when
$F_0 inter F_1 inter dots.c inter F_n$ is empty (this means that the polynomials
$f_1, ..., f_n$ do not have common zeros at infinity), for the family
$scr(F)[k] = {F_0, ..., [k], ..., F_n}$ from formula @eq:residue-relations-n1 of
@ss:total-sum-theorem[subsection] we obtain
$
  sum_(a in f^(-1) (0)) res_a ""_f omega
  = (-1)^k sum_(b in Z[k]) res_b ""_(scr(F)[k]) omega,
$ <eq:sum-infinity>
where $f^(-1) (0)$ is the set of zeros of the mapping $f$ in $CC^n$, and
$Z[k] = F_0 inter dots.c [k] dots.c inter F_n$. Summing up what we have said, we
obtain the following result.

#corollary[
  If the system of polynomials $f = (f_1, ..., f_n)$ does not have zeros at
  infinity in the projective space, then the total sum of the residues of the
  form $omega = h d z \/ f_1 dots.c f_n$ with respect to the mapping $f$ over
  all its zeros in $CC^n$ is equal (up to the sign) to the sum of the residues
  of $omega$ with respect to any $n - 1$ divisors $F_j = {f_j = 0}$,
  $j = 1, ..., [k], ..., n$, and the divisor at infinity $F_0$.
] <cor:sum-infinity>

Clearly, in @eq:sum-infinity $Z[k]$ is the set of zeros at infinity of the
system $f_1, ..., [k], ..., f_n$. Moreover, taking account of the specific form
@eq:projective-form of $omega$, we can show that in @eq:sum-infinity the
residues with respect to points $b in Z[k]$ can be integrated with respect to
$xi_0$. As a result we deduce that the total sum of the residues of $omega$ in
$CC^n$ can be expressed in terms of the residues of a certain meromorphic form
with respect to the divisors $F_1 inter F_0, ..., [k], ..., F_n inter F_0$ in
the space $F_0 tilde.eq PP_(n - 1)$ of fewer variables.

We observe that if the degree of the polynomial $h$ is less than or equal to
$deg f_1 + dots.c + deg f_n - (n + 1)$, then $q <= 0$ in @eq:projective-form and
the divisor at infinity is not polar for the form
$omega = h d z \/ f_1 dots.c f_n$. Therefore, on the assumption that the system
$f = (f_1, ..., f_n)$ does not have zeros at infinity in $PP_n$,
$
  sum_(a in f^(-1) (0)) res_a ""_f omega = 0.
$ <eq:sum-zero>
The next assertion follows from this.

#corollary(title: [#index-mark(
    "Formula",
    sub: "of Euler and Jacobi",
    target: <cor:euler-jacobi>,
  )the Euler-Jacobi formula])[
  Let us assume that the system of algebraic equations $f_j (z) = 0$,
  $j = 1, ..., n$, does not have roots at infinity in $PP_n$, and that all of
  the finite roots of this system are simple (that is, in them the Jacobian
  $J_f$ of the mapping $f = (f_1, ..., f_n)$ is nonzero). Then for any
  polynomial $h(z)$ of degree $< deg f_1 + dots.c + deg f_n - n$ we have
  $
    sum_(a in f^(-1) (0)) frac(h, J_f) (a) = 0.
  $
] <cor:euler-jacobi>

#proof[
  The corollary follows from @eq:sum-zero, since by Cauchy's formula
  $
    sum_(a in f^(-1) (0)) frac(h, J_f) (a)
    = sum_(a in f^(-1) (0)) (2 pi i)^(-n) integral_(Gamma_a)
    frac(h J_f d z, J_f f)
    = sum_(a in f^(-1) (0)) res_a ""_f (h) = 0.
  $
]

#source(48)The Euler-Jacobi formula admits the following generalization. For any
Laurent polynomial $g = sum c_alpha z^alpha$ we denote by $Delta(g)$ its Newton
polyhedron, that is, the convex hull in $RR^n$ of the set
${alpha in ZZ^n subset RR^n: c_alpha != 0}$. For any vector
$t in RR^n without {0}$ let $sigma_t$ be the face of $Delta(g)$ obtained by
intersecting this polyhedron by the support hyperplane with direction vector
$t$. Consider the mapping $f = (f_1, ..., f_n)$, where
$f_j = sum c_(j alpha) z^alpha$ are Laurent polynomials in $CC^n$. To each face
$sigma_(j t)$ of $Delta(f_j)$ there corresponds the "cut-off function" of the
polynomial $f_j$:
$
  f_(j t) = sum_(alpha in sigma_(j t)) c_(j alpha) z^alpha.
$
The system $f$ is said to be nondegenerate if for any $t in RR^n without {0}$
the system $f_t = (f_(1 t), ..., f_(n t))$ has only simple zeros in
$(CC without {0})^n$.

#corollary[
  Let $f = (f_1, ..., f_n)$ be a nondegenerate system of Laurent polynomials and
  let $Z_f$ be the set of zeros of this system in $(CC without {0})^n$. If all
  of the zeros $a in Z_f$ are simple and the Newton polyhedron of a polynomial
  $h$ lies strictly inside the sum $Delta(f_1) + dots.c + Delta(f_n)$, then
  $
    sum_(a in Z_f) (h \/ z_1 dots.c z_n J_f)|_a = 0.
  $
] <cor:newton-polyhedra>

Here the inclusion $Delta(h) subset Delta(f_1) + dots.c + Delta(f_n)$ is
analogous to the inequality for the degrees in Corollary~@cor:euler-jacobi. This
condition enables us to extend the meromorphic form
$
  omega = frac(h, f_1 dots.c f_n) frac(d z_1, z_1) and dots.c
  and frac(d z_n, z_n)
$
defined in $(CC without {0})^n$ to a suitable toroidal compactification of $X$
without adding poles (see @bib:Khovanskii1977, @bib:Khovanskii1978).

Various applications of the Euler-Jacobi formula to projective geometry are
contained in @bib:Griffiths1978a and @bib:Khovanskii1979.

#subsection[Converse of the theorem on the total sum of residues]
<ss:converse>
Here we prove that for the space $X = PP_n$ and any divisors in it the relation
between the local residues in the theorem of @ss:total-sum-theorem[subsection]
is unique in some sense.

#theorem[
  Let $F_1, ..., F_n$ be a system of effective divisors in $PP_n$ that have
  discrete intersection $Z = inter.big F_j$. Then for any set of complex numbers
  ${r_a}_(a in Z)$ satisfying the condition $sum (r_a: a in Z) = 0$ there is a
  form $omega$ with polar divisor $F = F_1 + dots.c + F_n$ such that
  $res_a omega = r_a$.
] <th:converse>

#proof[
  Since $Z$ is discrete, there is a hyperplane in $PP_n$ that does not intersect
  $Z$. Let us choose a system of homogeneous coordinates $xi$ in $PP_n$ such
  that the hyperplane is given by $xi_0 = 0$. Then
  $CC^n = PP_n without {xi_0 = 0}$ in the affine part, where the local
  coordinates $z_j = xi_j \/ xi_0$ act, the form $omega$ with polar divisor $F$
  is written as $omega = h d z \/ f_1 dots.c f_n$; here the $f_j (z)$ are
  polynomials #source(49) defining the divisors $F_j$:
  $F_j|_(CC^n) = {f_j = 0}$, and $deg h + n < deg f_1 + dots.c + deg f_n$ (the
  continuation of $omega$ to the entire $PP_n$ has the form @eq:projective-form
  from @ss:corollaries[subsection], and the last condition imposed on the degree
  means that $omega$ has poles only on $F$). In the proof of the theorem it is
  sufficient to find for any pair of distinct points $a, b in Z$ a polynomial
  $h$ such that

  (a) $res_a omega = -res_b omega = 1$;

  (b) $res_c omega = 0$, $c in Z without {a, b}$;

  (c) $deg h + n < deg f_1 + dots.c + deg f_n$.

  We show that for such an $h$ we can take $h(z) = H(z, a) - H(z, b)$, where
  $H(z, zeta)$ is the determinant of the matrix consisting of the coefficients
  $P_(q s) (z, zeta)$ of the expansions
  $
    f_q (z) - f_q (zeta) = sum_(s = 1)^n (z_s - zeta_s) P_(q s) (z, zeta),
    wide q = 1, ..., n.
  $
  Indeed, we can choose the coefficients $P_(q s)$ so that their joint degrees
  in variables $z$, $zeta$ do not exceed $k_q - 1$, where $k_q = deg f_q$. Then
  the degree of the determinant $H(z, zeta)$ does not exceed
  $lambda := k_1 + dots.c + k_n - n$. Since for any monomial
  $c_(alpha beta) z^alpha zeta^beta$ of degree $|alpha| + |beta| <= lambda$ the
  difference $c_(alpha beta) z^alpha a^beta - c_(alpha beta) z^alpha b^beta$ has
  degree in $z$ less than $lambda$, the polynomial $h = H(z, a) - H(z, b)$
  satisfies condition (c) for the degrees. The equality $res_a omega = 1$
  follows from the chain equalities below (we assume that
  $a = (a_1, ..., a_n)$):
  $
    & 1 = (2 pi i)^(-n) integral_(Gamma^epsilon (z - a))
      frac(d z, (z_1 - a_1) dots.c (z_n - a_n))
      = res_a ""_(z - a) (1) \
    & quad = res_a ""_(f(z) - f(a)) (H(z, a))
      = res_a ""_f (h) = res_a omega,
  $
  where the third equality is based on the transformation formula (see
  @ss:transformation-formula), and the fourth is based on the fact that
  $res_a ""_(f(z) - f(a)) (H(z, b)) = 0$ (see the lemma in
  @ss:transformation-formula) and $f(a) = 0$. Similarly we can prove that
  $res_b omega = -1$. The property (b) also follows from the lemma in
  @ss:transformation-formula. This proves the theorem.
]

The theorem we have proved is true for an arbitrary compact manifold $X$ if
$F_1, ..., F_n$ are positive (in the sense of Kodaira) divisors in $X$ (see
@bib:Griffiths1976). Without additional restrictions on $X$ or on the divisors,
the theorem is false. For example, let
$X = overline(CC)_(z_1) times overline(CC)_(z_2)$, $F_j = {f_j = 0}$,
$j = 1, 2$, be divisors, each defined by a polynomial $f_j$ that depends only on
$z_j$. Then the condition that the form $omega = h d z \/ f_1 dot f_2$ has poles
only on $F = F_1 + F_2$ is that the degree of $h$ in $z_j$ is less than the
degree of $f_j$ by at least two. Consequently, denoting the zeros of $f_1$ by
${alpha_j}$ and the zeros of $f_2$ by ${beta_k}$, for any form $omega$ with
polar divisor $F$ apart from the relations
$sum_(a = (alpha_j, beta_k)) res_a omega = 0$ we have, for each fixed $k$, the
relations $sum_j res_((alpha_j, beta_k)) omega = 0$.

We observe that the assertion of the proposition in
@ss:total-sum-theorem[subsection] also admits a converse in the following sense:
_for any set of numbers
${R_alpha = R_(alpha_1, ..., alpha_n)}_(alpha subset {1, ..., m})$_ #source(50)
satisfying the relations @eq:residue-relations of
@ss:total-sum-theorem[subsection] (with $Res_alpha omega$ replaced by $R_alpha$)
there is a form $omega$ with polar divisor $F = F_1 + dots.c + F_m$ such that
$Res_alpha omega = R_alpha$ (see @bib:Tsikh1984c).
