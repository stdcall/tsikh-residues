#import "main-defs.typ": index-destination, index-page, index-room

// The Subject Index as printed (pp. 187-188): one alphabet in two columns
// of 157 pt, 8.8-pt type with its baselines 9.55 pt apart, a blank line
// between the letters. A heading stands on a line of its own, its pages
// after it ("Divisor, 31"); each subentry on a line below it, 11.6 pt in
// ("effective, 31"), a subsubentry 11.6 pt further. A turned line of any
// of them stands 38.8 pt in. Marks name the heading (`term`), the subentry
// (`sub`) and the subsubentry (`subsub`) as printed; an entry that the
// book prints on one line with its qualifier ("Algebra, local, 23",
// "Zero, simple, 16") is a single term, `index-mark("Algebra, local")`.

// Letters and figures only; a formula sorts as it reads: "$n$-circular"
// under n, "$overline(partial)$-problem" under d.
#let sort-key(name) = {
  let read(formula) = formula
    .text
    .replace(regex("\b(cal|overline|hat|tilde|bold|upright)\("), "")
    .replace("partial", "d")
  lower(name.replace(regex("\$[^$]*\$"), read)).replace(
    regex("[^\p{L}0-9]"),
    "",
  )
}

// Names are strings of markup: "$n$-circular" gets its formula.
#let shown(name) = eval(name, mode: "markup")

// Pages joined into ranges, each page a link to the first mark on it.
#let page-list(marks) = {
  let pages = ()
  for mark in marks.sorted(key: index-page) {
    let page = index-page(mark)
    if pages.len() == 0 or pages.last().page != page {
      pages.push((page: page, mark: mark))
    }
  }
  let locator(entry) = box(context {
    let destination = index-destination(entry.mark)
    let printed = str(entry.page)
    metadata((
      kind: "page-reference",
      target: "index-mark",
      resolved: true,
      target-position: destination.position(),
      destination-offset-pt: 10,
      description: printed,
      printed: printed,
    ))
    link(destination, printed)
  })
  let runs = ()
  for entry in pages {
    if runs.len() > 0 and runs.last().last().page + 1 == entry.page {
      runs.last().push(entry)
    } else { runs.push((entry,)) }
  }
  runs
    .map(run => if run.len() == 1 { locator(run.first()) } else {
      // A range is not broken at its dash.
      [#locator(run.first())#sym.wj–#sym.wj#locator(run.last())]
    })
    .join[, ]
}

// The measures of the printed index, at the line pitch of 13 pt of the
// text: 8.8-pt type (the ink widths of 140 words are 0.977 times those of
// Termes at 9 pt), its baselines 9.55 pt apart (17 consecutive rows at 9.5,
// runs of 3 to 6 rows at 9.5-9.6 a row), a letter of the alphabet 19.5 pt
// below the last line of the one before (18 letters, 18.3-20.8 pt).
#let index-size = 8.8pt
#let index-pitch = 9.55pt
#let letter-gap = 19.5pt
// The columns: 157 pt wide (the longest printed lines of the left column,
// p. 188, reach 156.0 and 156.7 pt), the right one 185.0 pt right of the
// left one (p. 187); so the index is 342 pt wide, 3 pt wider than the text,
// and centred under the running head, as printed.
#let index-column = 157pt
#let index-gutter = 28pt
#let level-indent = 11.6pt
#let turned-indent = 38.8pt
// The cap height of the type, the height of a line box.
#let index-cap = 0.662 * index-size

// A line of the index at its depth (0 a heading, 1 a subentry, ...); a
// turned line stands `turned-indent` in. A line with subentries stays in
// its column with the first of them (`sticky`), as printed. An entry a
// little too long for its column stays on one line with its spaces shrunk,
// down to 76 per cent as TeX's could: the printed "Weierstrass preparation
// theorem (WPT), 110" is 156.7 pt long with spaces of 2.1-2.4 pt (the
// spaces of the index 2.95 pt at the median, 89 gaps).
#let index-line(depth, body, sticky: false) = block(
  width: 100%,
  breakable: false,
  sticky: sticky,
  spacing: index-pitch - index-cap,
  layout(size => {
    let room = size.width - depth * level-indent
    let natural = measure(body).width
    let shrunk = measure(text(spacing: 76%, body)).width
    let spacing = if natural > room and shrunk <= room {
      100% - (natural - room) / (natural - shrunk) * 24%
    } else { 100% }
    pad(left: turned-indent, par(
      hanging-indent: 0pt,
      first-line-indent: 0pt,
    )[#h(depth * level-indent - turned-indent)#text(spacing: spacing, body)])
  }),
)

#let new-node(name) = (
  name: name,
  marks: (),
  see: none,
  also: none,
  children: (:),
)

#let index-entries() = context {
  let heads = (:)
  for mark in query(<index-mark>) {
    let path = mark.value.path
    // Insert along the path, keeping the nodes as dictionaries.
    let add(nodes, path) = {
      let name = path.first()
      let node = nodes.at(name, default: new-node(name))
      if path.len() == 1 {
        node.marks.push(mark)
        if mark.value.see != none { node.see = mark.value.see }
        if mark.value.also != none { node.also = mark.value.also }
      } else {
        node.children = add(node.children, path.slice(1))
      }
      nodes.insert(name, node)
      nodes
    }
    heads = add(heads, path)
  }
  // A cross-reference names an entry as printed: a heading, or a heading
  // with its subentry.
  let first-place(node) = {
    let marks = node.marks
    for child in node.children.values() {
      marks += child.marks
      for grandchild in child.children.values() { marks += grandchild.marks }
    }
    if marks.len() == 0 { none } else {
      index-destination(marks.sorted(key: index-page).first())
    }
  }
  let target(name) = {
    let node = heads.at(name, default: none)
    if node != none { return first-place(node) }
    let (head, ..rest) = name.split(", ")
    let node = heads.at(head, default: none)
    if node != none and rest.len() > 0 {
      let child = node.children.at(rest.join(", "), default: none)
      if child != none { return first-place(child) }
    }
    none
  }
  let cross(name) = {
    let place = target(name)
    if place == none { shown(name) } else { link(place, shown(name)) }
  }
  let detail(node) = {
    let paged = node.marks.filter(m => m.value.see == none)
    let pages = if paged.len() > 0 [, #page-list(paged)]
    let see = if node.see != none [, _see_ #cross(node.see)]
    let also = if node.also != none [; _see also_ #cross(node.also)]
    [#pages#see#also]
  }
  let ordered(nodes) = nodes.values().sorted(key: it => sort-key(it.name))
  // The printed lines: every node, at its depth; a heading without pages
  // of its own stands alone above its subentries.
  let walk(node, depth) = {
    let found = ((depth: depth, node: node),)
    for child in ordered(node.children) { found += walk(child, depth + 1) }
    found
  }
  let letter = none
  for head in ordered(heads) {
    let initial = sort-key(head.name).first()
    if letter != none and initial != letter {
      v(letter-gap - index-cap, weak: true)
    }
    letter = initial
    for row in walk(head, 0) {
      index-line(row.depth, sticky: row.node.children.len() > 0)[#shown(
          row.node.name,
        )#detail(row.node)]
    }
  }
}

#let subject-index(body) = {
  set text(size: index-size, hyphenate: true)
  set par(justify: false, leading: index-pitch - index-cap)
  show math.equation.where(block: false): index-room
  let wide = 2 * index-column + index-gutter
  layout(size => pad(
    x: -(wide - size.width) / 2,
    columns(2, gutter: index-gutter, body),
  ))
}
