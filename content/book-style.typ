#import "main-defs.typ": reference-rules
#import "symbols.typ": CC
#import "numbering.typ": heading-number, roman, section-at
#import "statements.typ": (
  body-leading, body-size, bold-cap, cap, display-above, display-below,
  display-row-gap, display-row-strut, in-head, is-statement, line-ink-depth,
  line-ink-height, line-pitch, lineskip, new-par, par-indent, point-counter,
  reset-statements, statement-gap, unit, word-space, word-space-limits,
)
#import "bibliography-style.typ": bib-size
#import "index-style.typ": index-size

// AMS 1992 (AMS-TeX): 6 x 9 in, Times 11/13 on a measure of 339 pt (see
// `body-size` in `statements.typ`).
// Running heads: on a left-hand page the folio and the short title of the
// chapter, on a right-hand page the short title of the section starting on
// (or running through) the page and the folio, in capitals; the opening
// pages of chapters and of the front and back matter have no head and the
// folio centred at the foot.
#let page-width = 6in
#let page-height = 9in
#let text-width = 339pt
// The text block: the last baseline of a full page stands 42.65 line
// pitches below the first (554.4 pt; 132 full printed pages, median 42.62,
// upper quartile 42.67, the pages ending on a full line at 42.6-42.7). TeX
// spread the rest of a page in the space of its displays and statements;
// Typst leaves it at the foot. A page of plain text holds 43 lines. The
// text area begins at the cap height of the first line.
#let block-depth = 554.4pt
#let text-height = cap(body-size) + block-depth
#let page-margin = (
  inside: 44pt,
  outside: page-width - 44pt - text-width,
  top: 48pt,
  bottom: page-height - 48pt - text-height,
)
#let text-font = "TeX Gyre Termes"
#let math-font = "TeX Gyre Termes Math"
// The baseline of the running head stands 21.8 pt above that of the first
// line of the text (56 right-hand pages, 21.5-22.1).
#let head-drop = 21.8pt
// Running heads in capitals of 7.7 pt (the ink widths of 67 capital words
// of the printed heads are 0.96 times those of Termes at 8 pt); the folios,
// also those at the foot of the opening pages, in regular figures of 7.4 pt
// (157 printed folios of the heads, 0.966 times Termes at 7.7 pt).
#let head-size = 7.7pt
#let folio-size = 7.4pt
// The pages of the bibliography and the index begin with a line of smaller
// type, whose baseline stands higher in the text area: the head stands
// `head-drop` above it, as TeX's \topskip put it on every page.
#let first-line-sizes = (
  "back:bibliography": bib-size,
  "back:index": index-size,
)
// An opening page (of a chapter, of the front or back matter) has a full
// text block, and its folio stands 23.8 pt below the last baseline of a full
// page, in TeX's foot line: on the printed chapter openings the folio stands
// 23.8 pt below a full last line (pp. 1 and 161) and 517.1 pt below the
// CHAPTER line (all five), and every printed opening title stands 482.7-486.4
// pt above its folio (`openings` in `book-style`).
#let opening-folio-drop = 23.8pt
#let footnote-size = 8.8pt
#let footnote-pitch = 10pt
#let footnote-rule = 58.5pt
#let footnote-clearance = 9pt
#let footnote-drop = 13pt

// The cover stands before the counted pages: the half-title i is the second
// page of the file, so the right-hand pages (odd folios) are the even pages
// of the file; Typst tells left from right pages by their place in the file
// (see `binding` below).
#let recto-parity = "even"

// The number of sections before each chapter (sections are numbered
// through the book).
#let sections-before-chapter = (0, 4, 10, 15, 20)

// Short titles of the running heads, as printed: the chapter on a left-hand
// page, the section on a right-hand page.
#let running-titles = (
  "ch:preliminary": [Preliminary Information],
  "ch:local-residues": [Residues Associated with Mappings
    $f: CC^n -> CC^n$],
  "ch:residual-currents": [Residues Associated with Mappings
    $f: CC^n -> CC^p$],
  "ch:applications": [Applications],
  "ch:double-series": [Applications to Double Series and Integrals],
  "sec:singular-homologies": [Singular and Smooth Homologies],
  "sec:semianalytic-chains": [Semianalytic Chains],
  "sec:differential-forms": [Differential Forms and Currents],
  "sec:analytic-sets": [Complex Analytic Sets and Ideals],
  "sec:local-residue": [Basic Properties of a Local Residue],
  "sec:trace": [The Local Residue in Terms of the Trace],
  "sec:manifold": [Dependence Between Local Residues on a Manifold],
  "sec:total-sum": [The Total Sum of Local Residues],
  "sec:representability": [The Representability Condition for Integrals],
  "sec:parameter": [Local Residues Depending on a Parameter],
  "sec:main-facts": [Statements of the Main Facts],
  "sec:normal-intersections": [Existence in the Case of Normal Intersections],
  "sec:main-theorem": [Proof of the Main Theorem],
  "sec:residual-currents": [Residual Currents],
  "sec:fibered-residues": [Local and Fibered Residues],
  "sec:weil-formula": [Weil's Formula],
  "sec:weakly-holomorphic": [Weakly Holomorphic Functions],
  "sec:logarithmic-residue": [Logarithmic Residue],
  "sec:multiplicity": [Applications to Multiplicity of Mappings],
  "sec:polynomial-ideals": [Applications to Ideals in a Polynomial Ring],
  "sec:hadamard": [Singularities of the Hadamard Composition],
  "sec:filter": [Quantification Error of a Two-Dimensional Filter],
  "sec:integrals": [Calculation of a Class of Integrals],
  "front:introduction": [Introduction],
  "front:contents": [Contents],
  "back:bibliography": [Bibliography],
  "back:notation": [List of Notations],
  "back:index": [Subject Index],
)
#let running-title(it) = {
  let key = if it.has("label") { str(it.label) }
  let short = running-titles.at(key, default: it.body)
  upper(short)
}

// Opening pages of chapters and of the front and back matter.
#let opening-page(this-page) = query(heading.where(level: 1)).any(it => (
  it.location().page() == this-page
))

// The blank page inserted by `recto-break`: the page between its two
// markers. No head, no folio.
#let blank-inserted(this-page) = {
  let marks(side) = query(metadata.where(value: (
    kind: "recto-break",
    side: side,
  ))).map(it => it.location().page())
  marks("before")
    .zip(marks("after"))
    .any(((before, after)) => (
      before == this-page - 1 and after == this-page + 1
    ))
}

#let running-head = context {
  let this-page = here().page()
  if opening-page(this-page) or blank-inserted(this-page) { return }
  let folio = text(size: folio-size, counter(page).display())
  let n = counter(page).get().first()
  let chapters = query(heading.where(level: 1)).filter(it => (
    it.location().page() <= this-page
  ))
  let chapter = chapters.last(default: none)
  let chapter-head = if chapter == none { [] } else if (
    chapter.numbering == none
  ) {
    running-title(chapter)
  } else {
    [#roman(counter(heading).at(chapter.location()).first()). #running-title(
        chapter,
      )]
  }
  let section-head = {
    let sections = query(heading.where(level: 2)).filter(it => (
      chapter != none
        and it.location().page() <= this-page
        and it.location().page() >= chapter.location().page()
    ))
    let section = sections.last(default: none)
    if section == none { chapter-head } else if section.numbering == none {
      // An appendix or the notes of a chapter head their pages, as printed.
      running-title(section)
    } else {
      let number = counter(heading).at(section.location())
      [#heading-number(..number) #running-title(section)]
    }
  }
  let first-size = if chapter != none and chapter.has("label") {
    first-line-sizes.at(str(chapter.label), default: body-size)
  } else { body-size }
  set text(size: head-size)
  set par(first-line-indent: 0pt, justify: false)
  move(dy: cap(first-size) - cap(body-size), if calc.even(n) {
    grid(
      columns: (3em, 1fr, 3em),
      align: (left + bottom, center + bottom, right + bottom),
      folio, chapter-head, [],
    )
  } else {
    grid(
      columns: (3em, 1fr, 3em),
      align: (left + bottom, center + bottom, right + bottom),
      [], section-head, folio,
    )
  })
}

// An opening page: no head; the folio centred in the footer
// (`opening-folio-drop`).
#let opening-footer = context {
  if opening-page(here().page()) {
    align(center, text(
      size: folio-size,
      weight: "regular",
      counter(page).display(),
    ))
  }
}

// A blank page of the edition (ii, iv): it counts in the page sequence and
// has neither head nor folio.
#let blank-page() = page(header: none)[]

// The next right-hand page (an odd folio), after a blank page if needed.
// The markers on both sides let the running head leave the inserted blank
// page empty.
#let recto-break() = {
  metadata((kind: "recto-break", side: "before"))
  pagebreak(weak: true, to: recto-parity)
  metadata((kind: "recto-break", side: "after"))
}

#let page-setup(body) = {
  set page(
    width: page-width,
    height: page-height,
    // Right-hand pages are the even pages of the file (after the cover):
    // binding on the right in Typst's terms puts their inside margin on the
    // left.
    binding: right,
    margin: page-margin,
    header: running-head,
    header-ascent: head-drop - cap(body-size),
    footer: opening-footer,
    footer-descent: opening-folio-drop - cap(folio-size),
  )
  // Cyrillic (the title of the original, R. Zh. numbers) and the modifier
  // prime ʹ of transliterated names come from Liberation Serif, a Times
  // design that has them.
  set text(
    font: (text-font, "Liberation Serif"),
    size: body-size,
    lang: "en",
    region: "us",
  )
  set par(
    justify: true,
    leading: body-leading,
    spacing: body-leading,
    first-line-indent: 1em,
  )
  // The paragraphs of the text (those with its leading) have the measured
  // word space and indent (`statements.typ`). The pages measured on their
  // own in their sizes and leadings (the lists of the series, the
  // copyright page, the back pages, the bibliography and the index) keep
  // Typst's word space, with which they were measured.
  show par.where(leading: body-leading): set text(spacing: word-space)
  show par.where(leading: body-leading): set par(
    justification-limits: word-space-limits,
    first-line-indent: par-indent,
  )
  show math.equation: set text(font: math-font)
  body
}

// The titles of chapters and of the front and back matter: bold 14.1 on
// 18.1 pt, centred (the ink widths of 22 printed title words are 0.98 times
// those of Termes Bold at 14.4 pt; the lines of the two-line titles 18.0 and
// 18.2 pt apart).
#let title-size = 14.1pt
#let title-pitch = 18.1pt
#let title-block(title) = block(
  above: 0pt,
  below: 0pt,
  sticky: true,
  width: 100%,
  align(center, par(
    justify: false,
    first-line-indent: 0pt,
    leading: title-pitch - bold-cap(title-size),
    text(size: title-size, weight: "bold", hyphenate: false, title),
  )),
)

// Chapter opening, measured on the five printed openings, baseline to
// baseline: "CHAPTER I" in capitals of the text, 61.1 pt below the first
// line of a full page (517.1 pt above the folio, which stands 23.8 pt below
// the last line of a full page); the title 34.2 pt below it (33.4-33.7 pt on
// the page images, x 1.021 to the line pitch of 13 pt); the introduction of
// the chapter 45.7 pt below the last line of the title. The numeral stands
// 5.4 pt (ink to ink) after CHAPTER.
#let chapter-sink = 61.1pt
#let chapter-label-gap = 5.4pt
#let chapter-title-drop = 34.2pt
#let chapter-text-drop = 45.7pt
#let chapter-opening(label, title) = {
  // The text area begins at the cap height of its first line.
  v(chapter-sink)
  block(
    above: 0pt,
    below: chapter-title-drop - bold-cap(title-size),
    sticky: true,
    width: 100%,
    align(center, text(size: body-size, weight: "regular", label)),
  )
  title-block(title)
  // The introduction of the chapter is indented, as printed: the empty
  // paragraph makes its first paragraph a consecutive one.
  par(spacing: 0pt)[]
  v(chapter-text-drop - cap(body-size), weak: true)
}

// Titles of the front and back matter (Introduction, Contents,
// Bibliography, ...): `sink`: the baseline of the title below that of the
// first line of a full page; `drop`: from it to the first baseline below,
// a line of type `size`.
#let opening-title(title, sink: 95pt, drop: 45.9pt, size: body-size) = {
  // The text area begins at the cap height of the first line of a full
  // page.
  v(sink + cap(body-size) - bold-cap(title-size))
  title-block(title)
  // The first paragraph is indented, as printed.
  par(spacing: 0pt)[]
  v(drop - cap(size), weak: true)
}

// A heading's body without its notes, for the Contents.
// The first letter of a formula ("" when it opens with something else).
#let first-text(c) = {
  if c.has("text") {
    if type(c.text) == str { c.text } else { first-text(c.text) }
  } else if c.has("children") {
    let children = c.children.filter(x => x != [ ])
    if children.len() > 0 { first-text(children.first()) } else { "" }
  } else if c.has("base") { first-text(c.base) } else if c.has("body") {
    first-text(c.body)
  } else { "" }
}

// A note of the translation (a footnote and the counter update that
// restores the numbering) is dropped as a whole.
#let without-notes(body) = {
  if (
    body.func() == footnote or repr(body).starts-with("counter-update")
  ) { [] } else if body.func() == linebreak { [ ] } else if body.has(
    "children",
  ) {
    body.children.map(without-notes).join()
  } else { body }
}

// Contents (pp. v-vi): "Preface", "Preliminaries" and the back matter flush
// left; "CHAPTER I. Integral …" flush left with its turned lines indented;
// the sections indented, their numbers right-aligned in a column, turned
// lines under the title; page numbers flush right, without leaders.
#let contents-style(body) = {
  set par(first-line-indent: 0pt, justify: false)
  show outline.entry: it => {
    let element = it.element
    let numbered = element.numbering != none
    let page = it.page()
    let link-to(body) = link(element.location(), body)
    if it.level == 1 {
      let title = if numbered {
        let n = counter(heading).at(element.location()).first()
        [CHAPTER #roman(n). #without-notes(element.body)]
      } else { without-notes(element.body) }
      // A chapter stands 19.3 pt below the line before it (the printed
      // Contents: 19.1-19.6 pt), the other lines 13 pt apart.
      block(
        above: 19.3pt - cap(body-size),
        below: line-pitch - cap(body-size),
        breakable: false,
        link-to(grid(
          columns: (1fr, 2.5em),
          align: (left, right + bottom),
          par(hanging-indent: 1.2em, title), page,
        )),
      )
    } else {
      let number = if numbered {
        let n = counter(heading).at(element.location())
        [#n.at(1).]
      }
      block(
        above: line-pitch - cap(body-size),
        below: line-pitch - cap(body-size),
        breakable: false,
        link-to(grid(
          columns: (1.2em, 1.6em, 1fr, 2.5em),
          align: (left, right, left, right + bottom),
          [], number, pad(left: 0.35em, without-notes(element.body)), page,
        )),
      )
    }
  }
  body
}

// The ink of a display: the ascent of its first row and the descent of its
// last, measured on the display itself (references and marks inside are left
// out: their records depend on the layout being measured). A strut of known
// size beside a row leaves the other extent to measure. The formulas
// measured are marked by their `alt` and shown bare.
#let display-measure = "display-measure"
#let display-rows(body) = {
  if (
    body.func() == [].func() and body.children.any(c => c.func() == linebreak)
  ) {
    let rows = ((),)
    for c in body.children {
      if c.func() == linebreak { rows.push(()) } else { rows.at(-1).push(c) }
    }
    rows.map(r => r.join())
  } else { (body,) }
}
#let display-extent(body) = {
  let rows = display-rows(body)
  let probe = 100pt
  let height(row) = {
    measure({
      show ref: r => box(width: 2.5em)
      show metadata: none
      math.equation(row, block: true, alt: display-measure)
    }).height
  }
  let descent = height(box(height: probe) + rows.last()) - probe
  let ascent = (
    height(rows.first() + box(height: probe, baseline: probe)) - probe
  )
  (ascent, descent)
}

#let book-style(body) = {
  show: page-setup
  set heading(numbering: heading-number)
  // The bold C, R, Z of the number spaces are upright, as printed.
  show math.equation: it => {
    show ":": math.class("punctuation", ":") + h(0.2em)
    it
  }
  // Chapters and the front and back matter break the page; sections run
  // on.
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    // Footnotes are numbered through a chapter, as printed.
    counter(footnote).update(0)
    reset-statements()
    point-counter.update(0)
    counter(math.equation).update(0)
    unit.step()
    // Sections are numbered through the book: a chapter heading would
    // restart them at 1. The last section before each chapter, as printed
    // (Chapter I has §1-§4, II §5-§10, III §11-§15, IV §16-§20, V §21-§23);
    // a fixed table, since a count of the headings would not converge.
    if it.numbering != none {
      counter(heading).update((..n) => (
        n.pos().first(),
        sections-before-chapter.at(n.pos().first() - 1),
      ))
    }
    if it.numbering != none {
      context {
        let n = counter(heading).at(it.location()).first()
        chapter-opening([CHAPTER#h(chapter-label-gap)#roman(n)], it.body)
      }
    } else {
      // An unnumbered title, measured on the printed pages (x 1.021 to the
      // line pitch of 13 pt): the sink of its baseline below the first
      // baseline of a full page, from its distance to the folio (Contents
      // 485.3 pt, Introduction 483.4, Bibliography 484.1, List of Notations
      // 484.2, Subject Index 486.4; the chapter titles 482.7-484.0), and the
      // drop from it to the first baseline below, in the type of that line.
      let openings = (
        "front:contents": (sink: 92.9pt, drop: 31.8pt, size: body-size),
        "front:introduction": (sink: 94.8pt, drop: 46pt, size: body-size),
        "back:bibliography": (sink: 94.1pt, drop: 69.9pt, size: bib-size),
        "back:notation": (sink: 94pt, drop: 33.2pt, size: body-size),
        "back:index": (sink: 91.8pt, drop: 46.7pt, size: index-size),
      )
      let key = if it.has("label") { str(it.label) }
      let opening = openings.at(key, default: (
        sink: 94.8pt,
        drop: 46pt,
        size: body-size,
      ))
      opening-title(it.body, ..opening)
    }
  }
  // "§1. Singular and smooth homologies", bold 10 pt, centred; a section,
  // an appendix or the notes restart the subsections and the series of
  // statements and formulas.
  show heading.where(level: 2): it => {
    reset-statements()
    point-counter.update(0)
    counter(math.equation).update(0)
    unit.step()
    let number = if it.numbering != none {
      context [#heading-number(..counter(heading).at(it.location())) ]
    }
    // The weak space a statement leaves after itself gives way to the
    // space above the title. Distances from baseline to baseline, medians
    // of the printed pages: a section, an appendix or the notes stand
    // 20.3 pt below the text (15 printed titles, 18.8-24.8 pt) and 15.5 pt
    // above the text after it (6 titles followed by text, 15.3-18.1 pt; a
    // subsection after a title has the space of a subsection, 19.3 pt, as
    // printed: 18.3 pt, 10 titles); the title of a further list of
    // references, in 13 pt, 36.5 pt below the list before it and 35.6 pt
    // above the next entry. The titles are bold 10 pt (the ink widths of 47
    // printed title words are 1.006 times those of Termes Bold at 10 pt).
    let list-title = (
      it.has("label")
        and str(it.label)
          in ("back:supplementary-bibliography", "back:editorial-references")
    )
    let size = if list-title { 13pt } else { 10pt }
    let (above, below) = if list-title { (36.5pt, 35.6pt) } else {
      (20.3pt, 15.5pt)
    }
    let next-cap = if list-title { cap(10pt) } else { cap(body-size) }
    v(above - bold-cap(size), weak: true)
    block(
      above: above - bold-cap(size),
      below: 0pt,
      sticky: true,
      width: 100%,
      align(center, par(
        justify: false,
        first-line-indent: 0pt,
        leading: line-pitch - bold-cap(10pt),
        text(size: size, weight: "bold", hyphenate: false)[#number#it.body],
      )),
    )
    // The first paragraph is indented, as printed: the empty paragraph
    // makes it a consecutive one.
    par(spacing: 0pt)[]
    v(below - next-cap, weak: true)
  }
  // The numbered subsections of a section, "1. Notation.": bold, at the
  // start of a paragraph; each restarts the series of statements and
  // formulas.
  show metadata: it => {
    if (
      type(it.value) == dictionary
        and it.value.at("kind", default: none)
          == (
            "point"
          )
    ) {
      // A subsection stands 19 pt below the line before it (baseline to
      // baseline), as printed; one that opens a statement has the space of
      // the statement. It always begins an indented paragraph, also after a
      // display or a list.
      context if not in-head.get() {
        v(statement-gap, weak: true)
        new-par
      }
      point-counter.step()
      reset-statements()
      counter(math.equation).update(0)
      unit.step()
      let title = it.value.at("title", default: none)
      let note = it.value.at("note", default: none)
      // "1. Definitions (see [74])." — a note after the title upright.
      context strong[#point-counter.get().first().#if title != none [
          #title#if note == none [.]]]
      if note != none [ #note.]
      [ ]
    } else if (
      type(it.value) == dictionary
        and it.value.at("kind", default: none) == "notes-on"
    ) {
      // "§5." heading a paragraph of the notes on the literature: the sign
      // regular, the number bold, linked to the section.
      v(statement-gap, weak: true)
      context {
        let found = it.value.targets.map(t => query(t).first(default: none))
        if found.len() == 0 or found.contains(none) [§#strong[?.]] else {
          let numbers = found.map(h => counter(heading).at(h.location()).at(1))
          let run = (
            numbers.len() > 2 and numbers.windows(2).all(((a, b)) => b == a + 1)
          )
          let shown = if run [#numbers.first()–#numbers.last()] else {
            numbers.map(str).join(", ")
          }
          let sign = if numbers.len() == 1 [§] else [§§]
          link(found.first().location())[#sign#strong[#shown.]]
        }
      }
      [ ]
    } else { it }
  }

  // Displays: centred, the number of a labelled display at the right
  // margin, "(1.13)"; only labelled displays are numbered, in a series per
  // section; their spacing is TeX's (`display-above`, `display-below`):
  // it depends on the ink of the first and the last row, measured below.
  set math.equation(number-align: end + horizon)
  // An unnumbered display of several lines may break across pages, as
  // printed; its rows stand `display-row-gap` apart, ink to ink.
  show math.equation.where(block: true): set block(breakable: true)
  show math.equation.where(block: true): set par(leading: display-row-gap)
  // The cells of a matrix or determinant are set full size, their
  // fractions too, as printed.
  show math.mat: it => {
    if it.rows.flatten().all(c => repr(c).starts-with("styled")) { it } else {
      math.mat(
        ..it.rows.map(row => row.map(c => math.display(c))),
        delim: it.delim,
        align: it.align,
        augment: it.augment,
        row-gap: it.row-gap,
        column-gap: it.column-gap,
      )
    }
  }
  // Cases are set full size, their fractions and sums too, as printed:
  // each cell in display style (a cell already styled is left as it is,
  // so the rule does not apply to its own result).
  show math.cases: it => {
    if it.children.all(c => repr(c).starts-with("styled")) { it } else {
      math.cases(
        ..it.children.map(c => math.display(c)),
        delim: it.delim,
        reverse: it.reverse,
        gap: it.gap,
      )
    }
  }
  show math.equation.where(block: true): it => {
    // A row of a display measured for its ink (below): the bare formula.
    if it.at("alt", default: none) == display-measure { return it }
    // A display of several rows: a strut opens each row, so that the rows
    // stand apart as TeX set them (`display-row-strut`).
    let rows = display-rows(it.body)
    let body = if (
      rows.len() > 1 and it.body.children.first() != display-row-strut
    ) {
      rows.map(r => display-row-strut + r).join(linebreak())
    } else { it.body }
    if body != it.body and not it.has("label") and it.numbering == none {
      return math.equation(body, block: true)
    }
    context {
      // The ascent of the first row and the descent of the last give the
      // space above and below the display.
      let (ascent, descent) = display-extent(body)
      let above = display-above(ascent)
      let below = display-below(descent)
      // A numbered display stays on one page (split, it would show its
      // number twice): it is set in an unbreakable block with the spacing of
      // a display.
      // (No width: a block of full width measures 0 pt in the measurement
      // of a display below, which is unbounded.)
      let whole = block.with(breakable: false, above: above, below: below)
      if it.has("label") and it.numbering == none {
        // (The block of the layout carries the spacing: the blocks inside it
        // stand at its edges.)
        whole(layout(size => context {
          let n = counter(math.equation).get().first() + 1
          let tag = text(font: text-font, style: "normal")[(#n)]
          // References and marks inside are left out of the measurement:
          // their records depend on the layout being measured.
          let width = measure({
            show ref: r => box(width: 2.5em)
            show metadata: none
            math.equation(body, block: true, alt: display-measure)
          }).width
          // (A display of several lines has its number on the last line,
          // which is checked by the reader of the proofs, not here.)
          let lines = repr(it.body).contains("linebreak")
          let room = measure(tag).width + 1em.to-absolute()
          if not lines and size.width - width < room {
            // Too wide to stand clear of its number: the number on a line of
            // its own below, at the right margin, as printed.
            counter(math.equation).step()
            whole(width: 100%, {
              math.equation(body, block: true)
              v(-0.4em)
              align(right, tag)
            })
          } else if not lines and (size.width - width) / 2 < room {
            // Too wide to stand centred clear of its number: centred in the
            // room left of the number, at least 1 em from it, as printed.
            counter(math.equation).step()
            whole(width: 100%, grid(
              columns: (1fr, auto),
              column-gutter: 1em,
              align: (center + horizon, right + horizon),
              math.equation(body, block: true), tag,
            ))
          } else {
            whole(math.equation(
              // A display of several lines reaching into the room of its
              // number: its last line is padded by that room, so that the
              // display moves left of the number (Typst moves only a display
              // of one line).
              if lines and (size.width - width) / 2 < room {
                body + box(width: room)
              } else { body },
              block: true,
              numbering: _ => tag,
              // The number of a display of several lines stands on its last
              // line, as printed.
              number-align: end
                + if repr(it.body).contains("linebreak") { bottom } else {
                  horizon
                },
            ))
          }
        }))
      } else if it.numbering != none {
        // A symbolic tag, (*) or (27.9′) (`tagged-equation`); the displays
        // set above come here again, and their second block is void.
        whole(it)
      } else if repr(it.body).matches("linebreak").len() < 3 {
        // An unnumbered display of up to three lines is not split either: a
        // first line alone at the foot of a page is a bare beginning.
        whole(it)
      } else { block(breakable: true, above: above, below: below, it) }
    }
  }
  show link: set text(fill: black)
  // No line break between a formula and a hyphen after it ("$C^1$-norm").
  show regex("^-\p{L}"): it => sym.wj + it
  // A range "86–89" is not broken at its dash.
  show "–": it => sym.wj + it + sym.wj
  // A line never starts with an em dash: it stays with the word before it.
  show "—": it => sym.wj + it
  show enum: set par(justify: true)
  set enum(
    numbering: n => text(style: "normal", numbering("a)", n)),
    indent: 1em,
    body-indent: 0.5em,
  )
  show outline: set par(first-line-indent: 0pt)
  show outline.entry: set block(breakable: false)
  // Footnotes: 8.8 on 10 pt (the ink widths of the 16 words of the two
  // printed footnotes are 1.10 times those of Termes at 8 pt; their lines
  // 10.0 pt apart), numbered through the chapter, "(1)", indented as a
  // paragraph. On the printed pages the rule, 58.5 pt long, stands 9.0 pt
  // below the last line of the text and 13.0 pt above the first line of the
  // note (pp. 18 and 146).
  set footnote(numbering: "1")
  set footnote.entry(
    separator: {
      line(length: footnote-rule, stroke: 0.4pt)
      v(footnote-drop - footnote-pitch)
    },
    clearance: footnote-clearance,
    gap: footnote-pitch - cap(footnote-size),
    indent: 0pt,
  )
  show footnote.entry: set text(size: footnote-size, spacing: word-space)
  show footnote.entry: set par(
    leading: footnote-pitch - cap(footnote-size),
    first-line-indent: par-indent,
    justify: true,
    justification-limits: word-space-limits,
  )
  // A footnote mark stays on the line of the word it follows.
  // The book's mark is a superior figure in parentheses of the text size,
  // "(¹)"; an editorial note keeps its own mark.
  show footnote: it => sym.wj + if it.numbering == "1" [(#it)] else { it }
  // The entry: its mark, a space, the note, as printed.
  show footnote.entry: it => {
    let loc = it.note.location()
    let n = counter(footnote).at(loc)
    let mark = if it.note.numbering == "1" [(#super(str(n.first())))] else {
      numbering(it.note.numbering, ..n)
    }
    [#h(par-indent)#mark#h(0.3em)#it.note.body]
  }
  // Brackets in the text keep the size of the type, as printed: a root, an
  // index or an exponent inside does not enlarge them. Brackets around a
  // matrix, cases, a binomial or an evaluation bar grow with it.
  show math.equation.where(block: false): it => {
    show math.lr: l => {
      let body = repr(l.body)
      let tall = (
        ("mat(", "vec(", "cases(", "binom(", "mid(").any(m => body.contains(m))
      )
      if tall or l.size == 1em { l } else { math.lr(l.body, size: 1em) }
    }
    it
  }
  // In a display too the brackets keep the size of the type around indices,
  // primes and bars, as printed; they grow around a fraction, a large
  // operator, a root, a matrix or another tall formula.
  show math.equation.where(block: true): it => {
    show math.lr: l => {
      let body = repr(l.body)
      let tall = (
        "frac(",
        "mat(",
        "vec(",
        "cases(",
        "binom(",
        "mid(",
        "root(",
        "sqrt(",
        "∑",
        "∏",
        "∫",
        "∮",
        "⋃",
        "⋂",
        "stretch(",
        "⋀",
        "⋁",
      ).any(m => body.contains(m))
      if tall or l.size == 1em { l } else { math.lr(l.body, size: 1em) }
    }
    it
  }
  // The tilde over the fraktur S (`tilde(frak(S))`, §13) stands on the
  // glyph of the math font, whose accent height is too low for it; set over
  // the letter as a group, it clears the letter as over Ã. Typst does not
  // tell a fraktur from a script letter here, so the rule takes a styled S
  // under a tilde, which in this book is only 𝔖 (script letters keep their
  // own accent placement).
  show math.accent: it => {
    if (
      it.accent == "\u{0303}" and repr(it.base) == "styled(child: [S], ..)"
    ) {
      math.accent(it.base + h(0pt), it.accent, size: it.size)
    } else { it }
  }
  // An index or an exponent after brackets of the size of the type belongs
  // to the closing bracket, as in TeX: `(f_1)_*` puts the asterisk at the
  // height of an ordinary index, not below the index inside. Around a
  // fraction, a large operator or another tall formula the brackets grow,
  // and the index stays with the whole group.
  show math.attach: it => {
    if it.base.func() != math.lr { return it }
    let body = it.base.body
    if body.func() != [].func() or body.children.len() < 2 { return it }
    let tall = (
      "frac(",
      "mat(",
      "vec(",
      "cases(",
      "binom(",
      "mid(",
      "root(",
      "sqrt(",
      "∑",
      "∏",
      "∫",
      "∮",
      "⋃",
      "⋂",
      "stretch(",
      "⋀",
      "⋁",
    ).any(m => repr(body).contains(m))
    if tall { return it }
    let fields = it.fields()
    let _ = fields.remove("base")
    // Still one group, which a line does not break.
    math.lr(
      size: 1em,
      body.children.slice(0, -1).join()
        + math.attach(body.children.last(), ..fields),
    )
  }
  // A formula opening with f: the tail of the italic f would close the
  // word space before it ("if f" read as "iff"); a hair of space keeps it.
  show math.equation.where(block: false): it => {
    if first-text(it.body).starts-with("f") { h(0.1em) + it } else { it }
  }
  // A formula in the text that reaches higher or lower than the line takes
  // the room it needs, by TeX's interline rule as printed: two baselines
  // stand a line pitch apart unless the ink comes closer than 1 pt; the
  // neighbouring line is taken at its median, 2.3 pt deep and 8.1 pt high
  // (see `display-above`). So a formula pushes the line above when it
  // rises more than 9.7 pt and the line below when it sinks more than
  // 3.9 pt. (Of 2092 printed pairs of lines of text, 29 per cent stand
  // farther apart than 13.3 pt, 14.1 pt at the median.) In the smaller type
  // of notes and titles a formula higher than 1.15 em takes its room.
  show math.equation.where(block: false): it => context {
    // Where the edges of the text are set otherwise (the rows of the List
    // of Notations, a measurement of the ink), the formula is left to them.
    if text.top-edge != "cap-height" or text.bottom-edge != "baseline" {
      return it
    }
    let ascent = measure(text(
      top-edge: "bounds",
      bottom-edge: "baseline",
      it,
    )).height
    if text.size != body-size {
      return if ascent > 1.15em.to-absolute() {
        set text(top-edge: "bounds", bottom-edge: "bounds")
        it
      } else { it }
    }
    let descent = (
      measure(text(
        top-edge: "bounds",
        bottom-edge: "bounds",
        it,
      )).height
        - ascent
    )
    let rise = ascent - (line-pitch - lineskip - line-ink-depth)
    let sink = descent - (line-pitch - lineskip - line-ink-height)
    if rise > 0pt or sink > 0pt {
      set text(
        top-edge: cap(body-size) + calc.max(rise, 0pt),
        bottom-edge: -calc.max(sink, 0pt),
      )
      it
    } else { it }
  }
  // Figures stand at the head of a page; "Figure 1." and the caption in
  // 9 pt, centred.
  set figure(placement: top)
  set figure.caption(separator: [. ])
  show figure.caption: set text(size: 9pt)

  // Statements break across pages like the text.
  show figure: it => if is-statement(it) {
    set block(breakable: true)
    it.body
  } else { it }
  show: reference-rules
  body
}
