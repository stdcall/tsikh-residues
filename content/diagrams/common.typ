// Commutative diagrams share the book's type and arrow style: thin arrows,
// labels in the type of the text. Grid nodes and maps are supplied by each
// diagram.
#import "@preview/fletcher:0.5.8": diagram, edge, node

// `spacing` is the gap between neighbouring cells (columns, rows).
#let cd(spacing: (14mm, 9mm), node-inset: 1mm, ..args) = {
  set text(top-edge: "bounds", bottom-edge: "bounds")
  stack(diagram(
    spacing: spacing,
    node-inset: node-inset,
    edge-stroke: 0.45pt,
    // Connectors turn in sharp corners, as printed.
    edge-corner-radius: 0pt,
    // Labels of arrows in the type of indices, as printed.
    label-size: 0.8em,
    label-sep: 0.25em,
    ..args,
  ))
}

// A square: `nw → ne` on top, `sw → se` below, `nw → sw` and `ne → se`
// down; the labels of the horizontal maps above them, of the vertical maps
// (`west`, `east`) on their right, as printed.
#let square(nw, ne, sw, se, top: [], bottom: [], west: [], east: []) = cd(
  node((0, 0), nw),
  node((1, 0), ne),
  node((0, 1), sw),
  node((1, 1), se),
  edge((0, 0), (1, 0), top, "->", label-side: left),
  edge((0, 1), (1, 1), bottom, "->", label-side: left),
  edge((0, 0), (0, 1), west, "->", label-side: left),
  edge((1, 0), (1, 1), east, "->", label-side: left),
)
