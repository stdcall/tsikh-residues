"""Exact checks of Chapter II of Tsikh, *Multidimensional Residues and Their
Applications* (AMS, 1992): §§5-10, the Appendix, printed pp. 13-62.

Run with `sage -python checks/sage/ch2.py` (last run with SageMath 10.9).
Exact arithmetic only: Q, Q(i), polynomial, Laurent polynomial and rational
function rings, Groebner and standard bases (Singular).

Tools (section "init" checks them on cases known in closed form):
* local_res(h, F): the local residue res_0 of h dz / (F_1 ... F_n) for
  polynomials F with an isolated zero at 0 (other zeros allowed).  With u a
  polynomial, u(0) != 0, vanishing on the other zeros (from the saturation
  (F) : m^oo), u z_j^N = sum_k C_jk F_k; by the transformation formula of
  §5.5 with A = C/u, res_F(h) is the coefficient of (z_1 ... z_n)^(N-1) in
  the Taylor series of h det C / u^n (Cauchy's formula for z^N).
* global_res(h, F): the sum of h/J_F over the zeros of F when all of them
  are simple, the trace of h J^(-1) on Q[z]/(F).
* trace_h_over_J(h, F): the algebraic trace of h/J_F over Q(w) for the
  mapping F - w (§6.4), an element of Q(w).
* Integrals of forms over chains for f = z (products of circles |z_k| = e_k
  and discs |z_k| < e_k oriented by orders of parameters r_k, theta_k), as
  in checks/sage/ch1.py; boundaries with the outward normal first (§1.3).

What is checked (expected values are the book's, as literals, with the
printed page and our label; printed readings that fail stay as refuted
checks):
S0 (pp. 13-14, ch:local-residues): the Laurent expansions of
  h/(z w (z - w)) on Gamma_1, Gamma_2 and the residues -dh/dw(0),
  dh/dz(0), h generic of degree <= 3.
S1 (§5.1, pp. 14-16): skew symmetry, residues of elements of I_0(f) vanish,
  Gamma_a = (-1)^(k-1) boundary c_k (n = 2, 3), res_f(J_f) = mu.
S2 (§5.2-5.3, pp. 16-19): the Martinelli-Bochner kernel is closed (n <= 3);
  df_1 ^ ... ^ df_n = J_f dz (eta_omega = h beta(f)/J_f, n = 2, 3);
  the integral of beta over S^(2n-1) by Stokes' formula: 1 when C^n is
  oriented by dx_1 ... dx_n dy_1 ... dy_n (Aizenberg-Yuzhakov, Preliminaries,
  1°), (-1)^(n(n-1)/2) with dx_1 dy_1 ... dx_n dy_n, the orientation of the
  parameters r_1, theta_1, ..., r_n, theta_n (n <= 5).  The book does not
  fix the orientation of C^n (see the report).
S3 (§5.5, pp. 20-23): the transformation formula (det A(0) != 0 and = 0),
  formula (2) (k = (1, 3)), formula (3) with B^(k) (k = (2, 1)), the lemma
  (det A in I_P(g)), and the restored formula (4) (Kytmanov) for multi-
  indices of length m <= 2, a simple and a multiple zero, det A(0) = 0.
S4 (§5.6, pp. 23-25): local duality (Gram matrix); the Leibniz expansion of
  L(hg), L = sum_{|a|=2} D^a delta, with sum over i <= j (correction
  p25-sum-i-le-j; printed sum over all i, j refuted), n = 2, 3; the matrix
  with twos on the diagonal (det n + 1, n <= 8; printed all-twos matrix
  singular); the minimal number of generators of I_L: 5 for n = 3, 9 for
  n = 4 (> n); for n = 2 the functionals sum_{|a|=d} D^a delta, d = 2, 3, 4,
  have 2-generated I_L, and sum_{|a|=3} D^a delta = res_0 g for
  g = ((z1^2 - 4 z1 z2 + z2^2)/4, z1 z2 (z1 - z2)) (correction
  math-p25-n2-local-residue; the printed claim refuted).
S5 (§6, pp. 25-30): Theorem of §6.2, res_0 f(h) = [Tr h/J](0), and
  holomorphy of Tr h/J (a polynomial in w) for two mappings with a single
  zero (mu = 4, 6); res_f(phi J_f) = mu phi(0) (formula (4) of §6.1).
S6 (§7, pp. 31-38): the lemma of §7.1 (units); the orientations of the
  chains gamma_(n+k) of §7.2 (n = 2, 3); formula (1) of §7.3 (n <= 4);
  formula (2) of §7.3 for both k (n = 2, residues at infinity); the
  Euler-Jacobi formula and its bound; Corollary 3 (Newton polyhedra); the
  construction of the proof of the theorem of §7.4; the P1 x P1 example.
S7 (§8, pp. 38-44): formula (2) of §8.2 (correction
  math-p40-laurent-denominators; printed z^(alpha+k) refuted: n = 1,
  psi = z^2 + c, h = z^3 gives c^2 instead of -c) against the global residue
  (trace), n = 1 and n = 2 with phi_21 != 0; the display after Macaulay's
  theorem (p. 42) and Proposition of §8.3; formula (6) of §8.3 (the
  resultant algorithm, n = 2); global duality (§8.4).
S8 (§9, pp. 45-55): the separating cycle of the example of §9.2; the faces
  of Pi_a; Corollary 2 of §9.4: f = z gives Gamma = Gamma_0, f = (z2, z1)
  (the printed hypotheses) gives -(2 pi i)^2 over Gamma_0^eps(f) against
  (2 pi i)^2 over Gamma (the editorial note).
S9 (§10.2, pp. 57-58): the residue of dz/(z(z - 1) - t) at the root near 0
  is -(1 + 4t)^(-1/2) (algebraic), to order t^12.
S10 (Appendix, pp. 59-60): the Bott formula on P1 for V = z d/dz and the
  Fubini-Study metric: sum P(A)/det A = 2 = (-2 pi i)^(-1) int Theta.

Not established: no analytic statement in general (limits, homology
classes, Stein manifolds, the theorems of §9 and §10.1), only the stated
examples and ranges; the integrals over chains are for f = z only; the
residue computations check the transformation formula on examples, they do
not prove it.
"""
import itertools
from sage.all import (QQ, ZZ, QuadraticField, LaurentPolynomialRing,
                      PolynomialRing, PowerSeriesRing, matrix, vector,
                      factorial, binomial, prod, identity_matrix, ones_matrix,
                      QQbar)

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
# Residues.
# ---------------------------------------------------------------------------
def local_res(h, F, maxN=40):
    R = h.parent()
    z = R.gens()
    n = len(z)
    F = [R(f) for f in F]
    I = R.ideal(F)
    m = R.ideal(list(z))
    J, _ = I.saturation(m)
    if J.is_one():
        u = R(1)
    else:
        gens = list(J.gens()) + list(z)
        co = R(1).lift(R.ideal(gens))
        u = sum(co[i] * gens[i] for i in range(len(J.gens())))
        assert u in J and u.constant_coefficient() != 0
    N = 1
    while not all((u * zi ** N) in I for zi in z):
        N += 1
        assert N < maxN, "the zero at 0 is not isolated"
    rows = []
    for zi in z:
        co = (u * zi ** N).lift(I)
        assert sum(c * f for c, f in zip(co, F)) == u * zi ** N
        rows.append(co)
    D = matrix(R, rows).det()
    deg = n * (N - 1)

    def trunc(q):
        return sum((c * mm for c, mm in zip(q.coefficients(), q.monomials())
                    if mm.degree() <= deg), R(0))
    un = u ** n
    c0 = un.constant_coefficient()
    w = trunc(1 - un / c0)
    inv, p = R(0), R(1)
    for _ in range(deg + 1):
        inv += p
        p = trunc(p * w)
    val = trunc(trunc(h * D) * inv) / c0
    return val.monomial_coefficient(prod(zi ** (N - 1) for zi in z))


def jacobian(F, z):
    n = len(z)
    return matrix(F[0].parent(), n, n,
                  lambda i, j: F[i].derivative(z[j])).det()


def quotient_tools(I, base):
    B = I.normal_basis()
    G = I.groebner_basis()

    def coords(p):
        p = p.reduce(G)
        return vector(base, [p.monomial_coefficient(b) for b in B])

    def mult(p):
        return matrix(base, [coords(p * b) for b in B]).transpose()
    return B, mult


def global_res(h, F):
    """sum over the zeros of F of h/J_F; all zeros simple (checked)."""
    R = h.parent()
    I = R.ideal(F)
    assert I.dimension() == 0 and I.radical() == I
    B, mult = quotient_tools(I, QQ)
    MJ = mult(jacobian(F, R.gens()))
    assert MJ.det() != 0
    return (mult(h) * MJ.inverse()).trace()


def trace_h_over_J(h_coeffs_fn, F_fn, n):
    """[Tr h/J](w) for the mapping F - w over Q(w); h_fn, F_fn build the
    polynomials in a given ring."""
    W = PolynomialRing(QQ, ['w%d' % (k + 1) for k in range(n)])
    FW = W.fraction_field()
    S = PolynomialRing(FW, ['z%d' % (k + 1) for k in range(n)])
    z = S.gens()
    F = F_fn(z)
    h = h_coeffs_fn(z)
    I = S.ideal([F[k] - FW.gens()[k] for k in range(n)])
    B, mult = quotient_tools(I, FW)
    t = (mult(h) * mult(jacobian(F, z)).inverse()).trace()
    return t, W


# ---------------------------------------------------------------------------
# Exterior algebra and integrals over product chains (f = z), as in ch1.py.
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


def d_form(F, ring_vars):
    """Exterior derivative; ring_vars[idx] is the variable whose
    differential has index idx."""
    out = {}
    for key, c in F.items():
        for idx, var in enumerate(ring_vars):
            dc = c.derivative(var)
            if dc == 0 or idx in key:
                continue
            nk = (idx,) + key
            sk = tuple(sorted(nk))
            out[sk] = out.get(sk, 0) + perm_sign(nk) * dc
    return {k: v for k, v in out.items() if v != 0}


class ZSpace:
    """C^n with z_k, w_k = zbar_k (Laurent coefficients); dz_k -> 2k,
    dzbar_k -> 2k + 1."""

    def __init__(self, n):
        self.n = n
        names = (['z%d' % (k + 1) for k in range(n)]
                 + ['w%d' % (k + 1) for k in range(n)])
        self.L = LaurentPolynomialRing(K, names)
        self.z = self.L.gens()[:n]
        self.w = self.L.gens()[n:]
        self.vars = sum([[self.z[k], self.w[k]] for k in range(n)], [])

    def dz(self, k):
        return {(2 * k,): self.L(1)}

    def dw(self, k):
        return {(2 * k + 1,): self.L(1)}

    def fn(self, c):
        return {(): self.L(c)}

    def d(self, F):
        return d_form(F, self.vars)


def integrate(Z, F, kinds, order):
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
    return res, pi_


# ---------------------------------------------------------------------------
# init: the tools on cases known in closed form.
# ---------------------------------------------------------------------------
R2 = PolynomialRing(QQ, 'z1,z2')
z1, z2 = R2.gens()
check(local_res(z1, [z1 ** 2, z2]) == 1 and local_res(R2(1), [z1, z2]) == 1,
      "init: residues for monomial mappings")
check(local_res(R2(1), [z1 * (z1 - 1), z2]) == -1,
      "init: another zero at (1, 0): residue 1/(0 - 1)")
check(local_res(z1 ** 2 * z2 ** 3, [z1 ** 3, z2 ** 4]) == 1
      and local_res(z1 ** 2 * z2 ** 2, [z1 ** 3, z2 ** 4]) == 0,
      "init: Cauchy's formula for z^N")
check(global_res(R2(1), [z1 ** 2 - 1, z2 - 2]) == 0
      and global_res(z1, [z1 ** 2 - 1, z2 - 2]) == 1,
      "init: global residue, sum of h/J (1/2 - 1/2, 1/2 + 1/2)")
Z1 = ZSpace(1)
om1 = wedge(Z1.fn(Z1.z[0] ** (-1)), Z1.dz(0))
v1, pi1 = integrate(Z1, om1, ['circle'], ['t1'])
check(v1 == 2 * II * pi1, "init: int dz/z over |z| = e is 2 pi i")

# ---------------------------------------------------------------------------
# S0. Introduction to Chapter II (pp. 13-14): g = h/(z w (z - w)).
# ---------------------------------------------------------------------------
C = PolynomialRing(QQ, ['c%d%d' % (a, b) for a in range(4) for b in range(4)
                        if a + b <= 3])
cc = dict(zip([(a, b) for a in range(4) for b in range(4) if a + b <= 3],
              C.gens()))
Lzw = LaurentPolynomialRing(C, 'z,w')
z, w = Lzw.gens()
h = sum(cc[ab] * z ** ab[0] * w ** ab[1] for ab in cc)
for N in range(4, 8):
    S1_ = -h / (z * w ** 2) * sum((z / w) ** k for k in range(N))
    S2_ = h / (z ** 2 * w) * sum((w / z) ** k for k in range(N))
    check(S1_ * z * w * (z - w) == h * (1 - (z / w) ** N),
          "p. 13: expansion of g on Gamma_1, N = %d" % N)
    check(S2_ * z * w * (z - w) == h * (1 - (w / z) ** N),
          "p. 13: expansion of g on Gamma_2, N = %d" % N)
    check(S1_.monomial_coefficient(z ** (-1) * w ** (-1)) == -cc[(0, 1)],
          "p. 13: (2 pi i)^-2 int_Gamma_1 g = -dh/dw(0), N = %d" % N)
    check(S2_.monomial_coefficient(z ** (-1) * w ** (-1)) == cc[(1, 0)],
          "p. 13: (2 pi i)^-2 int_Gamma_2 g = dh/dz(0), N = %d" % N)

# ---------------------------------------------------------------------------
# S1. §5.1 (pp. 14-16).
# ---------------------------------------------------------------------------
fA = [z1 ** 2 + z2 ** 3, z2 ** 2 - z1 * z2 + z1 ** 3]
Lloc = PolynomialRing(QQ, 'z1,z2', order='negdegrevlex')
mu_A = Lloc.ideal([Lloc(f) for f in fA]).vector_space_dimension()
check(mu_A == 4, "p. 15: multiplicity of fA at 0")
check(local_res(jacobian(fA, [z1, z2]), fA) == mu_A,
      "p. 27: res_f(J_f) = mu (formula (4) of §6.1, phi = 1)")
for h in [R2(1), z1 * z2, z1 ** 2 * z2, z2 ** 3, 1 + z1 * z2 ** 2,
          3 * z1 ** 2 - z2 ** 2 + z1 * z2]:
    check(local_res(h, fA) == -local_res(h, [fA[1], fA[0]]),
          "p. 15: skew symmetry, h = %s" % h)
for q1, q2 in [(R2(1), z2), (z1 - 3 * z2 ** 2, 2 + z1 * z2),
               (z2 ** 3, z1 ** 4 - 1)]:
    check(local_res(q1 * fA[0] + q2 * fA[1], fA) == 0,
          "p. 15: the proposition, h in I_0(f)")
for n in (2, 3):
    Z = ZSpace(n)
    tor = ['t%d' % k for k in range(1, n + 1)]
    for k in range(1, n + 1):
        parts = [wedge(Z.fn(Z.w[l - 1]), Z.dz(l - 1)) if l == k else
                 wedge(Z.fn(Z.z[l - 1] ** (-1)), Z.dz(l - 1))
                 for l in range(1, n + 1)]
        om = wedge_all(parts)
        order = []
        for l in range(1, n + 1):
            order += ['r%d' % l, 't%d' % l] if l == k else ['t%d' % l]
        kinds = ['disk' if l == k else 'circle' for l in range(1, n + 1)]
        lhs, _ = integrate(Z, Z.d(om), kinds, order)
        rhs, _ = integrate(Z, om, ['circle'] * n, tor)
        check(rhs != 0 and lhs == (-1) ** (k - 1) * rhs,
              "p. 16: Gamma_a = (-1)^(k-1) boundary c_k, n = %d, k = %d"
              % (n, k))

# ---------------------------------------------------------------------------
# S2. §5.2-5.3 (pp. 16-19): the Martinelli-Bochner kernel.
# ---------------------------------------------------------------------------
for n in (1, 2, 3):
    Pz = PolynomialRing(K, ['z%d' % (k + 1) for k in range(n)]
                        + ['w%d' % (k + 1) for k in range(n)])
    Fz = Pz.fraction_field()
    zz = [Fz(v) for v in Pz.gens()[:n]]
    ww = [Fz(v) for v in Pz.gens()[n:]]
    r2 = sum(zz[k] * ww[k] for k in range(n))
    dwbar = [{(2 * k + 1,): Fz(1)} for k in range(n)]
    dzz = [{(2 * k,): Fz(1)} for k in range(n)]
    beta = {}
    for k in range(n):
        piece = wedge_all([{(): (-1) ** k * ww[k] / r2 ** n}]
                          + [dwbar[l] for l in range(n) if l != k] + dzz)
        for kk, v in piece.items():
            beta[kk] = beta.get(kk, 0) + v
    check(d_form(beta, sum([[zz[k], ww[k]] for k in range(n)], [])) == {},
          "p. 16: the Martinelli-Bochner kernel is closed, n = %d" % n)
for n in (2, 3):
    Pf = PolynomialRing(QQ, ['a%d_%d_%d' % (i, j, l) for i in range(n)
                             for j in range(n) for l in range(n)]
                        + ['z%d' % (k + 1) for k in range(n)])
    zs = Pf.gens()[-n:]
    co = Pf.gens()[:-n]
    # generic quadratic maps f_i = sum_j z_j (sum_l a_ijl z_l)
    fs = [sum(zs[j] * sum(co[i * n * n + j * n + l] * zs[l] for l in range(n))
              for j in range(n)) for i in range(n)]
    dfs = [{(j,): fs[i].derivative(zs[j]) for j in range(n)} for i in range(n)]
    top = wedge_all(dfs)
    check(top == {tuple(range(n)): jacobian(fs, zs)},
          "p. 18: df_1 ^ ... ^ df_n = J_f dz, eta = h beta(f)/J_f, n = %d" % n)
for n in range(1, 6):
    du = [{(2 * k,): K(1), (2 * k + 1,): II} for k in range(n)]
    dub = [{(2 * k,): K(1), (2 * k + 1,): -II} for k in range(n)]
    kappa = wedge_all(dub + du)[tuple(range(2 * n))]
    # int_S beta = (n-1)!/(2 pi i)^n * n * int_B dubar ^ du (Stokes, |u| = 1)
    #            = kappa / (2 i)^n   (int_B dV = pi^n/n!), with
    # dubar_1..dubar_n du_1..du_n = kappa dx_1 dy_1 ... dx_n dy_n.
    val_xy = kappa / (2 * II) ** n
    s_ay = perm_sign(sum([[k, n + k] for k in range(n)], []))
    check(val_xy == (-1) ** (n * (n - 1) // 2),
          "p. 16: int beta over S^(2n-1), orientation dx_1 dy_1 ..., n = %d"
          % n)
    check(val_xy * s_ay == 1,
          "p. 16: int beta over S^(2n-1) = 1, orientation dx_1..dx_n dy_1.."
          "dy_n (Aizenberg-Yuzhakov), n = %d" % n)
# the parameters r_1, theta_1, ..., r_n, theta_n (§7.2) give dx_1 dy_1 ...:
# dx ^ dy = (i/2) dz ^ dzbar pulls back to r dr ^ dtheta.
for n in (1, 2, 3):
    Z = ZSpace(n)
    vol = wedge_all([wedge({(): Z.L(II / 2)}, wedge(Z.dz(k), Z.dw(k)))
                     for k in range(n)])
    v, pi_ = integrate(Z, vol, ['disk'] * n,
                       sum([['r%d' % k, 't%d' % k] for k in range(1, n + 1)],
                           []))
    E = v.parent().gens()
    check(v == prod(pi_ * E[k] ** 2 for k in range(n)),
          "p. 33: r_1, theta_1, ..., r_n, theta_n orient C^n as "
          "dx_1 dy_1 ... (volume of the polydisc), n = %d" % n)

# ---------------------------------------------------------------------------
# S3. §5.5 (pp. 20-23).
# ---------------------------------------------------------------------------
A1 = matrix(R2, [[1 + z2, z1], [z1 * z2 - 2, 3 + z1 ** 2]])      # det(0) = 3
A2 = matrix(R2, [[z1, z2], [-z2, z1 + z2 ** 2]])                  # det(0) = 0
f_simple = [z1 + z2 ** 2, z2 - z1 ** 2 + z1 * z2]
hs = [R2(1), z1, z2 ** 2, 1 + 2 * z1 - z2 + z1 * z2 ** 2, z1 ** 3 * z2]
for f, A, lab in [(fA, A1, "multiple zero, det A(0) != 0"),
                  (fA, A2, "multiple zero, det A(0) = 0"),
                  (f_simple, A2, "simple zero, det A(0) = 0")]:
    g = list(A * vector(f))
    for h in hs:
        check(local_res(h, f) == local_res(h * A.det(), g),
              "p. 20: transformation formula (1), %s, h = %s" % (lab, h))
# formula (2): f = (z1^2, z2^2 + z1), z1^2 = f1, z2^4 = f1 + (z2^2 - z1) f2.
f2s = [z1 ** 2, z2 ** 2 + z1]
A3 = matrix(R2, [[1, 0], [1, z2 ** 2 - z1]])
check(list(A3 * vector(f2s)) == [z1 ** 2, z2 ** 4],
      "p. 22: g = A f with g = ((z1 - 0)^2, (z2 - 0)^4)")
for h in [R2(1), z2, z1 * z2, z2 ** 3, z1 * z2 ** 3, z2 ** 5,
          1 + z1 - z2 ** 3]:
    by2 = (h * A3.det()).monomial_coefficient(z1 * z2 ** 3)   # 1/k! d^k
    check(by2 == local_res(h, f2s), "p. 22: formula (2), h = %s" % h)
# formula (3) with B^(k): k = (2, 1), |k| = 3, g = A1 f_simple.
f, A = f_simple, A1
g = list(A * vector(f))
kk = (2, 1)
B = matrix(R2, 2, 2)
for j in range(2):
    for a in range(4):            # g_j^3 = sum binom (a_j1 f1)^a (a_j2 f2)^b
        b = 3 - a
        term = binomial(3, a) * (A[j, 0] * f[0]) ** a * (A[j, 1] * f[1]) ** b
        if a >= kk[0]:
            B[j, 0] += term / f[0] ** kk[0]
            check(a - kk[0] + b == 3 - kk[0], "p. 22: degree |k| - k_1")
        else:
            B[j, 1] += term / f[1] ** kk[1]
            check(a + b - kk[1] == 3 - kk[1], "p. 22: degree |k| - k_2")
check(list(B * vector([f[0] ** 2, f[1]])) == [g[0] ** 3, g[1] ** 3],
      "p. 22: g_j^|k| = sum_q B_jq f_q^(k_q)")
for h in [R2(1), z1, z2, z1 * z2 + 3, z2 ** 3 - z1]:
    check(local_res(h, [f[0] ** 2, f[1]])
          == local_res(h * B.det(), [g[0] ** 3, g[1] ** 3]),
          "p. 22: formula (3), h = %s" % h)
# the lemma: f = (z1 - 1, z2), A = [[z1, 1], [0, 1]], g = (z1(z1-1) + z2, z2),
# P = 0: g(P) = 0, f(P) = (-1, 0) != 0.
fL = [z1 - 1, z2]
AL = matrix(R2, [[z1, 1], [0, 1]])
gL = list(AL * vector(fL))
check(fL[0] * AL.det() == sum(AL.adjugate()[0, k] * gL[k] for k in range(2)),
      "p. 21: the lemma, f_1 det A = sum_k (adj A)_1k g_k")
Ploc = Lloc.ideal([Lloc(q) for q in gL])
check(Lloc(AL.det()) in Ploc, "p. 21: the lemma, det A in I_P(g)")
for h in [R2(1), z2 + 5, z1 ** 2 - z2]:
    check(local_res(h * AL.det(), gL) == 0,
          "p. 21: the lemma, res_P g(h det A) = 0, h = %s" % h)


# formula (4) (restored): I! res_(f^(b+1)) (h) = sum_J J! res_(g^(c+1))
# (h det A a_(j_1 i_1) ... a_(j_m i_m)), J over all sequences of length m.
def mult_of(seq, n=2):
    return [list(seq).count(i) for i in range(n)]


def fact_of(seq):
    return prod(factorial(c) for c in mult_of(seq))


hK = 1 + 2 * z1 - z2 + z1 * z2 ** 2
for f, A, lab in [(f_simple, A1, "simple zero, det A(0) != 0"),
                  (fA, A1, "multiple zero, det A(0) != 0"),
                  (f_simple, A2, "simple zero, det A(0) = 0")]:
    g = list(A * vector(f))
    for m in range(3):
        for I_ in itertools.product(range(2), repeat=m):
            b = mult_of(I_)
            lhs = fact_of(I_) * local_res(hK, [f[i] ** (b[i] + 1)
                                               for i in range(2)])
            rhs = 0
            for J_ in itertools.product(range(2), repeat=m):
                c = mult_of(J_)
                num = hK * A.det() * prod(A[J_[l], I_[l]] for l in range(m))
                rhs += fact_of(J_) * local_res(num, [g[i] ** (c[i] + 1)
                                                     for i in range(2)])
            check(lhs == rhs, "p. 23: formula (4), %s, I = %s" % (lab, I_))

# ---------------------------------------------------------------------------
# S4. §5.6 (pp. 23-25).
# ---------------------------------------------------------------------------
# local duality: f = (z1^2 - z2^2, z1 z2) has the single zero 0, mu = 4.
fD = [z1 ** 2 - z2 ** 2, z1 * z2]
ID = R2.ideal(fD)
basis = ID.normal_basis()
check(len(basis) == 4, "p. 24: dim Q_(f,0) = 4")
gram = matrix(QQ, [[local_res(p * q, fD) for q in basis] for p in basis])
check(gram.det() != 0, "p. 24: the local duality theorem, Gram matrix")


def L_fun(h, zs, d):
    """sum over |a| = d of D^a h(0) = sum a! [z^a] h."""
    tot = 0
    for a in itertools.product(range(d + 1), repeat=len(zs)):
        if sum(a) == d:
            tot += prod(factorial(x) for x in a) * h.coefficient(
                {zs[k]: a[k] for k in range(len(zs))})
    return tot


for n in (2, 3):
    Rn = PolynomialRing(QQ, ['p%d' % k for k in range(2 * (1 + n + n * n))]
                        + ['z%d' % (k + 1) for k in range(n)])
    zs = Rn.gens()[-n:]
    ps = Rn.gens()[:-n]
    mons = [Rn(1)] + list(zs) + [zs[i] * zs[j] for i in range(n)
                                 for j in range(i, n)]
    h = sum(ps[k] * mons[k] for k in range(len(mons)))
    g = sum(ps[len(mons) + k] * mons[k] for k in range(len(mons)))

    def D(p, i, j=None):
        p = p.derivative(zs[i])
        if j is not None:
            p = p.derivative(zs[j])
        return p.subs({v: 0 for v in zs})
    h0, g0 = h.subs({v: 0 for v in zs}), g.subs({v: 0 for v in zs})
    lhs = L_fun(h * g, zs, 2)
    corr = sum(h0 * D(g, i, j) + D(h, i) * D(g, j) + D(h, j) * D(g, i)
               + g0 * D(h, i, j) for i in range(n) for j in range(i, n))
    printed = sum(h0 * D(g, i, j) + D(h, i) * D(g, j) + D(h, j) * D(g, i)
                  + g0 * D(h, i, j) for i in range(n) for j in range(n))
    check(lhs == corr, "p. 25: L(hg), sum over i <= j, n = %d" % n)
    refuted(lhs == printed, "p. 25: L(hg), printed sum over i, j, n = %d" % n)
for n in range(1, 9):
    M = identity_matrix(QQ, n) + ones_matrix(QQ, n, n)
    check(M.det() == n + 1, "p. 25: det of the matrix 2/1, n = %d" % n)
    if n >= 2:
        refuted(2 * ones_matrix(QQ, n, n).det() != 0,
                "p. 25: printed all-twos matrix nonsingular, n = %d" % n)


def min_generators(n, d, Lf=None):
    """mu(I_L) for L = sum_{|a|=d} D^a delta at 0 in n variables (I_L is
    homogeneous, contains m^(d+1))."""
    Rv = PolynomialRing(QQ, ['z%d' % (k + 1) for k in range(n)])
    zs = Rv.gens()

    def mons(e):
        return [prod(zs[k] ** a[k] for k in range(n))
                for a in itertools.product(range(e + 1), repeat=n)
                if sum(a) == e]
    Lf = Lf or (lambda p: L_fun(p, zs, d))
    pieces = {}
    for e in range(d + 2):
        basis_e = mons(e)
        if e == d + 1:
            pieces[e] = basis_e
            continue
        test = mons(d - e)
        Mx = matrix(QQ, [[Lf(b * t) for b in basis_e] for t in test])
        pieces[e] = [sum(v[k] * basis_e[k] for k in range(len(basis_e)))
                     for v in Mx.right_kernel().basis()]
    total = 0
    for e in range(d + 2):
        basis_e = mons(e)

        def vec(p):
            return vector(QQ, [p.monomial_coefficient(b) for b in basis_e])
        dim_I = len(pieces[e])
        prods = [z * p for z in zs for p in pieces.get(e - 1, [])] if e else []
        dim_mI = matrix(QQ, [vec(p) for p in prods]).rank() if prods else 0
        total += dim_I - dim_mI
    return total


check(min_generators(3, 2) == 5 and 5 == (3 + 1) * 3 // 2 - 1 and 5 > 3,
      "p. 25: I_L for n = 3 has (n+1)n/2 - 1 = 5 > n generators")
check(min_generators(4, 2) == 9 and 9 == (4 + 1) * 4 // 2 - 1,
      "p. 25: I_L for n = 4 has 9 generators")
for d in (2, 3, 4):
    check(min_generators(2, d) == 2,
          "p. 25: n = 2, I_L of sum_{|a|=%d} D^a delta is 2-generated" % d)
gN = [(z1 ** 2 - 4 * z1 * z2 + z2 ** 2) / 4, z1 * z2 * (z1 - z2)]
IgN = R2.ideal(gN)
check(all(z1 ** a * z2 ** (4 - a) in IgN for a in range(5)),
      "p. 25: m^4 in I(g), so res_0 g and L vanish on m^4")
for a in range(4):
    for b in range(4 - a):
        mono = z1 ** a * z2 ** b
        check(local_res(mono, gN) == L_fun(mono, [z1, z2], 3),
              "p. 25: sum_{|a|=3} D^a delta = res_0 g on z1^%d z2^%d" % (a, b))
refuted(min_generators(2, 3) > 2,
        "p. 25: printed, sum_{|a|=3} D^a delta (n = 2) is not a local "
        "residue (its I_L would need more than 2 generators)")

# ---------------------------------------------------------------------------
# S5. §6 (pp. 25-30): residue = trace of h/J at w = 0.
# ---------------------------------------------------------------------------
for Ffn, lab, mu in [(lambda z: [z[0] ** 2 + z[1] ** 2, z[0] * z[1]],
                      "(z1^2 + z2^2, z1 z2)", 4),
                     (lambda z: [z[0] ** 2 + z[1] ** 2,
                                 z[0] * z[1] ** 2 + z[1] ** 3 + z[0] ** 3],
                      "(z1^2 + z2^2, z1 z2^2 + z2^3 + z1^3)", 6)]:
    Fq = Ffn([z1, z2])
    check(R2.ideal(Fq).vector_space_dimension() == mu
          and R2.ideal(Fq).radical() == R2.ideal([z1, z2]),
          "p. 27: %s has the single zero 0 of multiplicity %d" % (lab, mu))
    for hfn in [lambda z: 1, lambda z: z[0], lambda z: z[0] * z[1],
                lambda z: z[0] ** 2, lambda z: z[1] ** 2,
                lambda z: z[0] ** 2 * z[1] + 3 * z[1] ** 3,
                lambda z: z[0] ** 3 * z[1] - z[1] ** 4 + 2]:
        t, W = trace_h_over_J(lambda z: z[0].parent()(hfn(z)), Ffn, 2)
        check(t.denominator() == 1,
              "p. 27: Tr h/J is holomorphic (polynomial in w), %s" % lab)
        t0 = W(t.numerator()).subs({v: 0 for v in W.gens()}) \
            / W(t.denominator()).subs({v: 0 for v in W.gens()})
        check(t0 == local_res(R2(hfn([z1, z2])), Fq),
              "p. 27: theorem of §6.2, res_0 f(h) = [Tr h/J](0), %s, h = %s"
              % (lab, hfn([z1, z2])))
    for phi in [R2(1), z1 + 2, z2 ** 2 - 3 * z1 + 5]:
        check(local_res(phi * jacobian(Fq, [z1, z2]), Fq)
              == mu * phi.constant_coefficient(),
              "p. 27: formula (4), res_f(phi J) = mu phi(0), %s" % lab)

# ---------------------------------------------------------------------------
# S6. §7 (pp. 31-38).
# ---------------------------------------------------------------------------
# the lemma of §7.1: g = (h1 f1, h2 f2), h_j(0) != 0.
h1u, h2u = 2 + z1 - z2 ** 2, -1 + z1 * z2
for h in [R2(1), z1 ** 2, z1 * z2 + z2 ** 3]:
    check(local_res(h, fA) == local_res(h * h1u * h2u,
                                        [h1u * fA[0], h2u * fA[1]]),
          "p. 31: residue w.r.t. a system of divisors well defined, h = %s"
          % h)
# §7.2: the chains gamma_(n+k) and their induced orientations.
for n in (2, 3):
    Z = ZSpace(n)
    for k in range(n, 0, -1):
        order = (sum([['r%d' % l, 't%d' % l] for l in range(1, k + 1)], [])
                 + ['t%d' % l for l in range(k + 1, n + 1)])
        order2 = (sum([['r%d' % l, 't%d' % l] for l in range(1, k)], [])
                  + ['t%d' % l for l in range(k, n + 1)])
        parts = []
        for l in range(1, n + 1):
            if l < k:
                parts.append(wedge(Z.dw(l - 1), Z.dz(l - 1)))
            elif l == k:
                parts.append(wedge(Z.fn(Z.w[l - 1]), Z.dz(l - 1)))
            else:
                parts.append(wedge(Z.fn(Z.z[l - 1] ** (-1)), Z.dz(l - 1)))
        om = wedge_all(parts)
        lhs, _ = integrate(Z, Z.d(om), ['disk' if l <= k else 'circle'
                                        for l in range(1, n + 1)], order)
        rhs, _ = integrate(Z, om, ['disk' if l < k else 'circle'
                                   for l in range(1, n + 1)], order2)
        check(rhs != 0 and lhs == rhs,
              "p. 33: boundary gamma_(n+%d) contains +gamma_(n+%d), n = %d"
              % (k, k - 1, n))
# §7.3, formula (1): dz_1 ^ ... ^ dz_n = sigma(xi)/xi_0^(n+1), z = xi/xi_0.
for n in range(1, 5):
    Px = PolynomialRing(QQ, ['x%d' % k for k in range(n + 1)]).fraction_field()
    xs = Px.gens()
    dz = []
    for j in range(1, n + 1):
        zj = xs[j] / xs[0]
        dz.append({(k,): zj.derivative(xs[k]) for k in range(n + 1)
                   if zj.derivative(xs[k]) != 0})
    lhs = wedge_all(dz)
    sigma = {}
    for nu in range(n + 1):
        key = tuple(k for k in range(n + 1) if k != nu)
        sigma[key] = (-1) ** nu * xs[nu] / xs[0] ** (n + 1)
    check(lhs == sigma,
          "p. 34: formula (1), dz = sigma/xi_0^(n+1), n = %d" % n)
# §7.3, formula (2): sum of residues in C^2 = (-1)^k (residues at infinity).
f7 = [z1 ** 2 - 2 * z2 + 1, z2 ** 2 - z1 * z2 + z1 - 3]
h7 = z1 ** 2 * z2 + 3 * z2 ** 2 - z1          # deg 3, q = 3 + 3 - 4 = 2
lhs7 = global_res(h7, f7)
Ruv = PolynomialRing(QQ, 'u,v')
u, v = Ruv.gens()


def at(p, pt):
    return p.subs({u: u + pt[0], v: v + pt[1]})


# k = 1: chart xi_1 = 1, (u, v) = (1/z1, z2/z1), dz1 ^ dz2 = -du ^ dv/u^3,
# omega = -h^ du ^ dv/(u^2 f^1 f^2); Z[1] = {(0, 0), (0, 1)}.
f1h = 1 - 2 * v * u + u ** 2
f2h = v ** 2 - v + u - 3 * u ** 2
hh = v + 3 * v ** 2 * u - u ** 2
check(f1h == u ** 2 * (z1 ** 2 - 2 * z2 + 1).subs({z1: 1 / u, z2: v / u})
      and f2h == u ** 2 * f7[1].subs({z1: 1 / u, z2: v / u})
      and hh == u ** 3 * h7.subs({z1: 1 / u, z2: v / u}),
      "p. 35: chart xi_1 = 1, homogenizations")
r1 = sum(local_res(at(-hh, b), [at(u ** 2 * f1h, b), at(f2h, b)])
         for b in [(0, 0), (0, 1)])
check(lhs7 == (-1) ** 1 * r1, "p. 35: formula (2), k = 1")
# k = 2: chart xi_2 = 1, (u, v) = (1/z2, z1/z2), dz1 ^ dz2 = du ^ dv/u^3,
# omega = h^ du ^ dv/(u^2 f^1 f^2); Z[2] = {(0, 0)}.
f1h = v ** 2 - 2 * u + u ** 2
f2h = 1 - v + u * v - 3 * u ** 2
hh = v ** 2 + 3 * u - v * u ** 2
check(f1h == u ** 2 * f7[0].subs({z1: v / u, z2: 1 / u})
      and f2h == u ** 2 * f7[1].subs({z1: v / u, z2: 1 / u})
      and hh == u ** 3 * h7.subs({z1: v / u, z2: 1 / u}),
      "p. 35: chart xi_2 = 1, homogenizations")
r2 = local_res(hh, [u ** 2 * f2h, f1h])
check(lhs7 == (-1) ** 2 * r2 and lhs7 != 0, "p. 35: formula (2), k = 2")
# Euler-Jacobi (Corollary 2): deg h < deg f1 + deg f2 - n = 2.
for h in [R2(1), z1, z2, 3 * z1 - 7 * z2 + 2]:
    check(global_res(h, f7) == 0, "p. 35: Euler-Jacobi, h = %s" % h)
check(global_res(jacobian(f7, [z1, z2]), f7) == 4,
      "p. 35: the bound is sharp: h = J (degree 2) gives the 4 roots")
# Corollary 3 (Newton polyhedra): Delta(f_j) the unit square, sum [0,2]^2.
f8 = [1 + 2 * z1 + 3 * z2 - z1 * z2, 2 - z1 + z2 + 5 * z1 * z2]
I8 = R2.ideal(f8)
check(I8.saturation(R2.ideal([z1 * z2]))[0] == I8
      and I8.radical() == I8 and I8.vector_space_dimension() == 2,
      "p. 36: two simple zeros, all in the torus")
for e1, e2 in [((2 * z1, -z1 * z2), (-z1, 5 * z1 * z2)),        # t = (1, 0)
               ((1, 3 * z2), (2, z2)),                            # t = (-1, 0)
               ((3 * z2, -z1 * z2), (z2, 5 * z1 * z2)),           # t = (0, 1)
               ((1, 2 * z1), (2, -z1))]:                          # t = (0, -1)
    Ie = R2.ideal([sum(e1), sum(e2)]).saturation(R2.ideal([z1 * z2]))[0]
    check(Ie.is_one(), "p. 36: nondegenerate edge system %s" % (e1,))
J8 = jacobian(f8, [z1, z2])
B8, mult8 = quotient_tools(I8, QQ)
inv8 = (mult8(z1 * z2 * J8)).inverse()
check((mult8(z1 * z2) * inv8).trace() == 0,
      "p. 36: Corollary 3, h = z1 z2 inside 2 Delta: sum = 0")
check((mult8(R2(1)) * inv8).trace() != 0,
      "p. 36: Corollary 3 needs the interior: h = 1 (a vertex) gives != 0")
# §7.4: the construction h = H(z, a) - H(z, b).
f9 = [z1 ** 2 - 1, z2 ** 2 - z1 * z2 - 2]
zeros9 = [(1, 2), (1, -1), (-1, -2), (-1, 1)]
Rzz = PolynomialRing(QQ, 'z1,z2,x1,x2')
y1_, y2_, x1_, x2_ = Rzz.gens()
P9 = matrix(Rzz, [[y1_ + x1_, 0], [-x2_, y2_ + x2_ - y1_]])
F9 = [y1_ ** 2 - 1, y2_ ** 2 - y1_ * y2_ - 2]
F9x = [p.subs({y1_: x1_, y2_: x2_}) for p in F9]
check(all(F9[q] - F9x[q] == sum((Rzz.gens()[s] - Rzz.gens()[2 + s])
                                 * P9[q, s] for s in range(2))
          for q in range(2))
      and all(P9[q, s].degree() <= [2, 2][q] - 1 for q in range(2)
              for s in range(2)),
      "p. 37: f_q(z) - f_q(zeta) = sum (z_s - zeta_s) P_qs, deg <= k_q - 1")
H9 = P9.det()


def Hz(pt):
    return R2(H9.subs({x1_: pt[0], x2_: pt[1]}).subs({y1_: z1, y2_: z2}))


J9 = jacobian(f9, [z1, z2])
a9, b9 = zeros9[0], zeros9[3]
h9 = Hz(a9) - Hz(b9)
check(h9.degree() + 2 < 4, "p. 37: condition (c), deg h + n < deg f1 + deg f2")
vals = [h9(*c) / J9(*c) for c in zeros9]
check(vals == [1, 0, 0, -1], "p. 37: conditions (a), (b): residues 1, -1, 0")
# P1 x P1 example: f1(z1), f2(z2), deg_zj h <= deg f_j - 2.
f10 = [(z1 - 1) * (z1 + 2) * (z1 - 3), z2 ** 2 - 4]
h10 = 2 + 5 * z1
for beta in (2, -2):
    s = sum(h10(alpha, beta) / (f10[0].derivative(z1)(alpha, beta)
                                * f10[1].derivative(z2)(alpha, beta))
            for alpha in (1, -2, 3))
    check(s == 0, "p. 37: P1 x P1, sum over j of res at (alpha_j, %d)" % beta)

# ---------------------------------------------------------------------------
# S7. §8 (pp. 38-44).
# ---------------------------------------------------------------------------
R1 = PolynomialRing(QQ, 'x')
x = R1.gen()


def laurent_1(h, k, s, corrected, B=12):
    tot = 0
    for a in range(B):
        e = k * (a + 1) - 1 if corrected else a + k - 1
        tot += (-1) ** a * (h * s ** a).monomial_coefficient(x ** e)
    return tot


for c in [QQ(1), QQ(2), QQ(-3) / 5]:
    psi = x ** 2 + c
    true = sum(r ** 3 / psi.derivative()(r) for r, _ in psi.roots(QQbar))
    check(true == -c, "p. 40: n = 1, psi = z^2 + c, Res_psi(z^3) = -c")
    check(laurent_1(x ** 3, 2, R1(c), True) == -c,
          "p. 40: corrected formula (2), n = 1, c = %s" % c)
    refuted(laurent_1(x ** 3, 2, R1(c), False) == -c,
            "p. 40: printed z^(alpha+k) gives c^2, c = %s" % c)
    check(laurent_1(x ** 3, 2, R1(c), False) == c ** 2,
          "p. 40: printed reading evaluated: c^2, c = %s" % c)
k1, k2 = 2, 3
psi2 = [z1 ** k1 + 3 * z1 - 1,
        z2 ** k2 + z1 * (z1 ** 2 - 2 * z1 * z2 + 5 * z2 ** 2) + z1 * z2
        - 4 * z2 + 7]
s2 = [psi2[0] - z1 ** k1, psi2[1] - z2 ** k2]


def laurent_2(h, s, k, corrected, B=10):
    tot = 0
    for a1 in range(B):
        for a2 in range(B):
            if corrected:
                e1, e2 = k[0] * (a1 + 1) - 1, k[1] * (a2 + 1) - 1
            else:
                e1, e2 = a1 + k[0] - 1, a2 + k[1] - 1
            tot += (-1) ** (a1 + a2) * (h * s[0] ** a1 * s[1] ** a2
                                        ).monomial_coefficient(
                z1 ** e1 * z2 ** e2)
    return tot


bad = 0
for h in [R2(1), z1, z2, z1 * z2, z1 ** 2 * z2 ** 2, z2 ** 4, z1 ** 3 * z2]:
    true = global_res(h, psi2)
    check(laurent_2(h, s2, (k1, k2), True, 8)
          == laurent_2(h, s2, (k1, k2), True, 12) == true,
          "p. 40: corrected formula (2), n = 2, phi_21 != 0, h = %s" % h)
    bad += laurent_2(h, s2, (k1, k2), False, 8) != true
refuted(bad == 0, "p. 40: printed formula (2), n = 2")
# p. 42: Macaulay, P = (z1^2 - z2^2, z1 z2), rho = 2 + 2 - 2 + 1 = 3.
Pm = [z1 ** 2 - z2 ** 2, z1 * z2]
Am = matrix(R2, [[z1, z2], [-z2, z1]])
check(list(Am * vector(Pm)) == [z1 ** 3, z2 ** 3]
      and all(Am[i, j].degree() == 3 - 2 for i in range(2) for j in range(2)),
      "p. 42: z_i^rho = sum a_ij P_j, a_ij homogeneous of degree rho - k_j")
check(all(z1 ** a * z2 ** (3 - a) in R2.ideal(Pm) for a in range(4))
      and not all(z1 ** a * z2 ** (2 - a) in R2.ideal(Pm) for a in range(3)),
      "p. 42: Macaulay's rho = k_1 + ... + k_n - n + 1 = 3 is attained")
Qm = [z1 - 2, z2 + 3]
fm = [Pm[0] + Qm[0], Pm[1] + Qm[1]]
sm = list(Am * vector(Qm))
psim = list(Am * vector(fm))
check(psim == [z1 ** 3 + sm[0], z2 ** 3 + sm[1]], "p. 42: psi = A f")
badm = 0
for h in [R2(1), z1, z2, z1 * z2, z1 ** 2, z2 ** 3 - z1, z1 ** 2 * z2 ** 2]:
    true = global_res(h, fm)
    check(global_res(h * Am.det(), psim) == true,
          "p. 42: Proposition of §8.3, Res_f(h) = Res_psi(h det A), h = %s"
          % h)
    check(laurent_2(h * Am.det(), sm, (3, 3), True, 8) == true,
          "p. 42: corrected display after Macaulay's theorem, h = %s" % h)
    badm += laurent_2(h * Am.det(), sm, (3, 3), False, 8) != true
refuted(badm == 0, "p. 42: printed display z^(alpha + rho)")
# formula (6): f1 monic in z2 of total degree 2, R(z1) = resultant w.r.t. z2.
f11 = [z2 ** 2 + z1 * z2 + z1 - 1, z1 ** 2 + z2 ** 2 - 3 * z1 + z2]
res11 = f11[0].resultant(f11[1], z2)
lc = res11.lc()
g11 = [res11 / lc, f11[0]]
co11 = g11[0].lift(R2.ideal(f11))
A11 = matrix(R2, [co11, [1, 0]])
check(list(A11 * vector(f11)) == g11 and g11[0].degree() == 4
      and g11[0].monomial_coefficient(z1 ** 4) == 1
      and g11[0].variables() == (z1,),
      "p. 43: g = (R_11(z1)/lc, f_1), relations (4)")
k11 = (4, 2)
s11 = [g11[0] - z1 ** 4, g11[1] - z2 ** 2]
check(s11[0].degree() <= 4 and s11[0].degree(z1) < 4
      and s11[1].degree() <= 2 and s11[1].degree(z2) < 2,
      "p. 43: g_j = z_j^(k_j) + s_j, deg s_j <= k_j, deg_zj s_j < k_j")
for h in [R2(1), z1, z2 ** 2, z1 * z2 + 1, z1 ** 3 * z2]:
    true = global_res(h, f11)
    check(laurent_2(h * A11.det(), s11, k11, True, 10) == true,
          "p. 43: formula (6), h = %s" % h)
# §8.4 global duality (f7: simple zeros, Q[z]/I(f) of dimension 4).
I7 = R2.ideal(f7)
mons7 = [z1 ** a * z2 ** b for a in range(4) for b in range(4)]
for h, inside in [(z1 * f7[0] + f7[1] * 3, True), (z2 - 2, False),
                  (z1 ** 2 - 2 * z2 + 1 + z1 * f7[1], True), (R2(1), False)]:
    vanish = all(global_res(h * g, f7) == 0 for g in mons7)
    check(vanish == inside and (h in I7) == inside,
          "p. 44: global duality, h = %s" % h)

# ---------------------------------------------------------------------------
# S8. §9 (pp. 45-55).
# ---------------------------------------------------------------------------
Z = ZSpace(2)
om = wedge(Z.fn(Z.z[0] ** (-1) * Z.z[1] ** (-1)), wedge(Z.dz(0), Z.dz(1)))
tor, pi_ = integrate(Z, om, ['circle'] * 2, ['t1', 't2'])
tor_rev, _ = integrate(Z, om, ['circle'] * 2, ['t2', 't1'])
check(tor == (2 * II * pi_) ** 2,
      "p. 53: f = z: int over Gamma = int over Gamma_0(f) = (2 pi i)^2")
check(tor_rev == -(2 * II * pi_) ** 2,
      "p. 53: f = (z2, z1): Gamma_0(f) oriented by arg z2, arg z1 gives "
      "-(2 pi i)^2 (editorial note to Corollary 2)")
refuted(tor == tor_rev, "p. 53: printed hypotheses of Corollary 2")
# the example of §9.2 and the faces of Pi_a (n = 2, f = z): with the
# orientations of §5.1, boundary c^(1) = Gamma, boundary c^(2) = -Gamma, and
# boundary Pi_a = c^(1) + c^(2) (the faces of formula (2) of §9.2).
pieces = {}
for kpiece, kinds, order in [(1, ['disk', 'circle'], ['r1', 't1', 't2']),
                             (2, ['circle', 'disk'], ['t1', 'r2', 't2'])]:
    parts = [wedge(Z.fn(Z.w[0]), Z.dz(0)) if kpiece == 1 else
             wedge(Z.fn(Z.z[0] ** (-1)), Z.dz(0)),
             wedge(Z.fn(Z.w[1]), Z.dz(1)) if kpiece == 2 else
             wedge(Z.fn(Z.z[1] ** (-1)), Z.dz(1))]
    omk = wedge_all(parts)
    lhs, _ = integrate(Z, Z.d(omk), kinds, order)
    rhs, _ = integrate(Z, omk, ['circle'] * 2, ['t1', 't2'])
    check(lhs == (-1) ** (kpiece - 1) * rhs and rhs != 0,
          "p. 46: boundary c^(%d) = %s Gamma" % (kpiece,
                                                 '+' if kpiece == 1 else '-'))
for jpiece, face_kinds, face_order in [(1, ['circle', 'disk'],
                                        ['t1', 'r2', 't2']),
                                       (2, ['disk', 'circle'],
                                        ['r1', 't1', 't2'])]:
    parts = [wedge(Z.fn(Z.w[0]), Z.dz(0)) if jpiece == 1 else
             wedge(Z.dw(0), Z.dz(0)),
             wedge(Z.fn(Z.w[1]), Z.dz(1)) if jpiece == 2 else
             wedge(Z.dw(1), Z.dz(1))]
    omj = wedge_all(parts)
    lhs, _ = integrate(Z, Z.d(omj), ['disk', 'disk'], ['r1', 't1', 'r2', 't2'])
    rhs, _ = integrate(Z, omj, face_kinds, face_order)
    check(lhs == rhs and rhs != 0,
          "p. 47: boundary Pi_a contains +c^(%d)" % (3 - jpiece))

# ---------------------------------------------------------------------------
# S9. §10.2 (pp. 57-58): an algebraic residue.
# ---------------------------------------------------------------------------
Pt = PowerSeriesRing(QQ, 't', default_prec=14)
t = Pt.gen()
Lz = PowerSeriesRing(QQ, 'zz', default_prec=40)
zz = Lz.gen()
coef = []
for kpow in range(13):
    # residue at z = 0 of 1/(z (z - 1))^(k+1) = [z^k] (z - 1)^(-(k+1))
    coef.append(((zz - 1) ** (-(kpow + 1))).padded_list(kpow + 1)[kpow])
r = sum(coef[kpow] * t ** kpow for kpow in range(13)).add_bigoh(13)
check((r ** 2 * (1 + 4 * t)).add_bigoh(13) == Pt(1).add_bigoh(13)
      and r[0] == -1,
      "p. 57: res of dz/(z(z-1) - t) near 0 is -(1 + 4t)^(-1/2), to t^12")

# ---------------------------------------------------------------------------
# S10. Appendix (pp. 59-60): the Bott formula on P1, V = z d/dz, P = trace.
# At 0: A = 1; at infinity (w = 1/z): V = -w d/dw, A = -1; P(A)/det A = 1 + 1.
# Theta = dbar d log h, h = (1 + |z|^2)^(-2) (Fubini-Study, frame d/dz):
# Theta = 2 dz ^ dzbar/(1 + |z|^2)^2 = -4 i dx dy/(1 + r^2)^2, and
# (-2 pi i)^(-1) int Theta = (2/pi) int dx dy/(1 + r^2)^2 = 4 int_0^oo
# r dr/(1 + r^2)^2 = 4 * 1/2.
# ---------------------------------------------------------------------------
Rr = PolynomialRing(QQ, 'rr').fraction_field()
rr = Rr.gen()
anti = -1 / (2 * (1 + rr ** 2))
check(anti.derivative(rr) == rr / (1 + rr ** 2) ** 2,
      "p. 60: antiderivative of r/(1 + r^2)^2")
check(4 * (0 - anti.subs(rr=0)) == 2 == 1 / QQ(1) + (-1) / QQ(-1),
      "p. 60: Bott formula on P1: (-2 pi i)^(-1) int Theta = 2 = sum P/det")
Pz1 = PolynomialRing(QQ, 'z,w').fraction_field()
zq, wq = Pz1.gens()
logh_dz = -2 * wq / (1 + zq * wq)          # d/dz log h
theta_coef = (logh_dz).derivative(wq)       # coefficient of dzbar ^ dz
check(theta_coef == -2 / (1 + zq * wq) ** 2,
      "p. 60: Theta = dbar d log h = -2 dzbar ^ dz/(1 + |z|^2)^2")

print("ok ch2: %d checks" % COUNT[0])
