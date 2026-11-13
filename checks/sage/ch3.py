"""Exact checks of Chapter III, "Residues Associated with Mappings
f: C^n -> C^p (Residual Currents and Principal Values)", §§11-15, the
Appendix and the Notes (printed pp. 63-104).

Run: sage -python checks/sage/ch3.py (plain asserts; do not use -O).
The last line of the output is "ok ch3: N checks".

Book: A. K. Tsikh, Multidimensional Residues and Their Applications, AMS
Translations of Mathematical Monographs 103, 1992.  Pages are the printed
pages; numbers of subsections, statements and formulas are those of the
book, labels in brackets those of our sources.  Expected values are the
book's formulas, written below as literals (with the corrections where
marked); the Typst sources are not parsed.  Where the book is wrong, the
printed reading stays as a refuted check (`refuted`: the printed reading
must fail) beside the corrected one.

Exact arithmetic only: Q(i), polynomial rings over it with symbolic
coefficients, exact integrals of polynomials, Sage matrices over Z and Q.

Model of the currents ("cutoff calculus").  Test forms are polynomials in
z_k, conj(z_k) with symbolic coefficients times prod_k chi(|z_k|^2), where
chi is one smooth cutoff function of a real variable u >= 0, chi = 1 near
u = 0 and chi = 0 for u >= 1.  The chains are products, in a given order,
of circles {|z_k| = rho} (oriented by theta_k), exteriors {|z_k| > rho} and
planes C (oriented by dx_k ^ dy_k).  The integrals are computed exactly in
polar coordinates: the theta-integrals select the monomials z^a conj(z)^a,
the radial integrals are the moments M_a = int_0^oo u^a chi(u) du (free
symbols: for finitely many a they take arbitrary values for suitable chi)
and int u^a chi^(m)(u) du, reduced to M by integration by parts
(chi^(m)(0) = 0 for m >= 1, chi(0) = 1).  On a circle of small radius
rho, chi(rho^2) = 1 and chi^(m)(rho^2) = 0.  Every value is a polynomial in
the radii with nonnegative exponents (asserted: no divergent term), so the
limit as the radii tend to zero along any path, admissible paths included,
is the value at radii 0.  An identity verified with symbolic coefficients
holds for all test forms of that kind (polynomial coefficients of the
stated degree times the cutoffs), for every chi.

Conventions of the book used here: Stokes' formula of §3.2; the operators
on currents of §3.3, dT(psi) = (-1)^(r+1) T(d psi) and
dbar T(psi) = (-1)^(r+1) T(dbar psi) for psi of degree r; tubes oriented by
the parameters theta_1, ..., theta_s, r_(s+1), theta_(s+1), ... as in §2.3
(theta_I first, then the pairs (r_j, theta_j) of J, then the remaining
coordinates), so that d arg f_1 ^ ... ^ d arg f_n > 0 on the tube of a local
residue (Chapter II) and the Leray formula of §14.2 holds with the factor
+2 pi i.  With these conventions the boundary formula of the proof of
§13.3, d T_(I',{j}) = (-1)^j T_(I, empty), is checked through Stokes'
formula (check B "Stokes").

What is checked:

A  Introduction of Chapter III (p. 63): for f = (z1 z2, z2) the tube
   {|z1 z2| = delta^2, |z2| = delta} is the torus |z1| = |z2| = delta,
   oriented as d arg f1 ^ d arg f2 = d theta1 ^ d theta2, and the limit of
   int psi/(f1 f2), psi = g dz1 ^ dz2, g of degree <= 4, is
   (2 pi i)^2 dg/dz2(0) (p63-example-derivative); the printed
   (2 pi i)^2 2 dg/dz1(0) is refuted.  The same value along an admissible
   path (radii eps1/eps2 and eps2).  §11.1 (p. 65): the limit of
   prod eps_j^(nu_j) along an admissible path is 0 or oo only when the nu_j
   are not all zero (ch3-p65-limit-zero-or-infinity): the first nonzero
   exponent decides, exhaustively for nu in {-2, ..., 2}^3 against the
   model path eps_j = exp(-T_j), T_1 >> T_2 >> T_3 (log scale compared
   lexicographically); the general statement is proved in Lean
   (Ch3.lean, admissible_prod_tendsto_zero).
B  §11.2, property (4), and §13.3, formulas (1), (2) and the proof
   (pp. 66, 84-85), and §15.1 (p. 100).  Models: n = p = 1, f = z;
   n = 2, p = 1, f = z1; n = p = 2, f = (z1, z2), j = 1, 2; lambda =
   h/f^k with h of degree <= 2 and k = 1, 2, and 1-forms lambda; psi
   generic of the right degree (coefficients of degree <= 3, <= 2, <= 2).
   Checked: Stokes' formula of the proof,
   (-1)^j R_I[lambda]
     = R_(I')P_({j})[d lambda] + (-1)^q R_(I')P_({j})[lambda](d psi);
   the corrected sign (-1)^q R(lambda ^ d psi) = (-1)^(p+1) dR[lambda](psi)
   (the printed (-1)^p refuted, ch3-p85-stokes-derivative-sign); formula
   (1) with (-1)^(j+p+1) (printed (-1)^(j+p) refuted,
   ch3-p84-d-principal-sign); formula (2) and property (4) as
   (-1)^(j+p+1) dbar R_(I')P_({j}) = R_I (printed sign refuted); the
   member d R_(I')P_({j}) = +-R_I refuted with either sign
   (ch3-p66-main-theorem-4, ch3-p84-dbar-principal): for n = p = 1, f = z,
   psi = z^2 chi dzbar, R_f(psi) = dbar P_f(psi) = 0 but
   d P_f(psi) = -2 pi i M_0; in general
   d R' - dbar R' = partial R' = (-1)^p R'[d(1/f_1...f_p)] (all models);
   the bidimension (n, n - p) of R_I.  Cauchy-Pompeiu:
   dbar P_z(g dz) = -2 pi i g(0) = -R_z(g dz).  §15.1: with the corrected
   (1), j = p = n gives
   R[omega](1) = -(dR'P[omega])(1) + (-1)^n R'P[d omega](1)
   (ch3-p100-total-sum-sign).
C  §12.2-§12.5 (pp. 68-81): Cramer's rule, (3)-(5) of §12.2, and the nonzero
   rows delta_i; the cofactor identity (5) of §12.4 and prod_k v_k^(alpha_jk)
   = u_j as an identity of exponents, generic p x p matrices, p <= 4; the
   inequality of Lemma 1 of §12.2 from a linear relation, 200 random
   dependent matrices; polar forms: dz ^ dzbar = -2i rho drho ^ dtheta ((6)
   of §12.4), the pullbacks nu_delta^*(dz_j), nu_delta^*(dzbar_j), and dz[S]
   ^ dzbar[S] = +- prod (2i rho_q dtheta_q ^ drho_q) with the sign
   (-1)^(m(m-1)/2), m = n - s <= 5 (the printed sign + refuted for m = 2,
   ch3-p77-dz-dzbar-sign); the factor Phi of (11) of §12.4 for all A, S with
   n <= 3, s <= 2 (generic derivatives of rho_S); the exponents b_j of Step 5
   and of the lemma of §12.5 are negative, gamma_j <= 6; the special Taylor
   expansion of §12.3 for polynomials (n = 2, degree <= 5, gamma <= (2, 2))
   and the integral remainder with (sigma! tau!)^(-1)
   (p73-taylor-remainder-factorials; the printed remainder refuted, gamma_1
   <= 3); Lemma 2 of §12.4 needs the factor i (p78-lemma2-phase); for f = z1
   z2 the radius rho_1 = eps/rho_2 has the value 1/2 at rho_2 = 2 eps for
   every eps: no uniform bound tends to zero; pointwise rho_1 -> 0
   (ch3-p81-lemma-bound).
D  §13.4 (pp. 85-90): the normal matrices.  Exhaustively for p = 2, 3,
   n <= 4 (p = 3: n <= 3), entries in {0, 1, 2}, all zero patterns M: the
   criterion of the proof of the lemma (all I_k nonempty, k <= p - 1) is
   equivalent to the existence of A subset M, |A| = p - 1, with alpha_A
   normal; with the square case |A| = p (ch3-p86-normal-square) the
   equalities (8)-(10) agree with property (b) of the proposition,
   S(f) = S~(f) cap V(f_p); a matrix alpha_A is square only for |A| = p;
   the examples (z1 z2, z2), (z2, z1 z2), (z1, z1 z2).  The upper
   triangular solution (5) of the lemma has Delta_ii > 0 and its first
   nonzero exponent is Delta_ii (random triangular matrices, p <= 5).
E  §14 (pp. 92-99): the Proposition of §14.1 needs the complete
   intersection: f = (z1, z1 z2).  §14.2: the residue forms (2) and (5):
   df_1 ^ ... ^ df_p ^ psi/df = psi for every I with J_I != 0 (generic
   first jets, n <= 4, p <= n - 1, all I), hence independence of I on Z;
   the Leray formula with 2 pi i and eps(I) on f = z_k (n = 2, k = 1, 2),
   f = (z1, z2), (z2, z1) (n = 3).  §14.3: R_f[h] = 0 iff h in (f) for
   f = z1^2 in C^2 (h of degree <= 3 in z1).
F  §15.2 is not computed (the undefined W: ch3-p102-reg-Z is a reading).
   Appendix (pp. 102-104): the volume of Delta_m is 1/m!, m <= 6, and the
   average of a constant with (p + 1)! (pc-p103-average-factor; printed
   1/(p + 1)! refuted); lim int_(|z| = delta) psi/z equals
   lim int dbar chi(|z|/delta)/z ^ psi for f = z; the remark on
   f = (z1, z1 z2): along parabolic paths with t2 > t1 the tube is a
   shrinking torus and R(g dz1 ^ dz2) = (2 pi i)^2 dg/dz1(0), with h = z2
   (not in the ideal (z1)) R[h] = 0, so nondegeneracy fails; along
   admissible paths the tube leaves every compact set.

What is NOT established: the existence theorems (§12, §13.1), the
iterated limit (5), the supports (6) in general, the resolution of
singularities, Remmert's theorem, the theorem of §15.2 (Coleff and
Herrera), Passare's averaging; the currents are computed only for normal
crossings in coordinates (products of circles, exteriors and planes) and
polynomial test forms times cutoffs, and the combinatorial checks cover
only the stated ranges.  The general limit dichotomy of §11.1, the sign
bookkeeping of §13.3 and the combinatorics of the lemma of §13.4 are in
checks/lean/TsikhResidues/Ch3.lean.
"""

import itertools
import random
import time

from sage.all import (QQ, ZZ, QuadraticField, PolynomialRing, Matrix,
                      Subsets, SR, var, integrate, prod)
from sage.all import I as SI, pi as SPI

COUNT = [0]
T0 = time.time()
random.seed(20261113)


def check(condition, label):
    assert bool(condition), label
    COUNT[0] += 1


def refuted(condition, label):
    """The printed reading must fail."""
    assert not bool(condition), "printed reading holds: " + label
    COUNT[0] += 1


def section(name):
    print("%-4s %6.1f s, %d checks" % (name, time.time() - T0, COUNT[0]),
          flush=True)


def perm_sign(seq):
    seq = list(seq)
    if len(set(seq)) != len(seq):
        return 0
    s = 1
    for a in range(len(seq)):
        for b in range(a + 1, len(seq)):
            if seq[a] > seq[b]:
                s = -s
    return s


# ---------------------------------------------------------------------------
# Rings.  KI = Q(i).  B holds the symbolic constants: pi, the moments
# M_a of chi, the radii e_k, the coefficients c_k of test forms and h_k of
# semimeromorphic forms.  R = B[z_0.., w_0..] with w_k = conj(z_k).
# ---------------------------------------------------------------------------

KI = QuadraticField(-1, 'i')
II = KI.gen()
NV = 3                      # at most three complex variables
NMOM = 10
NC = 700
NH = 60
BNAMES = (['pi'] + ['M%d' % a for a in range(NMOM)]
          + ['e%d' % k for k in range(NV)]
          + ['c%d' % k for k in range(NC)] + ['h%d' % k for k in range(NH)])
B = PolynomialRing(KI, BNAMES)
PI = B('pi')
MOM = [B('M%d' % a) for a in range(NMOM)]
E = [B('e%d' % k) for k in range(NV)]
CS = [B('c%d' % k) for k in range(NC)]
HS = [B('h%d' % k) for k in range(NH)]
R = PolynomialRing(B, ['z%d' % k for k in range(NV)]
                   + ['w%d' % k for k in range(NV)])
Z = [R('z%d' % k) for k in range(NV)]
W = [R('w%d' % k) for k in range(NV)]
ZERO_M = (0,) * NV


class Pool:
    """Hands out fresh symbolic coefficients."""

    def __init__(self, syms):
        self.syms, self.i = syms, 0

    def take(self):
        s = self.syms[self.i]
        self.i += 1
        return s

    def reset(self):
        self.i = 0


CPOOL, HPOOL = Pool(CS), Pool(HS)


# ---------------------------------------------------------------------------
# Semimeromorphic coefficients: sum_m P_m chi^(m) / z^g, where chi^(m) is
# prod_k chi^(m_k)(z_k w_k) (present only if chi=True) and g a multi-index.
# ---------------------------------------------------------------------------


class SM:
    __slots__ = ('t', 'g', 'chi')

    def __init__(self, t, g=ZERO_M, chi=False):
        self.t = {m: P for m, P in t.items() if P != 0}
        self.g = tuple(g)
        self.chi = chi


def zpow(e):
    return prod(Z[k] ** e[k] for k in range(NV))


def sm_lift(a, g):
    sh = tuple(g[k] - a.g[k] for k in range(NV))
    assert min(sh) >= 0
    f = zpow(sh)
    return {m: P * f for m, P in a.t.items()}


def sm_add(a, b):
    g = tuple(max(a.g[k], b.g[k]) for k in range(NV))
    t = sm_lift(a, g)
    for m, P in sm_lift(b, g).items():
        t[m] = t.get(m, 0) + P
    return SM(t, g, a.chi or b.chi)


def sm_mul(a, b):
    assert not (a.chi and b.chi), "product of two cutoff factors"
    g = tuple(a.g[k] + b.g[k] for k in range(NV))
    t = {}
    for m1, P1 in a.t.items():
        for m2, P2 in b.t.items():
            m = tuple(m1[k] + m2[k] for k in range(NV))
            t[m] = t.get(m, 0) + P1 * P2
    return SM(t, g, a.chi or b.chi)


def sm_scale(c, a):
    return SM({m: c * P for m, P in a.t.items()}, a.g, a.chi)


def bump(m, k):
    return tuple(m[i] + (1 if i == k else 0) for i in range(NV))


def sm_dw(a, k):
    t = {}
    for m, P in a.t.items():
        t[m] = t.get(m, 0) + P.derivative(W[k])
        if a.chi:
            mk = bump(m, k)
            t[mk] = t.get(mk, 0) + P * Z[k]
    return SM(t, a.g, a.chi)


def sm_dz(a, k):
    gk = a.g[k]
    t = {}
    for m, P in a.t.items():
        if gk == 0:
            t[m] = t.get(m, 0) + P.derivative(Z[k])
            if a.chi:
                mk = bump(m, k)
                t[mk] = t.get(mk, 0) + P * W[k]
        else:
            t[m] = t.get(m, 0) + Z[k] * P.derivative(Z[k]) - gk * P
            if a.chi:
                mk = bump(m, k)
                t[mk] = t.get(mk, 0) + Z[k] * W[k] * P
    g = a.g if gk == 0 else bump(a.g, k)
    return SM(t, g, a.chi)


def sm_iszero(a):
    return all(P == 0 for P in a.t.values())


# ---------------------------------------------------------------------------
# Forms: {basis: SM}, basis an increasing tuple; dz_k <-> 2k, dw_k <-> 2k+1.
# ---------------------------------------------------------------------------


def fclean(f):
    return {b: c for b, c in f.items() if not sm_iszero(c)}


def fadd(*fs):
    out = {}
    for f in fs:
        for b, c in f.items():
            out[b] = sm_add(out[b], c) if b in out else c
    return fclean(out)


def fscale(c, f):
    return fclean({b: sm_scale(c, v) for b, v in f.items()})


def wedge(f, g):
    out = {}
    for b1, c1 in f.items():
        for b2, c2 in g.items():
            s = perm_sign(b1 + b2)
            if s == 0:
                continue
            key = tuple(sorted(b1 + b2))
            term = sm_scale(s, sm_mul(c1, c2))
            out[key] = sm_add(out[key], term) if key in out else term
    return fclean(out)


def dform(f, n, part='d'):
    """d, dbar ('dbar') or partial ('del') of a form in n variables."""
    out = {}
    for b, c in f.items():
        for k in range(n):
            for idx, op in ((2 * k, sm_dz), (2 * k + 1, sm_dw)):
                if part == 'dbar' and idx % 2 == 0:
                    continue
                if part == 'del' and idx % 2 == 1:
                    continue
                if idx in b:
                    continue
                s = perm_sign((idx,) + b)
                key = tuple(sorted((idx,) + b))
                term = sm_scale(s, op(c, k))
                out[key] = sm_add(out[key], term) if key in out else term
    return fclean(out)


def degree(f):
    ds = {len(b) for b in f}
    assert len(ds) <= 1
    return ds.pop() if ds else None


def monomials(n, deg):
    """Exponent pairs (a, b) of z^a w^b in n variables, total degree <= deg."""
    out = []
    for tot in range(deg + 1):
        for e in itertools.product(range(tot + 1), repeat=2 * n):
            if sum(e) == tot:
                out.append((e[:n], e[n:]))
    return out


def generic_poly(n, deg, pool):
    P = R(0)
    for a, b in monomials(n, deg):
        P += pool.take() * prod(Z[k] ** a[k] * W[k] ** b[k]
                                for k in range(n))
    return P


def test_form(n, bases, deg):
    """Generic polynomial coefficients times the cutoffs."""
    return {b: SM({ZERO_M: generic_poly(n, deg, CPOOL)}, ZERO_M, True)
            for b in bases}


def semimero(n, bases, deg, g):
    """Generic polynomial coefficients over z^g, no cutoff."""
    return {b: SM({ZERO_M: generic_poly(n, deg, HPOOL)}, g, False)
            for b in bases}


def bases_of_degree(n, r):
    return [tuple(c) for c in itertools.combinations(range(2 * n), r)]


def bases_of_bidegree(n, a, b):
    return [bs for bs in bases_of_degree(n, a + b)
            if sum(1 for x in bs if x % 2 == 0) == a]


# ---------------------------------------------------------------------------
# Integrals over product chains and their limits.
# ---------------------------------------------------------------------------


def N(a, m):
    """int_0^oo u^a chi^(m)(u) du in terms of the moments M_a."""
    if m == 0:
        return MOM[a]
    if a == 0:
        return B(-1) if m == 1 else B(0)
    return -a * N(a - 1, m - 1)


def integrate_chain(f, chain):
    """lim of int_chain f as all radii -> 0; chain = [(kind, k, radius)]."""
    dims = sum(1 if kind == 'circ' else 2 for kind, _, _ in chain)
    if not f:
        return B(0)
    assert degree(f) == dims, "degree of the form vs dimension of the chain"
    total = B(0)
    for b, c in f.items():
        target, factors, ok = [], [], True
        for kind, k, rad in chain:
            here = [x for x in b if x // 2 == k]
            if kind == 'circ':
                if len(here) != 1:
                    ok = False
                    break
                target += here
            else:
                if len(here) != 2:
                    ok = False
                    break
                target += [2 * k, 2 * k + 1]
        if not ok:
            continue
        sign = perm_sign(target)
        const = KI(sign)
        for kind, k, rad in chain:
            if kind == 'circ':
                const *= II if (2 * k) in b else -II
            else:
                const *= -2 * II
        for m, P in c.t.items():
            for exps, coef in P.dict().items():
                val = coef * const
                for kind, k, rad in chain:
                    a = exps[k] - c.g[k]
                    bb = exps[NV + k]
                    if kind == 'circ':
                        if (2 * k) in b:
                            a += 1
                        else:
                            bb += 1
                        if a != bb or m[k] != 0:
                            val = 0
                            break
                        assert a >= 0, "divergent circle term"
                        val *= 2 * PI * rad ** (2 * a)
                    else:
                        if a != bb:
                            val = 0
                            break
                        assert a >= 0, "divergent exterior term"
                        piece = N(a, m[k])
                        if kind == 'out' and m[k] == 0:
                            piece -= rad ** (2 * a + 2) / (a + 1)
                        val *= PI * piece
                    if val == 0:
                        break
                total += val
    lim = total.subs({e: 0 for e in E})
    return lim


def chi_free_check(chain):
    for kind, k, rad in chain:
        assert kind in ('circ', 'out', 'C')


# ===========================================================================
# A. The introduction (p. 63) and the admissible paths of §11.1 (p. 65).
# ===========================================================================

CPOOL.reset()
g = generic_poly(2, 4, CPOOL)
psi = {(0, 2): SM({ZERO_M: g}, ZERO_M, True)}          # g dz1 ^ dz2
# f = (z1 z2, z2): 1/(f1 f2) = 1/(z1 z2^2); torus |z1| = |z2| = delta.
# Orientation d arg f1 ^ d arg f2 = (dth1 + dth2) ^ dth2 = dth1 ^ dth2.
jac = Matrix(ZZ, [[1, 1], [0, 1]]).det()
check(jac == 1, "A orientation of the torus from d arg f")
inv = {(): SM({ZERO_M: R(1)}, (1, 2, 0), False)}
torus = [('circ', 0, E[0]), ('circ', 1, E[1])]
val = jac * integrate_chain(wedge(inv, psi), torus)
dg_dz2 = g.derivative(Z[1]).subs({z: 0 for z in Z + W})
dg_dz1 = g.derivative(Z[0]).subs({z: 0 for z in Z + W})
check(val == (2 * PI * II) ** 2 * B(dg_dz2),
      "A p. 63: limit (2 pi i)^2 dpsi/dz2(0) (p63-example-derivative)")
refuted(val == (2 * PI * II) ** 2 * 2 * B(dg_dz1),
        "A p. 63: printed (2 pi i)^2 2 dpsi/dz1(0)")
# Along an admissible path |z1| = eps1/eps2, |z2| = eps2: the same torus
# with radii tending to zero (the radii are free symbols in the model).
check(val == (2 * PI * II) ** 2 * B(dg_dz2),
      "A admissible path: the same limit")
# The first tube {|z1 z2| = delta, |z2| = delta^2}: |z1| = 1/delta.
for dlt in (QQ(1) / 2, QQ(1) / 10, QQ(1) / 10 ** 6):
    check(dlt / dlt ** 2 > 1, "A |z1| = delta/delta^2 > 1: the tube "
          "T^(eps(delta)) misses the unit polydisk carrying psi")


def lex_sign(nu):
    """Sign of the limit of sum nu_j T_j with T_1 >> T_2 >> ... (log scale)."""
    for x in nu:
        if x != 0:
            return 1 if x > 0 else -1
    return 0


# prod eps_j^(nu_j) = exp(-sum nu_j T_j): -> 0 iff the first nonzero nu_j is
# positive, -> oo iff it is negative, = 1 iff nu = 0.  Model: T_j = X^(4-j)
# compared at X = 10^6 (gaps far beyond the range of nu), which agrees with
# the lexicographic order for |nu_j| <= 2.
for nu in itertools.product(range(-2, 3), repeat=3):
    Xs = 10 ** 6
    s = sum(nu[j] * Xs ** (3 - j) for j in range(3))
    sgn = (s > 0) - (s < 0)
    check(sgn == lex_sign(nu), "A §11.1 the first nonzero exponent decides")
    if all(x == 0 for x in nu):
        refuted(sgn != 0, "A §11.1 printed: 0 or oo also for nu = 0")
section("A")


# ===========================================================================
# B. §11.2 (4), §13.3 (1), (2) and the proof, §15.1.
# ===========================================================================


def current(chain, lam, psi):
    """R_I P_J [lam](psi) = lim int_chain lam ^ psi."""
    return integrate_chain(wedge(lam, psi), chain)


def d_current(chain, lam, psi, n, part='d'):
    """(d T)(psi) = (-1)^(r+1) T(d psi), T = R_I P_J [lam] (§3.3)."""
    r = degree(psi)
    return (-1) ** (r + 1) * current(chain, lam, dform(psi, n, part))


def run_model(name, n, p, chains_by_j, TI, fpow, lam_specs, psi_deg):
    """Check the Stokes step, (1), (2) and the defect for one model."""
    for j, Tj in chains_by_j.items():
        for q, lam_bases, ldeg, g in lam_specs:
            CPOOL.reset()
            HPOOL.reset()
            lam = semimero(n, lam_bases, ldeg, g)
            r = 2 * n - p - q
            psi = test_form(n, bases_of_degree(n, r), psi_deg)
            dlam = dform(lam, n)
            RI = current(TI, lam, psi)
            Rdl = current(Tj, dlam, psi)
            Rldpsi = current(Tj, lam, dform(psi, n))
            dR = d_current(Tj, lam, psi, n)
            tag = "%s j=%d q=%d g=%s" % (name, j, q, g[:n])
            check((-1) ** j * RI == Rdl + (-1) ** q * Rldpsi,
                  "B Stokes (-1)^j R_I = R'[d lam] + (-1)^q R'(lam ^ d psi) "
                  + tag)
            check((-1) ** q * Rldpsi == (-1) ** (p + 1) * dR,
                  "B corrected (-1)^(p+1) dR'[lam](psi) " + tag)
            refuted((-1) ** q * Rldpsi == (-1) ** p * dR,
                    "B printed (-1)^p dR'[lam](psi) " + tag)
            check((-1) ** (j + p + 1) * dR + (-1) ** j * Rdl == RI,
                  "B corrected formula (1) of §13.3 " + tag)
            refuted((-1) ** (j + p) * dR + (-1) ** j * Rdl == RI,
                    "B printed formula (1) of §13.3 " + tag)
    # lambda = 1/f: formula (2) and property (4).
    one_over_f = {(): SM({ZERO_M: R(1)}, fpow, False)}
    CPOOL.reset()
    psi = test_form(n, bases_of_degree(n, 2 * n - p), psi_deg)
    RI = current(TI, one_over_f, psi)
    for j, Tj in chains_by_j.items():
        tag = "%s j=%d" % (name, j)
        dbarR = d_current(Tj, one_over_f, psi, n, 'dbar')
        dR = d_current(Tj, one_over_f, psi, n, 'd')
        delR = d_current(Tj, one_over_f, psi, n, 'del')
        check((-1) ** (j + p + 1) * dbarR == RI,
              "B corrected (2): (-1)^(j+p+1) dbar R' = R_I " + tag)
        refuted((-1) ** (j + p) * dbarR == RI,
                "B printed (2): (-1)^(j+p) dbar R' = R_I " + tag)
        refuted((-1) ** (j + p) * dR == RI,
                "B printed (2): (-1)^(j+p) d R' = R_I " + tag)
        refuted((-1) ** (j + p + 1) * dR == RI,
                "B d R' = +-R_I with the other sign " + tag)
        check(dR == dbarR + delR, "B d = dbar + partial on currents " + tag)
        dl = dform(one_over_f, n)
        check(delR == (-1) ** p * current(Tj, dl, psi),
              "B defect partial R' = (-1)^p R'[d(1/f)] " + tag)
    # bidimension (n, n - p) of R_I
    for a in range(0, n + 1):
        bb = 2 * n - p - a
        if bb < 0 or bb > n:
            continue
        CPOOL.reset()
        psi_ab = test_form(n, bases_of_bidegree(n, a, bb), psi_deg)
        v = current(TI, one_over_f, psi_ab)
        if (a, bb) != (n, n - p):
            check(v == 0, "B bidimension: R_I = 0 on (%d, %d)-forms %s"
                  % (a, bb, name))
        else:
            check(v != 0, "B R_I != 0 on (n, n-p)-forms %s" % name)


g1 = (1,) + (0,) * (NV - 1)
g2 = (2,) + (0,) * (NV - 1)
# n = p = 1, f = z.
run_model("n=p=1", 1, 1, {1: [('out', 0, E[0])]}, [('circ', 0, E[0])], g1,
          [(0, [()], 2, g1), (0, [()], 2, g2), (1, [(0,), (1,)], 2, g1)], 3)
# n = 2, p = 1, f = z1.
run_model("n=2,p=1", 2, 1, {1: [('out', 0, E[0]), ('C', 1, None)]},
          [('circ', 0, E[0]), ('C', 1, None)], g1,
          [(0, [()], 2, g1), (0, [()], 1, g2), (1, [(0,), (1,), (2,), (3,)],
                                                1, g1)], 2)
# n = p = 2, f = (z1, z2); T_({2},{1}) = (theta2, r1, theta1),
# T_({1},{2}) = (theta1, r2, theta2), T_I = (theta1, theta2).
g11 = (1, 1) + (0,) * (NV - 2)
g21 = (2, 1) + (0,) * (NV - 2)
run_model("n=p=2", 2, 2,
          {1: [('circ', 1, E[1]), ('out', 0, E[0])],
           2: [('circ', 0, E[0]), ('out', 1, E[1])]},
          [('circ', 0, E[0]), ('circ', 1, E[1])], g11,
          [(0, [()], 2, g11), (0, [()], 1, g21),
           (1, [(0,), (1,), (2,), (3,)], 1, g11)], 2)

# Q1 counterexample: n = p = 1, f = z, psi = z^2 chi dzbar.
inv1 = {(): SM({ZERO_M: R(1)}, g1, False)}
psi = {(1,): SM({ZERO_M: Z[0] ** 2}, ZERO_M, True)}
TI1, TJ1 = [('circ', 0, E[0])], [('out', 0, E[0])]
check(current(TI1, inv1, psi) == 0, "B Q1: R_f(z^2 chi dzbar) = 0")
check(d_current(TJ1, inv1, psi, 1, 'dbar') == 0,
      "B Q1: dbar P_f(z^2 chi dzbar) = 0")
check(d_current(TJ1, inv1, psi, 1, 'd') == -2 * PI * II * MOM[0],
      "B Q1: d P_f(z^2 chi dzbar) = -2 pi i M_0 != 0")
# Cauchy-Pompeiu: dbar P_z(g dz) = -2 pi i g(0) = -R_z(g dz).
CPOOL.reset()
gg = generic_poly(1, 4, CPOOL)
psi = {(0,): SM({ZERO_M: gg}, ZERO_M, True)}
g0 = B(gg.subs({z: 0 for z in Z + W}))
check(current(TI1, inv1, psi) == 2 * PI * II * g0,
      "B R_z(g dz) = 2 pi i g(0)")
check(d_current(TJ1, inv1, psi, 1, 'dbar') == -2 * PI * II * g0,
      "B Cauchy-Pompeiu: dbar P_z(g dz) = -2 pi i g(0)")
# §15.1: formula (1) with j = p = n.
for nn in range(1, 6):
    check((-1) ** (nn + nn + 1) == -1,
          "B §15.1 j = p = n: coefficient of dR'P[omega](1) is -1")
    refuted((-1) ** (nn + nn) == -1,
            "B §15.1 printed coefficient +1 under the §3.3 convention")
section("B")


# ===========================================================================
# C. §12: linear algebra, polar forms, exponents, Taylor expansions.
# ===========================================================================

# Cofactor identity (5) of §12.4 and v^alpha = u: generic p x p matrices.
for p in range(1, 5):
    Rg = PolynomialRing(QQ, ['a%d%d' % (r, s) for r in range(p)
                             for s in range(p)])
    al = Matrix(Rg, p, p, Rg.gens())
    Dl = al.det()
    cof = al.adjugate().transpose()          # cof[j, k] = cofactor of a_jk
    for j in range(p):
        for k in range(p):
            lhs = sum(al[j, l] * cof[k, l] for l in range(p))
            check(lhs == (Dl if j == k else 0),
                  "C (5) §12.4 cofactor identity p=%d" % p)
    # exponent of u_l in prod_k v_k^(alpha_jk), v_k = prod_l u_l^(cof_lk/D)
    for j in range(p):
        for l in range(p):
            ex = sum(al[j, k] * cof[l, k] for k in range(p))
            check(ex == (Dl if j == l else 0),
                  "C §12.4 prod v_k^(alpha_jk) = u_j, p=%d" % p)

# Cramer's rule (3)-(4) of §12.2: rho_S = eps_I^(delta) / rho[S]^beta with
# delta = alpha_(I,S)^(-1) (rows nonzero),
# beta = alpha_(I,S)^(-1) alpha_(I,S').
for trial in range(100):
    s = random.randint(1, 3)
    n = s + random.randint(0, 2)
    while True:
        al = Matrix(ZZ, s, n, [random.randint(0, 3) for _ in range(s * n)])
        if al[:, :s].det() != 0:
            break
    A = al[:, :s]
    dl = A.inverse()
    beta = dl * al[:, s:]
    # log rho_S = dl * (log eps - alpha_(I,S') log rho[S])
    for i in range(s):
        check(any(x != 0 for x in dl.row(i)), "C §12.2 delta_i != 0")
    lg_eps = Matrix(QQ, s, 1, [random.randint(-5, 5) for _ in range(s)])
    lg_rest = Matrix(QQ, n - s, 1, [random.randint(-5, 5)
                                    for _ in range(n - s)])
    lg_S = dl * lg_eps - beta * lg_rest
    lg = lg_S.stack(lg_rest)
    check(al * lg == lg_eps, "C §12.2 the solution satisfies (2)")

# Lemma 1 of §12.2: alpha_r = sum q_j alpha_j, q = max q_j: alpha_rk <=
# q (alpha_(r+1),k + ... + alpha_pk).
for trial in range(200):
    p = random.randint(2, 4)
    n = random.randint(1, 4)
    rows = [[random.randint(0, 3) for _ in range(n)] for _ in range(p - 1)]
    qs = [QQ(random.randint(-3, 4)) / random.randint(1, 3)
          for _ in range(p - 1)]
    comb = [sum(qs[j] * rows[j][k] for j in range(p - 1)) for k in range(n)]
    if any(x < 0 or x not in ZZ for x in comb):
        continue
    q = max(qs)
    for k in range(n):
        check(comb[k] <= q * sum(rows[j][k] for j in range(p - 1)),
              "C Lemma 1 §12.2 alpha_rk <= q sum alpha_jk")
    if any(x != 0 for x in comb):
        check(q > 0, "C Lemma 1 §12.2 q > 0 when alpha_r != 0")

# Polar forms.  Generic exterior algebra over a fraction field.
PR = PolynomialRing(KI, ['r%d' % k for k in range(6)]
                    + ['t%d' % k for k in range(6)]
                    + ['D%d_%d' % (a, b) for a in range(6)
                       for b in range(6)])
PF = PR.fraction_field()
RHO = [PF('r%d' % k) for k in range(6)]
EXP = [PF('t%d' % k) for k in range(6)]        # e^(i theta_k)


def gwedge(f, g):
    out = {}
    for b1, c1 in f.items():
        for b2, c2 in g.items():
            s = perm_sign(b1 + b2)
            if s == 0:
                continue
            key = tuple(sorted(b1 + b2))
            out[key] = out.get(key, 0) + s * c1 * c2
    return {b: c for b, c in out.items() if c != 0}


def gwedge_all(fs):
    out = {(): PF(1)}
    for f in fs:
        out = gwedge(out, f)
    return out


def drho(k):
    return {(2 * k,): PF(1)}


def dth(k):
    return {(2 * k + 1,): PF(1)}


def dzp(k, drho_form=None):
    """nu^*(dz_k) = e^(i th) drho + i rho e^(i th) dth."""
    dr = drho(k) if drho_form is None else drho_form
    out = {b: EXP[k] * c for b, c in dr.items()}
    out[(2 * k + 1,)] = out.get((2 * k + 1,), 0) + II * RHO[k] * EXP[k]
    return out


def dzbp(k, drho_form=None):
    dr = drho(k) if drho_form is None else drho_form
    out = {b: c / EXP[k] for b, c in dr.items()}
    out[(2 * k + 1,)] = out.get((2 * k + 1,), 0) - II * RHO[k] / EXP[k]
    return out


check(gwedge(dzp(0), dzbp(0)) == {(0, 1): -2 * II * RHO[0]},
      "C (6) §12.4: dz ^ dzbar = -2i rho drho ^ dtheta")
check(gwedge(dzp(0), dzbp(0)) == gwedge({(1,): 2 * II * RHO[0]}, drho(0)),
      "C §12.4 Step 4: dz ^ dzbar = 2i rho dtheta ^ drho")
for m in range(1, 6):
    lhs = gwedge_all([dzp(k) for k in range(m)] + [dzbp(k) for k in range(m)])
    rhs = gwedge_all([gwedge({(2 * k + 1,): 2 * II * RHO[k]}, drho(k))
                      for k in range(m)])
    sgn = (-1) ** (m * (m - 1) // 2)
    check(lhs == {b: sgn * c for b, c in rhs.items()},
          "C §12.4 dz[S] ^ dzbar[S] = (-1)^(m(m-1)/2)"
          " prod(2i rho dth ^ drho),"
          " m=%d (ch3-p77-dz-dzbar-sign)" % m)
    if sgn == -1:
        refuted(lhs == rhs, "C §12.4 printed sign + for m=%d" % m)

# Phi of (11) §12.4: rho_j (j in S) functions of rho[S] with generic
# derivatives D_j_q; nu^*(dz_A ^ dzbar_(S\A) ^ dz[S] ^ dzbar[S]) =
# k rho_1...rho_n e^(i(theta_A - theta_(S\A))) dtheta ^ drho[S].
for n in range(1, 4):
    for s in range(0, min(n, 2) + 1):
        S = list(range(s))
        rest = list(range(s, n))
        dr = {}
        for j in S:
            dr[j] = {(2 * q,): PF('D%d_%d' % (j, q)) for q in rest}
        for A in Subsets(S):
            A = sorted(A)
            SA = [j for j in S if j not in A]
            fs = ([dzp(j, dr[j]) for j in A] + [dzbp(j, dr[j]) for j in SA]
                  + [dzp(q) for q in rest] + [dzbp(q) for q in rest])
            form = gwedge_all(fs)
            target = tuple(sorted([2 * k + 1 for k in range(n)]
                                  + [2 * q for q in rest]))
            check(list(form.keys()) == [target],
                  "C Phi §12.4 only dtheta ^ drho[S] survives n=%d A=%s"
                  % (n, A))
            coef = form[target]
            ph = prod([RHO[k] for k in range(n)]) * prod(
                [EXP[j] for j in A]) / prod([EXP[j] for j in SA])
            kk = coef / ph
            check(kk in KI and kk != 0,
                  "C Phi §12.4: k(A, S) nonzero constant n=%d s=%d A=%s"
                  % (n, s, A))

# Exponents b_j of Step 5 of §12.4 and of the lemma of §12.5.
for gj in range(0, 7):
    for sg in range(0, 7):
        for ta in range(0, 7):
            if sg + ta < gj - 1:
                for b in (-gj + 1 + sg - ta, -gj - 1 + sg - ta,
                          -gj + sg - ta):
                    check(b < 0, "C Step 5 §12.4 b_j < 0")
            if sg + ta < gj:
                for b in (-gj + sg - ta, -gj - 1 + sg - ta):
                    check(b < 0, "C lemma §12.5 b_k < 0")

# Lemma 2 of §12.4 needs e^(i b theta): int_0^(2 pi) e^(i b th) = 0, but
# int_0^(2 pi) e^(b th) != 0 for real b != 0 (p78-lemma2-phase).
th = var('th')
for b in (-3, -1, 1, 2):
    check(integrate((SI * b * th).exp(), th, 0, 2 * SPI).simplify_full()
          == 0, "C Lemma 2 §12.4 int e^(i b th) = 0")
    refuted(integrate((b * th).exp(), th, 0, 2 * SPI).simplify_full() == 0,
            "C Lemma 2 §12.4 printed e^(b th)")

# Special Taylor expansion of §12.3 for polynomials, n = 2, and the integral
# remainder of its proof.
TR = PolynomialRing(QQ, ['x0', 'x1', 'y0', 'y1', 't'])
X = [TR('x0'), TR('x1')]
Y = [TR('y0'), TR('y1')]
TT = TR('t')


def taylor_split(P, k, gk):
    """P = sum_(s+t<gk) x^s y^t g_st(x[k]) + remainder (both returned)."""
    low, high = TR(0), TR(0)
    for mon, cf in P.dict().items():
        term = cf * TR.monomial(*mon)
        if mon[k] + mon[2 + k] < gk:
            low += term
        else:
            high += term
    return low, high


for trial in range(30):
    P = TR(0)
    for mon in itertools.product(range(3), repeat=4):
        if sum(mon) <= 5 and random.random() < 0.5:
            P += random.randint(-4, 4) * TR.monomial(*mon, 0)
    for gam in itertools.product(range(3), repeat=2):
        rem = P
        lows = []
        for k in range(2):
            low, rem = taylor_split(rem, k, gam[k])
            lows.append(low)
            # g_st^k do not depend on x_k, y_k: low has degree < gamma_k in
            # (x_k, y_k) and each coefficient is free of them
            for mon in low.dict():
                check(mon[k] + mon[2 + k] < gam[k],
                      "C §12.3 terms z_k^s zbar_k^t g(z[k]), s+t < gamma_k")
        check(sum(lows) + rem == P, "C §12.3 psi = sum + Psi")
        for mon in rem.dict():
            check(all(mon[k] + mon[2 + k] >= gam[k] for k in range(2)),
                  "C §12.3 Psi in prod (z_k, zbar_k)^(gamma_k)")

# The remainder of Taylor's formula in z_1, zbar_1 (proof of the lemma):
# psi^1_st = gamma_1 (s! t!)^(-1) int_0^1 (1-t)^(gamma_1-1)
#            d^(s+t) psi / dz^s dzbar^t (t z_1, z[1]) dt.
for trial in range(10):
    P = TR(0)
    for mon in itertools.product(range(4), repeat=4):
        if sum(mon) <= 5 and random.random() < 0.4:
            P += random.randint(-4, 4) * TR.monomial(*mon, 0)
    for g1v in range(1, 4):
        low, high = taylor_split(P, 0, g1v)
        rec, rec_pr = TR(0), TR(0)
        for sg in range(g1v + 1):
            ta = g1v - sg
            der = P.derivative(X[0], sg) if sg else P
            der = der.derivative(Y[0], ta) if ta else der
            dert = der.subs({X[0]: TT * X[0], Y[0]: TT * Y[0]})
            integrand = (1 - TT) ** (g1v - 1) * dert
            F = integrand.integral(TT)
            val = F.subs({TT: 1}) - F.subs({TT: 0})
            rem_c = QQ(g1v) / (ZZ(sg).factorial() * ZZ(ta).factorial()) * val
            rem_p = QQ(g1v) * val
            rec += X[0] ** sg * Y[0] ** ta * rem_c
            rec_pr += X[0] ** sg * Y[0] ** ta * rem_p
        check(rec == high, "C §12.3 integral remainder with (s! t!)^(-1)"
              " (p73-taylor-remainder-factorials)")
        if g1v >= 2 and high != 0:
            refuted(rec_pr == high, "C §12.3 printed remainder without"
                    " (s! t!)^(-1), gamma_1=%d" % g1v)

# Lemma of §12.5 (ch3-p81-lemma-bound): for f = z1 z2, S = {1}, rho_1 =
# eps/rho_2 on W_delta = (eps, 1).  At rho_2 = 2 eps the point
# nu_delta(theta, rho[S]) has |z_1| = 1/2, |z_2| = 2 eps, inside the support
# of a test form equal to 1 near 0, for every eps: the bound
# |I'| <= rho_j (2 pi)^n sum M_(mu nu) does not tend to zero uniformly, so
# "<= sup |I'|" would not conclude.  Pointwise rho_1 -> 0 and rho_1 <= 1, so
# the integral of |I'| over the cube tends to zero by bounded convergence.
r2 = var('r2')
for epsv in (QQ(1) / 10, QQ(1) / 1000, QQ(1) / 10 ** 6):
    check((epsv / r2).subs(r2=2 * epsv) == QQ(1) / 2,
          "C §12.5 rho_1 = 1/2 at rho_2 = 2 eps for every eps")
    check((epsv / r2).subs(r2=epsv) == 1, "C §12.5 sup rho_1 = 1 on W_delta")
    check((epsv / r2).subs(r2=QQ(1) / 2) == 2 * epsv,
          "C §12.5 rho_1 -> 0 pointwise")
section("C")


# ===========================================================================
# D. §13.4: normal matrices.
# ===========================================================================


def square_normal(rows, cols):
    """The square matrix (rows x cols) is nonsingular and upper triangular
    after a permutation of the columns, i.e. some ordering of the columns
    makes it upper triangular with a nonzero diagonal (pure Python)."""
    k = len(rows)
    if len(cols) != k:
        return False
    for perm in itertools.permutations(cols):
        if all(rows[r][perm[r]] != 0 for r in range(k)) and all(
                rows[r][perm[c]] == 0 for r in range(k) for c in range(r)):
            return True
    return False


def rect_normal(al, A):
    """p x (p-1) matrix alpha_A: alpha_A[p] normal and last row zero."""
    p = len(al)
    return (square_normal(al[:p - 1], A)
            and all(al[p - 1][c] == 0 for c in A))


def I_k(al, M, k):
    p = len(al)
    return [j for j in M if al[k][j] > 0
            and all(al[l][j] == 0 for l in range(k + 1, p))]


# The pure-Python test agrees with "det != 0 and triangular after a column
# permutation" (Sage determinants), all square 0/1/2-matrices of size <= 3.
for k in range(1, 4):
    for entries in itertools.product(range(3), repeat=k * k):
        rows = [list(entries[r * k:(r + 1) * k]) for r in range(k)]
        Mt = Matrix(ZZ, rows)
        tri = any(all(Mt[r, perm[c]] == 0 for r in range(k)
                      for c in range(r))
                  for perm in itertools.permutations(range(k)))
        assert square_normal(rows, list(range(k))) == (Mt.det() != 0
                                                        and tri)
    check(True, "D square normality test, size %d" % k)

for p, nmax in ((2, 4), (3, 3)):
    for n in range(p, nmax + 1):
        cases = 0
        for entries in itertools.product(range(3), repeat=p * n):
            al = [list(entries[r * n:(r + 1) * n]) for r in range(p)]
            for Msize in range(n + 1):
                for M in itertools.combinations(range(n), Msize):
                    subs1 = list(itertools.combinations(M, p - 1))
                    # (9)/(a) of the lemma: x in S~(f) iff some normal
                    # alpha_A, A subset M, |A| = p - 1
                    tilde = any(rect_normal(al, list(A)) for A in subs1)
                    # the proof: iff all I_k, k <= p - 1, are nonempty
                    crit = all(I_k(al, M, k) for k in range(p - 1))
                    assert tilde == crit, ("lemma §13.4", al, M)
                    # (10): x in S(f) iff some square normal alpha_A,
                    # |A| = p (ch3-p86-normal-square)
                    full = any(square_normal(al, list(A)) for A in
                               itertools.combinations(M, p))
                    vfp = any(al[p - 1][j] > 0 for j in M)
                    # property (b): S(f) = S~(f) cap V(f_p)
                    assert full == (tilde and vfp), ("(b)", al, M)
                    # (8): x in S(f') iff some normal alpha_A[p], |A| = p-1
                    sprime = any(square_normal(al[:p - 1], list(A))
                                 for A in subs1)
                    # property (a): S~(f) consists of the planes P_A of
                    # S(f') not contained in V(f_p) (alpha_(p,A) = 0)
                    comp = any(square_normal(al[:p - 1], list(A))
                               and all(al[p - 1][j] == 0 for j in A)
                               for A in subs1)
                    assert tilde == comp, ("(a)", al, M)
                    assert (not tilde) or sprime
                    cases += 1
        check(cases == 3 ** (p * n) * 2 ** n,
              "D §13.4 lemma, (8)-(10), (a), (b): p=%d n=%d, %d cases"
              % (p, n, cases))
for p in range(2, 5):
    al = Matrix(ZZ, p, 5, lambda r, c: r + c)
    for size in range(0, p + 1):
        for A in itertools.combinations(range(5), size):
            sub = al.matrix_from_columns(list(A))
            check(sub.is_square() == (size == p),
                  "D alpha_A is p x |A|: square iff |A| = p")
            if size == p - 1:
                refuted(sub.is_square(),
                        "D printed: square alpha_A with |A| = p - 1")

# Examples.  alpha rows of (z1 z2, z2), (z2, z1 z2), (z1, z1 z2).
ex = {'(z1 z2, z2)': [[1, 1], [0, 1]],
      '(z2, z1 z2)': [[0, 1], [1, 1]],
      '(z1, z1 z2)': [[1, 0], [1, 1]]}
S_full = {k: [A for A in itertools.combinations(range(2), 2)
              if square_normal(v, list(A))]
          for k, v in ex.items()}
S_tilde = {k: [A for A in itertools.combinations(range(2), 1)
               if rect_normal(v, list(A))] for k, v in ex.items()}
check(S_full['(z1 z2, z2)'] == [(0, 1)] and S_tilde['(z1 z2, z2)'] == [(0,)],
      "D (z1 z2, z2): S = {0}, S~ = {z1 = 0}")
check(S_full['(z2, z1 z2)'] == [] and S_full['(z1, z1 z2)'] == [],
      "D (z2, z1 z2), (z1, z1 z2): S = empty (tubes leave every compact)")
check(S_tilde['(z1, z1 z2)'] == [], "D (z1, z1 z2): S~ = empty")

# (5)-(6) of the proof of the lemma: upper triangular alpha_A[p] with
# positive diagonal; the solution exponents Delta_(ki) vanish for k < i and
# Delta_ii > 0, so the first nonzero exponent of eps is positive.
for trial in range(200):
    q = random.randint(1, 5)
    U = Matrix(ZZ, q, q, lambda r, c: random.randint(1, 3) if r == c else
               (random.randint(0, 3) if c > r else 0))
    Dl = U.det()
    cof = U.adjugate().transpose()
    check(Dl > 0, "D Delta > 0")
    for i in range(q):
        check(cof[i, i] > 0, "D Delta_ii > 0")
        for k in range(i):
            check(cof[k, i] == 0, "D Delta_ki = 0 for k < i")
    # z_i^Delta = prod_(k >= i) w_k^(Delta_ki): exponents of log z from
    # U log z = log w.
    check(Dl * U.inverse() == cof.transpose(),
          "D (5): inverse = cofactors / Delta")
section("D")


# ===========================================================================
# E. §14.
# ===========================================================================

# §14.1: the complete intersection is needed.  f = (z1, z1 z2): on
# {|z1| = eps1} the condition |z1 z2| > eps2 means |z2| > eps2/eps1 > 1 for
# admissible paths, outside the polydisk carrying psi, so
# R_(f1) P_(f2)[f2](psi) = 0, while R_(f1)(psi) != 0.
CPOOL.reset()
psi = test_form(2, [(0, 2, 3)], 2)
inv1 = {(): SM({ZERO_M: R(1)}, g1, False)}
v = current([('circ', 0, E[0]), ('C', 1, None)], inv1, psi)
check(v != 0, "E §14.1 R_(z1)(psi) != 0 for f = (z1, z1 z2)")
check(QQ(1) / QQ(10) ** 3 / (QQ(1) / QQ(10) ** 9) > 1,
      "E eps2/eps1 > 1 on an admissible path (eps1 = eps2^3 here)")

# §14.2: residue forms.  Generic first jets a_jk of f_j: df_j = sum a_jk dz_k.
for n in range(2, 5):
    for p in range(1, n):
        JR = PolynomialRing(KI, ['a%d_%d' % (j, k) for j in range(p)
                                 for k in range(n)] + ['hh'])
        JF = JR.fraction_field()
        aa = [[JF('a%d_%d' % (j, k)) for k in range(n)] for j in range(p)]
        hh = JF('hh')
        # psi = hh dz_1 ^ ... ^ dz_n ^ dzbar_K; dzbar_K symbolic: indices
        # n .. 2n-1 stand for dzbar; one K of size n - p.
        Kset = tuple(range(n, n + n - p))
        psi_g = {tuple(range(n)) + Kset: hh}
        df = [{(k,): aa[j][k] for k in range(n)} for j in range(p)]
        dfall = {(): JF(1)}
        for j in range(p):
            dfall = gwedge(dfall, df[j])
        for Iset in itertools.combinations(range(n), p):
            rest = [k for k in range(n) if k not in Iset]
            epsI = perm_sign(list(Iset) + rest)
            JI = Matrix(JF, p, p, [aa[j][k] for j in range(p)
                                   for k in Iset]).det()
            if JI == 0:
                continue
            eta = {tuple(rest) + Kset: epsI * hh / JI}
            check(gwedge(dfall, eta) == psi_g,
                  "E §14.2 df ^ (eps(I)/J_I)(psi/dz_I) = psi n=%d p=%d I=%s"
                  % (n, p, Iset))
            if p == 1:
                check(epsI == (-1) ** Iset[0],
                      "E (2) §14.2: eps({j}) = (-1)^(j-1)")

# The Leray formula with the factor (2 pi i)^p and eps(I), coordinate cases.
CPOOL.reset()
for k in range(2):
    # n = 2, f = z_k: psi of bidegree (2, 1).
    for l in range(2):
        CPOOL.reset()
        psi = test_form(2, [tuple(sorted((0, 2, 2 * l + 1)))], 2)
        gk = tuple(1 if i == k else 0 for i in range(NV))
        inv = {(): SM({ZERO_M: R(1)}, gk, False)}
        other = 1 - k
        lhs = current([('circ', k, E[0]), ('C', other, None)], inv, psi)
        # The residue form omega = psi/df is characterized by
        # df ^ omega = psi (checked above for the formula (2)); here
        # df = dz_k and omega = sgn . (psi without dz_k).
        (b, c), = psi.items()
        rest = tuple(x for x in b if x != 2 * k)
        sgn = perm_sign([2 * k] + list(rest))       # psi = sgn dz_k ^ rest
        restr = SM({m: P.subs({Z[k]: 0, W[k]: 0}) for m, P in c.t.items()
                    if m[k] == 0}, c.g, True)
        rhs = 2 * PI * II * sgn * integrate_chain(
            {rest: restr}, [('C', other, None)])
        check(lhs == rhs,
              "E (1) §14.2 Leray formula f = z_%d, l=%d" % (k + 1, l + 1))
        if l == other:
            check(lhs != 0, "E (1) §14.2 nonzero case")
            refuted(lhs == -rhs, "E (1) §14.2 sign of the Leray formula")
for order in ((0, 1), (1, 0)):
    # n = 3, f = (z_(order0), z_(order1)): tube (theta_f1, theta_f2, z3).
    for l in range(3):
        CPOOL.reset()
        psi = test_form(3, [tuple(sorted((0, 2, 4, 2 * l + 1)))], 2)
        gf = (1, 1, 0)
        inv = {(): SM({ZERO_M: R(1)}, gf, False)}
        lhs = current([('circ', order[0], E[0]), ('circ', order[1], E[1]),
                       ('C', 2, None)], inv, psi)
        # I = {1, 2}: J_I = det d(f1, f2)/d(z1, z2) = +-1, eps(I) = +1.
        JI = Matrix(ZZ, [[1 if order[j] == k else 0 for k in range(2)]
                         for j in range(2)]).det()
        (b, c), = psi.items()
        rest = tuple(x for x in b if x not in (0, 2))
        # psi = sgn dz_1 ^ dz_2 ^ rest; eps(I) J_I^(-1) (psi/dz_I) with
        # psi/dz_I the form psi with dz_1, dz_2 deleted from dz_1 ^ dz_2 ^ dz_3
        # (eps(I) = +1 for I = {1, 2}).
        sgn = perm_sign([0, 2] + list(rest))
        restr = SM({m: P.subs({Z[0]: 0, W[0]: 0, Z[1]: 0, W[1]: 0})
                    for m, P in c.t.items() if m[0] == 0 and m[1] == 0},
                   c.g, True)
        rhs = (2 * PI * II) ** 2 * (1 / JI) * sgn * integrate_chain(
            {rest: restr}, [('C', 2, None)])
        check(lhs == rhs,
              "E Theorem §14.2: R_f = (2 pi i)^2 eps(I) P(psi/dz_I / J_I),"
              " f order %s, l=%d" % (order, l + 1))
        if l == 2:
            check(lhs != 0, "E Theorem §14.2 nonzero case")
            refuted(lhs == -rhs, "E §14.2 sign of J_I, order %s" % (order,))

# §14.3: R_f[h] = 0 iff h in (f), f = z1^2 in C^2,
# h = sum_(a<=3) (h_a + h_(4+a) z2) z1^a.
CPOOL.reset()
HPOOL.reset()
hpoly = sum(HS[a] * Z[0] ** a + HS[4 + a] * Z[0] ** a * Z[1]
            for a in range(4))
psi = test_form(2, [(0, 2, 3)], 3)
lamh = {(): SM({ZERO_M: hpoly}, g2, False)}
v = current([('circ', 0, E[0]), ('C', 1, None)], lamh, psi)
# v is linear in the c's; it vanishes for all psi iff its coefficients do.
cvars = [c for c in CS if v.degree(c) > 0]
coeffs = [v.coefficient({c: 1}) for c in cvars]
for a in range(4):
    for t in (0, 4):
        h = HS[a + t]
        inside = (a >= 2)
        if inside:
            check(all(cf.degree(h) <= 0 for cf in coeffs),
                  "E §14.3 z1^%d terms (in (z1^2)) do not contribute" % a)
        else:
            check(any(cf.degree(h) > 0 for cf in coeffs),
                  "E §14.3 z1^%d terms (not in (z1^2)) detected" % a)
section("E")


# ===========================================================================
# F. Appendix.
# ===========================================================================

ts = [var('t%d' % k) for k in range(6)]
for m in range(1, 7):
    expr = SR(1)
    upper = 1 - sum(ts[:m - 1])
    # iterated integral over t_(m-1), ..., t_0
    for k in reversed(range(m)):
        expr = integrate(expr, ts[k], 0, 1 - sum(ts[:k]))
    vol = expr.simplify_full()
    check(vol == QQ(1) / ZZ(m).factorial(),
          "F volume of Delta_%d = 1/%d!" % (m, m))
    cst = 7
    check(ZZ(m).factorial() * cst * vol == cst,
          "F average with (p+1)! (pc-p103-average-factor), m=%d" % m)
    if m >= 2:
        refuted(cst * vol / ZZ(m).factorial() == cst,
                "F printed 1/(p+1)! average, m=%d" % m)

# lim int_(|z| = delta) g dz/z = lim int dbar chi(|z|/delta)/z ^ g dz for
# f = z: in polar coordinates the right side is
# 2 pi i sum_b c_bb delta^(2b) int chi'(s) s^(2b) ds -> 2 pi i c_00 int chi'.
CPOOL.reset()
gg = generic_poly(1, 4, CPOOL)
psi = {(0,): SM({ZERO_M: gg}, ZERO_M, True)}
lhs = current([('circ', 0, E[0])], {(): SM({ZERO_M: R(1)}, g1, False)}, psi)
c00 = B(gg.subs({z: 0 for z in Z + W}))
check(lhs == 2 * PI * II * c00, "F appendix: tube integral 2 pi i g(0)")
# int chi'(s) ds over [1/2, 1] = chi(1) - chi(1/2) = 1: the delta^0 term.
check(2 * PI * II * c00 * (1 - 0) == lhs,
      "F appendix: lim int dbar chi(|z|/delta)/z ^ g dz = 2 pi i g(0)")

# Remark: f = (z1, z1 z2).  Parabolic path (delta^t1, delta^t2), t2 > t1:
# |z1| = delta^t1, |z2| = delta^(t2 - t1), a shrinking torus oriented by
# d arg f1 ^ d arg f2 = dth1 ^ (dth1 + dth2) = dth1 ^ dth2.
check(Matrix(ZZ, [[1, 0], [1, 1]]).det() == 1,
      "F orientation d arg f1 ^ d arg f2 for (z1, z1 z2)")
CPOOL.reset()
g = generic_poly(2, 3, CPOOL)
psi = {(0, 2): SM({ZERO_M: g}, ZERO_M, True)}
torus = [('circ', 0, E[0]), ('circ', 1, E[1])]
inv = {(): SM({ZERO_M: R(1)}, (2, 1, 0), False)}     # 1/(z1 . z1 z2)
v = current(torus, inv, psi)
check(v == (2 * PI * II) ** 2 * B(g.derivative(Z[0]).subs(
    {z: 0 for z in Z + W})), "F R(g dz1 ^ dz2) = (2 pi i)^2 dg/dz1(0)")
lam_z2 = {(): SM({ZERO_M: Z[1]}, (2, 1, 0), False)}
check(current(torus, lam_z2, psi) == 0, "F R[z2] = 0 along parabolic paths")
Pz = PolynomialRing(QQ, ['u1', 'u2'])
u1, u2 = Pz.gens()
check(u2 not in Pz.ideal([u1, u1 * u2]), "F z2 not in (z1, z1 z2)")
check(1 not in Pz.ideal([u1, u1 * u2]), "F 1 not in (z1, z1 z2)")
section("F")

print("ok ch3: %d checks" % COUNT[0])
