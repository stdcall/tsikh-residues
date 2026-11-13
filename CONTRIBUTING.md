# Typesetting conventions

The sources are Typst; `content/main.typ` is the book. Build with
`just build` (the PDF goes to `build/`), check with `just check`, format with
`just fmt`. Lines are at most 80 characters; a long display formula is
broken across source lines (a line break in a formula is a space).

## Pages

The page is 6 × 9 in with a measure of 339 pt; the text is set in 11/13 pt
TeX Gyre Termes, formulas in TeX Gyre Termes Math. The book was set in
AMS-TeX with Times; the sizes and spaces of the style are measured on the
printed pages (word space, indent, displays, statements, titles, heads,
notes; see the comments of `content/statements.typ` and
`content/book-style.typ`), so our lines and pages hold about as much text
as the edition's, but our page breaks differ. A page of plain text holds 43
lines; the text block is as deep as the edition's (its last baseline 554.4
pt below the first), the space that TeX spread over the displays of a page
stays at its foot. Running heads, in capitals of 7.7 pt, the folio in
regular figures of 7.4 pt: a left-hand page has the folio and the short
title of the chapter ("I. PRELIMINARY INFORMATION"), a right-hand page the
short title of the section that starts on the page or runs through it
("§2. SEMIANALYTIC CHAINS") and the folio; the pages of an appendix or of
the notes of a chapter are headed "APPENDIX", "NOTES ON THE LITERATURE".
The short titles are those of the edition (`running-titles` in
`content/book-style.typ`). The opening pages of chapters and of the front
and back matter have a full text block, no head and their folio centred in
the foot line; their titles (bold 14.1 pt) stand where the edition's do.
The notes are 8.8/10 pt, the bibliography 8.8/10 pt, the index 8.8 pt on
9.55 pt in two columns of 157 pt.

The front matter is numbered i–x as in the 1992 edition: i half-title, ii
the recent titles of the series, iii title, iv copyright page, v–vi
Contents, vii–x Introduction. The main text starts again at 1 with Chapter
I. Chapters and the parts of the front and back matter begin on a
right-hand page; sections run on. The cover is outside the count and comes
first in the PDF, so the right-hand pages (odd folios) are the even pages of
the file; `recto-break()` in `book-style.typ` starts the next right-hand page
and leaves the blank page it may insert without head or folio.

## Files

One file per section, `content/CC-SS-<name>.typ`, included by `main.typ`:
`01-00-…` holds the heading and the introduction of Chapter I, `01-01-…` its
§1, `02-05-…` §5 (the first section of Chapter II), `02-90-appendix.typ` and
`02-99-notes.typ` the appendix and the notes on the literature of Chapter
II, and so on. A file starts with

```typst
#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *
```

then the heading: `= Preliminary Information <ch:preliminary>` (chapter,
followed by its introduction), `== Singular and smooth homologies
<sec:singular-homologies>` (section §1; the sections are numbered through the
book by the style), `#heading(level: 2, numbering: none)[Appendix]
<app:…>`, `#heading(level: 2, numbering: none)[Notes on the literature]
<notes:…>`. A heading longer than a source line is a call,
`#heading(level: 2)[…] <sec:…>`. The section labels are fixed in
`running-titles` of `content/book-style.typ`.

`#source(n)` marks where page `n` of the 1992 file begins (printed page +
12): before the first word of the page, also inside a statement or a proof;
if the page begins with a heading, at the start of the first paragraph after
it. A page that begins with a parenthesis has `#source(n)\(`: `#source(n)(`
would read the parenthesis as arguments of the call.

## Subsections

A section is divided into numbered subsections with a bold run-in title:
`#subsection[Notation] <ss:notation>` at the start of the paragraph prints
"**1. Notation.**" (number and final period by the style; a subsection
without a title is `#subsection(none) <ss:…>`). It stands a little lower
than a paragraph, as printed (19.3 pt below the line before it). A
subsection that opens a statement or a proof is the first thing in its body:
`#theorem[#subsection[…] <ss:…> Suppose …] <th:…>` prints "2. Title.
THEOREM. …". Every subsection has a
label; `@ss:…` prints "§5.2" (the book refers to subsections by section and
number, also within a section).

## Statements

Theorems, lemmas, propositions, corollaries, remarks, examples and
definitions are numbered within a subsection, each kind in its own series,
as printed: a kind that occurs once in its subsection has no number
("THEOREM."), several are "LEMMA 1.", "LEMMA 2."; the style decides, no
number is written in the source. A statement the book leaves unnumbered
among numbered ones of its kind ("REMARK 1.", "REMARK 2.", "REMARK.") is
`#remark(numbered: false)[…]`.

- `#theorem[…] <th:…>`, `#lemma[…] <lem:…>`, `#proposition[…] <prop:…>`,
  `#corollary[…] <cor:…>` print "THEOREM." in capitals and small capitals,
  indented like a paragraph, and set the statement in italic;
  `#remark[…] <rem:…>`, `#example[…] <exm:…>`, `#definition[…] <def:…>`
  are upright. `slant: true`/`false` overrides.
- A name: `#theorem(title: [Weil])[…]` prints "THEOREM (Weil)."; an index
  mark may stand inside the title.
- A footnote right after the head: `#theorem(note: [the footnote])[…]`.
- `#proof[…]` prints "PROOF." in small capitals; the book closes no proof
  with a square (`qed: true` would add □). `title: [Proof of Theorem 2.]`
  for another head.
- `#roman-text[…]` sets words upright inside an italic statement.
- Theorems, lemmas, propositions and corollaries stand apart from the text
  before and after them (19.3 pt, as subsections); proofs, remarks and
  examples have no space of their own, as printed (AMS-TeX's \demo): the
  style spaces them by their kind.
- The paragraph after a statement or proof is a new, indented paragraph;
  text after a display formula or a list continues at the margin, as
  printed; where the book starts a new, indented paragraph right after a
  display or a list, the source has `#new-par` (not needed before
  `#subsection`, which always opens an indented paragraph). Steps "1.", "2." of a proof
  are written `1\.` (a bare `1. ` at the start of a line would make a list);
  items "1)", "2)" that the book sets as paragraphs are written as
  paragraphs.

## Labels and references

Put a literal semantic label right after its target. Prefixes: `ch:`,
`sec:` (§), `ss:` (a subsection), `app:`, `notes:`, `th:`, `lem:`, `prop:`,
`cor:`, `rem:`, `exm:`, `def:`, `eq:`, `fig:`, `bib:`.

References are native and print numbers only; write the words and the
place as the book does:

- `@ss:…` prints "§5.2"; `@sec:…` "§5". Within a section the book also
  writes "subsection 2": `@ss:…[subsection]` (the number is counted).
  `@ss:…[n]`, `@sec:…[n]` print the bare counted number ("subsections 4
  and 5", "§§12, 13": `§§@sec:a[n], @sec:b[n]`); `@ss:…[nn]` prints the
  number of a subsection without the sign ("§§5.6, 8.4":
  `§§@ss:a[nn], @ss:b[nn]`).
- A statement: `Lemma~@lem:…` prints "Lemma 2"; in another subsection the
  book adds the place: `Proposition~@prop:… of @ss:…` ("Proposition 1 of
  §5.2"). An unnumbered statement prints no number: refer to it by its
  subsection, `the proposition of @ss:…`, or with a description,
  `@prop:…[the proposition]` (a bare `@prop:…` to it prints "?").
- A formula: `@eq:…` prints "(4)"; in another subsection `formula @eq:… of
  @ss:…` ("formula (4) of §6.1"); inside formulas write `#[@eq:…]`.
- A page reference ("see p. 156") is `p.~@label[page]`; a passage without a
  number gets an invisible anchor `#anchor <para:…>`.

While the book is being typeset, a reference to a target in another part
that is not typeset yet is a placeholder: `@x:ss-5-2` ("§5.2"),
`@x:sec-5` ("§5"), `@x:eq-4` ("(4)"), `@x:th-2` ("2"), `@x:bib-48`
("[48]"). It prints as the book does and is replaced by the semantic label
when the target exists.

Citations `@bib:Key` print the number of the bibliography, "[133]"; a
locator inside the brackets is the supplement: `@bib:Key[p.~5]` prints
"[133, p. 5]"; the book's "[48], p. 246" is `@bib:Key, p.~246`. The keys are
those of `references.bib` (Latin surname of the first author and the year:
`Aizenberg1977`).

## Formulas

- Only labelled display formulas are numbered, "(1)" at the right margin,
  in one series per subsection, as printed: `$ … $ <eq:…>`. Label every
  display that the book numbers. A symbolic tag "(1′)", "(*)" is
  `#tagged-equation([1$'$], $ … $) <eq:…>`. Where the book passes over a
  formula number, `#skipped-formula-number` before the next formula keeps
  the printed numbers. A numbered display stays on one page.
- A display of several lines lines up as printed: `&` before the aligned
  sign of relation in each row, or, where the book starts the first row at
  the margin and indents the others, `& first row \ & quad = …`.
- Words inside a display are upright strings (`"if"`); conditions after a
  formula stand after `quad`; cases: `cases(ZZ\, quad & q = 0\, n\,, 0\, &
  q != 0\, n\,)`.
- Notation helpers are in `content/symbols.typ`: `CC`, `RR`, `ZZ`, `NN`,
  `QQ` print the bold upright C, R, Z, N, Q of the book (not
  double-struck); `dbar` (∂̄), `relcomp` (⋐), the operators `res`, `Res`,
  `ind`, `supp`, `Re`, `Im`, `rank`, `sgn`, `det`, `dist`, `codim`; `xto(label)` is an
  arrow with a label over it, as in the exact sequences; `bigslash` is the
  large solidus before a product with limits (not `slash.big`, which the
  fonts of the book lack).
- Commutative diagrams use the helpers of `content/diagrams/common.typ`
  (Fletcher): `square(…)` for a square, `cd(…)` for others.
- The local residue: `res_a omega` (the point below, as printed); with the
  mapping as a right index, `res_a ""_f (h)`.
- Write `f_i lr((x))` when a subscripted symbol is followed by an argument
  (`C_q (X)` with a space works as well); `abs(alpha)` rather than
  `|alpha|` inside limits and indices; `wide` for a wide space (Typst has
  no `qquad`).
- `f_\#` for f with the sharp sign; `plus.o` for ⊕; script capitals with
  `cal(…)`/`scr(…)` as printed.
- Write `$C^1$-norm`: the style keeps the hyphen with the formula.

## Corrections and notes

Errors of the 1992 text are corrected minimally in the source; every change
is recorded in `corrections.json` (printed page, place, printed and
corrected reading in Typst markup, reason, how it was verified). The list of
corrections is built into a separate PDF (`just corrections`). An editorial
note `#ed-note[…]` is added only where the reader needs an explanation of a
deviation from the book; it is a footnote with its own marks "*1)", "*2)",
…, and the helper appends "— Ed.". The footnotes of the book (the editor's
remarks of the translation) are ordinary footnotes "(1)", "(2)", numbered
through a chapter.

## Index and notation

The Subject Index and the List of Notations are generated from marks in the
text. Subject index: `#index-mark("Formula", sub: "of Stokes")`, a subentry
of a subentry with `subsub:`, a cross-reference `see:`/`also:`; a mark
referring to a statement or heading names it: `target: <th:…>`. A subentry
with a formula is a string of markup: `sub: "$n$-circular"`. List of
Notations: `#notation-mark($H_q (X)$, sort: "H q X")`, with `sort:` where the
letters of the formula do not give its place. Marks add no space; put them
right before the word or after the formula they describe.
