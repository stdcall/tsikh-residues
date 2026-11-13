#import "../main-defs.typ": *
#import "../statements.typ": *
#import "../symbols.typ": *

#heading(numbering: none)[Introduction] <front:introduction>
#source(9)
The technique of residues is known for its many applications in different
branches of mathematics. The concept of a residue very often arises at the
junction of discrete and continuous mathematics: in the framework of discrete
mathematics a residue appears as the apparatus of some calculus or other, and in
those cases when a residue admits an integral interpretation the possibility of
using it is considerably extended (above all thanks to Stokes' formula). The
work of Leray has been a great influence on the development of multidimensional
residues: in connection with the use of partial differential equations he
considered generalizations of the Cauchy residue associated with integration
over tubes around submanifolds of complex analytic manifolds.

In modern function theory and algebraic geometry there are several different
approaches to the definition of a residue. One of these leads to residues
associated with holomorphic mappings of analytic manifolds (sets) into Euclidean
space. These residues are the simplest analogs of the Cauchy residue of a
function in one complex variable. For mappings of sets of the same dimension
they coincide with the Grothendieck local residues in algebraic geometry and
provide a good instrument for the investigation of singularities of holomorphic
and meromorphic vector fields.

It is advisable to associate these residues with holomorphic mappings only under
local considerations. On the whole they are represented by integrals over tubes
around analytic sets and so they are more general than in Leray's theory of
residues. For nondiscrete analytic sets it is advisable to interpret them as
currents, and we can use them to study properties of analytic sets.

In this book we give a systematic account of residues associated with
holomorphic mappings and indicate many applications. The account begins with a
chapter on preliminary information. In it we collect information from the theory
of analytic sets and also material from algebraic topology that is necessary for
the integration of differential forms over chains. We then give a detailed study
of residues associated with mappings that preserve the dimension (local
residues). The scheme of presenting local residues is borrowed to some extent
from the chapter "Residues" in the book @bib:Griffiths1978a by Griffiths and
#source(10) Harris on algebraic geometry: the integral definition of a local
residue is the original, and we prove the continuity principle, the
transformation formula, and the local duality theorem. We give new proofs of
these properties based on the simplest deformations of integrable contours. We
should observe that we derive local duality from Weil's integral formula, and
Weil's formula, as a result of the transformation formula, from Cauchy's
formula. Next we give an algebraic interpretation of a local residue in terms of
the trace with respect to some extension of the field of meromorphic functions.
The construction of the extension is determined by Bishop's integral formula. In
@sec:manifold we prove a theorem on the total sum of residues on a compact
manifold---a multidimensional generalization of a known fact about the vanishing
of the sum of all Cauchy residues of a rational form on the Riemann sphere.
Chapter~@ch:double-series is devoted to applications of local residues to
problems connected with the investigation and calculation of double series and
integrals. In turn, these problems reduce to the investigation of integrals of
meromorphic functions (forms) over compact and noncompact two-dimensional
contours. Here we try to demonstrate the use of local residues, analogous to the
applications of Cauchy residues of functions of one complex variable to the
calculation of definite integrals. For this, in @sec:representability, we
establish a criterion for the representability of integrals over cycles in terms
of local residues. The meaning of this lies in determining whether it is
possible to deform the original contour of integration into the sum of simpler
ones that take part in the definition of a local residue.

In addition, local residues are applied to algebraic geometry in
Chapter~@ch:applications. We solve the question of whether a given polynomial
belongs to an ideal in a polynomial ring (or an ideal in a ring of germs of
holomorphic functions), where we mainly use the duality theorem for local
residues. In @sec:multiplicity we consider the problem of calculating the
multiplicity of a mapping with respect to the Taylor coefficients; this
application is based on the representation of the multiplicity in the form of
the logarithmic residue
$
  (2 pi i)^(-n) integral_Gamma (d f_1)/f_1 and dots.c and (d f_n)/f_n
$
over the local cycle $Gamma$ close to zero of the mapping $f = (f_1, ..., f_n)$.
We should mention that by means of local residues we prove the Weierstrass
preparation theorem (see @sec:weil-formula) for vector functions; the proof is
analogous to the traditional proof of Poincaré for one function, where
one-dimensional residues are used. In the vector case the technique of Cauchy's
multiple formula (or repeated application of one-dimensional residues) is rough,
and multidimensional residues work well. By means of the Weierstrass preparation
theorem for vector functions and the algebraic interpretation of a local residue
mentioned above we prove the coincidence of geometric multiplicity (equal to the
number of simple roots into which the multiple root $a$ for small perturbations
of the mapping $f$ splits) and algebraic multiplicity (equal to #source(11) the
dimension of the quotient-ring $scr(O)_a \/ I_a (f_1, ..., f_n)$ of the ring of
germs of holomorphic functions at a point $a in CC^n$ with respect to the ideal
generated in this ring by the components $f_j$ of the mapping $f$).

In Chapter~@ch:residual-currents we present residues associated with mappings
that lower the dimension, that is, residues of semimeromorphic forms, connected
with integration over tubes around nondiscrete analytic sets. In the simplest
situation such residues are written in the form of a limit
$
  lim_(epsilon -> 0) integral_(abs(f) = epsilon) psi \/ f,
$ <eq:intro-residue>
where $f$ is a function holomorphic in a domain $G subset CC^n$, and $psi$ is a
smooth compactly supported form of degree $2n - 1$. With such a residue there is
closely connected the current of the principal value $[1 \/ f]$:
$
  [1 \/ f](psi) = lim_(epsilon -> 0) integral_(abs(f) > epsilon) psi \/ f,
  quad psi in scr(D)^(2n) (G).
$ <eq:intro-principal-value>
The principal value @eq:intro-principal-value and the residue @eq:intro-residue
were considered by many mathematicians, including Dolbeault, Norguet, Schwartz,
Herrera, and Lieberman. Later the situation we have described was extended by
Coleff and Herrera to the case of codimension greater than one, that is, to the
case of integration of forms $psi \/ f_1 dots.c f_p$ over tubes in analytic
spaces defined by the conditions $|f_j| = epsilon_j$, $j = 1, ..., p$. In
§§@sec:normal-intersections[n], @sec:main-theorem[n], following the work of
Coleff, Herrera, and Passare, by means of resolution of singularities we prove
the existence of residual currents and describe their supports, and in
§§@sec:residual-currents[n], @sec:fibered-residues[n] we derive the properties
of these currents. As an example we find the following residue formula for the
current @eq:intro-residue: if $A$ is the null set of the function $f$, then for
any compactly supported $(n, n - 1)$-form $psi$ we have
$
  lim_(epsilon -> 0) integral_(abs(f) = epsilon) psi \/ f
  = 2 pi i lim_(delta -> 0) integral_(A inter {abs(d f) > delta}) psi \/ d f.
$
If the set $A$ has no singularities, then this formula turns into the well-known
Leray formula. We observe that the language of residual currents is well adapted
to the study of holomorphic functions on analytic sets; such a study is carried
out in @sec:weakly-holomorphic.

We have succeeded in presenting only part of the general theory of
multidimensional residues, namely, we have described integrals over complete
tubes around analytic sets. We have not touched on the very interesting and deep
(in content) integrals over tubes around cycles lying on analytic sets (such
integrals lead to the multidimensional analogs of periods of Abelian integrals,
see Griffiths @bib:Griffiths1969) and also integrals over cycles in nonsingular
fibers $f = t$ that tend to zero as $t -> 0$ (the latter integrals arise in
asymptotic investigations; see, for example, Varchenko @bib:Varchenko1985 and
Palamodov @bib:Palamodov1985).

The sections have continuous numbering and split into subsections. The numbering
of theorems, propositions, lemmas, and formulas is separate in #source(12) each
subsection. In references to assertions and formulas of a different section we
give the number of the section and subsection (for example, the theorem in
@ss:division-with-remainder), and references within the same section are
accompanied only by the number of the subsection. The list of references does
not pretend to be complete and consists mainly of works on residues with respect
to holomorphic mappings and their applications.

The book has been written on the basis of special courses given by the author at
the University of Krasnoyarsk in 1983--1985.

The author expresses his deep gratitude to A. P. Yuzhakov, on whose initiative
the book was written, and who helped to improve the proofs of many assertions.
The author is also grateful to A. A. Alyakrinskii for reading the manuscript and
making a series of critical remarks and to I. M. Belous and O. N. Zhdanov for
their help in putting the manuscript into shape.
