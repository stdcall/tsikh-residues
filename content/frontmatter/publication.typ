// Page iv: the copyright page. Every line stands with its baseline where it
// is printed, measured in points below the first baseline of a full page,
// and is centred on the text block or set at its left edge, as printed.
// Monotype Times, set in TeX Gyre Termes at the sizes that give the printed
// lines (the type of the edition is wider than Termes for its height); the
// Russian lines in Liberation Serif, a Times design with Cyrillic.
#import "../main-defs.typ": source

// A line or block with its first baseline `y` below the first baseline of
// a full page (the text block starts at the cap height of 10-pt type above
// it).
#let at(y, body, centred: false) = place(
  top + left,
  dy: y + 0.662 * 10pt,
  block(width: 100%, if centred { align(center, body) } else { body }),
)
#let russian = (font: "Liberation Serif", weight: "bold")
// A line break that keeps the line justified, as printed.
#let br = linebreak(justify: true)
// The logos of TeX and AMS-TeX: the E of TeX lowered, the M of AMS too. The
// calligraphic letters of the edition are not in the fonts of the book: the
// script capitals of the math font stand for them, set as text so that the
// line keeps its baseline.
#let tex = [T#h(-0.1667em)#text(baseline: 0.16em)[E]#h(-0.125em)X]
#let amstex = [#text(font: "TeX Gyre Termes Math")[𝒜#h(-0.12em)#text(
      baseline: 0.16em,
    )[ℳ]#h(-0.12em)𝒮]-#tex]
// The sign of permanent paper: an infinity in a circle, 3.5 pt after the
// centred line and outside it.
#let permanent = box(width: 0pt, place(
  bottom + left,
  dx: 3.5pt,
  dy: 1.5pt,
  circle(radius: 4.35pt, stroke: 0.55pt, align(center + horizon, text(
    size: 8pt,
    top-edge: "bounds",
    bottom-edge: "bounds",
    $infinity$,
  ))),
))

#source(6)
#set text(top-edge: "baseline", bottom-edge: "baseline", hyphenate: false)
#set par(first-line-indent: 0pt, justify: false, spacing: 0pt)

#at(-8.89pt, centred: true, text(
  ..russian,
  size: 10.3pt,
)[АВГУСТ КАРЛОВИЧ ЦИХ])
#at(20.51pt, centred: true, text(..russian, size: 15.1pt)[МНОГОМЕРНЫЕ ВЫЧЕТЫ])
#at(38.06pt, centred: true, text(..russian, size: 15.1pt)[И ИХ ПРИМЕНЕНИЯ])
#at(61.3pt, centred: true, text(
  font: "Liberation Serif",
  size: 10.6pt,
)[«Наука», Новосибирск, 1988])

#[
  #set text(size: 11.35pt)
  #at(86.2pt, centred: true)[Translated from the Russian by E. J. F. Primrose]
  #at(98.06pt, centred: true)[Translation edited by Sergei Gelfand]
]

#[
  #set text(size: 10.7pt)
  #set par(leading: 11.39pt)
  // The first line runs 2.6 pt into the margin, as printed.
  #at(117.5pt, block(width: 100% + 3pt, par(
    first-line-indent: (amount: 13pt, all: true),
  )[1991 _Mathematics Subject Classification._ Primary 32-20, Secondary 32A27,\
    32C30.]))
]

#[
  #set text(size: 8.9pt)
  #set par(leading: 8.87pt, justify: true)
  #at(149.51pt)[#smallcaps[Abstract]. Multidimensional residues related to the
    integration of meromorphic forms on an-#br alytic spaces are considered.
    Applications of these residues in function theory and in algebraic#br
    geometry are discussed, including those related to the study of analytic
    sets, singularities of vec-#br tor fields, ideals in polynomial rings, and
    intersection theory. Applications of multidimensional#br residues in
    computations involving multiple integrals and series are also discussed.]
  #at(149.51pt + 5 * 8.87pt, par(
    first-line-indent: (amount: 11.6pt, all: true),
  )[The book will be useful to specialists in complex analysis and in
    theoretical physics.])
]

#at(220.43pt, text(
  size: 8.1pt,
  weight: "bold",
)[Library of Congress Cataloging-in-Publication Data])
#[
  #set text(size: 8.8pt)
  #set par(leading: 8.78pt, justify: true)
  #let entry(y, body) = at(y, par(
    first-line-indent: (amount: 11.6pt, all: true),
    body,
  ))
  #at(238.22pt)[T͡Sikh, A. K.]
  #entry(248.18pt)[\[Mnogomernye vychety i ikh primenenii͡a. English\]]
  #entry(256.95pt)[Multidimensional residues and their applications/A. K. Tsikh;
    \[translated from the Russian#br by E. J. Primrose\].]
  #entry(274.5pt)[p. cm.---(Translations of mathematical monographs; v. 103)]
  #entry(285.17pt)[Translation of: Mnogomernye vychety i ikh primenenii͡a.]
  #entry(293.95pt)[Includes bibliographical references and index.]
  #entry(302.72pt)[ISBN 0-8218-4560-8 (alk. paper)]
  #entry(311.73pt)[1\. Congruences and residues.#h(8.1pt)I. Title.#h(
      8.1pt,
    )II. Series.]
  #at(320.5pt)[QA244.T7413#h(1fr)]
  #at(320.5pt)[#h(59.2pt)1992]
  #at(320.5pt, align(right)[92-8368])
  #at(329.27pt)[512′.72---dc20]
  #at(329.27pt, align(right)[CIP])
]

#[
  #set text(size: 9pt)
  #at(394.71pt, centred: true)[Copyright ©1992 by the American Mathematical
    Society. All rights reserved.]
  #at(405.86pt, centred: true)[Translation authorized by the]
  #at(417.24pt, centred: true)[All-Union Agency for Authors’ Rights, Moscow]
  #at(428.62pt, centred: true)[The American Mathematical Society retains all
    rights]
  #at(439.77pt, centred: true)[except those granted to the United States
    Government.]
  #at(451.15pt, centred: true)[Printed in the United States of America]
]
#[
  #set text(size: 7.9pt)
  #at(465.38pt, centred: true)[Information on Copying and Reprinting can be
    found at the back of this volume.]
  #at(477.24pt, centred: true)[The paper used in this book is acid-free and
    falls within the guidelines]
  #at(486.25pt, centred: true)[established to ensure permanence and
    durability.#permanent]
  #at(497.39pt, centred: true)[This publication was typeset using #amstex,]
  #at(506.17pt, centred: true)[the American Mathematical Society’s #tex macro
    system.]
  #at(523.24pt, centred: true)[10 9 8 7 6 5 4 3 2 1#h(15.6pt)97 96 95 94 93 92]
]
