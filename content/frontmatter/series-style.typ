// The list of the recent titles of the series (pp. ii and 190 of the
// edition) and the notice on copying (p. 189), measured on the printed
// pages from the text block of the full pages (first baseline, left edge;
// see `cover.typ`). Monotype Times, set here in TeX Gyre Termes at the
// sizes that give the printed lines.

// The list: 8.9-pt type; the number of a title flush right in a column as
// wide as "103", the names in bold and the title 7.9 pt to the right of
// it, in a column of 316.5 pt; turned lines under the names. The space
// after the names is 2.2 pt wider than a word space. The bold of the
// edition is narrower than that of Termes: the names are set 0.22 pt
// tighter.
#let list-size = 8.9pt
#let list-cap = 0.662 * list-size
// The bold names set the top of the first line of a title.
#let names-cap = 0.676 * list-size
#let number-width = 13.3pt
#let number-gap = 7.9pt
#let names-gap = 2.2pt
#let names-tracking = -0.22pt
#let list-width = number-width + number-gap + 316.5pt

// One title of the series: its number, the names and the title with its
// year. A title printed on two lines has its turned line as a third
// argument: the first line is justified, as printed.
#let title-entry(number, names, title, ..turned) = block(
  width: 100%,
  breakable: false,
  grid(
    columns: (number-width, 1fr),
    column-gutter: number-gap,
    align(right, str(number)),
    par(justify: true)[#text(tracking: names-tracking)[*#names,*]#h(
        names-gap,
      ) #title#for line in turned.pos() [#linebreak(justify: true)#line]],
  ),
)

// A page of the list: the heading "Recent Titles in This Series", bold
// 14.4 pt a little tighter, flush left, its baseline 16.5 pt above the
// first baseline of a full page; a note under it at the right (italic but
// for its parentheses, 9.5 pt lower); the first title 24 pt below the
// heading (35.6 pt below it after the note); a closing line flush right,
// `closing-below` the last baseline of a full page. The pitches of the
// titles and of the lines of a title differ a little from page to page,
// as printed.
#let series-page(
  note: none,
  closing: none,
  closing-below: 5pt,
  title-pitch: 12pt,
  line-pitch: 9.76pt,
  body,
) = {
  pagebreak(weak: true)
  set text(size: list-size, hyphenate: false)
  set par(first-line-indent: 0pt, leading: line-pitch - list-cap)
  set block(spacing: title-pitch - names-cap)
  let first = 0.662 * 10pt
  place(top + left, dy: first - 16.5pt - 0.676 * 14.4pt, text(
    size: 14.4pt,
    weight: "bold",
    top-edge: "cap-height",
    bottom-edge: "baseline",
    tracking: -0.12pt,
  )[Recent Titles in This Series])
  if note != none {
    place(top + right, dy: first - 16.5pt + 9.5pt - list-cap, note)
  }
  let start = if note == none { 24pt } else { 35.6pt }
  place(top + left, dy: first - 16.5pt + start - names-cap, block(
    width: list-width,
    body,
  ))
  if closing != none {
    place(
      top + right,
      dy: first + 42 * 13pt + closing-below - list-cap,
      closing,
    )
  }
}

// The notice on copying (p. 189): 10-pt type on 11.62 pt, justified as
// printed: word spaces shrink hardly at all, letters a little; paragraphs
// indented 12 pt; its first baseline 18.6 pt below that of a full page.
#let copying-notice(body) = {
  set text(size: 10pt)
  set par(
    justify: true,
    justification-limits: (
      spacing: (min: 95%, max: 300%),
      tracking: (min: -0.02em, max: 0em),
    ),
    first-line-indent: (amount: 12pt, all: true),
    leading: 11.62pt - 0.662 * 10pt,
    spacing: 11.62pt - 0.662 * 10pt,
  )
  v(18.6pt)
  body
}

// The printed pages after the index have neither head nor folio.
#let unnumbered-pages(body) = {
  set page(header: none, footer: none)
  body
}
