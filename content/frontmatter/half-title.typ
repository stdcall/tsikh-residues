// Page i: the half-title. A heavy rule 4 pt wide from the level of the
// running heads down to 520 pt from the top of the page, 77 pt from the
// left edge; the title in Bookman Light (TeX Gyre Bonum), flush left
// 17.3 pt to the right of the rule. Positions from the top left corner of
// the page, measured on the edition from the text block of the full pages.
#import "../main-defs.typ": source
#import "cover.typ": bookman, display-line

// A line of a right-hand page placed from the top left corner of the page
// (its left margin is 44 pt, its top margin 48 pt): `x` the origin of its
// first letter, `y` its baseline, `cap` its cap height, `width` its
// measured width.
#let page-line(x, y, cap, width, body) = display-line(
  x - 44pt,
  y - 48pt,
  cap,
  width: width,
  ..bookman,
  body,
)

#source(3)
#place(top + left, dx: 77.1pt - 44pt, dy: 27.7pt - 48pt, rect(
  width: 4pt,
  height: 519.8pt - 27.7pt,
  fill: black,
))
#page-line(94.45pt, 230.2pt, 14pt, 271.6pt)[Multidimensional Residues]
#page-line(94.7pt, 255.1pt, 14pt, 226.3pt)[and Their Applications]
