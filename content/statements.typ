// Theorems, lemmas, propositions, corollaries, remarks, examples and
// definitions are numbered within a subsection, each kind in a series of its
// own, as printed: a kind that occurs once in a subsection has no number
// ("THEOREM."), several are "LEMMA 1.", "LEMMA 2.". Each is a figure of kind
// "st-<kind>", so that @label prints its number.
#let statement-kinds = (
  "theorem",
  "lemma",
  "proposition",
  "corollary",
  "remark",
  "example",
  "definition",
)
#let is-statement(it) = (
  it.func() == figure and type(it.kind) == str and it.kind.starts-with("st-")
)
#let reset-statements() = (
  statement-kinds
    .map(k => counter(figure.where(kind: "st-" + k)).update(0))
    .join()
)

// The units in which statements and formulas are numbered: a chapter
// introduction, a section before its first subsection, a subsection, an
// appendix, the notes. The style steps this counter where each begins.
#let unit = counter("unit")

// The numbered subsections of a section, "1. Notation.":
// `#subsection[Notation] <ss:…>` at the start of a paragraph, or first in
// the body of a statement that opens with it. The style prints it;
// `@ss:…` prints "§5.2".
#let point-counter = counter("point")
#let subsection(title, note: none) = metadata((
  kind: "point",
  title: title,
  note: note,
))

// The notes on the literature of a chapter go by section, each paragraph
// headed "§5." (the sign regular, the number bold), a little lower than a
// paragraph, as printed: `#notes-on(<sec:…>)` at the start of the
// paragraph; several sections, `#notes-on(<sec:a>, <sec:b>)`, print
// "§§14, 15." (three or more consecutive ones "§§11–13.").
#let notes-on(..targets) = metadata((
  kind: "notes-on",
  targets: targets.pos(),
))

// Whether a statement at `loc` of figure kind `key` prints its number: more
// than one of its kind in its unit.
#let numbered-in-unit(key, loc) = {
  let u = unit.at(loc)
  let same = query(figure.where(kind: key)).filter(f => (
    unit.at(f.location()) == u
  ))
  same.len() > 1
}

// The end of a proof: a white square after a space, as printed.
#let qed-mark = box(
  baseline: 0pt,
  rect(width: 0.6em, height: 0.6em, stroke: 0.04em, inset: 0pt),
)
#let qed-gap = 0.8em

// The book's type, measured on the printed pages in the frame of this
// edition (a measure of 339 pt, a line pitch of 13 pt): Times 11 on 13 pt.
// The ink widths of 861 words of the text are 1.105 times those of TeX Gyre
// Termes at 10 pt (frequency-weighted; per word median 1.10, quartiles
// 1.09-1.11).
// `cap` is the cap height of a size: the top edge of a line of text.
#let body-size = 11pt
#let line-pitch = 13pt
#let cap(size) = 0.662 * size
// The cap height of the bold of the titles (Termes Bold, as Times Bold).
#let bold-cap(size) = 0.676 * size

// The text is set with the leading of the body, and its paragraphs (see
// `page-setup` in `book-style.typ`), statements and notes with the word
// space measured on the printed pages: the ink gaps between the words of
// full lines are 2.8, 3.4, 3.9, 4.5 and 5.3 pt at 5, 25, 50, 75 and 95 per
// cent (24 898 gaps, pp. 1-176); a space 10 per cent wider than that of
// Termes that may shrink to 76 per cent and stretch to 160, as TeX's Times
// could, gives 2.8, 3.4, 3.9, 4.5 and 5.5 pt and 63.0 letters to a full line
// of plain text (62.2 printed).
#let body-leading = line-pitch - cap(body-size)
#let word-space = 110%
#let word-space-limits = (spacing: (min: 76%, max: 160%))

// The paragraph indent: the first letter of a paragraph stands 11.6 pt
// right of the margin (232 printed paragraphs, quartiles 11.4-12.0), 0.7 pt
// further than with an indent of 1 em of Termes (the same letters); the
// heads of statements and subsections stand there too.
#let par-indent = 11.7pt

// Displays are spaced as TeX spaced them in the edition: a skip above and
// below the formula on top of the interline rule (baselines a line pitch
// apart, unless the ink comes closer than 1 pt). Measured on 166 printed
// displays of one line: the skips are 6.0 pt above and 5.9 pt below
// (medians, quartiles 4.7-7.2: the pages are justified at the foot); the
// line above a display reaches 2.3 pt below its baseline and the line below
// 8.1 pt above its baseline (medians of the ink of 2900 lines).
// `display-above(ascent)` and `display-below(descent)` give the space
// between the text and the ink of a formula of that ascent and descent.
#let display-skip-above = 6pt
#let display-skip-below = 5.9pt
#let lineskip = 1pt
#let line-ink-depth = 2.3pt
#let line-ink-height = 8.1pt
#let display-above(ascent) = (
  display-skip-above + calc.max(lineskip + line-ink-depth, line-pitch - ascent)
)
#let display-below(descent) = (
  display-skip-below
    + calc.max(lineskip + line-ink-height, line-pitch - descent)
    - cap(body-size)
)
// The rows of a display stand as TeX set them: a line pitch and \jot apart,
// or, where they reach closer, 1 pt and \jot of white between their ink:
// 3.9 pt (median of 58 printed pairs of rows, quartiles 3.4-4.8). A strut
// opening each row, as high and deep as a line of text (see
// `display-above`), keeps the rows of plain formulas a line pitch and
// 2.9 pt apart; as an opening it adds no space to the row.
#let display-row-gap = 3.9pt
#let display-row-strut = math.class(
  "opening",
  box(height: line-pitch - lineskip, baseline: line-ink-depth),
)

// Theorems, lemmas, propositions, corollaries and subsections stand 19.3 pt
// below the line before them, baseline to baseline (median of 154 printed,
// quartiles 18.5-20.0), and the text after such a statement as far below
// it (18.6-19.1 pt). Proofs, remarks and examples have no space of their
// own, as AMS-TeX's \demo: they follow the line before them and the text
// follows them a line pitch apart (18 of 22 matched printed paragraphs
// after a proof, a remark or an example stand 12.8-13.1 pt below it; a
// proof or remark after a statement stands as far below it as the text
// would). The paragraph after a statement is a new, indented paragraph: an
// empty paragraph without spacing after the block makes it a consecutive
// one (Typst indents only those), and weak space restores the gap. The
// weak space collapses with that of a following statement or display and
// vanishes at a page break.
#let statement-skip = 6.3pt
#let statement-gap = line-pitch + statement-skip - cap(body-size)
#let statement-block(body, skip: true) = {
  let gap = if skip { statement-gap } else { body-leading }
  // The space above as weak spacing too: after a proof or a remark, whose
  // trailing space is the normal one, the larger space of a theorem wins.
  v(gap, weak: true)
  block(
    width: 100%,
    breakable: true,
    above: gap,
    below: 0pt,
    {
      // A statement of one paragraph is no `par` element: the word space
      // of the text is set here.
      set text(spacing: word-space)
      set par(justification-limits: word-space-limits)
      align(left, body)
    },
  )
  par(spacing: 0pt)[]
  v(gap, weak: true)
}

#let keep-with-opening(body) = {
  let first = if body.func() == [].func() {
    body.children.find(it => it.func() not in ([ ].func(), parbreak))
  } else { body }
  if first == none { return false }
  (
    first.func()
      in (enum, enum.item, list, list.item, table, grid, align, figure, block)
      or (first.func() == math.equation and first.block)
  )
}

// The square closes the last line of a proof; after a display it stands
// at the end of the display, after a list in its last item.
#let ends-with-square(body) = {
  let children = if body.func() == [].func() { body.children } else { (body,) }
  let blank(it) = (
    it.func() in ([ ].func(), parbreak) or (it.func() == par and it.body == [])
  )
  let offset = children.rev().position(it => not blank(it))
  if offset == none { return body }
  let index = children.len() - 1 - offset
  let last = children.at(index)
  if last.func() == math.equation and last.block and last.has("label") {
    // A numbered display is left as it is (its label stays in the chapter
    // file, where the editor finds it); the square follows at the right.
    children.slice(0, index + 1).sum(default: [])
    align(right, qed-mark)
  } else if last.func() == math.equation and last.block {
    let fields = last.fields()
    let formula = fields.remove("body")
    let _ = fields.remove("label", default: none)
    children.at(index) = math.equation(
      formula + math.equation(h(qed-gap) + qed-mark).body,
      ..fields,
    )
    children.slice(0, index + 1).sum(default: [])
  } else if last.func() == enum.item {
    let fields = last.fields()
    let item-body = fields.remove("body")
    let _ = fields.remove("label", default: none)
    let number = fields.remove("number", default: auto)
    children.at(index) = enum.item(number, ends-with-square(item-body))
    children.slice(0, index + 1).sum(default: [])
  } else if last.func() == enum {
    let fields = last.fields()
    let items = fields.remove("children")
    let _ = fields.remove("label", default: none)
    let item = items.pop()
    if item.func() == enum.item {
      let item-fields = item.fields()
      let item-body = item-fields.remove("body")
      items.push(enum.item(ends-with-square(item-body), ..item-fields))
    } else {
      items.push(ends-with-square(item))
    }
    children.at(index) = enum(..items, ..fields)
    children.slice(0, index + 1).sum(default: [])
  } else if last.func() in (table, grid, align, block, figure) {
    body
    align(right, qed-mark)
  } else {
    // The square stays on the line of the last word.
    [#children.slice(0, index + 1).sum(default: [])#sym.wj#box[#h(
          qed-gap,
        )#qed-mark]]
  }
}

// A subsection that opens the body of a statement stands before its head:
// "2. Lemma. …"; while it is printed there, `in-head` is true.
#let in-head = state("in-head", false)
#let take-point(body) = {
  if body.func() != [].func() { return (none, body) }
  let children = body.children
  let first = children.position(it => it.func() not in ([ ].func(), parbreak))
  if first == none { return (none, body) }
  let it = children.at(first)
  if (
    it.func() == metadata
      and type(it.value) == dictionary
      and (
        it.value.at("kind", default: none) == "point"
      )
  ) {
    let rest = children.slice(first + 1)
    while rest.len() > 0 and rest.first().func() == [ ].func() {
      rest = rest.slice(1)
    }
    // The style sets no space above a subsection printed in a head.
    ([#in-head.update(true)#it#in-head.update(false)], rest.sum(default: []))
  } else { (none, body) }
}

// The head runs into the first paragraph; before an opening display, list
// or table it stands on its own line, kept with it. A display after the
// first paragraph may go to the next page, as in the book.
#let with-head(header, content, styled) = {
  if keep-with-opening(content) {
    block(above: 0pt, sticky: true, header) + styled(content)
  } else {
    [#header #styled(content)]
  }
}

// Italic as a text style, not as emphasis: emphasis inside the statement
// then turns upright.
// Figures stay upright in an italic statement, as printed ("Chapter II,
// §19, Theorem 4").
#let italic-statement(body) = {
  show regex("[0-9]"): set text(style: "normal")
  text(style: "italic", body)
}

// "THEOREM.", "LEMMA 2." in capitals and small capitals with an upright
// number; "THEOREM (Weil)."; the text of a theorem, lemma, proposition or
// corollary is italic, of a remark, example or definition upright, unless
// `slant` says otherwise.
// `note: […]`: a footnote right after the head, "THEOREM(¹)".
// `numbered: false`: a statement the book leaves without a number among
// numbered ones of its kind ("REMARK 1.", "REMARK 2.", "REMARK."); it is
// a kind of its own and does not count with them.
// `period: false`: no full stop after the head, where the text goes on with
// a part of the statement ("THEOREM I. General part …" of §11.2).
#let statement(
  kind,
  title: none,
  note: none,
  slant: auto,
  numbered: auto,
  period: true,
  body,
) = {
  let (opening-point, body) = take-point(body)
  let key = "st-" + kind + if numbered == false { "-unnumbered" }
  let name = upper(kind.first()) + kind.slice(1)
  let slant = if slant == auto {
    kind in ("theorem", "lemma", "proposition", "corollary")
  } else { slant }
  let header = context {
    let n = counter(figure.where(kind: key)).get().first()
    let number = if numbered != false and numbered-in-unit(key, here()) [ #n]
    let head = text(style: "normal", smallcaps(name) + number)
    let mark = if note != none { footnote(note) }
    let close = if title != none [ (#title).] else if period [.]
    [#h(par-indent)#opening-point#head#mark#close]
  }
  let styled(body) = if slant { italic-statement(body) } else { body }
  figure(
    kind: key,
    supplement: name,
    numbering: "1",
    outlined: false,
    statement-block(
      with-head(header, body, styled),
      // A proof, a remark or an example opened by a subsection has the
      // space of the subsection.
      skip: kind
        in ("theorem", "lemma", "proposition", "corollary", "definition")
        or opening-point != none,
    ),
  )
}

#let theorem(..args) = statement("theorem", ..args)
#let lemma(..args) = statement("lemma", ..args)
#let proposition(..args) = statement("proposition", ..args)
#let corollary(..args) = statement("corollary", ..args)
#let remark(..args) = statement("remark", ..args)
#let example(..args) = statement("example", ..args)
#let definition(..args) = statement("definition", ..args)

// Upright words inside an italic statement.
#let roman-text(body) = text(style: "normal", body)

// "PROOF." in capitals and small capitals; the text ends with the white
// square. `title: [Proof of Theorem 2.3.]` for another head, `qed: false`
// where the book has no square.
// `title: none` for an argument the book closes with the square but sets
// without a head.
#let proof(title: [Proof.], qed: false, body) = {
  let (opening-point, body) = take-point(body)
  statement-block(skip: opening-point != none, {
    let text-body = if qed { ends-with-square(body) } else { body }
    let head = if title == none [#h(par-indent)#opening-point] else [
      #h(par-indent)#opening-point#smallcaps(title)
    ]
    if keep-with-opening(body) {
      block(above: 0pt, sticky: true, head)
      text-body
    } else {
      [#head #text-body]
    }
  })
}

// A new paragraph after a display or a list, indented as the book prints it;
// text after a display without it continues at the margin.
#let new-par = par(spacing: 0pt)[] + context v(-par.spacing)

// The printed formula numbers of a section pass over a number:
// `#skipped-formula-number` before the next formula keeps them.
#let skipped-formula-number = counter(math.equation).step()

// Small print, 8 on 10 pt: the normal text after it stands a line further
// down and starts a new, indented paragraph. (The edition sets no passage in
// small print; the helper is unused.)
#let small-print(body) = {
  block(width: 100%, above: line-pitch - cap(body-size), below: 0pt, {
    set text(size: 8pt)
    set par(leading: 10pt - cap(8pt), spacing: 10pt - cap(8pt))
    // The first paragraph is indented, as printed.
    par(spacing: 0pt)[]
    body
  })
  par(spacing: 0pt)[]
  v(2 * line-pitch - cap(body-size), weak: true)
}
