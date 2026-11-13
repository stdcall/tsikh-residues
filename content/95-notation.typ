#import "main-defs.typ": *
#import "symbols.typ": *
#import "notation-style.typ": notation-entries, notation-index

#heading(numbering: none)[List of Notations] <back:notation>
#source(197)
$NN, ZZ, RR, CC$ are the sets of natural numbers, integers, real numbers, and
complex numbers, respectively; if $alpha$ is a multi-index
$(alpha_1, ..., alpha_n)$, $alpha_j in ZZ$, then
$abs(alpha) = alpha_1 + dots.c + alpha_n$,
$alpha! = alpha_1 ! dots.c alpha_n !$; if $A$ is a finite set, then $abs(A)$ is
the cardinality of $A$; for a vector $z in CC^n$, we set
$
  norm(z) = max_j abs(z_j), wide
  abs(z) = (z_1 overline(z)_1 + dots.c + z_n overline(z)_n)^(1\/2), \
  partial^abs(alpha) / (partial z^alpha)
  = partial^abs(alpha)
  / (partial_(z_1)^(alpha_1) dots.c partial_(z_n)^(alpha_n)),
  wide z[j] = (z_1, ..., z_(j - 1), z_(j + 1), ..., z_n).
$

#notation-index[#notation-entries()]
