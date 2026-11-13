#set document(
  title: "Multidimensional Residues and Their Applications",
  author: "A. K. Tsikh",
  date: none,
)
#import "frontmatter/cover.typ": cover
#import "book-style.typ": blank-page, book-style, contents-style, recto-break

#cover()

#show: book-style

// Front matter: i half-title, ii the titles of the series, iii title,
// iv copyright page, v-vi Contents, vii-x Introduction.
#set page(numbering: "i")
#counter(page).update(1)
#[
  #set page(header: none)
  #include "frontmatter/half-title.typ"
  #pagebreak()
  #include "frontmatter/series.typ"
  #pagebreak()
  #include "frontmatter/title.typ"
  #pagebreak()
  #include "frontmatter/publication.typ"
  #pagebreak()
]
#[
  #show: contents-style
  #heading(numbering: none, outlined: false, bookmarked: true)[Contents]
  <front:contents>
  #outline(title: none, depth: 2)
]
#recto-break()
#include "frontmatter/introduction.typ"

#recto-break()
#set page(numbering: "1")
#counter(page).update(1)
#include "01-00-preliminary.typ"
#include "01-01-singular-homologies.typ"
#include "01-02-semianalytic-chains.typ"
#include "01-03-differential-forms.typ"
#include "01-04-analytic-sets.typ"
#recto-break()
#include "02-00-local-residues.typ"
#include "02-05-local-residue.typ"
#include "02-06-trace.typ"
#include "02-07-manifold.typ"
#include "02-08-total-sum.typ"
#include "02-09-representability.typ"
#include "02-10-parameter.typ"
#include "02-90-appendix.typ"
#include "02-99-notes.typ"
#recto-break()
#include "03-00-residual-currents.typ"
#include "03-11-main-facts.typ"
#include "03-12-normal-intersections.typ"
#include "03-13-main-theorem.typ"
#include "03-14-residual-currents.typ"
#include "03-15-fibered-residues.typ"
#include "03-90-appendix.typ"
#include "03-99-notes.typ"
#recto-break()
#include "04-00-applications.typ"
#include "04-16-weil-formula.typ"
#include "04-17-weakly-holomorphic.typ"
#include "04-18-logarithmic-residue.typ"
#include "04-19-multiplicity.typ"
#include "04-20-polynomial-ideals.typ"
#include "04-99-notes.typ"
#recto-break()
#include "05-00-double-series.typ"
#include "05-21-hadamard.typ"
#include "05-22-filter.typ"
#include "05-23-integrals.typ"
#include "05-99-notes.typ"

#recto-break()
#include "80-bibliography.typ"
#recto-break()
#include "95-notation.typ"
#recto-break()
#include "90-index.typ"
#recto-break()
#include "98-back.typ"
