// The cover of Translations of Mathematical Monographs 103 (1992), the
// display lines of the cover and of the title pages, and the seal of the
// Society, set from measurements of the originals. The display type of the
// series is ITC Bookman Light and Demi, set here in TeX Gyre Bonum, its
// URW clone.

#let bookman = (font: "TeX Gyre Bonum")
#let bookman-bold = (font: "TeX Gyre Bonum", weight: "bold")

// A display line: the origin of its first letter at `x`, its baseline at
// `y` and its size given by the cap height `cap`. A measured `width` is
// reached by widening the letter spacing (`fit: "tracking"`), the word
// spaces (`fit: "spacing"`) or by scaling the line horizontally (`fit:
// "scale"`); without it the line keeps its natural width. `anchor` is the
// point of the line placed at `x`: its left end, its centre or its right
// end. Further arguments are those of `text`.
#let display-line(
  x,
  y,
  cap,
  body,
  width: none,
  fit: "tracking",
  anchor: left,
  ..style,
) = place(top + left, dx: x, dy: y, context {
  let style = style.named()
  let spacing = style.remove("spacing", default: 100%)
  let edges = (top-edge: "baseline", bottom-edge: "baseline")
  let cap-ratio = (
    measure(text(
      ..style,
      size: 100pt,
      top-edge: "cap-height",
      bottom-edge: "baseline",
    )[H]).height
      / 100pt
  )
  let size = cap / cap-ratio
  let set-line(extra, tracking) = text(
    ..style,
    ..edges,
    size: size,
    spacing: spacing + extra,
    tracking: tracking,
    body,
  )
  let line = set-line(0pt, 0pt)
  let natural = measure(line).width
  if width != none and fit == "spacing" {
    // The widening of the line per point added to each word space.
    let spaces = (measure(set-line(1pt, 0pt)).width - natural) / 1pt
    if spaces > 0 {
      line = set-line((width - natural) / spaces, 0pt)
      natural = width
    }
  } else if width != none and fit == "tracking" {
    // The widening of the line per point of letter spacing.
    let gaps = (measure(set-line(0pt, 1pt)).width - natural) / 1pt
    if gaps > 0 {
      line = set-line(0pt, (width - natural) / gaps)
      natural = width
    }
  }
  let k = if width != none and fit == "scale" { width / natural } else { 1 }
  let shift = if anchor == center { -natural * k / 2 } else if (
    anchor == right
  ) { -natural * k } else { 0pt }
  move(dx: shift, scale(x: k * 100%, origin: left, reflow: true, line))
})

// The name of the series: "MATHEMATICAL" and "MONOGRAPHS" open with an M
// larger than the capitals that follow it, its top level with theirs (or
// `m-drop` lower) and its feet below their baseline. `x` is the M,
// `rest-x` the next letter, `right` the end of the line; `cap` and
// `m-cap` the cap heights. The capitals of Bookman are wider than those of
// Bonum: the rest of the word is letterspaced to its printed width.
#let series-word(
  x,
  rest-x,
  right,
  y,
  cap,
  m-cap,
  rest,
  m-drop: 0pt,
  ..style,
) = {
  display-line(x, y - cap + m-cap + m-drop, m-cap, [M], ..style)
  display-line(rest-x, y, cap, rest, width: right - rest-x, ..style)
}

// The seal of the Society, drawn about its centre: `r` is the radius of
// the inner of its two circles, `paint` its colour. The measures are those
// of the seal on the title page, in parts of `r`. Around the circles the
// name of the Society reads over the top, "FOUNDED 1888" along the bottom
// between two dots; inside, a temple of four columns on three steps, with
// "ΤΡΗΤΟΣ ΜΗ" above it and "ΑΓΕΩΜΕ", "ΕΙΣΙΤΩ" at its sides.
#let ring-font = (font: ("TeX Gyre Heros", "Liberation Serif"))
// Letters set along an arc of radius `radius` from angle `from` to angle
// `to` (degrees, counterclockwise from the right); `outward`: their tops
// point away from the centre, else towards it.
#let arc-text(radius, from, to, size, body, outward: true, paint: black) = {
  context {
    let letters = body.clusters()
    let style = (..ring-font, size: size, fill: paint)
    let widths = letters.map(c => measure(text(..style, c)).width)
    let total = widths.sum()
    let span = calc.abs(to - from) / 180 * calc.pi * radius
    let gap = (span - total) / calc.max(letters.len() - 1, 1)
    let direction = if to < from { -1 } else { 1 }
    let s = 0pt
    for (c, w) in letters.zip(widths) {
      let middle = s + w / 2
      let angle = from + direction * (middle / radius) * 180 / calc.pi
      let a = angle * 1deg
      let px = radius * calc.cos(a)
      let py = -radius * calc.sin(a)
      let turn = if outward { 90deg - a } else { 270deg - a }
      place(
        top + left,
        dx: px - w / 2,
        dy: py,
        rotate(turn, origin: center + top, reflow: false, move(
          dx: 0pt,
          text(
            ..style,
            top-edge: "baseline",
            bottom-edge: "baseline",
            box(width: w, align(center, c)),
          ),
        )),
      )
      s += w + gap
    }
  }
}

// The seal in a square box of side `3 r`, its centre in the middle; a
// part `(x, y)` of it is given from the centre in parts of `r`, `y` down.
#let seal(r, paint: black) = box(width: 3 * r, height: 3 * r, {
  let u(k) = k * r
  let c = 1.5 * r
  let thin = u(0.023)
  let thick = u(0.031)
  let at(x, y, body) = place(top + left, dx: c + u(x), dy: c + u(y), body)
  let outline(x0, y0, x1, y1) = at(x0, y0, rect(
    width: u(x1 - x0),
    height: u(y1 - y0),
    stroke: (paint: paint, thickness: thin),
  ))
  // The circles.
  at(-1, -1, circle(radius: r, stroke: (paint: paint, thickness: thin)))
  at(-1.137, -1.137, circle(radius: u(1.137), stroke: (
    paint: paint,
    thickness: thick,
  )))
  // The name of the Society over the top, its letters standing on the
  // arc; the year of its foundation along the bottom, its letters hanging
  // from it; two dots between them.
  let ring = u(0.286)
  at(0, 0, arc-text(
    u(1.19),
    205.9,
    -23.7,
    ring,
    "AMERICAN MATHEMATICAL SOCIETY",
    paint: paint,
  ))
  at(0, 0, arc-text(
    u(1.4),
    225.9,
    281.9,
    ring,
    "FOUNDED",
    outward: false,
    paint: paint,
  ))
  at(0, 0, arc-text(
    u(1.4),
    296.8,
    319.3,
    ring,
    "1888",
    outward: false,
    paint: paint,
  ))
  for a in (216.6deg, 323.4deg) {
    at(1.25 * calc.cos(a) - 0.03, -1.25 * calc.sin(a) - 0.03, circle(
      radius: u(0.03),
      fill: paint,
    ))
  }
  // The inscription: a line over the temple, and up and down its sides.
  let small = (..ring-font, size: u(0.175), fill: paint)
  let centred(x, y, body) = place(center + horizon, dx: u(x), dy: u(y), body)
  centred(0, -0.67, text(..small)[ΤΡΗΤΟΣ ΜΗ])
  centred(-0.69, -0.15, rotate(-90deg, reflow: true, text(..small)[ΑΓΕΩΜΕ]))
  centred(0.69, -0.15, rotate(90deg, reflow: true, text(..small)[ΕΙΣΙΤΩ]))
  // The temple: a pediment with its tympanum, an entablature of two bands,
  // four columns with their capitals, three steps.
  let triangle(half, base, apex) = at(0, 0, polygon(
    stroke: (paint: paint, thickness: thin, join: "miter"),
    (u(-half), u(base)),
    (0pt, u(apex)),
    (u(half), u(base)),
  ))
  triangle(0.554, -0.234, -0.52)
  triangle(0.45, -0.27, -0.465)
  outline(-0.554, -0.234, 0.554, -0.205)
  outline(-0.518, -0.205, 0.518, -0.16)
  outline(-0.518, -0.16, 0.518, -0.1)
  for x in (-0.415, -0.14, 0.14, 0.415) {
    outline(x - 0.085, -0.1, x + 0.085, -0.06)
    outline(x - 0.055, -0.06, x + 0.055, 0.53)
  }
  outline(-0.52, 0.53, 0.52, 0.6)
  outline(-0.57, 0.6, 0.57, 0.68)
  outline(-0.61, 0.68, 0.61, 0.77)
})

// The cover is measured in units of 1/300 in on the cover of the edition
// (1987 x 3019 units, 6.6 x 10.1 in at the scale of the measurements of
// the pages), mapped proportionally onto the 6 x 9 in page of the book: a
// horizontal unit is 6 in / 1987, a vertical one 9 in / 3019. A line is
// given by the origin of its first letter, its baseline, its cap height
// and the right end of its ink. A dark navy field; at the spine a dark maroon
// strip and a white rule; white type and rule. The colours are the medians
// of large areas of the original.
#let ux = 6in / 1987
#let uy = 9in / 3019
#let navy = rgb(1, 5, 13)
#let maroon = rgb(19, 3, 2)
#let white = rgb(244, 251, 251)

#let cover-line(x, y, cap, body, right: none, ..args) = display-line(
  x * ux,
  y * uy,
  cap * uy,
  body,
  width: if right == none { none } else { (right - x) * ux },
  ..args,
)

#let cover() = page(
  width: 6in,
  height: 9in,
  margin: 0pt,
  header: none,
  footer: none,
  numbering: none,
  fill: navy,
)[
  #set text(hyphenate: false, fill: white)
  #place(top + left, rect(width: 356.25 * ux, height: 100%, fill: maroon))
  #place(top + left, dx: 356.25 * ux, rect(
    width: 13 * ux,
    height: 100%,
    fill: white,
  ))
  // The series, flush left at 446 units; the rule under it.
  #cover-line(446, 258, 60, [Translations of], right: 1088, ..bookman)
  #series-word(
    443 * ux,
    601 * ux,
    1657 * ux,
    417 * uy,
    95 * uy,
    124 * uy,
    [ATHEMATICAL],
    m-drop: 3 * uy,
    ..bookman,
  )
  #series-word(
    647 * ux,
    814 * ux,
    1761 * ux,
    564 * uy,
    96 * uy,
    125 * uy,
    [ONOGRAPHS],
    ..bookman,
  )
  #place(top + left, dx: 448 * ux, dy: 683 * uy, rect(
    width: (1894.75 - 448) * ux,
    height: 7.25 * uy,
    fill: white,
  ))
  #cover-line(454, 793, 40, [Volume 103], right: 791, fit: "spacing", ..bookman)
  // The title and the author.
  #cover-line(
    450,
    1513,
    73,
    [Multidimensional Residues],
    right: 1880,
    ..bookman,
  )
  #cover-line(451, 1643, 73, [and Their Applications], right: 1642, ..bookman)
  #cover-line(
    447,
    1827,
    51,
    [A. K. Tsikh],
    right: 850,
    fit: "spacing",
    ..bookman,
  )
  // The seal, its left part and its foot cut off by its window, and the
  // name of the Society.
  #place(top + left, dx: 445 * ux, dy: 2600 * uy, block(
    width: 240 * ux,
    height: 180 * uy,
    clip: true,
    place(
      top + left,
      dx: (560 - 445) * ux - 1.5 * 17.7pt,
      dy: (2756 - 2600) * uy - 1.5 * 17.7pt,
      seal(17.7pt, paint: white),
    ),
  ))
  #cover-line(
    702,
    2768,
    31,
    [American Mathematical Society],
    right: 1462,
    ..bookman-bold,
  )
]
