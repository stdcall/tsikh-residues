"""Exact checks of the Introduction and Chapter I of Tsikh, *Multidimensional
Residues and Their Applications* (AMS, 1992), printed pp. vii-x and 1-13.

Run with `sage -python checks/sage/ch1.py` (last run with SageMath 10.9).
Exact arithmetic only: Q, Q(i), polynomial and Laurent polynomial rings,
Groebner and standard bases (Singular, global and local orderings).

Integrals of differential forms over chains are computed exactly for the
mapping f = z: a chain is a product of circles |z_k| = e_k (parameter
theta_k) and discs |z_k| < e_k (parameters r_k, theta_k), oriented by an
order of its parameters (§1.3); z_k = r_k c_k with c_k = exp(i theta_k),
zbar_k = r_k / c_k, forms are exterior polynomials in dz_k, dzbar_k with
Laurent polynomial coefficients, the integral over theta_k picks the term
free of c_k, and r_k^a integrates to e_k^(a+1)/(a+1).  The boundary of a
chain is taken with the outward normal first (§1.3).

What is checked (expected values are the book's, written as literals, with
the printed page and the label of our text):
S1 (§1.4, p. 3, ss:intersection-index): ind(S^(n-1), l) = (-1)^(n-1) for
  the sphere oriented as the boundary of the ball and the outgoing ray,
  n = 1..6 (frames at the point e_1).
S2 (§2.4, p. 6, ss:semianalytic-orientation, correction
  math-p6-tube-boundary-sign): for I = {1..s}, J = {s+1..n}, f = z,
  n <= 3, every s and j in J: by Stokes' formula the boundary piece
  |z_j| = e_j of T_(I,J) (oriented by theta_1..theta_s, r_(s+1),
  theta_(s+1), ..., r_n, theta_n, the intervals (0, e_j)) is (-1)^s times
  the chain oriented by theta_1, ..., theta_s, theta_j, r_(s+1), ..., [j],
  ..., r_n, theta_n; the other pieces do not see the test form.  The
  printed sign (-1)^j is refuted (for n = 1 it gives
  boundary{|z| < e} = -{|z| = e}); the printed list of parameters of the
  boundary pieces (the pair theta_j, r_j omitted) is one parameter short.
S3 (§4.4, pp. 10-11, ss:ideals, th:lasker-noether, prop:primary-order):
  for f = (z1^2 - z2^3, z2^2 - z2) with zeros (0,0), (1,1), (-1,1):
  the primary components, the order rho = 2 of the component I^0 at the
  origin and of I_0(f) in O_0 (local standard bases), I^0 = <I, m^rho>,
  I_0(f) = I_0(P) for the generators P of I^0, and the Lasker-Noether
  theorem (membership in I(f) iff membership in all I_a(f)) for 8
  polynomials h.

Not established: anything about general chains or analytic sets (the
integrals are for f = z only); the homological statements of §§1-2
(Mayer-Vietoris, Poincare duality, semianalytic chains), the facts on
analytic sets and resolution of singularities of §4 are quoted from the
literature and not checked; the residue formula of the Introduction
(p. ix) is a theorem of Chapter III and is not checked here.
"""
from sage.all import (QQ, ZZ, QuadraticField, LaurentPolynomialRing,
                      PolynomialRing, matrix, identity_matrix)

COUNT = [0]


def check(cond, label):
    assert cond, "FAILED: " + label
    COUNT[0] += 1


def refuted(cond, label):
    """The printed reading: the condition must be false."""
    assert not cond, "printed reading unexpectedly holds: " + label
    COUNT[0] += 1


K = QuadraticField(-1, 'i')
II = K.gen()


# ---------------------------------------------------------------------------
# Exterior algebra and exact integrals over product chains (f = z).
# ---------------------------------------------------------------------------
def perm_sign(seq):
    seq = list(seq)
    s = 1
    for a in range(len(seq)):
        for b in range(a + 1, len(seq)):
            if seq[a] > seq[b]:
                s = -s
    return s


def wedge(A, B):
    out = {}
    for ka, ca in A.items():
        for kb, cb in B.items():
            if set(ka) & set(kb):
                continue
            key = ka + kb
            sk = tuple(sorted(key))
            out[sk] = out.get(sk, 0) + perm_sign(key) * ca * cb
    return {k: v for k, v in out.items() if v != 0}


def wedge_all(lst):
    out = {(): 1}
    for f in lst:
        out = wedge(out, f)
    return out


class ZSpace:
    """C^n with z_k and w_k = zbar_k; dz_k -> 2k, dzbar_k -> 2k + 1."""

    def __init__(self, n):
        self.n = n
        names = (['z%d' % (k + 1) for k in range(n)]
                 + ['w%d' % (k + 1) for k in range(n)])
        self.L = LaurentPolynomialRing(K, names)
        self.z = self.L.gens()[:n]
        self.w = self.L.gens()[n:]

    def dz(self, k):
        return {(2 * k,): self.L(1)}

    def dw(self, k):
        return {(2 * k + 1,): self.L(1)}

    def fn(self, c):
        return {(): self.L(c)}

    def d(self, F):
        out = {}
        for key, c in F.items():
            for k in range(self.n):
                for idx, var in ((2 * k, self.z[k]), (2 * k + 1, self.w[k])):
                    dc = c.derivative(var)
                    if dc == 0 or idx in key:
                        continue
                    nk = (idx,) + key
                    sk = tuple(sorted(nk))
                    out[sk] = out.get(sk, 0) + perm_sign(nk) * dc
        return {k: v for k, v in out.items() if v != 0}


def integrate(Z, F, kinds, order):
    """Integral of the form F over the product chain: kinds[k] is 'circle'
    (|z_k| = e_k) or 'disk' (|z_k| < e_k); order lists the parameters
    'r1', 't1', ... in the order fixing the orientation.  The value is a
    polynomial in e_1..e_n and pi_ (= pi) over Q(i)."""
    n = Z.n
    names = (['r%d' % (k + 1) for k in range(n)]
             + ['e%d' % (k + 1) for k in range(n)]
             + ['c%d' % (k + 1) for k in range(n)])
    P = LaurentPolynomialRing(K, names)
    r, e, c = P.gens()[:n], P.gens()[n:2 * n], P.gens()[2 * n:]
    for k in range(n):
        assert ('r%d' % (k + 1) in order) == (kinds[k] == 'disk')
        assert 't%d' % (k + 1) in order
    rad = [e[k] if kinds[k] == 'circle' else r[k] for k in range(n)]
    phi = Z.L.hom([rad[k] * c[k] for k in range(n)]
                  + [rad[k] * c[k] ** (-1) for k in range(n)], P)

    def pull_d(k, conj):
        cc = c[k] ** (-1) if conj else c[k]
        out = {(2 * k + 1,): (-1 if conj else 1) * II * rad[k] * cc}
        if kinds[k] == 'disk':
            out[(2 * k,)] = cc
        return out
    total = {}
    for key, coef in F.items():
        form = wedge_all([{(): phi(coef)}]
                         + [pull_d(idx // 2, idx % 2 == 1) for idx in key])
        for kk, v in form.items():
            total[kk] = total.get(kk, 0) + v
    pos = {}
    for k in range(n):
        pos['r%d' % (k + 1)] = 2 * k
        pos['t%d' % (k + 1)] = 2 * k + 1
    idx = [pos[p] for p in order]
    coef = perm_sign(idx) * total.get(tuple(sorted(idx)), P(0))
    PI = PolynomialRing(K, ['e%d' % (k + 1) for k in range(n)] + ['pi_'])
    E, pi_ = PI.gens()[:n], PI.gens()[n]
    res = PI(0)
    for mc, ex in zip(coef.coefficients(), coef.exponents()):
        ex = list(ex)
        if any(ex[2 * n + k] != 0 for k in range(n)):
            continue
        term = PI(mc)
        for k in range(n):
            term *= 2 * pi_
            if kinds[k] == 'disk':
                assert ex[k] >= 0 and ex[n + k] >= 0
                term *= E[k] ** (ex[k] + 1 + ex[n + k]) / (ex[k] + 1)
            else:
                assert ex[k] == 0 and ex[n + k] >= 0
                term *= E[k] ** ex[n + k]
        res += term
    return res


# init: the disc and its boundary circle, n = 1 (Stokes' formula for
# zbar dz: 2 pi i e^2 on both sides), and the circle integral of dz/z.
Z1 = ZSpace(1)
om = wedge(Z1.fn(Z1.w[0]), Z1.dz(0))
v_disk = integrate(Z1, Z1.d(om), ['disk'], ['r1', 't1'])
v_circ = integrate(Z1, om, ['circle'], ['t1'])
check(v_disk == v_circ and v_circ != 0, "init: Stokes, disc, n = 1")
check(integrate(Z1, wedge(Z1.fn(Z1.z[0] ** (-1)), Z1.dz(0)), ['circle'],
                ['t1']) == 2 * II * v_circ.parent().gens()[1],
      "init: int dz/z = 2 pi i")

# ---------------------------------------------------------------------------
# S1. §1.4 (p. 3): ind(S^(n-1), l) = (-1)^(n-1).  At the point e_1 the
# outward normal is e_1; by §1.3 the boundary orientation is the frame v
# with det(e_1, v) = 1, here v = (e_2, ..., e_n); the outgoing ray has
# tangent e_1 and the index is sgn det(v, e_1).
# ---------------------------------------------------------------------------
for n in range(1, 7):
    E = identity_matrix(QQ, n)
    frame = [E.column(k) for k in range(1, n)]
    check(matrix(QQ, [E.column(0)] + frame).transpose().det() == 1,
          "p. 3: boundary frame of the ball, n = %d" % n)
    ind = matrix(QQ, frame + [E.column(0)]).transpose().det().sign()
    check(ind == (-1) ** (n - 1), "p. 3: ind(S^(n-1), l), n = %d" % n)


# ---------------------------------------------------------------------------
# S2. §2.4 (p. 6): the boundary of the tube T_(I,J), f = z.
# ---------------------------------------------------------------------------
def tube_order(n, circles):
    out = []
    for k in range(1, n + 1):
        out += ['t%d' % k] if k in circles else ['r%d' % k, 't%d' % k]
    return out


for n in range(1, 4):
    Z = ZSpace(n)
    for s in range(0, n):
        I = list(range(1, s + 1))
        J = list(range(s + 1, n + 1))
        kinds_T = ['circle' if k <= s else 'disk' for k in range(1, n + 1)]
        for j in J:
            # test form: dz_i/z_i (i in I), zbar_j dz_j, dzbar_k dz_k (k in J,
            # k != j), in the order of the indices; on the pieces |z_k| = e_k,
            # k != j, it vanishes.
            parts = []
            for k in range(1, n + 1):
                if k in I:
                    parts.append(wedge(Z.fn(Z.z[k - 1] ** (-1)), Z.dz(k - 1)))
                elif k == j:
                    parts.append(wedge(Z.fn(Z.w[k - 1]), Z.dz(k - 1)))
                else:
                    parts.append(wedge(Z.dw(k - 1), Z.dz(k - 1)))
            om = wedge_all(parts)
            lhs = integrate(Z, Z.d(om), kinds_T, tube_order(n, I))
            pieces = {}
            for l in J:
                kinds_l = ['circle' if (k in I or k == l) else 'disk'
                           for k in range(1, n + 1)]
                pieces[l] = integrate(Z, om, kinds_l, tube_order(n, I + [l]))
            check(pieces[j] != 0 and all(pieces[l] == 0 for l in J if l != j),
                  "p. 6: test form sees only the piece j, n=%d s=%d j=%d"
                  % (n, s, j))
            corr_order = (['t%d' % k for k in I] + ['t%d' % j]
                          + sum([['r%d' % k, 't%d' % k] for k in J if k != j],
                                []))
            kinds_j = ['circle' if (k in I or k == j) else 'disk'
                       for k in range(1, n + 1)]
            corr = integrate(Z, om, kinds_j, corr_order)
            check(lhs == (-1) ** s * corr,
                  "p. 6: corrected boundary (-1)^s, n=%d s=%d j=%d"
                  % (n, s, j))
            if (j - s) % 2 == 1:
                refuted(lhs == (-1) ** j * corr,
                        "p. 6: printed (-1)^j, n=%d s=%d j=%d" % (n, s, j))
            # the printed list of parameters, the pair theta_j, r_j omitted
            printed_list = (['t%d' % k for k in I]
                            + sum([['r%d' % k, 't%d' % k] for k in J
                                   if k != j], []))
            refuted(len(printed_list) == len(corr_order),
                    "p. 6: printed parameters of the piece, n=%d s=%d j=%d"
                    % (n, s, j))

# ---------------------------------------------------------------------------
# S3. §4.4 (pp. 10-11): primary components, orders, Lasker-Noether.
# ---------------------------------------------------------------------------
G = PolynomialRing(QQ, 'z1,z2')
x1, x2 = G.gens()
F = [x1 ** 2 - x2 ** 3, x2 ** 2 - x2]
Ig = G.ideal(F)
zeros = [(0, 0), (1, 1), (-1, 1)]
check(Ig.dimension() == 0 and len(Ig.variety()) == 3
      and set(tuple(v[t] for t in (x1, x2)) for v in Ig.variety())
      == set(zeros), "p. 10: the zeros of f")
comps = Ig.complete_primary_decomposition()
check(len(comps) == 3, "p. 10: three primary components")
m0 = G.ideal([x1, x2])
I0 = [Q for Q, Pr in comps if Pr == m0][0]


def order_of(ideal_contains, m_gens, maxrho=8):
    for rho in range(1, maxrho):
        mono = [x1 ** a * x2 ** (rho - a) for a in range(rho + 1)]
        if all(ideal_contains(p) for p in mono):
            return rho
    return None


rho = order_of(lambda p: p in I0, None)
check(rho == 2, "p. 10: order of the component I^0 at the origin")
check(I0 == Ig + m0 ** rho, "p. 11: I^0 = <I, m^rho>")
check(Ig + m0 ** (rho - 1) != I0, "p. 11: rho is the smallest such order")
L = PolynomialRing(QQ, 'y1,y2', order='negdegrevlex')
y1, y2 = L.gens()


def local_ideal(gens, a):
    """The ideal I_a in O_a, in coordinates y = z - a, local ordering."""
    sub = {x1: y1 + a[0], x2: y2 + a[1]}
    return L.ideal([L(g.subs(sub)) for g in gens])


Iloc0 = local_ideal(F, (0, 0))
rho_loc = order_of(lambda p: L(p.subs({x1: y1, x2: y2})) in Iloc0, None)
check(rho_loc == rho, "p. 11: the proposition, order of I_0(f) in O_0")
Ploc = local_ideal(I0.gens(), (0, 0))
check(all(g in Ploc for g in Iloc0.gens())
      and all(g in Iloc0 for g in Ploc.gens()),
      "p. 11: I_0(f) = I_0(P)")
# Lasker-Noether: h in I(f) iff h in I_a(f) for every zero a.
tests = [x1 * F[0] + (x1 + 3) * F[1], x2, x2 * (x1 ** 2 - 1), x1 ** 2 - x2,
         x1 * x2 - x1, x1, x2 ** 2 * (x1 ** 2 - 1) + F[0], G(1)]
for h in tests:
    glob = h in Ig
    loc = all(L(h.subs({x1: y1 + a[0], x2: y2 + a[1]})) in local_ideal(F, a)
              for a in zeros)
    check(glob == loc, "p. 11: Lasker-Noether for h = %s" % h)
# x1 x2 - x1 = x1 (x2 - 1) vanishes at the three zeros but is not in
# I_0(f) = (z1^2, z2): vanishing at a multiple zero is not enough.
check([h in Ig for h in tests] == [True, False, True, True, False, False,
                                   True, False],
      "p. 11: Lasker-Noether, the expected memberships")

print("ok ch1: %d checks" % COUNT[0])
