# Checks kept with the edition

Independent checks of statements from A. K. Tsikh, *Multidimensional
Residues and Their Applications* (AMS, 1992). They supplement, and never
replace, reading the text against the printed book: none of them
establishes that our text matches the book.

* `tests/` — `just test` (and `just check`, and CI): the bibliography is
  generated from `references.bib` and `editorial.bib` (a change of a record
  reaches the printed entry and its links; the editorial references follow
  the list of the book), and statements, formulas and subsections are
  numbered by counters, sections through the book (an inserted statement
  renumbers the following ones and every reference to them).
* `sage/` — `just check-sage` runs every `*.py` here with `sage -python`
  (last run with SageMath 10.9); one script per chapter, the Introduction
  with Chapter I. Exact arithmetic only — ℤ, ℚ, ℚ(i), number fields and
  algebraic numbers, polynomial, rational function and power series rings,
  exact integrals and limits, local standard bases and multiplicities in
  Singular; no floating-point value is evidence. The scripts check the
  orientations of tubes and chains and the signs of Stokes' formula, the
  Martinelli–Bochner kernel and its normalization, local residues, the
  transformation formula and local and global duality, the trace formula,
  the theorem on the total sum of residues and the Euler–Jacobi formula,
  global residues of polynomial mappings, the residual currents and
  principal values of Chapter III on explicit test forms (the signs of the
  main theorem, normal matrices, the Leray residue formula), Weil's formula
  and the Hefer determinant, the King formula, multiplicities and Bézout's
  theorem, the theorems of Macaulay and Noether, Hadamard compositions,
  the quantification error of the filter of §22 and the integrals over R²
  of §23, and the examples and counterexamples of the text with all their
  hypotheses. Expected values are written as literals with the printed page
  and the label they come from; where the book is wrong, the printed reading
  stays in the script as a refuted check beside the corrected one. The
  docstring of each script states what it covers and what it does not
  establish — none certifies an analytic limiting argument or a theorem
  beyond the stated ranges. Each script prints `ok <name>: N checks`; the
  `sage` job of CI runs them one job per script.
* `lean/` and `lean-proofs.json` — `just check-lean` compiles the formal
  steps of `lean/TsikhResidues/` against the pinned mathlib (versions in
  `lean/lean-toolchain` and `lean/lake-manifest.json`) and audits their
  axioms: the declarations of the five files, one per chapter, may depend
  only on `propext`, `Classical.choice` and `Quot.sound`. Each record of
  `lean-proofs.json` names its declarations, the passage of the book they
  check, their limitations, and the labels of the checked passages
  (`passages`), which must exist in `content/`: when such a passage
  changes, the proof is reviewed by hand. The declarations prove bounded
  steps — determinants, sign and constant computations, exponent and
  limit lemmas under explicit hypotheses — not the analytic theorems they
  serve.

`just check` runs the tests, builds both PDFs and checks fonts, links,
bookmarks and the sources; `just check-sage` and `just check-lean` run the
mathematical checks, as CI does for every change.
