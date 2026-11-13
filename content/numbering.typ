// Numbering of the book: chapters I-V; sections §1-§23 numbered through
// the whole book; the subsections 1., 2., ... of a section, "§5.3" in
// references. Statements and formulas are numbered within a subsection
// (see `statements.typ`): "Lemma 2", "(1)". References never carry the
// chapter: section numbers are unique.

#let roman(n) = numbering("I", n)

// The heading counter is (chapter, section). A chapter heading would restart
// the sections at 1; `book-style.typ` sets the section part back to the last
// section number after each chapter heading, so that sections are numbered
// through the book.
#let heading-number(..n) = {
  let parts = n.pos()
  if parts.len() == 1 { roman(parts.first()) } else {
    "§" + str(parts.at(1)) + "."
  }
}

// The section of a location, 0 in the Preliminaries and before them.
#let section-at(loc) = {
  let n = counter(heading).at(loc)
  n.at(1, default: 0)
}
