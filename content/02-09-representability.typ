#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *
#import "diagrams/common.typ": cd, edge, node

#heading(level: 2)[The representability condition for integrals over cycles \ in
  terms of local residues]
<sec:representability>

A fruitful use of one-dimensional residues is based on the fact that when
Cauchy's theorem is taken into account, the original contour of integration is
replaced by the sum of the simplest contours---small circles around singular
points (poles) of the integrand. As a rule, this feature of the application of
one-dimensional residues does not lead to difficulties, because it is often
#source(57)obvious which singular points lie inside the contour, and so it is
clear which are the residues such that the original integral splits into their
sum. In the multidimensional situation the question of representing the original
surface of integration as the sum of the simplest cycles (for example, local
cycles $Gamma_a$) is more complicated, and here there arises a difficult
topological problem. Let us consider this problem as that of representing
integrals over cycles in terms of local residues.

#subsection[Refinement of the question] <ss:refinement>
Let us give an exact statement of what we understand by "representability of
integrals over cycles in terms of local residues." Let $X$ be a complex analytic
manifold of dimension $n$, and let $omega$ be a meromorphic differential form of
degree $n$ on $X$. We assume that the polar set of $omega$ can be split into $n$
hypersurfaces (divisors) $F_1, ..., F_n$. Everywhere in this section we shall
denote by $F$ the union of the hypersurfaces $F_1, ..., F_n$, and by $Z$ the set
of isolated points of intersection of these hypersurfaces. Consider an integral
of the form
$
  (2 pi i)^(-n) integral_Gamma omega,
$ <eq:cycle-integral>
where $Gamma$ is a cycle of real dimension $n$ in the domain of regularity of
$omega$, that is, in $X without F$. The assumption that $omega$ has poles on $F$
implies that in a neighborhood $scr(U)_a$ of each point $a in X$ it admits the
representation $omega = h d z \/ f_1 dots.c f_n$, where the $f_j$ are the
defining functions of the hypersurfaces $F_j$ in
$scr(U)_a: F_j inter scr(U)_a = {z: f_j (z) = 0}$, and $h$ is a function
holomorphic in $scr(U)_a$. As we have already noted in @ss:divisors, with each
point $a in Z$ there is associated the local cycle
$
  Gamma_a = {z in scr(U)_a: |f_j (z)| = epsilon, quad j = 1, ..., n}.
$ <eq:local-cycle>
Thus, if $Gamma = Gamma_a$, then the integral @eq:cycle-integral is the local
residue $res_a omega$ of $omega$ with respect to the hypersurfaces
$F_1, ..., F_n$. If the cycle $Gamma$ is homologous in the domain of regularity
of $omega$ to a linear combination of local cycles of the form @eq:local-cycle:
#tagged-equation(
  [$*$],
  $
    Gamma ~ sum_(a in Z) n_a Gamma_a, wide n_a "are integers",
  $,
) <eq:representable>
then according to Stokes's formula the integral @eq:cycle-integral reduces to
local residues:
$
  (2 pi i)^(-n) integral_Gamma omega = sum_(a in Z) n_a res_a omega.
$
#new-par
As a result of what we have said, we can refine the meaning of the title of this
section: by the condition of "representability of the integral
@eq:cycle-integral in terms of local residues" we understand the condition of
representability of the cycle $Gamma$ in $X without F$ in the form
@eq:representable, i.e., as a linear combination of local cycles $Gamma_a$. We
now take up the clarification of the latter condition.

#subsection[Separating cycles and their connection with local cycles]
<ss:separating-cycles>
#source(58)As in @ss:refinement[subsection], let $X$ be a complex analytic
manifold of complex dimension $n$, and $F_1, ..., F_n$ be hypersurfaces in $X$
whose union we denote by $F$, and the discrete part of their intersection by
$Z$. We see that in a very general situation the cycle $Gamma$ in $X without F$
can be represented as a sum of local cycles ${Gamma_a}_(a in Z)$ (that is, in
the form @eq:representable) if and only if it "separates" the hypersurfaces
$F_1, ..., F_n$. To this end we say that a nontrivial (that is, not homologous
to zero) $n$-dimensional cycle $Gamma$ in $X without F$ #index-mark(
  "Cycles",
  sub: "separating",
)_separates_ the hypersurfaces $F_1, ..., F_n$ if it satisfies the conditions
$
  Gamma ~ 0 quad "in" X without (F_1 union dots.c [k] dots.c union F_n),
  wide k = 1, ..., n.
$ <eq:separation-conditions>
The conditions @eq:separation-conditions reflect the fact that each of the
hypersurfaces $F_j$ is an obstruction to $Gamma$ being homologous to zero
outside the union of all hypersurfaces. In the one-dimensional situation
($n = 1$), when $X$ is a domain of the complex plane and $F_1 = {a_1, a_2, ...}$
is a discrete set of points in $X$, condition @eq:separation-conditions means
that the cycle $Gamma$ is expressed in terms of small circles around the points
$a_j$, that is, in terms of local cycles. In the multidimensional situation
there is also a connection between local and separating cycles. For example, in
@ss:integral-definition (see the proof of the proposition) we actually showed
that any local cycle $Gamma_a$ splits the hypersurfaces $F_j inter scr(U)_a$,
$j = 1, ..., n$. In fact, for each local cycle $Gamma_a$ we have
$Gamma_a = (-1)^(k - 1) partial c_a^((k))$, where
$
  c_a^((k)) = {z in scr(U)_a: |f_j (z)| = epsilon_j, quad j != k,
    quad |f_k (z)| <= epsilon_k}
$ <eq:faces>
is an $(n + 1)$-chain in $X without (F_1 union dots.c [k] dots.c union F_n)$,
that is, $Gamma_a$ is a cycle that separates the hypersurfaces $F_1, ..., F_n$.
Thus any cycle $Gamma$ representable in the form @eq:representable is
separating. The following example shows that the converse assertion is false,
generally speaking. Let $X = CC^2 without {0}$, $F_j = {z in X: z_j = 0}$,
$j = 1, 2$, and let $Gamma = {z: |z_1| = |z_2| = 1}$ be a 2-cycle in
$X without (F_1 union F_2)$. Clearly, the cycle $Gamma$ separates $F_1$ and
$F_2$, since $Gamma = plus.minus partial c^((j))$, where
$c^((1)) = {z: |z_1| <= 1, |z_2| = 1} subset X without F_2$,
$c^((2)) = {z: |z_1| = 1, |z_2| <= 1} subset X without F_1$. At the same time,
$Gamma$ cannot be represented in the form @eq:representable, since
$F_1 inter F_2 = emptyset$.

This example may refer to the category of pathological cases, so we have the
following result.

#theorem[
  Let $X$ be a Stein manifold of complex dimension $n$, and let $F_1, ..., F_n$
  be an arbitrary system of hypersurfaces in $X$. In order that an
  $n$-dimensional cycle $Gamma$ in $X without F$ can be represented in the form
  @eq:representable it is necessary and sufficient that it separates
  $F_1, ..., F_n$, that is, that it satisfies the conditions
  @eq:separation-conditions.
] <th:separating>

A complete proof of the theorem will be given in @ss:proof[subsection]. We now
make some remarks and prove the theorem when $n = 2$ with the aim of a better
understanding of the essence of the assertion, without going into technical
details.

#remark[
  #source(59)From the proof of the theorem it will be obvious that in the case
  when _the intersection $F_1 inter dots.c inter F_n$ is discrete the assertion
  remains true under the following conditions_: (1) _the homology group
  $H_(2n - 1) (X)$ is trivial_; (2) _for all $j$ from $1$ to $n$ the complements
  $X without F_j$ are Stein manifolds_ (we observe that these conditions are
  satisfied if $X$ is a Stein manifold: according to Serre's theorem
  @bib:Serre1953 $H_q (X) tilde.eq 0$, $q > dim X$, if $X$ is a Stein manifold
  and the homology is considered with coefficients in a field: the fact that if
  $X$ is a Stein manifold, then $X without {"hypersurface"}$ is also a Stein
  manifold can be established directly). In particular, from what we have said
  it follows that the theorem is true for any system of algebraic hypersurfaces
  $F_1, ..., F_n$ in projective space that has discrete intersection.
] <rem:weaker-conditions>

Let us give a proof of the theorem in the case when $n = 2$, the homology group
$H_3 (X)$ is trivial, and the complex curves $F_1$, $F_2$ have discrete
intersection $Z = F_1 inter F_2$. Suppose that the cycle $Gamma$ in
$X without F$ separates $F_1$ and $F_2$, that is, it is homologous to zero in
the domains $X_1 = X without F_2$, $X_2 = X without F_1$. We apply to the open
sets $X_1$, $X_2$ the Mayer-Vietoris exact sequence (see @ss:mayer-vietoris)
$
  H_3 (X_1 union X_2) xto(partial_*) H_2 (X_1 inter X_2) xto(i_*)
  H_2 (X_1) plus.o H_2 (X_2),
$ <eq:mayer-vietoris-two>
where $i_* = (i_(1 *), -i_(2 *))$, the $i_(k *)$ are induced by the embeddings
$i_k: X_1 inter X_2 -> X_k$, $k = 1, 2$, and $partial_*$ is a connecting
homomorphism that acts according to the following rule. Since the $X_k$ are
open, any cycle $h$ in $X_1 union X_2$ is homologous to a certain sum
$c^((1)) + c^((2))$ of chains $c^((k))$ in $X_k$. In view of the fact that
$partial c^((1)) + partial c^((2)) = partial h = 0$, the boundary
$partial c^((1))$ is a cycle in $X_1 inter X_2$, which is the homology class of
the image $partial_* [h]$. Thus, $partial_* [h] = [partial c^((1))]$. By the
condition of the theorem, for a cycle $Gamma$ in
$X without (F_1 union F_2) = X_1 inter X_2$ we have $i_* [Gamma] = 0$, and since
the sequence @eq:mayer-vietoris-two is exact, there is a three-dimensional cycle
$h$ in $X_1 union X_2 = X without F_1 inter F_2$ such that
$
  partial_* [h] = [Gamma], wide [h] in H_3 (X without Z).
$ <eq:boundary-preimage>
Since $H_3 (X) tilde.eq 0$, $H_3 (X without Z)$ is generated by a family of
three-dimensional spheres enclosing points $a in Z$, or equivalently by a family
of boundaries $h_a = partial Pi_a$ of the polyhedra
$
  Pi_a = {z in scr(U)_a: |f_j (z)| <= epsilon_j, quad j = 1, 2}.
$ <eq:polyhedra>
Thus, $h ~ sum_(a in Z) n_a h_a$, so according to @eq:boundary-preimage
$
  [Gamma] = partial_* [sum_(a in Z) n_a h_a] = sum_(a in Z) n_a [partial_* h_a].
$ <eq:class-expansion>
But $h_a = c_a^((1)) + c_a^((2))$, where $c_a^((k))$ are the faces of the
polyhedron $Pi_a$ defined by formula @eq:faces when $n = 2$. Therefore, by the
definition of the homomorphism $partial_*$ and the cycle $Gamma_a$ (see
@eq:local-cycle of @ss:refinement[subsection])
$
  partial_* [h_a] = [partial c_a^((1))] = [Gamma_a],
$
#source(60)and taking account of @eq:class-expansion we see that $Gamma$ can be
represented in the form @eq:representable.

#subsection[Proof of the theorem] <ss:proof>
We observe that the necessity of the condition of the theorem was proved in
@ss:separating-cycles[subsection], even before stating it. Let us prove
sufficiency.

Let $X$ be a Stein manifold of complex dimension $n$, let $F_1, ..., F_n$ be a
family of complex hypersurfaces in $X$, and let $Gamma$ be a real
$n$-dimensional cycle in $X without F$ (we recall that
$F = F_1 union dots.c union F_n$) that separates the given family of
hypersurfaces, that is, $Gamma ~ 0$ in domains $X without F[k]$, where
$F[k] = F_1 union dots.c [k] dots.c union F_n$. We need to prove that $Gamma$
can be represented in the form @eq:representable.

Let us represent $F_1 inter dots.c inter F_n$ as a union $Z union Z'$, where $Z$
is the discrete part of this intersection, and $Z'$ is the analytic subset of
$X$ consisting of irreducible components of dimension $>= 1$. Then for the
manifold $X' = X without Z'$ and the hypersurfaces $F'_j = F_j inter X'$ we have
$X' without F'_j = X without F_j$, $j = 1, ..., n$, so
$X without F = X' without F'$, $X without F[k] = X' without F'[k]$. This means
that the given cycle $Gamma$ is a cycle in $X' without F'$ that separates the
family of hypersurfaces $F'_1, ..., F'_n$ with discrete intersection $Z$.
Moreover, since $X$ is a Stein manifold we have (1)
$H_(2n - 1) (X') tilde.eq 0$, (2) for each $j$ from 1 to $n$ the complement
$X' without F'_j$ is a Stein manifold. In fact, since $X$ does not have compact
"holes," and $Z'$ does not contain compact connected components, there are no
nontrivial $(2n - 1)$-cycles in $X'$; property (2) follows from the equalities
$X' without F'_j = X without F_j$. Finally, we observe that the assertion to be
proved about the representation of $Gamma$ in the form @eq:representable refers
to the discrete part $Z$ of the intersection $F_1 inter dots.c inter F_n$ only.
As a result we come to the conclusion that it is sufficient to prove our
assertion under the following assumptions: (1) $H_(2n - 1) (X) tilde.eq 0$; (2)
$X without F_j$, $j = 1, ..., n$, _are Stein manifolds_; (3) _the intersection
$Z = F_1 inter dots.c inter F_n$ is discrete._

We first prove the following lemma.

#lemma[
  Let $X$ be a complex analytic manifold of dimension $n$ and let
  $Phi_0, Phi_1, ..., Phi_s$ be hypersurfaces in $X$ such that the complements
  $X without Phi_j$, $j = 0, 1, ..., s$, are Stein manifolds. Then
  $
    H_(n + q) (X without Phi_0 inter Phi_1 inter dots.c inter Phi_s) tilde.eq 0
    quad "for all" q > s.
  $
] <lem:stein-homology>

#proof[
  We proceed by induction on $s$. If $s = 0$, then the assertion that
  $H_(n + q) (X without Phi_0)$ is trivial when $q > 0$ follows from the result
  of Serre cited in the remark of @ss:separating-cycles[subsection], since by
  hypothesis $X without Phi_0$ is a Stein manifold. We put
  $Phi^j = Phi_0 inter Phi_1 inter dots.c inter Phi_j$ and assume that
  $H_(n + q) (X without Phi^(s - 1)) tilde.eq 0$ for all $q > s - 1$. Obviously
  $
    X without Phi^s = X without (Phi^(s - 1) inter Phi_s)
    = (X without Phi^(s - 1)) union (X without Phi_s).
  $
  In the Mayer-Vietoris exact sequence we put $X_1 = X without Phi^(s - 1)$,
  $X_2 = X without Phi_s$; #source(61)when $q > s - 1$ it takes the form
  $
    0 -> H_(n + q + 1) (X without Phi^s) xto(partial_*)
    H_(n + q) [(X without Phi_s) without Phi^(s - 1)] -> 0,
  $
  since by the induction assumption
  $H_(n + j) (X without Phi^(s - 1)) plus.o H_(n + j) (X without Phi_s)
  tilde.eq 0$ for $j = q, q + 1$ if $q > s - 1$. But by hypothesis
  $X without Phi_s$ is a Stein manifold, and so are the complements
  $(X without Phi_s) without Phi_j$, $j = 0, 1, ..., s - 1$. Therefore by the
  inductive assumption the exactness of the sequence implies that
  $
    H_(n + q + 1) (X without Phi^s)
    tilde.eq H_(n + q) [(X without Phi_s) without Phi^(s - 1)] tilde.eq 0
  $
  for $q > s - 1$ or $q + 1 > s$. This completes the proof of the lemma.
]

#proof(title: [Proof of the theorem.])[
  We introduce the notation
  $
    F^k = inter.big_(j = 1)^k F_j, quad
    ""_k F = union.big_(j = k + 1)^n F_j, quad
    k = 1, ..., n - 1; \
    F^0 = ""_0 F = F = union.big_(j = 1)^n F_j.
  $
  For each $k = 0, 1, ..., n - 1$ we consider the intersection
  $L_k := ""_k F inter F^k$. Clearly,
  $
    L_0 = F, quad L_(n - 1) = Z, quad
    L_k = (""_k F inter F^(k - 1)) inter F^k, quad
    L_(k - 1) = (""_k F inter F^(k - 1)) union F^k.
  $
  For open sets $X_k = X without (""_k F inter F^(k - 1))$,
  $X'_k = X without F^k$ we consider the family of Mayer-Vietoris exact
  sequences (we observe that $X_k union X'_k = X without L_k$,
  $X_k inter X'_k = X without L_(k - 1)$):
  $
    xto(j_*^k) H_(n + q + 1) (X without L_k) xto(partial_*^k)
    H_(n + q) (X without L_(k - 1)) \
    xto(i_*^k) H_(n + q) (X_k) plus.o H_(n + q) (X'_k) ->,
  $ <eq:mayer-vietoris-family>
  $k = 1, ..., n - 1$. This family determines the following sequence:
  $
    H_n (X without F) xfrom(partial_*^1)
    H_(n + 1) (X without L_1) xfrom(partial_*^2) \
    dots.c xfrom(partial_*^k) H_(n + k) (X without L_k)
    xfrom(partial_*^(k + 1)) dots.c
    xfrom(partial_*^(n - 1)) H_(2n - 1) (X without Z).
  $ <eq:boundary-sequence>
  #new-par
  Let $Gamma$ be an $n$-cycle in $X without F$ that separates the family
  $F_1, ..., F_n$. The proof that $Gamma$ can be represented in the form
  @eq:representable consists in verifying the following assertions:

  (a) there is a $(2n - 1)$-cycle $h_(2n - 1)$ in $X without Z$ such that
  $partial_*^1 compose dots.c compose partial_*^(n - 1) [h_(2n - 1)]
  = [Gamma]$; in the sequence @eq:boundary-sequence;

  (b) the equality
  $partial_*^1 compose dots.c compose partial_*^(n - 1) [h_(2n - 1)]
  = sum_(a in Z) n_a Gamma_a$ is satisfied.

  Let us prove (a). Since $Gamma ~ 0$ in $X without F[1] = X_1$ and in
  $X without F_1 = X'_1$, from the fact that the sequence
  @eq:mayer-vietoris-family is exact when $k = 1$ it follows that there is an
  element $[h_(n + 1)] in H_(n + 1) (X without L_1)$ for which in
  @eq:mayer-vietoris-family, and therefore #source(62)in @eq:boundary-sequence,
  $partial_*^1 [h_(n + 1)] = [Gamma]$. We now apply induction on $k$. Suppose
  that in $H_(n + k - 1) (X without L_(k - 1))$ there is an element
  $[h_(n + k - 1)]$ that satisfies the condition
  $
    partial_*^1 compose dots.c compose partial_*^(k - 1) [h_(n + k - 1)]
    = [Gamma].
  $
  #new-par
  We show that there is an $(n + k)$-cycle in $X without L_k$ with the property
  $partial_*^k [h_(n + k)] = [h_(n + k - 1)]$. For this, with each $L_k$,
  $k = 1, ..., n - 1$, we associate the sets
  $
    M_i = M_i (k) = (""_i F without F_k) inter F^i, wide
    N_i = N_i (k) = (""_i F without ""_k F) inter F^i, & \
                                 i = 0, 1, ..., k - 1. &
  $
  Obviously the sets $M_i (k)$ and $N_i (k)$ are constructed similarly to $L_i$,
  except that they start from the totality of hypersurfaces
  $F_1, ..., F_(k - 1), F_(k + 1), ..., F_n$ and $F_1, ..., F_k$ respectively;
  we have
  $
    X without M_(k - 1) = X_k, quad X without N_(k - 1) = X'_k, quad
    X without M_0 = X without F[k], \
    X without N_0 = X without F_1 union dots.c union F_k.
  $
  We put $tilde(X)_i = X without [(""_i F without F_k) inter F^(i - 1)]$,
  $tilde(X)'_i = X without F^i$. Clearly
  $tilde(X)_i union tilde(X)'_i = X without M_i$,
  $tilde(X)_i inter tilde(X)'_i = X without M_(i - 1)$. For each pair
  $(tilde(X)_i, tilde(X)'_i)$ we write exact sequences of type
  @eq:mayer-vietoris-family:
  $
    -> H_(n + s + 1) (X without M_i) xto(tilde(partial)_*^i)
    H_(n + s) (X without M_(i - 1)) -> H_(n + s) (tilde(X)_i)
    plus.o H_(n + s) (tilde(X)'_i) ->,
  $ <eq:mayer-vietoris-tilde>
  $i = 1, ..., k - 1$, and associate with them a sequence analogous to the
  sequence @eq:boundary-sequence:
  $
    H_n (X without F[k]) xfrom(tilde(partial)_*^1)
    H_(n + 1) (X without M_1) xfrom(tilde(partial)_*^2)
    H_(n + 2) (X without M_2) <- \
    dots.c xfrom(tilde(partial)_*^(k - 1))
    H_(n + k - 1) (X without M_(k - 1)).
  $ <eq:boundary-sequence-tilde>
  Here all of the $tilde(partial)_*^i$ are monomorphisms, since the sequences
  @eq:mayer-vietoris-tilde are exact, and by the lemma
  $H_(n + i) (tilde(X)_i) tilde.eq H_(n + i) (tilde(X)'_i) tilde.eq 0$. By means
  of the sequences @eq:boundary-sequence–@eq:boundary-sequence-tilde we
  construct the following diagram:
  $
    #cd(
      spacing: (8mm, 7mm),
      node((0, 0), $H_n (X without F)$),
      node((1, 0), $H_(n + 1) (X without L_1)$),
      node((1.75, 0), $dots.c$),
      node((0.3, 1), $dots.c$),
      node((1, 1), $H_(n + k - 1) (X without L_(k - 1))$),
      node((2, 1), $H_(n + k) (X without L_k)$),
      node((0.3, 2), $dots.c$),
      node((1, 2), $H_(n + k - 1) (X without M_(k - 1))$),
      node((0, 3), $H_n (X without F[k])$),
      node((1, 3), $H_(n + 1) (X without M_1)$),
      node((1.75, 3), $dots.c,$),
      edge((1, 0), (0, 0), $partial_*^1$, "->", label-side: right),
      edge((1.75, 0), (1, 0), $partial_*^2$, "->", label-side: right),
      edge((0.3, 1), (0.3, 0.5), (1.95, 0.5), (1.95, 0), "->"),
      edge((1, 1), (0.3, 1), $partial_*^(k - 1)$, "->", label-side: right),
      edge((2, 1), (1, 1), $partial_*^k$, "->", label-side: right),
      edge((1, 1), (1, 2), $i_(* 1)^(k - 1)$, "->", label-side: left),
      edge(
        (1, 2),
        (0.3, 2),
        $tilde(partial)_*^(k - 1)$,
        "->",
        label-side: right,
      ),
      edge((0.3, 2), (0.3, 2.5), (1.95, 2.5), (1.95, 3), "->"),
      edge((1, 3), (0, 3), $tilde(partial)_*^1$, "->", label-side: right),
      edge((1.75, 3), (1, 3), $tilde(partial)_*^2$, "->", label-side: right),
      edge((0, 0), (0, 3), $beta_k$, "->", label-side: left),
    )
  $ <eq:residue-diagram-k>
  #source(63)where $i_(* 1)^(k - 1)$ is a projection of the homomorphism
  $
    i_*^(k - 1): H_(n + k - 1) (X without L_(k - 1))
    -> H_(n + k - 1) (X without M_(k - 1))
    plus.o H_(n + k - 1) (X without N_(k - 1))
  $
  in the sequence @eq:mayer-vietoris-family onto the first term
  $H_(n + k - 1) (X without M_(k - 1))$, and $beta_k$ is the homomorphism
  induced by the embedding $X without F subset X without F[k]$. Since
  $X without L_q = X_q union X'_q$,
  $X without M_q = tilde(X)_q union tilde(X)'_q$, $X_q subset tilde(X)_q$,
  $X'_q = tilde(X)'_q$, the diagram (see @ss:mayer-vietoris)
  $
    #cd(
      node((0, 0), $H_(n + q - 1) (X without L_(q - 1))$),
      node((1, 0), $H_(n + q) (X without L_q)$),
      node((0, 1), $H_(n + q - 1) (X without M_(q - 1))$),
      node((1, 1), $H_(n + q) (X without M_q)$),
      edge((1, 0), (0, 0), $partial_*^q$, "->", label-side: right),
      edge((1, 1), (0, 1), $tilde(partial)_*^q$, "->", label-side: right),
      edge((0, 0), (0, 1), $alpha_(q - 1)$, "->", label-side: left),
      edge((1, 0), (1, 1), $alpha_q$, "->", label-side: left),
    )
  $
  is commutative, where $alpha_q$, $q = 1, ..., k - 1$, are homomorphisms
  induced by embeddings. Therefore in the diagram @eq:residue-diagram-k we have
  the equality
  $
    beta_k compose partial_*^1 compose dots.c compose partial_*^(k - 1)
    [h_(n + k - 1)]
    = tilde(partial)_*^1 compose dots.c compose tilde(partial)_*^(k - 1)
    compose i_(* 1)^(k - 1) [h_(n + k - 1)].
  $
  But by the inductive assumption
  $partial_*^1 compose dots.c compose partial_*^(k - 1) [h_(n + k - 1)]
  = [Gamma]$, and by the condition of the theorem $beta_k [Gamma] = 0$, so
  $tilde(partial)_*^1 compose tilde(partial)_*^2 compose dots.c compose
  tilde(partial)^(k - 1) compose i_(* 1)^(k - 1) [h_(n + k - 1)] = 0$. Since
  $tilde(partial)_*^q$, $q = 1, ..., k - 1$, are monomorphisms,
  $i_(* 1)^(k - 1) [h_(n + k - 1)] = 0$.

  In exactly the same way we prove that the element
  $i_(* 2)^(k - 1) [h_(n + k - 1)]
  in H_(n + k - 1) (X without N_(k - 1)) = H_(n + k - 1) (X'_k)$ is zero, where
  $i_(* 2)^(k - 1)$ is the projection of the homomorphism $i_*^(k - 1)$ onto the
  second term. Now from the fact that the sequence @eq:mayer-vietoris-family is
  exact and the fact that $i_*^(k - 1) [h_(n + k - 1)] = 0$ it follows that
  there is an element $[h_(n + k)] in H_(n + k) (X without L_k)$ such that
  $partial_*^k [h_(n + k)] = [h_(n + k - 1)]$, and the inductive assumption
  proves assertion (a).

  Let us prove (b). Since $H_(2n - 1) (X) tilde.eq 0$ and $Z$ is discrete (see
  the arguments at the beginning of @ss:proof[subsection]), as the base of the
  $(2n - 1)$-dimensional homology of $X without Z$ we can take the family of
  faces ${h_a = partial Pi_a}_(a in Z)$ of the polyhedra
  $
    Pi_a = {z in scr(U)_a: |f_j (z)| < epsilon_j, quad j = 1, ..., n},
  $
  where $scr(U)_a$ are disjoint neighborhoods of points $a in Z$, and the $f_j$
  are the functions that define the $F_j$ in $scr(U)_a$. Therefore the cycle
  $h_(2n - 1)$ constructed by induction is homologous in $X without Z$ to the
  sum $sum_(a in Z) n_a h_a$. In the proof of the theorem on the total sum of
  residues (see @ss:total-sum-theorem) we obtained the equality
  $partial_*^1 compose dots.c compose partial_*^(n - 1) h_a = Gamma_a$. Thus
  assertion (b), and with it the theorem, are proved.
]

#subsection[Coefficients of separation] <ss:separation-coefficients>
According to the theorem we have just proved, in Stein manifolds cycles of the
form @eq:representable, and only these cycles, are separating. Therefore we call
the integer $n_a = n_a (Gamma)$ in the expansion #source(64)@eq:representable
the #index-mark(
  "Coefficient of separation",
)_coefficient of separation_ of the hypersurfaces $F_1, ..., F_n$ by the cycle
$Gamma$ at the point $a$.

Let us indicate a method of calculating the coefficients of separation in the
two-dimensional case. We observe that according to the proof (see
@ss:separating-cycles[subsection]) in this case the theorem on the description
of separating cycles is true if $H_3 (X) tilde.eq 0$ and $F_1$, $F_2$ are curves
in $X$ with discrete intersection $Z$. Thus, let $Gamma$ be a separating
two-dimensional cycle in $X without (F_1 union F_2)$, that is,
$Gamma = partial c^((k))$, where $c^((k))$ is a chain in $X without F_k$,
$k = 1, 2$. Then $c^((2)) - c^((1))$ is a three-dimensional cycle in
$X without Z$, and since $H_3 (X) tilde.eq 0$ we have
$c^((2)) - c^((1)) = partial Omega$ for some 4-chain $Omega$ in $X$. Suppose
that $a^((0)) in X without |Omega|$, where $|Omega|$ is the support of the chain
$Omega$.

#proposition[
  For a separating cycle $Gamma$ in $X without (F_1 union F_2)$ the coefficient
  of separation of the curves $F_1$ and $F_2$ at a point $a in Z$ is equal to
  the intersection index of the cycle $partial Omega$ with the curve $l_a$
  joining the point $a^((0))$ to the point $a$. In other words,
  $Gamma ~ sum_(a in Z) n_a Gamma_a$, where $n_a = ind(partial Omega, l_a)$,
  $Z = F_1 inter F_2$.
] <prop:separation-index>

#remark[
  From property (1) of the intersection index (see @ss:intersection-index) it
  follows that for a fixed chain $Omega$ the index $ind(partial Omega, l_a)$
  does not depend on the choice of the curve $l_a$.
] <rem:index-independence>

#proof[
  From the construction of the chain $Omega$ we have
  $partial_* [partial Omega] = [Gamma]$, where
  $partial_*: H_3 (X without Z) -> H_2 (X without F)$ is the connecting
  homomorphism described in the proof in @ss:separating-cycles[subsection]. The
  expansion of the cycle $partial Omega$ with respect to a system of generators
  ${h_a}_(a in Z)$ (we recall that $h_a = partial Pi_a$ is the boundary of the
  polyhedron @eq:polyhedra in @ss:separating-cycles[subsection]) has the form
  $
    partial Omega ~ sum_(b in Z inter |Omega|) m_b h_b.
  $
  Since $partial_* [partial Omega] = Gamma$, from @eq:class-expansion in
  @ss:separating-cycles[subsection] we conclude that the coefficients of
  separation $n_a$ can be chosen so that $n_b = m_b$ for $b in Z inter |Omega|$
  and $n_b = 0$ for all remaining $b$.

  Consequently, by property (2) of the intersection index (see
  @ss:intersection-index) $ind(partial Omega, l_a) = sum n_b dot ind(h_b, l_a)$.
  But since the curve $l_a$ can always be chosen to be disjoint with all of the
  $h_b$ when $b != a$, $ind(h_b, l_a) = 0$ when $b != a$. As we noted in
  @ss:separating-cycles[subsection], the cycle $h_a$ is homologous to the
  three-dimensional sphere $S_a^3$ whose orientation is induced by the
  orientation of the ball enveloping it, and this means that
  $ind(h_a, l_a) = ind(S_a^3, l_a) = 1$ (see @ss:intersection-index); our
  assertion is thus proved.
]

In practical applications (see Chapter~@ch:double-series, for example) the chain
$Omega$ mentioned in the proposition is often the closure of a domain
$G subset X$ with piecewise smooth boundary $partial G$. Since in this case for
any $a in X$, $a^0 in X without overline(G)$ the intersection index
$ind(partial G, l_a)$ is equal to one if $a$ lies in $G$ and zero otherwise,
from the proposition we have the following corollary.

#corollary[
  #source(65)If for a two-dimensional cycle $Gamma$ in
  $X without (F_1 union F_2)$ we have $Gamma = partial c^((k))$, where $c^((k))$
  are chains in $X without F_k$, $k = 1, 2$, such that $c^((2)) - c^((1))$ is
  the boundary of some domain $G subset X$, then
  $
    Gamma ~ sum_(a in G) Gamma_a.
  $
] <cor:domain-boundary>

We observe that in the summation we should have written $a in Z inter G$; our
notation is justified by the fact that when $a in.not Z$ the support $|Gamma_a|$
is an empty set.

We are automatically in the conditions of Corollary~@cor:domain-boundary if we
consider: a domain $G$ in the space $CC^2$ that is the product $G_1 times G_2$
of planar domains; complex curves $F_j = {z in G: f_j (z) = 0}$
($f_j in scr(O) (overline(G))$, $j = 1, 2$); the cycle
$Gamma = partial G_1 times partial G_2$.

#corollary[
  If $f_1 (z) != 0$ for $z in partial G_1 times G_2$, and $f_2 (z) != 0$ for
  $z in G_1 times partial G_2$,#ed-note[The 1992 edition has $f_1 (z) != 0$ for
    $z in G_1 times partial G_2$ and $f_2 (z) = 0$ for
    $z in partial G_1 times G_2$. Even with $!=$ in the second condition this
    does not suffice: for $f = (z_2, z_1)$ on the unit bidisk the integral of
    $d z_1 and d z_2 \/ (f_1 f_2)$ over $Gamma$ is $(2 pi i)^2$, over
    $Gamma_0^epsilon (f)$ it is $-(2 pi i)^2$. The hypotheses above are those of
    the generalization that follows.] then for the cycle
  $Gamma = partial G_1 times partial G_2$ we have the representation
  $
    Gamma ~ sum_(a in G) Gamma_a^epsilon (f),
  $
  where
  $Gamma_a^epsilon (f) = {z in scr(U)_a: |f_j (z)| = epsilon_j, j = 1, 2}$.
] <cor:product-domain>

A more thorough analysis of the theorem on separating cycles enables us to
generalize the result of Corollary~@cor:product-domain to the multidimensional
situation as follows: if $Gamma = partial G_1 times dots.c times partial G_n$
and for the functions $f_j in scr(O) (overline(G))$,
$G = G_1 times dots.c times G_n$ we have $f_j (z) != 0$ for
$z in G_1 times dots.c times partial G_j times dots.c times G_n$,
$j = 1, ..., n$, then the cycle $Gamma$ can be expressed in terms of local
cycles $Gamma_a = Gamma_a^epsilon (f)$ by the formula
$
  Gamma = sum_(a in G) Gamma_a.
$
Hence we have the following variant of the logarithmic residue formula (compare
Proposition~@prop:logarithmic-residue in @ss:geometric-trace): if
$phi in scr(O) (overline(G))$, then under the stated conditions on $G$, $Gamma$,
and $f_j$ we have the formula
$
  sum_(a in f^(-1) (0) inter G) mu_a (f) dot phi(a)
  = (2 pi i)^(-n) integral_Gamma
  phi frac(d f_1, f_1) and dots.c and frac(d f_n, f_n).
$

#subsection[Cycles that separate $m > dim X$ hypersurfaces]
<ss:many-hypersurfaces>
Consider a complex analytic manifold $X$ of dimension $n$ and a family of
hypersurfaces $F_1, ..., F_m$ in $X$, where $m > n$. As before, we put
$F = F_1 union dots.c union F_m$. We say that a real $n$-dimensional cycle
$Gamma$ in $X without F$ _separates the hypersurfaces_ $F_1, ..., F_m$ if
$
  Gamma ~ 0 quad "in" X without (F_(j_1) union dots.c union F_(j_(n - 1)))
$ <eq:many-separation>
for any set of $n - 1$ indices ${j_1, ..., j_(n - 1)} subset {1, ..., m}$. It
turns out, as in the case $m = n$, that separating cycles are closely connected
with local #source(66)cycles. In the situation $m > n$ we define local cycles as
follows. We split the set ${1, ..., m}$ into $n$ nonempty disjoint subsets
$J_1, ..., J_n$ and consider the system of $n$ hypersurfaces
$scr(T)_J = {T_1, ..., T_n}$, where $T_j = union.big_(k in J_j) F_k$. With each
isolated point $a$ of the intersection $T_1 inter dots.c inter T_n$ we associate
the local cycle
$
  Gamma_(J, a) = {z in scr(U)_a: |phi_j (z)| = epsilon_j, quad j = 1, ..., n},
$ <eq:partition-cycle>
where the $phi_j$ are the defining functions for the $T_j$ in
$scr(U)_a: T_j inter scr(U)_a
= {z in scr(U)_a: phi_j = product_(k in J_j) f_k = 0}$ (in this representation
the $f_k$ are the defining functions for the $F_k$). We denote by
$H_n^* (X without F)$ the subgroup of the homology group $H_n (X without F)$
generated by cycles of the form @eq:partition-cycle for all possible partitions
$J$ and isolated points $a$ of intersections of the families $scr(T)_J$. Thus,
the homology class of the cycle $Gamma$ in $X without F$ belongs to this
subgroup if
$
  Gamma ~ sum_(J, a) n_(J, a) Gamma_(J, a).
$

#theorem[
  Let $X$ be a Stein manifold of dimension $n$ and let
  $scr(F) = {F_1, ..., F_m}$ be a family of hypersurfaces in $X$ such that for
  any $alpha = {alpha_1, ..., alpha_n} subset {1, ..., m}$ the intersection
  $Z_alpha = F_(alpha_1) inter dots.c inter F_(alpha_n)$ is discrete and
  $Z_alpha inter Z_beta = emptyset$ for $alpha != beta$. Then the homology class
  of the cycle $Gamma$ in $X without F$ belongs to the subgroup
  $H_n^* (X without F)$ if and only if $Gamma$ separates the family of
  hypersurfaces $scr(F)$.
] <th:many-separating>

#proof[
  _Necessity._ It is sufficient to prove that for any partition
  $J = {J_1, ..., J_n}$ of the set ${1, ..., m}$ and each point of intersection
  $a$ of the family $scr(T)_J$ the local cycle $Gamma_(J, a)$ is separating. Let
  us fix an arbitrary set ${j_1, ..., j_(n - 1)}$ in ${1, ..., m}$. Clearly, at
  least one element $J_k$ of any partition $J$ does not contain any of the
  numbers $j_1, ..., j_(n - 1)$. Then
  $Gamma_(J, a) = plus.minus partial c_(J, a)^((k))$, where the chain
  $c_(J, a)^((k)) = {z in scr(U)_a: |phi_j (z)| = epsilon_j, j != k,
    |phi_k (z)| <= epsilon_k}$ lies in
  $X without (T_1 union dots.c [k] dots.c union T_n)
  subset X without (F_(j_1) union dots.c union F_(j_(n - 1)))$, that is,
  $Gamma_(J, a)$ is a separating cycle.

  _Sufficiency._ Let $Gamma$ be an $n$-cycle in $X without F$ that separates the
  hypersurfaces $F_1, ..., F_m$, that is, it satisfies the conditions
  @eq:many-separation. According to the theorem of
  @ss:separating-cycles[subsection], for any set
  $alpha = (alpha_1, ..., alpha_n) subset {1, ..., m}$ the cycle $Gamma$ admits
  the expansion
  $
    Gamma ~ sum_(a in Z_alpha) n_a (alpha) Gamma_a (alpha) quad
    "in" X without union.big_(j = 1)^n F_(alpha_j),
  $ <eq:alpha-expansion>
  where $Gamma_a (alpha)$ is the local cycle at the point $a in Z_alpha$
  constructed from the hypersurfaces $F_(alpha_1), ..., F_(alpha_n)$, that is,
  $Gamma_a (alpha)
  = {z in scr(U)_a: |f_(alpha_j) (z)| = epsilon_j, j = 1, ..., n}$. Since by
  hypothesis for any $k in {1, ..., m} without alpha$ the hypersurface $F_k$
  does not pass through the point $a in Z_alpha$, according to the lemma of
  @ss:divisors we have $[Gamma_a (alpha)] in H_n^* (X without F)$.

  #source(67)Let $omega$ be an arbitrary differential closed $n$-form in
  $X without F$. Since $X without F$ is a Stein manifold, by Serre's theorem
  @bib:Serre1953 $omega$ is cohomologous to a holomorphic $n$-form $phi$ in
  $X without F$. We observe that the form $phi$ can be represented as
  $phi = sum phi_alpha$, where $phi_alpha$ is a form holomorphic in
  $X without (F_(alpha_1) union dots.c union F_(alpha_n))$, and the summation is
  taken over all sets $alpha subset {1, ..., m}$ of length $n$. In fact, by the
  hypothesis of the theorem any $n + 1$ hypersurfaces of the family $F$ have
  empty intersection, so the sets $scr(U)_j = X without F_j$, $j = 1, ..., m$,
  form a covering of the manifold $X$. It is well known that, for any Stein
  manifold, cohomology groups of positive dimension with values in the sheaf
  $Omega^p$ of germs of holomorphic forms are trivial. Consequently, by Leray's
  theorem on acyclic coverings @bib:Griffiths1978a (in our case $scr(U)_j$ are
  Stein manifolds) for the covering
  $underline(scr(U)) = {scr(U)_j}_(j = 1, ..., m)$ of the manifold $X$ we have
  $
    H^(m - 1) (underline(scr(U)), Omega^n) tilde.eq H^(m - 1) (X, Omega^n)
    tilde.eq 0.
  $
  This means that the form $phi in Omega^n (X without F)
  = Omega^n (inter.big_(j = 1)^m (X without F_j))$, regarded as a holomorphic
  $(m - 1)$-cocycle, is trivial, that is, $phi = sum_(j = 1)^m phi_j$, where
  $phi_j in Omega^n (X without F[j])$. Next we apply the same arguments to the
  forms $phi_j$, and so on, until we obtain an expansion for $phi$ as a sum
  $sum phi_alpha$ of forms $phi_alpha$ with singularities on at most $n$
  hypersurfaces of the family $scr(F)$. Now for the form $omega ~ phi$ from
  @eq:alpha-expansion we have
  $
    integral_Gamma omega = sum_alpha integral_Gamma phi_alpha
    = sum_alpha sum_(a in Z_alpha) n_a (alpha)
    integral_(Gamma_a (alpha)) phi_alpha.
  $
  Consider the cycle
  $tilde(Gamma) = sum_alpha sum_(a in Z_alpha) n_a (alpha) Gamma_a (alpha)$, for
  which
  $
    integral_(tilde(Gamma)) omega
    = sum_alpha sum_(a in Z_alpha) sum_beta n_a (alpha)
    integral_(Gamma_a (alpha)) phi_beta
    = sum_alpha sum_(a in Z_alpha) n_a (alpha)
    integral_(Gamma_a (alpha)) phi_alpha;
  $
  here the last equality is explained by the fact that when $beta != alpha$ and
  $a in Z_alpha$ the cycle $Gamma_a (alpha)$ is homologous to zero in
  $X without union.big_(j in beta) F_j$, the domain of holomorphy of $phi_beta$,
  and therefore $integral_(Gamma_a (alpha)) phi_beta = 0$. Thus, for any closed
  $n$-form $omega$ in $X without F$ we have
  $integral_Gamma omega = integral_(tilde(Gamma)) omega$. By de Rham's theorem
  $Gamma ~ tilde(Gamma)$ in $X without F$, so $[Gamma] in H_n^* (X without F)$.
]
