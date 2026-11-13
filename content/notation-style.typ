#import "main-defs.typ": index-destination, index-page
#import "statements.typ": body-size, cap, line-pitch, lineskip

// The List of Notations as printed (p. 185): after the opening paragraph,
// one symbol a line in three columns of 86 pt with gutters of 40 pt, the
// symbol at the left of its column and its pages flush right, "C_q (X)
// ... 1", in the type of the text with its baselines a line pitch apart
// (11 on 13 pt: the rows of the printed list stand 12.7 pt apart on the page
// image, 13.0 pt at the line pitch of the text). The symbols are
// those of the marks in the text (`notation-mark`); a symbol marked in
// several places gets all its pages ("5, 64"). Order: by the letters of
// the symbol as it reads (Latin, then Greek and signs), or by the `sort`
// key of its mark.

#let greek = (
  "alpha",
  "beta",
  "gamma",
  "delta",
  "epsilon",
  "zeta",
  "eta",
  "theta",
  "iota",
  "kappa",
  "lambda",
  "mu",
  "nu",
  "xi",
  "omicron",
  "pi",
  "rho",
  "sigma",
  "tau",
  "upsilon",
  "phi",
  "chi",
  "psi",
  "omega",
)

// A given sort key compares its letters regardless of case, a capital
// before its small letter: "D r X" (D^r (X)) before "d" (d), as printed.
#let collate(key) = {
  key
    .clusters()
    .map(c => if lower(c) != upper(c) {
      lower(c) + if c == upper(c) { "0" } else { "1" }
    } else { c + "1" })
    .join()
}

// The key of a symbol: its `sort` key, or the letters of its formula. A
// Latin letter sorts first, a Greek one after the Latin alphabet in the
// order of the Greek alphabet (beta, Gamma, epsilon, mu, Pi, pi, rho,
// Omega, as printed), a sign last.
#let symbol-key(mark) = {
  let given = mark.value.sort
  let source = if given != none { given } else {
    repr(mark.value.symbol)
  }
  let text = lower(source)
  let name = greek.find(g => text.contains(g))
  let latin = text.replace(
    regex(
      "\b(overline|tilde|hat|bold|upright|cal|frak|sequence|equation|"
        + "attach|text|body|block|false|true|base|t|b|tl|tr|bl|br)\b",
    ),
    "",
  )
  let letters = latin.replace(regex("[^a-z]"), "")
  let greek-key = greek.find(g => text.starts-with(g))
  // A sort key that starts with "~" is a sign: after the Greek letters.
  if given != none and given.starts-with("~") {
    "3" + collate(given)
  } else if given != none and greek-key != none {
    let rank = greek.position(g => g == greek-key)
    "2" + str(10 + rank) + collate(given)
  } else if given != none { "1" + collate(given) } else if (
    letters != ""
  ) {
    "1" + letters
  } else if name != none { "2" + name } else { "3" + text }
}

// The measures of the printed list: its baselines a line pitch apart, as in
// the text, its type that of the text.
#let notation-pitch = line-pitch
#let notation-cap = cap(body-size)

#let notation-entries() = context {
  let groups = (:)
  for mark in query(<notation-mark>) {
    let key = repr(mark.value.symbol)
    let group = groups.at(key, default: (mark: mark, marks: ()))
    group.marks.push(mark)
    groups.insert(key, group)
  }
  let rows = groups.values().sorted(key: g => symbol-key(g.mark))
  // The ink of a row: how high its symbol and pages reach above the
  // baseline and how deep below.
  let ink(row) = {
    let ascent = measure(text(top-edge: "bounds", bottom-edge: "baseline", row))
    let full = measure(text(top-edge: "bounds", bottom-edge: "bounds", row))
    (ascent.height, full.height - ascent.height)
  }
  let depth = none
  for group in rows {
    let pages = ()
    for mark in group.marks.sorted(key: index-page) {
      let page = index-page(mark)
      if pages.len() == 0 or pages.last().page != page {
        pages.push((page: page, mark: mark))
      }
    }
    let locators = pages.map(p => {
      let destination = index-destination(p.mark)
      let printed = str(p.page)
      box(
        metadata((
          kind: "page-reference",
          target: "notation-mark",
          resolved: true,
          target-position: destination.position(),
          destination-offset-pt: 10,
          description: printed,
          printed: printed,
        ))
          + link(destination, printed),
      )
    })
    // The rows stand a line pitch apart, or farther where their ink would
    // come closer than 1 pt, by TeX's interline rule, as printed ("f^#"
    // under "f_#" 17.4 pt, "H^F_q (X)" under "H_q (X)" 15.3 pt): each row
    // keeps the edges of a line of text, and its formulas their ink.
    let symbol = group.mark.value.symbol
    let (ascent, row-depth) = ink[#symbol #locators.join[, ]]
    let above = if depth == none { 0pt } else {
      calc.max(notation-pitch, depth + lineskip + ascent) - notation-cap
    }
    depth = row-depth
    // The symbol at the left, its pages flush right; a symbol too wide
    // for the column leaves its pages on the line below, flush right.
    block(
      width: 100%,
      breakable: false,
      above: above,
      below: 0pt,
      text(top-edge: notation-cap, bottom-edge: 0pt, par(
        justify: false,
        first-line-indent: 0pt,
      )[#symbol#h(1em, weak: true)#h(1fr)#locators.join[, ]]),
    )
  }
}

// The columns stand 7.3 pt lower under the displays of the opening
// paragraph than a paragraph would: their first row 33.7 pt below the last
// row of the displays, as printed.
#let notation-index(body) = {
  set par(justify: false, leading: notation-pitch - notation-cap)
  // (No room for formulas here: the rows take theirs, `notation-entries`.)
  v(7.3pt)
  columns(3, gutter: 40pt, body)
}
