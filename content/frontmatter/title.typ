// Page iii: the title page. A heavy rule 3.9 pt wide down the page from its
// top to the foot of the seal, 62 pt from the left edge; the series, the
// volume, the title and the author flush left 17.3 pt to the right of it,
// in Bookman Light (TeX Gyre Bonum), the series under a rule 2 pt thick;
// the seal of the Society and its name in Bookman Demi at the foot.
// Positions from the top left corner of the page, measured on the edition.
#import "../main-defs.typ": source
#import "cover.typ": bookman, bookman-bold, display-line, seal, series-word

// A right-hand page: its left margin is 44 pt, its top margin 48 pt.
#let at-page(x, y, body) = place(top + left, dx: x - 44pt, dy: y - 48pt, body)
// A line placed from the top left corner of the page: `x` the origin of
// its first letter, `y` its baseline, `cap` its cap height, `width` its
// measured width.
#let page-line(x, y, cap, width, body, ..style) = display-line(
  x - 44pt,
  y - 48pt,
  cap,
  width: width,
  ..style,
  body,
)

#source(5)
#at-page(62.2pt, 0pt, rect(width: 3.9pt, height: 632.2pt, fill: black))
#page-line(79pt, 29.3pt, 11.76pt, 131.3pt, ..bookman)[Translations of]
#series-word(
  80.4pt - 44pt,
  110.3pt - 44pt,
  312.8pt - 44pt,
  60.7pt - 48pt,
  18.9pt,
  23.86pt,
  [ATHEMATICAL],
  ..bookman,
)
#series-word(
  118.3pt - 44pt,
  149.2pt - 44pt,
  324.6pt - 44pt,
  90.1pt - 48pt,
  18.9pt,
  23.86pt,
  [ONOGRAPHS],
  ..bookman,
)
#at-page(80.4pt, 107.4pt, rect(
  width: 400.1pt - 80.4pt,
  height: 2pt,
  fill: black,
))
#page-line(82pt, 132.1pt, 7.97pt, 68.6pt, fit: "spacing", ..bookman)[Volume 103]
#page-line(79.4pt, 287.6pt, 14pt, 271.4pt, ..bookman)[Multidimensional Residues]
#page-line(79.7pt, 312.5pt, 14pt, 226.1pt, ..bookman)[and Their Applications]
#page-line(78.3pt, 349.9pt, 10.8pt, 84.9pt, fit: "spacing", ..bookman)[A. K.
  Tsikh]
#at-page(106.1pt - 1.5 * 20.63pt, 604.7pt - 1.5 * 20.63pt, seal(20.63pt))
#page-line(140.5pt, 598.8pt, 6.71pt, 163.4pt, ..bookman-bold)[American
  Mathematical Society]
#page-line(140.5pt, 611.1pt, 6.71pt, 120.7pt, ..bookman)[Providence, Rhode
  Island]
