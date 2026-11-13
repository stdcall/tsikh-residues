#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

== Semianalytic chains <sec:semianalytic-chains>

The information given here about semianalytic chains is in the paper
@bib:Coleff1978 of Coleff and Herrera, and the reader can find the necessary
homological apparatus in the book @bib:Bredon1967 of Bredon.

#subsection[Definitions] <ss:semianalytic-definitions>
Let $W$ be a real analytic manifold (or some real analytic subset of another
analytic manifold). A subset $M subset W$ is said to be _semianalytic_ if for
each point $a in W$ there is a neighborhood $scr(U)$ in which $M$ is the finite
union of finite intersections of sets given by an analytic equation #source(16)
or inequality. Thus, to construct $M inter scr(U)$ we take sets of the form
$
  {x in scr(U): f(x) = 0}, quad {x in scr(U): g(x) > 0},
$
where $f$ and $g$ are real analytic functions in $scr(U)$, and first their
finite intersections are formed and then finite unions. We shall consider only
locally closed semianalytic sets $M$; for such sets the boundary
$partial M = overline(M) without M$ (here $overline(M)$ is the closure of $M$)
is a closed subset of $W$ and of $overline(M)$.

When integrating differential forms over semianalytic sets it is important to
take their multiplicity into account; this leads to the concept of a
semianalytic chain. Suppose that $dim M <= q$ (here $dim M$ is the real
dimension of the semianalytic set $M$, which is defined as in the case of
complex analytic sets considered in @ss:analytic-definitions). A pair $(M, c)$,
where $c$ is an element of $H_q^F (M) = H_q^F (M, RR)$#notation-mark(
  $H_q^F (X)$,
  sort: "H q X F",
), the homology group with closed supports and real coefficients, is called a
#index-mark("Prechain")_$q$-prechain._ In order to define the boundary of a
prechain, we recall the exact sequence that connects the homology (with closed
supports) of a locally compact space $W$, a closed subset $A$ of it, and the
complement $scr(U) = W without A$:
$
  dots.c -> H_q^F (A) xto(i) H_q^F (W) xto(j) H_q^F (scr(U))
  xto(partial_(scr(U), A)) H_(q - 1)^F (A) -> dots.c .
$ <eq:closed-supports-sequence>
We now define the boundary of the prechain as
$
  partial (M, c) = (partial M, partial_(M, partial M) (c)),
$
where $partial_(M, partial M)$ is the homomorphism from the exact sequence
@eq:closed-supports-sequence when $W = overline(M)$, $A = partial M$. By the sum
of two prechains $(M_1, c_1)$ and $(M_2, c_2)$ we mean the pair
$(M, c'_1 + c'_2)$, where
$M = (M_1 union M_2) without (partial M_1 union partial M_2)$, and $c'_k$ is the
image of $c_k$ under the composition $i_k compose j_k$ of the homomorphisms
$
  H_q^F (M_k) xto(j_k) H_q^F (M_k without (partial M_1 union partial M_2))
  xto(i_k) H_q^F (M), quad k = 1, 2;
$
here the homomorphisms $i_k$ are induced by embeddings, and the $j_k$ are
homomorphisms from @eq:closed-supports-sequence when $W = M_k$,
$A = (partial M_1 union partial M_2) inter M_k$.

On the set of $q$-prechains we introduce an equivalence relation as follows:
$
  (M_1, c_1) ~ (M_2, c_2) <=> (M_1, c_1) + (M_2, -c_2) = (M, 0).
$
The class of $q$-prechains $(M, c)$ with respect to this equivalence relation is
denoted by $[M, c]$ and is called a #index-mark(
  "Chain",
  sub: "semianalytic",
)_semianalytic $q$-chain._ We denote the set of semianalytic $q$-chains in $W$
by $frak(C)_q (W)$.

#subsection[Intersection of semianalytic chains] <ss:semianalytic-intersection>
Let $W$ be a real analytic set of dimension $m$, oriented by its fundamental
class $[W] in H_m^F (W)$. It is convenient to define the intersection of
semianalytic chains by means of cohomology, and here the Poincaré duality
isomorphism helps. If $Y$ is a locally closed subspace of $W$, then the
$inter$-intersection with the help of $[W]$ determines an #source(17)
isomorphism $P$ between the local cohomologies of $W$ with supports on $Y$ and
the homology of $Y$:
$
  P: H_Y^p (W) -> H_(m - p)^F (Y), quad P(alpha) = [W] inter alpha,
$
where the inverse $Delta = P^(-1)$ is the Poincaré duality isomorphism.

To define the intersection of semianalytic chains we introduce the concept of
the faithful representatives of such chains. If $Y$ is a semianalytic subset of
$W$ and its dimension is equal to $q$, then the presheaf of homology groups
${scr(U) -> H_q^F (scr(U))}$ ($scr(U)$ is open in $Y$) is a sheaf, which we
denote by $scr(H)_q^F (Y)$. We can therefore define the support of an element
$c in H_q^F (Y)$ as the support of the corresponding section of the sheaf
$scr(H)_q^F (Y)$. It turns out that each semianalytic $q$-chain
$alpha in frak(C)_q (W)$ is a $q$-prechain $(M, c)$ such that the support of the
element $c in H_q^F (M)$ is $M$ and the support of $partial_(M, partial M) (c)$
coincides with $partial M$. Such a $q$-prechain is unique and is called the
_faithful representative_ of the chain $alpha$.

We now consider semianalytic chains $alpha_k$ in $W$ of dimensions $q_k$,
$k = 1, 2$. Let $(M_k, c_k)$ be the faithful representatives of these chains,
$L = partial M_1 union partial M_2$, and let
$
  j_k: H_(M_k)^(m - q_k) (W without partial M_k)
  -> H_(M_k without L)^(m - q_k) (W without L)
$
be canonical restrictions of local cohomology groups. The intersection
$c_1 dot.c c_2$ of the homology classes $c_1$ and $c_2$ is defined in terms of
the Poincaré duality isomorphism and its inverse by
$
  c_1 dot.c c_2 = P(j_1 (Delta c_1) union j_2 (Delta c_2))
  in H_(q_1 + q_2 - m)^F (M_1 inter M_2);
$
here we have taken into account the fact that
$(M_1 without L) inter (M_2 without L) = M_1 inter M_2$.

Let $alpha_1$ and $alpha_2$ be semianalytic chains of pure dimensions $q_1$ and
$q_2$, where their faithful representatives $(M_1, c_1)$ and $(M_2, c_2)$
satisfy the condition $dim(M_1 inter M_2) <= q_1 + q_2 - m$. In this case the
intersection $alpha_1 dot.c alpha_2$ is defined as the element
$
  [M_1 inter M_2, c_1 dot.c c_2] in frak(C)_(q_1 + q_2 - m) (W).
$

#subsection[Inverse images and orientations of semianalytic chains]
<ss:semianalytic-orientation>
The inverse image of a semianalytic chain under an analytic mapping is defined
by means of the concept of a cohomology semianalytic prechain and the
$inter$-multiplication of homology and cohomology classes (see @bib:Coleff1978).
We shall be interested in semianalytic chains with supports of the form
$
  |T_(I, J)^epsilon|#notation-mark($T_(I, J)^delta$, sort: "T I J")
  = {z in W: |f_i (z)| = epsilon_i, i in I, |f_j (z)| gt.lt epsilon_j,
    j in J},
$
where $W$ is a complex analytic set of pure dimension, $I = {1, ..., s}$,
$J = {s + 1, ..., p}$, and $f = (f_1, ..., f_p)$ is a holomorphic mapping from
$W$ to $CC^p$. With the mapping $f$ there is associated a real analytic mapping
#source(18) $|f| = (|f_1|, ..., |f_p|)$ from
$W without {z: f_1 (z) dots.c f_p (z) = 0}$ to $RR_>^p$ (here
$RR_>$#notation-mark($RR_>$, sort: "R ~>") is a set of positive real numbers).
The semianalytic chains with supports $|T_(I, J)^epsilon|$ that are of interest
to us are the inverse images
$
  T_(I, J)^epsilon = (-1)^(s(s + 1)\/2) |f|^(-1) ({epsilon_I} times
    {t_(s + 1) gt.lt epsilon_(s + 1)} times dots.c times {t_p gt.lt epsilon_p})
$
of a semianalytic chain in $RR_>^p$ that is the product of a point
$epsilon_I = (epsilon_1, ..., epsilon_s) in RR_>^s$ and canonically oriented
intervals $(epsilon_j, +infinity)$ or $(0, epsilon_j)$.

Let us consider the case when $W$ is the space $CC^n$ with coordinates
$z = (z_1, ..., z_n)$, $n = p$. The set $|T_(I, J)^epsilon|$ admits a local
parametrization $z = z(theta_I; (r, theta)_J)$, where
$theta_I = (theta_1, ..., theta_s)$,
$(r, theta)_J = (r_(s + 1), theta_(s + 1), ..., r_n, theta_n)$, and $r_j$,
$theta_j$ are determined from the equalities $f_j (z) = r_j e^(i theta_j)$. Then
the chain $T_(I, J)^epsilon$ can be regarded as the set $|T_(I, J)^epsilon|$
with orientation specified by the order of the parameters
$theta_1, ..., theta_s, r_(s + 1), theta_(s + 1), ..., r_n, theta_n$ (compare
with @ss:orientation). If the chain $T_(I, J)^epsilon$ is relatively compact in
$CC^n$, then the boundary $partial T_(I, J)^epsilon$ is equal to the sum
$
  sum_(j in J) (-1)^s T_(I union {j}, J without {j})^epsilon,
$
where the orientation of each chain $T_(I union {j}, J without {j})^epsilon$ is
determined by the order of the parameters
$theta_1, ..., theta_s, theta_j, r_(s + 1), theta_(s + 1), ..., [j], ..., r_n,
theta_n$
(here $[j]$ means that the pair $theta_j$, $r_j$ is omitted).
