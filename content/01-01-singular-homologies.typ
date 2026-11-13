#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *
#import "diagrams/common.typ": square

== Singular and smooth homologies <sec:singular-homologies>

#subsection[Notation] <ss:notation>
For a topological space $X$ we denote by $C_q (X)$#notation-mark(
  $C_q (X)$,
  sort: "C q X",
), $Z_q (X)$#notation-mark($Z_q (X)$, sort: "Z q X"), $H_q (X)$#notation-mark(
  $H_q (X)$,
  sort: "H q X",
) the #index-mark("Group", sub: "of chains")#index-mark(
  "Group",
  sub: "of cycles",
)#index-mark(
  "Group",
  sub: "singular homology",
)_groups of $q$-dimensional singular chains, cycles, homologies_ respectively
with coefficients in the field of real numbers $RR$. Let
$partial$#notation-mark($partial$, sort: "d") denote the boundary operator:
$partial: C_q (X) -> C_(q - 1) (X)$. If $z in Z_q (X)$, then for the
#index-mark("Class", sub: "homology")_homology class_ of the cycle $z$ (that is,
for an element of the group $H_q (X)$) we use the notation $[z]$; the
#index-mark("Cycles", sub: "homologous")_homology_ condition for two cycles is
written in the form $z_1 ~ z_2$. Let $f: X -> Y$ be a continuous mapping of
topological spaces. Then there is defined the homomorphism
$f_\#: C_q (X) -> C_q (Y)$#notation-mark($f_\#$, sort: "f #") of groups of
chains, which on singular simplexes $sigma in C_q (X)$ is defined by the formula
$f_\# (sigma) = f compose sigma$. In turn, $f_\#$ induces a homomorphism
$f_\#: H_q (X) -> H_q (Y)$. Finally, for the support of the chain $c in C_q (X)$
we use the notation $|c|$.

#subsection[The Mayer-Vietoris exact sequence] <ss:mayer-vietoris>
#index-mark(
  "Sequence",
  sub: "Mayer-Vietoris",
  target: <ss:mayer-vietoris>,
)This is the exact sequence of homomorphisms of homology groups that connects
the homology of the union of two spaces with the homologies of each of them and
their intersection. We shall use this sequence for topological spaces $X_1$ and
$X_2$ that are open in their union $X_1 union X_2$. Thus, under the given
assumptions, the exact sequence (see @bib:Spanier1966, p.~246) is
$
  dots.c xto(partial_*) H_q (X_1 inter X_2) xto(i_*)
  H_q (X_1) plus.o H_q (X_2) xto(j_*) \
  xto(j_*) H_q (X_1 union X_2) xto(partial_*)
  H_(q - 1) (X_1 inter X_2) xto(i_*) dots.c .
$
Here $i_* = (i_(1 *), -i_(2 *))$, where the $i_(k *)$ are induced by the
embeddings $i_k: X_1 inter X_2 -> X_k$, $k = 1, 2$. The homomorphism $j_*$ acts
according to the formula $j_* ([z_1], [z_2]) = [z_1 + z_2]$ for cycles $z_k$ in
$X_k$. The homomorphism $partial_*$ is said to be #index-mark(
  "Homomorphism, connecting",
)_connecting_, and its construction is as follows. Using the fact that $X_1$
#source(14) and $X_2$ are open in their union, we can replace each cycle $z$ in
$X_1 union X_2$ by a cycle $z'$ homologous to it, which is represented in the
form of the sum $c_1 + c_2$ of two chains with supports $|c_k| subset X_k$,
$k = 1, 2$. Then $partial_* [z] = [partial c_1]$#notation-mark(
  $partial_*$,
  sort: "d star",
).

Let $X$, $X_1$, $X_2$ be topological spaces, where $X_1 subset X_2$. If
Mayer-Vietoris exact sequences hold for the pairs $(X, X_1)$, $(X, X_2)$, then
the diagram
$
  #square(
    $H_q (X union X_1)$,
    $H_(q - 1) (X inter X_1)$,
    $H_q (X union X_2)$,
    $H_(q - 1) (X inter X_2)$,
    top: $partial_*^1$,
    bottom: $partial_*^2$,
    west: $alpha$,
    east: $beta$,
  )
$
is commutative, where $partial_*^1$, $partial_*^2$ are connecting homomorphisms,
and $alpha$ and $beta$ are induced by embeddings.

By means of the Mayer-Vietoris exact sequence it is easy to prove by induction
on the dimension that for the $n$-dimensional sphere $S^n$#notation-mark(
  $S^n$,
  sort: "S n",
) and the space
$RR_*^(n + 1) = RR^(n + 1) without {0}$
$
  H_q (S^n) tilde.eq H_q (RR_*^(n + 1))
  tilde.eq cases(ZZ\, quad & q = 0\, n\,, 0\, & q != 0\, n\,)
$
where the generator in $H_n (RR_*^(n + 1))$ is the homology class of $S^n$
enclosing $0$.

#subsection[Orientation of smooth chains] <ss:orientation>
Let $X$ be a differentiable manifold. We recall that a $q$-dimensional _smooth
singular simplex in $X$_ is a mapping $sigma: Delta^q -> X$ of the standard
simplex $Delta^q subset RR^q$, which is continuously differentiable in some
neighborhood of $Delta^q$. The faces of the simplex $sigma$ are defined by the
restrictions $sigma_i = sigma|_(Delta_i^(q - 1))$ to the $(q - 1)$-dimensional
faces $Delta_i^(q - 1)$ of the standard simplex $Delta^q$. A #index-mark(
  "Chain",
  sub: "smooth singular",
)_smooth singular chain_ is a formal linear combination (with real coefficients)
of smooth singular simplexes. Let $t_1, ..., t_q$ be the coordinates of the
space $RR^q$ that contains the standard simplex $Delta^q$. To give a definite
#index-mark("Orientation of a simplex")_orientation_ to the singular simplex
$sigma$ means to fix the order of succession of the coordinates $t_1, ..., t_q$.
If we choose other coordinates $tau_1, ..., tau_q$ in a neighborhood of
$Delta^q$, then their order of succession determines the same orientation when
the Jacobian $partial t \/ partial tau > 0$, and the opposite orientation when
$partial t \/ partial tau < 0$. We can agree that the order $t_1, ..., t_q$
determines the orientation with the $+$ sign when any other order
$t_(j_1), ..., t_(j_q)$ determines the order with the sign $epsilon(J)$, where
$epsilon(J)$ is the parity of the permutation $J = (j_1, ..., j_q)$.

Let us choose a system of coordinates $t_1, ..., t_q$ in $RR^q supset Delta^q$
so that the face $Delta_i^(q - 1)$ of the simplex $Delta^q$ lies in the plane
$t_1 = 0$ and $t_1 <= 0$ at points $t in Delta^q$. We assume that the order
$t_1, ..., t_q$ determines the orientation of the smooth singular simplex
$sigma$. This order induces an orientation of the face
$sigma_i = sigma|_(Delta_i^(q - 1))$ determined by the order $t_2, ..., t_q$.
The #index-mark("Orientation of a simplex", sub: "induced")_induced orientation_
#source(15) is chosen so that the sum of all faces with induced orientation
gives the boundary of the simplex $sigma$: $partial sigma = sum sigma_i$.

The smooth singular chains that occur in the main text are identified, as a
rule, with piecewise smooth submanifolds of the space $CC^n$: such submanifolds
are divided into pieces $V^((nu))$, each of which admits a parametrization
$V^((nu)) = {z = sigma^((nu)) (t)}$ by means of a smooth simplex
$sigma^((nu)) (t)$.

#subsection[The intersection index of chains] <ss:intersection-index>
Now let $X$ be a differentiable oriented manifold of dimension $n$, and let
$alpha$, $beta$ be smooth singular simplexes in $X$ of complementary dimensions:
$dim alpha = r$, $dim beta = q$, $r + q = n$. We assume that the orientation of
$alpha$ is specified by the order of the parameters $t_1, ..., t_r$, and the
orientation of $beta$ by the order of the parameters $tau_1, ..., tau_q$. We say
that the smooth simplexes $alpha$ and $beta$ _intersect transversally_ at the
point $a = alpha(t^0) = beta(tau^0)$ if for local coordinates
$x = (x_1, ..., x_n)$ of the manifold $X$ and the parametrizations $x(t)$ and
$x(tau)$ of the simplexes $alpha$ and $beta$ the Jacobian
$partial x \/ partial (t, tau)$ is nonzero at $(t^0, tau^0)$. The quantity
$sgn partial x \/ partial (t, tau)|_((t^0, tau^0))$ is called the _intersection
index of the simplexes $alpha$ and $beta$ at the point $a$_, denoted by
$ind_a (alpha, beta)$#notation-mark($ind$, sort: "ind"). If the supports
$|alpha|$ and $|beta|$ do not intersect at the point $a$, we put
$ind_a (alpha, beta) = 0$.

Let $c_r = sum m_i alpha^i$ and $b_q = sum n_j beta^j$ be smooth singular chains
of complementary dimensions in $X$ such that any two simplexes $alpha^i$ and
$beta^j$ intersect transversally. Then the _intersection index_ of these chains
is defined as
$
  ind(c_r, b_q) = sum_({a, i, j}) m_i n_j ind_a (alpha^i, beta^j).
$
We note that if the orientation of the sphere $S^(n - 1)$ in the space $RR^n$ is
induced by the orientation of the ball $scr(B)$ that it bounds, then for any ray
$l$ directed from the center of the ball to a point $a^0 in RR^n without scr(B)$
we have $ind(S^(n - 1), l) = (-1)^(n - 1)$. In this case when the chain $c_r$ in
the manifold $X$ is a cycle ($partial c_r = 0$), the intersection index has the
following properties:

1) if $partial b'_q = partial b''_q$, then $ind(c_r, b'_q) = ind(c_r, b''_q)$;

2) if the cycles $c'_r$ and $c''_r$ are homologous ($c'_r ~ c''_r$) in
$X without |partial b_q|$, then $ind(c'_r, b_q) = ind(c''_r, b_q)$.
