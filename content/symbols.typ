// Notation of the book. Operators are `math.op`; a symbol that is an object,
// not an operator, is formula content.

// The complex space C^n, the reals, the integers: bold upright capitals,
// as printed (not double-struck).
#let CC = math.upright(math.bold("C"))
#let RR = math.upright(math.bold("R"))
#let ZZ = math.upright(math.bold("Z"))
#let NN = math.upright(math.bold("N"))
#let QQ = math.upright(math.bold("Q"))

// d-bar: the overlined ∂.
#let dbar = $overline(partial)$.body

// Relatively compact, "M ⋐ N".
#let relcomp = sym.subset.double

#let Re = math.op("Re")
#let Im = math.op("Im")
#let supp = math.op("supp")
#let interior = math.op("int")
#let dist = math.op("dist")
#let rank = math.op("rank")
#let grad = math.op("grad")
// The local residue with its point below, also in the text:
// "res_a omega"; with the mapping as a right index,
// `res_a ""_f (h)`, as printed.
#let res = math.limits(math.op("res"), inline: true)
#let Res = math.op("Res")
#let sign = math.op("sign")
#let const = math.op("const")
#let diam = math.op("diam")
#let Hom = math.op("Hom")
#let Ker = math.op("Ker")
#let mes = math.op("mes")

// A bold upright I, the multi-index (1, ..., 1).
#let II = math.upright(math.bold("I"))
#let meas = math.op("meas")

// The push-forward of chains, f with a tilde under it, as printed.
#let utilde(x) = math.accent(x, "\u{0330}")

// The determinant, an operator without limits: "det^(-2) X".
#let det = math.op("det")

// The sign function, "sgn".
#let sgn = math.op("sgn")

// The regular and the singular points of an analytic set, "reg A",
// "sng A".
#let reg = math.op("reg")
#let sng = math.op("sng")

// The intersection index, "ind".
#let ind = math.op("ind")

// An arrow with a label above it, longer than the label by 1.2 em, as in the
// exact sequences of the book: `xto(partial_*)`.
#let xto(label) = math.attach(
  math.stretch(sym.arrow.r, size: 100% + 1.2em),
  t: label,
)
// The same arrow to the left: `xfrom(i_*)`.
#let xfrom(label) = math.attach(
  math.stretch(sym.arrow.l, size: 100% + 1.2em),
  t: label,
)

// A large solidus between a numerator and a product with limits, as in
// formula (2) of §16.2: `H d zeta bigslash product_(j = p + 1)^n …`. The
// font of the book has no "⧸" (`slash.big`); its slash stretches.
#let bigslash = math.stretch(sym.slash, size: 2.6em)

// The codimension, "codim".
#let codim = math.op("codim")

// The trace, "Tr".
#let Tr = math.op("Tr")

// The projective space, a bold upright P: `PP_n`.
#let PP = math.upright(math.bold("P"))
