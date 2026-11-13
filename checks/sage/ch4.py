"""Exact checks of Chapter IV, "Applications to Function Theory and Algebraic
Geometry", §§16-20 and the notes (printed pp. 105-159).

Run: sage -python checks/sage/ch4.py (plain asserts; do not use -O).
The last line of the output is "ok ch4: N checks".

Book: A. K. Tsikh, Multidimensional Residues and Their Applications, AMS
Translations of Mathematical Monographs 103, 1992.  Pages are the printed
pages, numbers of subsections and formulas those of the book; the ids in
parentheses are the entries of corrections.json.  Expected values are the
book's formulas, written below as literals (with the corrections where
marked); the Typst sources are not parsed.  Where the book is wrong, the
printed reading is kept as a refuted check (`refuted`: the printed reading
must fail) beside the corrected one.

Exact arithmetic only: Q, Q(i), Q(zeta_3), polynomial and rational function
rings with symbolic coefficients, Laurent series (one-variable residues),
Groebner bases and multiplication matrices in zero-dimensional quotients
(total sums of residues at simple zeros = traces of g/J), Singular standard
bases in a local ordering (local multiplicity = dimension of the local
algebra, the theorem of 19.4; membership in I_a(f); the order rho of
I_a(f)), and a small exterior algebra over these rings (wedge products,
exterior derivatives, pull-backs).  Two integrals are done by Sage's
symbolic integration with exact results (rational integrands on [0, oo)
and the Gaussian integral of C1); no floating-point value is used.

What is checked:

A  §16 (pp. 105-117).
   A1 Weil's formula (2) of 16.1 as a total sum of residues for the proper
      mapping f = (z1^2 + z2, z2^2 - z1), Hefer coefficients by divided
      differences, 3 points z, 4 functions h; the Jacobian in place of the
      Hefer determinant fails.
   A2 p. 114, (7)-(9) of 16.4 (p114-polyhedron-variable,
      p114-hefer-argument): the Hefer matrix of
      (f(zeta) - f(z), z) at (xi, eta) has determinant H(xi, zeta), which
      depends only on (xi, zeta), and kernel factor [eta - z]; for the
      printed polyhedron |zeta_j| < delta_2, i.e. (f(zeta) - f(z), zeta),
      the determinant depends on eta (refuted).
   A3 Proposition of 16.3: h(0) = 0 => h^mu in I_0(f), 3 mappings, 4 h.
   A4 16.4: f = (z', f_n): 1, z_n, ..., z_n^(k-1) is a basis of Q_(f,0).
   A5 16.5: the degree m - 1 segments g' of g generate I_0(g) when
      m^m is in I_0(g), 2 examples.
B  §17 (pp. 117-132).
   B1 The two examples of the introduction.
   B2 Proposition of 17.1 on z1^2 (not minimal) and the cusp (minimal,
      J = sng A = {0}).
   B3 Theorem of 17.2 on the cusp: the Hefer construction gives
      h~ = 2 z2^2 = h J' on A for h = z1/z2; H = J' delta.
   B4 17.4 and 6.4: for f = z^3, psi = z, both B(zeta, z)
      and B(z, zeta) vanish at the other preimages of f(z) and both give
      Bishop's formula h(z) B(z, z)/J(z) (generic h of degree 5); so the
      kernel of 17.4 with B(zeta, z) is correct as printed.
   B5 Example of 17.3: Phi(C^2) satisfies the three equations, which define
      it set-theoretically (their ideal has an embedded point at 0); the
      kernel ideal is prime of dimension 2; only (0, 0) and (0, 1) have a
      common image; Phi is an immersion; the ideal of A at 0 needs 4
      generators (Singular minbase), so A is not a complete intersection.
   B6 The identity (h dz1/f'_z2) ^ (df/f) = h dz1 ^ dz2/f of 17.5.
C  §18 (pp. 132-141).
   C1 Formula (5) of 18.1: the complex Hessian of
      (1/2) log(|z|^2 + eps) has determinant eps/(2^n (t + eps)^(n+1)),
      n <= 5; (sum H_jk dz_j ^ dzbar_k)^n = n! det H dz_1 ^ dzbar_1 ^ ...,
      n <= 3; the antiderivative (s/(1+s))^n of n s^(n-1)/(1+s)^(n+1),
      n <= 10, and the integrals = 1, n <= 6: the regularized
      ((i/pi) ddbar log|z|)^n has total mass 1 = I[Z_f] for f = z (the
      theorem of 18.1, p = n), so (5) has no factor 1/p!
      (m4-p136-poincare-lelong-factor; the printed 1/n! refuted, 2 <= n <= 6);
      the case p = 1: (1/2pi) int log r Delta(exp(-r^2)) = 1.
   C2 Proposition of 18.1, (6) (p136-dbar-closed): psi = zbar
      (d-closed) gives cbar != 0 for f = z, D = {|z - c| < R}; a
      dbar-closed psi gives psi(0).
   C3 18.3: the curve of (z^2 - 1, z(z^2 - 1)); R(w) = (w1^3 - w2^2)^2,
      d = 2, two preimages for (z^4, z^6); the Hefer expansion (5),
      H(w, w) = dR_*/dw_(n+1); formula (6) on both examples along each local
      component (generic phi of degree 4): phi(1) + phi(-1) and 2 phi(0).
   C4 The remark of 18.3 (p141-derivative-in-w-n-k): k = 2, the bracket is
      phi(t) with dR_1*/dw_2 dR_2*/dw_3; R_2 does not depend on w_2, so the
      printed dR_2*/dw_(n+1) vanishes identically (refuted).
D  §19 (pp. 141-149).
   D1 19.1: Euler's formula, det A = (k_1...k_n)^(-1) dg/dz and
      mu_0(g) = prod deg g_j for 3 homogeneous systems (n = 2, 3); Bezout's
      count for 2 affine systems without zeros at infinity, and a system with
      one finite root and one root at infinity.
   D2 Theorem of 19.2 and the theorem of 19.4: the order at 0 of the
      resultant R(f) equals dim Q_(f,0), 4 examples with n = 2 (one with a
      nonreduced curve K) and 2 with n = 3 (R(f) as the norm of f_3 over
      Q(z3)).
   D3 Theorem of 19.3 (p146-orders-d0): mu_0 >= prod d_0(f_j), with
      equality iff the initial system has an isolated zero, 8 examples
      (n = 2, 3; 4 with a nonisolated initial system).
   D4 Lemma 2 of 19.3: mu_0(f'(z', 0)) = d_1...d_(n-1), 3 examples, n = 3.
E  §20 (pp. 149-158).
   E1 Lemma of 20.1 (p149-lemma-degree-condition): d sigma =
      (p + n - q) P dz/Q for generic forms, n <= 3, up to 5 degree pairs; the
      printed condition p + q != n admits z dz/z^2, which has residue 1
      (refuted).
   E2 Theorem of 20.1 (Macaulay), 3 systems: all monomials of degree
      sum d_j - n + 1 lie in I(f); the Jacobian does not.
   E3 Theorem and remark of 20.2: an affine h in I(f) with cancelling top
      degrees: h~ in I(f~) with linear q_j and h~ in the local ideal of
      (xi_0^(d+1), f~) (p153-mapping-exponent); the remark's system: z2 =
      z1 f1 + f2, the only zero [1:0:0], the local condition holds, xi_2 is
      not in (f~) (no identity (3)).
   E4 Proposition of 20.2 (m4-p152-*): sigma on the chart xi_k = 1 is
      (-1)^k dxi[k] (formula (7)); the chart of P_(n+1) has Jacobian
      (-1)^(n-k+1) s^(-n-2) (formula (6)); hence pi^>(omega) =
      (-1)^(n+1) omega ^ dxi_(n+1)/xi_(n+1), all k <= n <= 5 (printed
      relation refuted for even n); on the cell Delta x [0, 1] (product
      orientation) the torus gives int pi^>(omega) = (-1)^(n+1) 2 pi i
      int omega, n <= 5 (printed (5) refuted for n = 2, 4); the identity
      d xi = lam^n dlam ^ sigma(v) behind it for any chain (n = 1, 2, generic
      quadratic v); the orientation of pi_> Gamma is (-1)^(n+1) that of the
      local cycle and (2 pi i)^(-n-1) is the normalization of res_0 F
      (p153-residue-normalization; the printed (2 pi i)^(-n) refuted); the
      cycle delta Gamma~ needs eps |xi_0|^(d_i) (m4-p153-coboundary-cycle).
   E5 Theorem of 20.3 and its lemma: n = 2, f = (z1 + z2^3, z1 z2 + z2^5):
      mu = 4, rho = beta = 4; f_j^* = w_n^(-d_j) f_j(sigma(w))
      (p155-blowup-exponent) = (f_j)_*(w', 1) + w_n g_j(w)
      (m4-p155-remainder-term; printed w_n f_j(w) refuted);
      mu(f^*) = mu - d_1 d_2; R^*(u) = u^(-d_1 d_2) R(u)
      (p156-branch-multiplicities; the printed sum d_1 d_2 refuted);
      (7) for all alpha with alpha_1 <= 4, alpha_2 <= 6, and (8) for
      |alpha| >= beta (p156-alpha-bound); n = 3 example of the lemma;
      bound (5) attained and the Jacobian outside I_a(f), 3 examples;
      the absolute bound rho <= mu (p154-absolute-bound), 3 examples.
   E6 Proposition of 20.4: the psi_k of the Hefer determinant of
      (z1^2 + z2, z2^2 - z1) span Q[z]/(f); h in I(f) iff Res_f(h psi_k) = 0
      for all k (3 polynomials h).

Not established: no analytic limit, homology class, current, principal
value or integral formula of the chapter is proved here; the general
theorems are checked only on the stated examples and ranges.  The bounded
algebraic steps proved for all n are in checks/lean/TsikhResidues/Ch4.lean.
Literature: King's formula, M. Vidras and A. Yger, Multidimensional Residue
Theory and Applications, AMS, 2023, Remark C.31, (C.23), p. 478, with
dd^c = (i/2pi) d dbar, (B.15), p. 452.
"""

from sage.all import *

COUNT = [0]


def check(cond, label):
    assert cond, label
    COUNT[0] += 1


def refuted(cond, label):
    """The printed reading `cond` must be false."""
    assert not cond, "printed reading unexpectedly holds: " + label
    COUNT[0] += 1


def local_ring(names):
    return PolynomialRing(QQ, names, order='negdegrevlex')


def local_mult(gens):
    R = gens[0].parent()
    return R.ideal(gens).vector_space_dimension()


def local_in(g, gens):
    R = gens[0].parent()
    return R.ideal(gens).reduce(R(g)) == 0


def local_order(gens):
    R = gens[0].parent()
    I = R.ideal(gens)
    k = 0
    while True:
        if all(I.reduce(m) == 0 for m in monomials_of_degree(R, k)):
            return k
        k += 1


def monomials_of_degree(R, k):
    from itertools import combinations_with_replacement
    xs = R.gens()
    return [prod(c) if c else R.one()
            for c in combinations_with_replacement(xs, k)]


def mult_matrix(g, I, basis):
    R = I.ring()
    rows = []
    for b in basis:
        r = I.reduce(R(g) * b)
        rows.append([r.monomial_coefficient(m) for m in basis])
    return matrix(QQ, rows).transpose()


def total_residue_simple(g, F):
    """Res_F(g) = sum of g(a)/J_F(a) over the (simple) common zeros of F,
    computed as the trace of g * J^{-1} in Q[z]/(F)."""
    R = F[0].parent()
    I = R.ideal(F)
    J = matrix(R, len(F), len(F), lambda i, j: F[i].derivative(R.gen(j))).det()
    assert R.ideal(list(F) + [J]) == R.ideal(R.one()), "multiple roots"
    basis = list(I.normal_basis())
    MJ = mult_matrix(J, I, basis)
    Mg = mult_matrix(g, I, basis)
    return (Mg * MJ.inverse()).trace()


# ---------------------------------------------------------------- forms
def perm_sign(seq):
    s = 1
    seq = list(seq)
    for i in range(len(seq)):
        for j in range(i + 1, len(seq)):
            if seq[i] > seq[j]:
                s = -s
    return s


def wedge(a, b):
    res = {}
    for I, c in a.items():
        for J, e in b.items():
            if set(I) & set(J):
                continue
            seq = I + J
            K = tuple(sorted(seq))
            res[K] = res.get(K, 0) + perm_sign(seq) * c * e
    return {k: v for k, v in res.items() if v != 0}


def wedge_all(forms):
    out = {(): 1}
    for f in forms:
        out = wedge(out, f)
    return out


def dform(a, variables):
    """Exterior derivative; the basis index k stands for d(variables[k])."""
    res = {}
    for I, c in a.items():
        for k, x in enumerate(variables):
            dc = c.derivative(x)
            if dc == 0 or k in I:
                continue
            seq = (k,) + I
            K = tuple(sorted(seq))
            res[K] = res.get(K, 0) + perm_sign(seq) * dc
    return {k: v for k, v in res.items() if v != 0}


# ======================================================== A: section 16
def section16():
    # A1. Weil's formula (2) of 16.1 as a total sum of residues: for the
    # proper mapping f = (z1^2 + z2, z2^2 - z1) the polyhedron Pi^r(f)
    # contains f^{-1}(f(z)) for |f(z)| < r, and (2) says
    # Res_{f(.) - f(z)} (h H(., z)) = h(z), H = det of the Hefer matrix.
    R = PolynomialRing(QQ, 'u1,u2,z1,z2')
    u1, u2, z1, z2 = R.gens()

    def f(a, b):
        return [a**2 + b, b**2 - a]

    def hefer(f, xs, ys):
        """P_jk with f_j(xs) - f_j(ys) = sum_k (xs_k - ys_k) P_jk."""
        n = len(xs)
        rows = []
        for fj in f:
            row = []
            for k in range(n):
                p1 = fj.subs({xs[i]: ys[i] for i in range(k)})
                p0 = fj.subs({xs[i]: ys[i] for i in range(k + 1)})
                q, r = (p1 - p0).quo_rem(xs[k] - ys[k])
                assert r == 0
                row.append(q)
            rows.append(row)
        return matrix(R, rows)

    fu = [R(t) for t in f(u1, u2)]
    P = hefer(fu, [u1, u2], [z1, z2])
    fz = [t.subs({u1: z1, u2: z2}) for t in fu]
    check(all(fu[j] - fz[j] == (u1 - z1) * P[j, 0] + (u2 - z2) * P[j, 1]
              for j in range(2)), "A1 Hefer expansion (1) of 16.1")
    H = P.det()
    S = PolynomialRing(QQ, 'u1,u2')
    for pt in [(1, 2), (-2, 3), (QQ(1) / 2, -1)]:
        sub = {z1: pt[0], z2: pt[1]}
        F = [S(fu[j].subs(sub) - fz[j].subs(sub)) for j in range(2)]
        Hz = S(H.subs(sub))
        for h in [S(1), S.gen(0), S.gen(1),
                  S.gen(0)**3 * S.gen(1) - 2 * S.gen(1)**2 + 7]:
            val = total_residue_simple(h * Hz, F)
            check(val == h(pt[0], pt[1]), "A1 Weil formula (2), z=%s" % (pt,))
        # without the Hefer determinant (H replaced by the Jacobian) one
        # gets the sum of h over all of f^{-1}(f(z)), not h(z)
        Jz = matrix(S, 2, 2, lambda i, j: F[i].derivative(S.gen(j))).det()
        refuted(total_residue_simple(S.gen(0) * Jz, F) == pt[0],
                "A1 Jacobian in place of H")

    # A2. p. 114, (7)-(9) of 16.4: the system F(zeta, z) = (f(zeta) - f(z), z)
    # (polyhedron with |z_j| < delta_2, p114-polyhedron-variable) has a
    # Hefer matrix at (xi, eta) vs (zeta, z) with determinant H(xi, zeta)
    # (depends only on (xi, zeta), as stated) and kernel factor [eta - z];
    # the printed system (f(zeta) - f(z), zeta) (|zeta_j| < delta_2) has
    # determinant +-H(eta, z), which depends on eta.
    T = PolynomialRing(QQ, 'x1,x2,e1,e2,u1,u2,z1,z2')
    x1, x2, e1, e2, U1, U2, Z1, Z2 = T.gens()
    PT = matrix(T, 2, 2, lambda i, j: T(P[i, j]))

    def Pof(a, b):  # P(a, b) with a, b pairs
        return PT.subs({T('u1'): a[0], T('u2'): a[1],
                        T('z1'): b[0], T('z2'): b[1]})

    def fT(a):
        return [a[0]**2 + a[1], a[1]**2 - a[0]]

    X, E, U, Z = (x1, x2), (e1, e2), (U1, U2), (Z1, Z2)
    A = Pof(X, U)
    B = -Pof(E, Z)
    Mcorr = block_matrix([[A, B], [zero_matrix(T, 2), identity_matrix(T, 2)]],
                         subdivide=False)
    lhs = [(fT(X)[j] - fT(E)[j]) - (fT(U)[j] - fT(Z)[j])
           for j in range(2)] + [E[j] - Z[j] for j in range(2)]
    dif = vector(T, [X[0] - U[0], X[1] - U[1], E[0] - Z[0], E[1] - Z[1]])
    check(vector(T, lhs) == Mcorr * dif,
          "A2 Hefer expansion of (f(zeta)-f(z), z)")
    Hcorr = Mcorr.det()
    check(Hcorr == A.det() and all(Hcorr.derivative(v) == 0
                                    for v in (e1, e2, Z1, Z2)),
          "A2 det depends only on (xi, zeta)")
    # printed: (f(zeta) - f(z), zeta); differences (xi - zeta, eta - z)
    Mpr = block_matrix([[A, B], [identity_matrix(T, 2), zero_matrix(T, 2)]],
                       subdivide=False)
    lhs_pr = [(fT(X)[j] - fT(E)[j]) - (fT(U)[j] - fT(Z)[j])
              for j in range(2)] + [X[j] - U[j] for j in range(2)]
    check(vector(T, lhs_pr) == Mpr * dif, "A2 Hefer expansion, printed system")
    refuted(all(Mpr.det().derivative(v) == 0 for v in (e1, e2, Z1, Z2)),
            "A2 printed |zeta_j| < delta_2: det free of (eta, z)")

    # A3. Proposition of 16.3 (local Nullstellensatz): h(a) = 0 => h^mu in
    # I_a(f), mu = mu_a(f).
    L = local_ring('a,b')
    a, b = L.gens()
    for F in [[a**3 - b**2, a * b], [a**2 + b**3, a * b**2 + b**4],
              [a**3 + b**4 + a * b, b**2 + a**5]]:
        mu = local_mult(F)
        for h in [a, b, a + 2 * b, a**2 - 3 * b + a * b]:
            check(local_in(h**mu, F), "A3 h^mu in I_0(f)")
    check(local_mult([a**3 - b**2, a * b]) == 5, "A3 mu of (a^3 - b^2, ab)")

    # A4. 16.4, the special case f = (z', f_n): 1, z_n, ..., z_n^{k-1} is a
    # basis of Q_{f,0}, k = ord f_n(0', z_n).
    for fn, k in [(b**3 + a * b + b**4, 3), (b**5 + a**2 * b + a * b**2, 5)]:
        F = [a, fn]
        check(local_mult(F) == k, "A4 dim Q_{f,0} = k")
        Ii = L.ideal(F)
        nf = [Ii.reduce(b**j) for j in range(k)]
        mons = sorted(set(sum([list(p.monomials()) for p in nf], [])))
        M = matrix(QQ, [[p.monomial_coefficient(m) for m in mons] for p in nf])
        check(M.rank() == k, "A4 1, z_n, ..., z_n^{k-1} independent")

    # A5. 16.5: with m^m in I(g), the degree m - 1 segments g' generate the
    # same local ideal as g.
    for G in [[a**2 + b**3 + a**3 * b, b**2 + a**3 + a * b**4],
              [a * b + a**4 + b**5, a**2 - b**3 + a**3 * b**2]]:
        m = local_order(G)
        Gt = [sum(c * mon for c, mon in zip(g.coefficients(), g.monomials())
                  if mon.degree() <= m - 1) for g in G]
        check(all(local_in(x, G) for x in Gt) and
              all(local_in(x, Gt) for x in G), "A5 I(g') = I(g), m = %d" % m)


# ======================================================== B: section 17
def section17():
    # B1. Introduction: (z2 - z1)/(z2 + z1) is 1 on {z1 = 0}, -1 on {z2 = 0};
    # t = z1/z2 on z1^2 = z2^3 parametrized by (t^3, t^2); no g(z1, z2) with
    # g(t^3, t^2) = t (the exponents 3a + 2b never equal 1).
    R = PolynomialRing(QQ, 'z1,z2,t')
    z1, z2, t = R.gens()
    Fr = R.fraction_field()
    q = Fr(z2 - z1) / Fr(z2 + z1)
    check(q.subs(z1=0) == 1 and q.subs(z2=0) == -1,
          "B1 the meromorphic function")
    check(Fr(z1 / z2).subs({z1: t**3, z2: t**2}) == t, "B1 t = z1/z2")
    check(all(3 * i + 2 * j != 1 for i in range(3) for j in range(3)),
          "B1 no holomorphic g with g(t^3, t^2) = t")

    # B2. Proposition of 17.1: f = z1^2 is not minimal for A = {z1 = 0}
    # (z1 vanishes on A, z1 not in (z1^2)) and J = {f = df = 0} = A; the
    # cusp f = z1^2 - z2^3 is minimal ((f) is radical) and J = {0} = sng A.
    S = PolynomialRing(QQ, 'z1,z2')
    s1, s2 = S.gens()
    I1 = S.ideal([s1**2])
    check(I1.radical() == S.ideal([s1]) and s1 not in I1,
          "B2 z1^2 not minimal")
    check(S.ideal([s1**2, 2 * s1]).radical() == S.ideal([s1]),
          "B2 J = A for f = z1^2")
    cusp = s1**2 - s2**3
    check(S.ideal([cusp]).radical() == S.ideal([cusp]), "B2 cusp minimal")
    check(S.ideal([cusp, cusp.derivative(s1), cusp.derivative(s2)]).radical()
          == S.ideal([s1, s2]), "B2 J = {0} = sng A for the cusp")

    # B3. Theorem of 17.2 on the cusp f = z1^2 - z2^3, projection to z2
    # (z2 = s^2, the sheets z1 = +-s^3): h = z1/z2 is weakly holomorphic;
    # Hefer f(zeta1, z2) - f(z1, z2) = (zeta1 - z1)(zeta1 + z1), H = z1 +
    # zeta1; H(z1^(j), z1^(nu), z2) = J' = 2 z1 for j = nu and 0 otherwise; the
    # function sum_nu h(z^(nu)) H(z1, z1^(nu), z2) = 2 z2^2 is holomorphic and
    # equals h J' on A; h dJ/dz2 = -3 z1 z2 extends as well.
    T = PolynomialRing(QQ, 'z1,s')
    w1, s = T.gens()
    sheets = [s**3, -s**3]
    hv = [s, -s]                          # h = z1/z2 = +-s on the sheets
    Hf = lambda x, y: x + y
    htilde = sum(hv[k] * Hf(w1, sheets[k]) for k in range(2))
    check(htilde == 2 * s**4, "B3 h~ = 2 z2^2")
    check(all(Hf(sheets[j], sheets[k]) == (2 * sheets[j] if j == k else 0)
              for j in range(2) for k in range(2)), "B3 H = J' delta")
    check(all(hv[k] * 2 * sheets[k] == 2 * s**4 for k in range(2)),
          "B3 h~ = h J' on A")
    check(all(hv[k] * (-3 * s**4) == -3 * sheets[k] * s**2 for k in range(2)),
          "B3 h dJ/dz2 = -3 z1 z2 on A")

    # B4. 17.4 and 6.4: Bishop's weight for f(z) = z^3,
    # psi = z, preimages z, w z, w^2 z (w^3 = 1). B(zeta, z) of (1) of 6.4
    # vanishes at the other preimages as a function of zeta, and so does
    # B(z, zeta); both give Bishop's formula h(z) B(z,z)/J(z).
    K = CyclotomicField(3)
    om = K.gen()
    P = PolynomialRing(K, 'z,zeta,' + ','.join('c%d' % i for i in range(6)))
    z, ze = P.gen(0), P.gen(1)
    cs = P.gens()[2:]
    h = lambda x: sum(cs[i] * x**i for i in range(6))
    pre = lambda x: [x, om * x, om**2 * x]

    def B(zeta, zz):
        zs = pre(zz)
        first = prod(zs[nu] - zeta for nu in range(1, 3))
        second = prod(zs[k] - zs[s_] for k in range(3) for s_ in range(1, 3)
                      if k != s_)
        return first * second
    Fp = P.fraction_field()
    J = lambda x: 3 * x**2
    lhs = Fp(h(z) * B(z, z)) / Fp(J(z))
    for name, W in [("B(zeta,z)", lambda x: B(x, z)),
                    ("B(z,zeta)", lambda x: B(z, x))]:
        check(all(W(y) == 0 for y in pre(z)[1:]),
              "B4 %s vanishes at the other preimages" % name)
        tot = sum(Fp(h(y) * W(y)) / Fp(J(y)) for y in pre(z))
        check(tot == lhs, "B4 Bishop formula with %s" % name)
    check(B(z, ze) != B(ze, z), "B4 the two weights differ")

    # B5. Example of 17.3: A = Phi(C^2), Phi = (x, xy, y(y-1), y^2(y-1)).
    Rr = PolynomialRing(QQ, 'x,y,X,Y,v1,v2,v3,v4')
    x, y, X, Y = Rr.gens()[:4]
    v = Rr.gens()[4:]
    Phi = lambda x, y: [x, x * y, y * (y - 1), y**2 * (y - 1)]
    eqs = lambda w: [w[0] * w[3] - w[1] * w[2], w[2]**3 - w[3] * (w[3] - w[2]),
                     w[0]**2 * w[2] - w[1] * (w[1] - w[0])]
    check(all(e == 0 for e in eqs(Phi(x, y))),
          "B5 Phi(C^2) satisfies the 3 equations")
    Ik = Rr.ideal([v[i] - Phi(x, y)[i] for i in range(4)])
    Ik = Ik.elimination_ideal([x, y])
    S4 = PolynomialRing(QQ, 'v1,v2,v3,v4')
    Kid = S4.ideal([S4(str(g)) for g in Ik.gens() if g != 0])
    three = S4.ideal([S4(str(e)) for e in eqs(v)])
    check(three.radical() == Kid and Kid.is_prime() and Kid.dimension() == 2,
          "B5 the 3 equations define A, an irreducible surface")
    # pairs of distinct points with the same image
    R2 = PolynomialRing(QQ, 'x,y,X,Y')
    x, y, X, Y = R2.gens()
    pairs = R2.ideal([Phi(x, y)[i] - Phi(X, Y)[i] for i in range(4)])
    sat = pairs.saturation(R2.ideal([x - X, y - Y]))[0].radical()
    check(sat == R2.ideal([x, X, y * Y, y + Y - 1]).radical(),
          "B5 only (0,0) and (0,1) have the same image")
    check(all(p.subs({x: 0, y: 0}) == 0 and p.subs({x: 0, y: 1}) == 0
              for p in Phi(x, y)), "B5 both are mapped to 0")
    Jac = matrix(R2, [[p.derivative(x), p.derivative(y)] for p in Phi(x, y)])
    check(R2.ideal(Jac.minors(2)) == R2.ideal(R2.one()),
          "B5 Phi is an immersion")
    singular.eval('ring r4 = 0, (v1,v2,v3,v4), ds;')
    singular.eval('ideal K4 = %s;' % ', '.join(str(g) for g in Kid.gens()))
    check(int(singular.eval('size(minbase(K4));')) == 4,
          "B5 the ideal of A at 0 needs 4 generators (not 2)")

    # B6. End of the proof of 17.5: (h dz1/f'_{z2}) ^ (df/f) = h dz1^dz2/f.
    Q = PolynomialRing(QQ, 'z1,z2,c').fraction_field()
    q1, q2, c = Q.gens()
    ff = q1**3 - q2**2 + c * q1 * q2 + 1
    hh = q1**2 + c * q2
    lhs = wedge({(0,): hh / ff.derivative(q2)},
                {(0,): ff.derivative(q1) / ff, (1,): ff.derivative(q2) / ff})
    check(lhs == {(0, 1): hh / ff}, "B6 omega' identity")


# ======================================================== C: section 18
def section18():
    # C1. Formula (5) of 18.1 (m4-p136-poincare-lelong-factor).
    # For u = (1/2) log(|z|^2 + eps) in C^n, (i/pi) dd-bar u has density
    # (n!/pi^n) eps/(|z|^2+eps)^{n+1} dV: det(u_{j kbar}) = (1/2)^n
    # eps/(t+eps)^{n+1} (t = |z|^2), (i ddbar u)^n = n! det(u_{j kbar}) prod(i
    # dz_j ^ dzbar_j), i dz ^ dzbar = 2 dx ^ dy, dV = pi^n t^{n-1} dt/(n-1)!.
    # Its total mass n int_0^oo s^{n-1}/(1+s)^{n+1} ds = 1 for every eps, so
    # the regularized ((i/pi) ddbar log|z|)^n has mass 1 at 0 = I[Z_f] for f =
    # z (Theorem of 18.1 with p = n); the printed factor 1/p! gives 1/n!.
    for n in range(1, 6):
        names = (['z%d' % j for j in range(n)] +
                 ['w%d' % j for j in range(n)] + ['eps'])
        F = PolynomialRing(QQ, names).fraction_field()
        zs, ws, eps = F.gens()[:n], F.gens()[n:2 * n], F.gens()[2 * n]
        t = sum(zs[j] * ws[j] for j in range(n))
        # d/dw_k (1/2) log(t + eps) = (1/2) z_k/(t + eps); then d/dz_j
        Hm = matrix(F, n, n, lambda j, k:
                    (zs[k] / (2 * (t + eps))).derivative(zs[j]))
        check(Hm.det() == eps / (2**n * (t + eps)**(n + 1)),
              "C1 complex Hessian determinant, n = %d" % n)
    for n in range(1, 4):
        # (sum H_jk dz_j ^ dzbar_k)^n = n! det H dz_1^dzbar_1^...^dz_n^dzbar_n
        Hs = PolynomialRing(QQ, ['h%d%d' % (j, k)
                                 for j in range(n) for k in range(n)])
        Hmat = matrix(Hs, n, n, Hs.gens())
        # basis index 2j: dz_j, 2j+1: dzbar_j
        Om = {}
        for j in range(n):
            for k in range(n):
                Om.update(wedge({(2 * j,): Hs.one()},
                                {(2 * k + 1,): Hmat[j, k]}))
        Omn = wedge_all([Om] * n)
        check(Omn == {tuple(range(2 * n)): factorial(n) * Hmat.det()},
              "C1 n-th power of a (1,1)-form, n = %d" % n)
    S = PolynomialRing(QQ, 's').fraction_field()
    s = S.gen()
    for n in range(1, 11):
        Fn = (s / (1 + s))**n
        check(Fn.derivative(s) == n * s**(n - 1) / (1 + s)**(n + 1) and
              Fn.subs(s=0) == 0 and Fn.numerator().leading_coefficient() ==
              Fn.denominator().leading_coefficient() and
              Fn.numerator().degree() == Fn.denominator().degree(),
              "C1 antiderivative (s/(1+s))^n, limits 0 and 1, n = %d" % n)
    sv = var('sv')
    for n in range(1, 7):
        mass = integrate(n * sv**(n - 1) / (1 + sv)**(n + 1), sv, 0, oo)
        check(mass == 1, "C1 total mass 1, n = %d" % n)
        if n >= 2:
            refuted(mass / factorial(n) == 1,
                    "C1 printed 1/p!, p = n = %d" % n)
    # p = 1 (Poincare-Lelong, no factorial either way): (i/pi) ddbar log|z| =
    # delta_0; with psi = exp(-|z|^2): (1/2pi) int log r Delta psi dx dy =
    # psi(0) = 1.
    r = var('r')
    check(integrate((4 * r**3 - 4 * r) * log(r) * exp(-r**2), r, 0, oo) == 1,
          "C1 Poincare-Lelong normalization")

    # C2. Proposition of 18.1, (6), with a dbar-closed psi (p136-dbar-closed):
    # n = p = 1, f = z, beta(u) = du/(2 pi i u), D = {|z - c| < R}, 0 < |c| <
    # R. On |z - c| = R, zbar = cbar + R^2/(z - c).
    Kc = PolynomialRing(QQ, 'c,cb,R').fraction_field()
    c, cb, Rr = Kc.gens()
    P = PolynomialRing(Kc, 'z')
    z = P.gen()

    def res_sum(num, poles):
        """Sum of residues of num/prod(z - p) at simple poles p."""
        den = prod(z - p for p in poles)
        return sum(Kc(num(p)) / Kc(den.derivative()(p)) for p in poles)
    # psi = zbar (d-closed, not dbar-closed): (2 pi i)^{-1} int zbar dz/z =
    # cbar
    lhs = res_sum(lambda w: cb * (w - c) + Rr**2, [Kc(0), c])
    check(lhs == cb, "C2 int_{dD} zbar dz/(2 pi i z) = cbar")
    refuted(lhs == 0, "C2 printed: d-closed psi = zbar (int over Z_f is 0)")
    # psi = z^2 + 3 (dbar-closed): value psi(0) = 3
    check(res_sum(lambda w: w**2 + 3, [Kc(0)]) == 3, "C2 dbar-closed psi")

    # C3. 18.3: (z^2 - 1, z(z^2 - 1)) maps C onto w2^2 = w1^2 + w1^3;
    # (z^4, z^6): R(w) = (w1^3 - w2^2)^2, d = 2, two preimages; formula (6)
    # with the Hefer function H and dR_*/dw_{n+1}, along each local
    # component of A (parametrized by w = f(t)); the integral
    # int_Gamma phi H(f(z), w) df'/(f' - w') = 2 pi i sum_{f'(z) = w'} phi(z)
    # H(f(z), w).
    Pz = PolynomialRing(QQ, 'z,w1,w2,w3')
    zz, w1, w2, w3 = Pz.gens()
    f1, f2 = zz**2 - 1, zz * (zz**2 - 1)
    Rw = (f1 - w1).resultant(f2 - w2, zz)
    check(Rw == w2**2 - w1**2 - w1**3, "C3 resultant of (z^2-1, z(z^2-1))")
    Rw2 = (zz**4 - w1).resultant(zz**6 - w2, zz)
    check(Rw2 == (w1**3 - w2**2)**2, "C3 R(w) = (w1^3 - w2^2)^2, d = 2")
    Tt = PolynomialRing(QQ, 't')
    tt = Tt.gen()
    Ft = Tt.fraction_field()
    Gz = PolynomialRing(Ft, 'zz')
    g = gcd(Gz.gen()**4 - tt**4, Gz.gen()**6 - tt**6)
    check(g.degree() == 2, "C3 (z^4, z^6): mu_0 = 2 preimages")
    # generic phi
    Cf = PolynomialRing(QQ, ['a%d' % i for i in range(5)] + ['t'])
    avars, T = Cf.gens()[:5], Cf.gens()[5]
    phi = lambda x: sum(avars[i] * x**i for i in range(5))
    FF = Cf.fraction_field()
    # example 1: H(zeta, w) = zeta2 + w2 from w2^2 - (w1+1) w1^2
    fv = lambda x: (x**2 - 1, x * (x**2 - 1))
    Hh = lambda a, b: a[1] + b[1]
    dR = lambda b: 2 * b[1]
    wt = fv(T)
    Pc = PolynomialRing(QQ, 'p1,p2,q1,q2')
    p1, p2, q1, q2 = Pc.gens()
    Rs = lambda a, b: b**2 - a**2 * (a + 1)
    P1 = ((Rs(p1, p2) - Rs(q1, q2)) - (p2 + q2) * (p2 - q2)).quo_rem(p1 - q1)
    check(P1[1] == 0 and (Rs(p1, p2) - Rs(q1, q2)) ==
          P1[0] * (p1 - q1) + (p2 + q2) * (p2 - q2), "C3 Hefer expansion (5)")
    check((p2 + q2).subs({p1: q1, p2: q2}) == Rs(q1, q2).derivative(q2),
          "C3 H(w, w) = dR_*/dw_2")
    E = (FF(phi(T) * Hh(fv(T), wt)) + FF(phi(-T) * Hh(fv(-T), wt))) \
        / FF(dR(wt))
    check(E == phi(T), "C3 example 1: the bracket of (6) is phi(t)")
    check(E.subs({T: 1}) + E.subs({T: -1}) == phi(1) + phi(-1),
          "C3 example 1: (6) gives phi(1) + phi(-1)")
    # example 2: R_* = w1^3 - w2^2, H = -(zeta2 + w2), dR_*/dw2 = -2 w2
    Ki = QuadraticField(-1, 'i')
    ii = Ki.gen()
    Ci = PolynomialRing(Ki, ['a%d' % i for i in range(5)] + ['t'])
    ai, Ti = Ci.gens()[:5], Ci.gens()[5]
    phii = lambda x: sum(ai[k] * x**k for k in range(5))
    FFi = Ci.fraction_field()
    wt2 = (Ti**4, Ti**6)
    roots = [Ti, ii * Ti, -Ti, -ii * Ti]
    E2 = sum(FFi(phii(x) * (-(x**6 + wt2[1]))) for x in roots) \
        / FFi(-2 * wt2[1])
    check(E2 == phii(Ti) + phii(-Ti),
          "C3 example 2: the bracket is phi(t)+phi(-t)")
    check(E2.subs({Ti: 0}) == 2 * phii(0),
          "C3 example 2: (6) gives mu_0 phi(0) = 2 phi(0)")

    # C4. Remark after the theorem of 18.3 (p141-derivative-in-w-n-k): n = 1,
    # k = 2, f = (z^2 - 1, z(z^2 - 1), (z^2 - 1)(z^2 + z)); R_2 is built from
    # (f1 - w1, f3 - w3) and depends on (w1, w3) only.
    f3 = (zz**2 - 1) * (zz**2 + zz)
    R2 = (f1 - w1).resultant(f3 - w3, zz)
    check(R2.derivative(w2) == 0 and R2.is_squarefree(),
          "C4 R_2 = R_2(w1, w3)")
    # Hefer: H_2(zeta, w) = zeta3 + w3 - 2(zeta1^2 + zeta1) (R_2 monic of
    # degree 2 in w3)
    Pd = PolynomialRing(QQ, 'p1,p3,q1,q3')
    a1, a3, b1, b3 = Pd.gens()
    R2s = lambda x, y: R2.subs({w1: x, w3: y})
    H2 = a3 + b3 - 2 * (a1**2 + a1)
    rest = (R2s(a1, a3) - R2s(b1, b3)) - H2 * (a3 - b3)
    check(Pd(rest).quo_rem(a1 - b1)[1] == 0, "C4 Hefer expansion for R_2")
    check(H2.subs({a1: b1, a3: b3}) == Pd(R2s(b1, b3)).derivative(b3),
          "C4 H_2(w, w) = dR_2/dw_3")
    f3v = lambda x: (x**2 - 1) * (x**2 + x)
    wt3 = (T**2 - 1, T * (T**2 - 1), f3v(T))
    H2v = lambda a, b: a[2] + b[2] - 2 * (a[0]**2 + a[0])
    dR2 = lambda b: 2 * b[2] - 2 * (b[0]**2 + b[0])
    full = lambda x: (x**2 - 1, x * (x**2 - 1), f3v(x))
    E3 = sum(FF(phi(x) * Hh(full(x), wt3) * H2v(full(x), wt3))
             for x in (T, -T)) / FF(dR(wt3) * dR2(wt3))
    check(E3 == phi(T),
          "C4 remark: product of derivatives dR_1/dw_2 dR_2/dw_3")
    refuted(Pz(R2).derivative(w2) != 0,
            "C4 printed dR_2/dw_{n+1} (identically 0)")


# ======================================================== D: section 19
def section19():
    L2 = local_ring('z1,z2')
    z1, z2 = L2.gens()
    L3 = local_ring('z1,z2,z3')
    y1, y2, y3 = L3.gens()

    # D1. Proof of 19.1: k_j g_j = sum_q z_q dg_j/dz_q (Euler) and
    # det A = (k_1...k_n)^{-1} dg/dz for A = (k_j^{-1} dg_j/dz_q);
    # mu_0(g) = prod deg g_j for homogeneous g with an isolated zero.
    G2 = PolynomialRing(QQ, 'z1,z2')
    x1, x2 = G2.gens()
    G3 = PolynomialRing(QQ, 'z1,z2,z3')
    u1, u2, u3 = G3.gens()
    homs = [([x1**2 + x1 * x2 + 3 * x2**2, x1**3 - x2**3 + x1 * x2**2], L2),
            ([x1**3 + x2**3, x1 * x2**3 + x1**4 - x2**4], L2),
            ([u1**2 + u2 * u3, u2**2 + u1 * u3 + u3**2,
              u3**3 + u1**3 + u1 * u2**2], L3)]
    for g, L in homs:
        Rg = g[0].parent()
        xs = Rg.gens()
        n = len(xs)
        ks = [gi.degree() for gi in g]
        check(Rg.ideal(g).vector_space_dimension() < Infinity,
              "D1 isolated zero")
        Jm = matrix(Rg, n, n, lambda j, q: g[j].derivative(xs[q]))
        check(all(ks[j] * g[j] == sum(xs[q] * Jm[j, q] for q in range(n))
                  for j in range(n)), "D1 Euler formula")
        A = matrix(Rg.fraction_field(), n, n, lambda j, q: Jm[j, q] / ks[j])
        check(A.det() == Jm.det() / prod(ks), "D1 det A")
        check(local_mult([L(str(gi)) for gi in g]) == prod(ks),
              "D1 mu_0(g) = prod deg g_j")
    # Bezout: no zeros at infinity => dim Q[z]/(f) = prod deg
    for f in [[x1**2 + x2 - 1, x2**3 - x1 + x1 * x2 + 2],
              [x1**3 + x1 * x2 + 1, x2**2 + x1 + 3]]:
        lead = [fi.homogeneous_components()[fi.degree()] for fi in f]
        check(G2.ideal(lead).vector_space_dimension() < Infinity and
              G2.ideal(f).vector_space_dimension() ==
              prod(fi.degree() for fi in f),
              "D1 Bezout, no zeros at infinity")
    # a root at infinity: (z1 z2 - 1, z1 - 1): one finite root and [0:0:1]
    f = [x1 * x2 - 1, x1 - 1]
    check(G2.ideal(f).vector_space_dimension() == 1, "D1 one finite root")
    Lc = local_ring('a,b')     # chart xi_2 = 1, (a, b) = (xi_0, xi_1)
    a, b = Lc.gens()
    check(local_mult([b - a**2, b - a]) == 1, "D1 multiplicity 1 at infinity")

    # D2. Theorem of 19.2: mu_0(f) = order at z_n = 0 of the resultant R(f)
    # (for f_1 monic in z_1 and f_1(z_1, 0) = z_1^k the Sylvester resultant
    # is the local one; nonreduced K included).  Also theorem of 19.4:
    # this geometric multiplicity equals dim Q_{f,0}.
    for f in [[x1**2 - x2**3, x1 - x2**2 * (1 + x1)],
              [(x1 - x2)**2, x1**2 + x2**3],
              [x1**3 + x2**2 * x1 + x2**5, x1 * x2 + x2**4],
              [x1**2 - x2**4, x1 * x2**2 + x1**3]]:
        res = f[0].resultant(f[1], x1)
        ordR = min(m.degree() for m in res.monomials())
        check(ordR == local_mult([L2(str(fi)) for fi in f]),
              "D2 mu_0 = ord R(f) = dim Q_{f,0}")
    # n = 3: R(f) = norm of f_3 over Q(z3)[z1,z2]/(f1, f2)
    Fz = PolynomialRing(QQ, 'z3').fraction_field()
    Rq = PolynomialRing(Fz, 'z1,z2', order='degrevlex')
    q1, q2 = Rq.gens()
    q3 = Fz.gen()
    for f, fl in [([q1 - q3**2, q2**2 - q3**3, q1 * q2 + q3**4],
                   [y1 - y3**2, y2**2 - y3**3, y1 * y2 + y3**4]),
                  ([q1**2 - q3**3, q2 - q1 * q3, q1 + q2 + q3**2],
                   [y1**2 - y3**3, y2 - y1 * y3, y1 + y2 + y3**2])]:
        I = Rq.ideal(f[:2])
        basis = list(I.normal_basis())
        M = matrix(Fz, [[I.reduce(f[2] * bb).monomial_coefficient(m)
                         for m in basis] for bb in basis])
        normf3 = M.det()
        num, den = normf3.numerator(), normf3.denominator()
        ordR = num.valuation() - den.valuation()
        check(ordR == local_mult(fl), "D2 n = 3: ord R(f) = mu_0(f)")

    # D3. Theorem of 19.3: mu_0(f) >= prod d_0(f_j), with equality iff the
    # initial polynomials have an isolated zero (p146-orders-d0).
    exs = [([z1**2 + z2**3, z2**2 + z1**3 * z2], True),
           ([z1 * z2 + z1**3, z1**2 - z2**2 + z2**4], True),
           ([z1 + z2 + z1**2, z1 + z2 + z2**2], False),
           ([z1**2 + z2**5, z1 * z2 + z2**4], False),
           ([z1 * z2 + z1**4, z1**2 + z2**3], False),
           ([y1**2 + y3**3, y2**2 + y1**3, y3**2 + y1 * y2**2], True),
           ([y1 + y2**2, y2 + y3**2, y3 + y1**2], True),
           ([y1 * y2 + y3**3, y2 * y3 + y1**3, y1 * y3 + y2**3], False)]
    for f, isolated in exs:
        R = f[0].parent()
        d0 = [min(m.degree() for m in fi.monomials()) for fi in f]
        init = [sum(c * m for c, m in zip(fi.coefficients(), fi.monomials())
                    if m.degree() == d0[j]) for j, fi in enumerate(f)]
        G = PolynomialRing(QQ, R.variable_names())
        iso = (G.ideal([G(str(p)) for p in init]).vector_space_dimension()
               < Infinity)
        check(iso == isolated, "D3 initial system isolated or not")
        mu = local_mult(f)
        check(mu >= prod(d0) and ((mu == prod(d0)) == isolated),
              "D3 mu_0 >= prod d_0, equality iff isolated")

    # D4. Lemma 2 of 19.3 (used with p156-branch-multiplicities): if
    # (f')_* defines finitely many lines, none in {z_n = 0}, the number of
    # zeros of f'(z', 0) at 0 is d_1...d_{n-1} (= mu_1 + ... + mu_r).
    for fp in [[y1 + y3**2, y2 + y3**2],
               [y1**2 - y2**2 + y3**3, y1 * y2 + y3**4],
               [y1**2 + y1 * y3 + y2**3, y2**2 - y3**2 + y1**3]]:
        d0 = [min(m.degree() for m in fi.monomials()) for fi in fp]
        sec = [L2(str(fi.subs({y3: 0}))) for fi in fp]
        check(local_mult(sec) == prod(d0), "D4 sum of branch multiplicities")


# ======================================================== E: section 20
def section20():
    # E1. Lemma of 20.1 (p149-lemma-degree-condition): for forms P, Q of
    # degrees p, q in C^n, sigma = (P/Q) sum (-1)^{j-1} z_j dz[j] has
    # d sigma = (p + n - q) P dz/Q; generic P, Q (symbolic coefficients),
    # n = 1, 2, 3 and small degrees.
    from itertools import combinations_with_replacement
    for n in range(1, 4):
        for p, q in [(0, 1), (1, 1), (2, 1), (1, 3), (0, 2)]:
            if n == 3 and p + q > 3:
                continue
            zn = ['z%d' % j for j in range(n)]
            mP = list(combinations_with_replacement(range(n), p))
            mQ = list(combinations_with_replacement(range(n), q))
            names = (zn + ['a%d' % i for i in range(len(mP))] +
                     ['b%d' % i for i in range(len(mQ))])
            Rf = PolynomialRing(QQ, names)
            Ff = Rf.fraction_field()
            zs = [Ff(x) for x in Rf.gens()[:n]]
            As = Rf.gens()[n:n + len(mP)]
            Bs = Rf.gens()[n + len(mP):]
            Pf = sum(Ff(As[i]) * prod(zs[k] for k in mP[i])
                     for i in range(len(mP)))
            Qf = sum(Ff(Bs[i]) * prod(zs[k] for k in mQ[i])
                     for i in range(len(mQ)))
            g = Pf / Qf
            sigma = {}
            for j in range(n):
                idx = tuple(k for k in range(n) if k != j)
                sigma[idx] = (-1)**j * zs[j] * g
            ds = dform(sigma, zs)
            expected = ({tuple(range(n)): (p + n - q) * g}
                        if p + n != q else {})
            check(ds == expected,
                  "E1 d sigma = (p+n-q) omega, n=%d p=%d q=%d" % (n, p, q))
    # the printed condition p + q != n admits n = 1, P = z, Q = z^2:
    # omega = dz/z has residue 1, so it is not exact
    Lz = LaurentSeriesRing(QQ, 'z')
    zl = Lz.gen()
    n_, p_, q_ = 1, 1, 2
    check(p_ + q_ != n_ and p_ + n_ == q_,
          "E1 (n,p,q) = (1,1,2): printed condition holds, corrected one fails")
    refuted((zl / zl**2).residue() == 0,
            "E1 printed p + q != n: z dz/z^2 exact")

    # E2. Theorem of 20.1 (Macaulay): forms of degree > sum d_j - n lie in
    # I(f); the Jacobian (degree sum d_j - n) does not (exactness of (5) of
    # 20.3 in the homogeneous case).
    G2 = PolynomialRing(QQ, 'z1,z2', order='degrevlex')
    x1, x2 = G2.gens()
    G3 = PolynomialRing(QQ, 'z1,z2,z3', order='degrevlex')
    u1, u2, u3 = G3.gens()
    for f in [[x1**2 + x1 * x2 + 3 * x2**2, x1**3 - x2**3 + x1 * x2**2],
              [x1**3 + x2**3, x1 * x2**3 + x1**4 - x2**4],
              [u1**2 + u2 * u3, u2**2 + u1 * u3 + u3**2,
               u3**3 + u1**3 + u1 * u2**2]]:
        R = f[0].parent()
        n = R.ngens()
        I = R.ideal(f)
        top = sum(fi.degree() for fi in f) - n
        check(all(I.reduce(m) == 0 for m in monomials_of_degree(R, top + 1)),
              "E2 Macaulay: degree sum d - n + 1 in I(f)")
        Jac = matrix(R, n, n, lambda i, j: f[i].derivative(R.gen(j))).det()
        check(Jac.degree() == top and I.reduce(Jac) != 0,
              "E2 Jacobian not in I(f)")

    # E3. Theorem and remark of 20.2 (Noether in P_n).
    H3 = PolynomialRing(QQ, 'x0,x1,x2', order='degrevlex')
    X0, X1, X2 = H3.gens()

    def homog(p):
        d = p.degree()
        return sum(H3(c) * X0**(d - m.degree()) * X1**m.degree(x1)
                   * X2**m.degree(x2)
                   for c, m in zip(p.coefficients(), p.monomials()))
    # positive instance: no zeros at infinity, h in I(f) with cancelling top
    # degrees; h~ lies in (f~) in degree deg h
    f = [x1**2 + x2 - 1, x2**2 - x1 + 2]
    h = x2**2 * f[0] - x1**2 * f[1] + (x1 + 3) * f[0]
    lead = G2.ideal([fi.homogeneous_components()[2] for fi in f])
    check(lead.vector_space_dimension() < Infinity,
          "E3 no zeros at infinity")
    check(h.degree() == 3 and h in G2.ideal(f), "E3 h in I(f)")
    Ih = H3.ideal([homog(fi) for fi in f])
    check(Ih.reduce(homog(h)) == 0, "E3 h~ in I(f~)")
    # explicit q_j with deg q_j + deg f_j <= deg h (= 3)
    A = PolynomialRing(QQ, ['c%d' % i for i in range(6)])
    cs = A.gens()
    GA = PolynomialRing(A, 'z1,z2')
    y1, y2 = GA.gens()
    qa = cs[0] * y1 + cs[1] * y2 + cs[2]
    qb = cs[3] * y1 + cs[4] * y2 + cs[5]
    fA = [GA(str(fi)) for fi in f]
    diff_ = GA(str(h)) - qa * fA[0] - qb * fA[1]
    sol = A.ideal(diff_.coefficients())
    check(sol != A.ideal(1), "E3 representation with linear q_j exists")
    # the step of the proof: h~ lies in the local ideal of
    # F = (xi_0^{d+1}, f~_1, ..., f~_n) at 0 in C^{n+1}, d = deg h~
    # (p153-mapping-exponent; degrees: d + (sum d_i - n) + n + 1 = deg of
    # xi_0^{d+1} f~_1 ... f~_n, so pi^> applies to h~ g~ sigma/(xi_0^{d+1} f~))
    L3 = local_ring('x0,x1,x2')
    dh = h.degree()
    Floc = [L3('x0')**(dh + 1)] + [L3(str(homog(fi))) for fi in f]
    check(local_in(L3(str(homog(h))), Floc), "E3 h~ in I_0(xi_0^{d+1}, f~)")
    check(dh + (sum(fi.degree() for fi in f) - 2) + 2 + 1 ==
          (dh + 1) + sum(fi.degree() for fi in f), "E3 degrees for pi^>")
    # the remark: f = (z1, z2 - z1^2, z1^2 + z2^2), h = z2
    fr = [x1, x2 - x1**2, x1**2 + x2**2]
    check(x2 == x1 * fr[0] + fr[1], "E3 remark: z2 = z1 f1 + f2")
    Fr = [X1, X0 * X2 - X1**2, X1**2 + X2**2]
    check(H3.ideal(Fr).radical() == H3.ideal([X1, X2]),
          "E3 remark: unique zero [1:0:0]")
    Lr2 = local_ring('z1,z2')
    check(local_in(Lr2('z2'), [Lr2(str(p)) for p in fr]),
          "E3 remark: local Noether condition at 0")
    refuted(H3.ideal(Fr).reduce(X2) == 0,
            "E3 remark: xi2 in (f~) (no identity (4))")

    # E4. Proposition of 20.2 (signs).  (a) sigma restricted to xi_k = 1 is
    # (-1)^k dxi_0^..[k]..^dxi_n; (b) in the chart u_j = x_j/x_k, s = 1/x_k of
    # P_{n+1}, dx_0^...^dx_n = (-1)^{n-k+1} s^{-n-2} du[k] ^ ds, so
    # pi^>(omega) = (-1)^{n-k+1} P(u,1)/Q(u,1) du[k] ^ ds/s and
    # pi^>(omega) = (-1)^{n+1} omega ^ ds/s; (c) for omega =
    # sigma/(xi_0...xi_n), Gamma the torus |xi_j/xi_0| = 1 (int_Gamma omega =
    # (2 pi i)^n) and pi_> Gamma the cell Delta x [0,1], (t, theta) -> e^{-2 pi
    # i theta} tau(t)/|tau|, int pi^>(omega) = (-1)^{n+1} 2 pi i int_Gamma
    # omega; (d) pi_> Gamma is (-1)^{n+1} times the local cycle Gamma_0(F), F =
    # (xi_0, ..., xi_n), and (2 pi i)^{-n-1} is the normalization of res_0 F
    # (p153-residue-normalization).
    for n in range(1, 6):
        X = PolynomialRing(QQ, ['x%d' % j for j in range(n + 1)])
        xs = X.gens()
        sig = {}
        for k in range(n + 1):
            sig[tuple(j for j in range(n + 1) if j != k)] = (-1)**k * xs[k]
        for k in range(n + 1):
            restr = {}
            for I_, c in sig.items():
                if k in I_:
                    continue
                cc = c.subs({xs[k]: 1})
                if cc != 0:
                    restr[I_] = cc
            check(restr == {tuple(j for j in range(n + 1) if j != k): (-1)**k},
                  "E4a sigma on the chart xi_%d = 1, n = %d" % (k, n))
            U = PolynomialRing(QQ, ['u%d' % j for j in range(n + 1)
                                    if j != k] + ['s']).fraction_field()
            us = list(U.gens()[:-1])
            s = U.gens()[-1]
            xmap = []
            it = iter(us)
            for j in range(n + 1):
                xmap.append(1 / s if j == k else next(it) / s)
            Jm = matrix(U, n + 1, n + 1,
                        lambda i, j: xmap[i].derivative(U.gen(j)))
            check(Jm.det() == (-1)**(n - k + 1) * s**(-n - 2),
                  "E4b Jacobian of the chart, n = %d, k = %d" % (n, k))
            # pi^>(omega) / (omega ^ ds/s) = (Jacobian sign)/(sign of sigma)
            rel = (Jm.det() * s**(n + 2)) / (-1)**k
            check(rel == (-1)**(n + 1),
                  "E4b pi^>(omega) = (-1)^(n+1) omega ^ ds/s")
            if n % 2 == 0:
                refuted(rel == 1, "E4b printed pi^>(omega) = omega ^ "
                        "dxi_{n+1}/xi_{n+1}, n = %d, k = %d" % (n, k))
        # (c): pull back of the wedge of dxi_j/xi_j; basis 0..n-1: dt_k, n:
        # dtheta
        Sr = PolynomialRing(QQ, 'pi_,I_').quotient('I_^2 + 1')
        pi_, I_ = Sr.gens()
        logs = [{(n,): -2 * pi_ * I_}] + [{(k,): I_, (n,): -2 * pi_ * I_}
                                          for k in range(n)]
        pb = wedge_all(logs)
        coeff = pb[tuple(range(n + 1))]
        integral = coeff * (2 * pi_)**n       # product orientation dt ^ dtheta
        target = 2 * pi_ * I_ * (2 * pi_ * I_)**n
        check(integral == (-1)**(n + 1) * target,
              "E4c int pi^>(omega) = (-1)^(n+1) 2 pi i int omega, n = %d" % n)
        if n % 2 == 0:
            refuted(integral == target, "E4c printed (1) of 20.2, n = %d" % n)
        # (d): d arg xi_0 ^ ... ^ d arg xi_n = (dlog xi's)/i^{n+1}
        dargs = [{(n,): -2 * pi_}] + [{(k,): Sr(1), (n,): -2 * pi_}
                                      for k in range(n)]
        orient = wedge_all(dargs)[tuple(range(n + 1))]
        check(orient == (-1)**(n + 1) * (2 * pi_),
              "E4d orientation of pi_> Gamma, n = %d" % n)
        # (2 pi i)^{-n-1} int_{Gamma_0(F)} dxi/(xi_0...xi_n) = 1 = res_0 F(1):
        # int over pi_> Gamma = (-1)^{n+1} int over Gamma_0(F) = (-1)^{n+1}(2
        # pi i)^{n+1}
        check(integral == (-1)**(n + 1) * (2 * pi_ * I_)**(n + 1),
              "E4d normalization (2 pi i)^(-n-1), n = %d" % n)
        refuted(integral == (-1)**(n + 1) * (2 * pi_ * I_)**n,
                "E4d printed (2 pi i)^(-n), n = %d" % n)
    # homogeneity P(x)/Q(x) = s^{n+1} P(u,1)/Q(u,1) in the chart, n = 2, k = 0
    Hq = PolynomialRing(QQ, 'u1,u2,s').fraction_field()
    v1, v2, sv = Hq.gens()
    xm = [1 / sv, v1 / sv, v2 / sv]
    Pp = lambda a, b, c: a**2 + 3 * b * c - c**2
    Qq = lambda a, b, c: a**5 + b**4 * c + 2 * a * c**4
    check(Pp(*xm) / Qq(*xm) == sv**3 * Pp(1, v1, v2) / Qq(1, v1, v2),
          "E4b homogeneity of P/Q")
    # (e) for any chain: with xi = lam * v(t) (v depending on n real
    # parameters t), d xi_0 ^ ... ^ d xi_n = lam^n d lam ^ sigma(v), so the
    # pull back of pi^>(omega) is (d lam/lam) ^ tau^* omega on every simplex
    # (n = 1, 2, generic quadratic v): (5) holds for chains, not only cycles.
    from itertools import combinations_with_replacement
    for n in (1, 2):
        tn = ['t%d' % k for k in range(n)]
        mons = [()] + [c for dgr in (1, 2)
                       for c in combinations_with_replacement(range(n), dgr)]
        cn = ['c%d_%d' % (j, i)
              for j in range(n + 1) for i in range(len(mons))]
        Rv = PolynomialRing(QQ, tn + ['lam'] + cn)
        ts, lam = Rv.gens()[:n], Rv.gens()[n]
        cc = Rv.gens()[n + 1:]
        vv = [sum(cc[j * len(mons) + i] * prod(ts[k] for k in mons[i])
                  for i in range(len(mons))) for j in range(n + 1)]
        coords = list(ts) + [lam]
        dxi = [dform({(): lam * vv[j]}, coords) for j in range(n + 1)]
        lhs = wedge_all(dxi)
        sigv = {}
        for k in range(n + 1):
            term = {(): (-1)**k * vv[k]}
            for j in range(n + 1):
                if j != k:
                    term = wedge(term, dform({(): vv[j]}, coords))
            for key, val in term.items():
                sigv[key] = sigv.get(key, 0) + val
        sigv = {kk: vv_ for kk, vv_ in sigv.items() if vv_ != 0}
        rhs = wedge({(n,): lam**n}, sigv)
        check(lhs == rhs, "E4e d xi = lam^n d lam ^ sigma(v), n = %d" % n)
    # the cycle delta Gamma~ of 20.2 (m4-p153-coboundary-cycle): the condition
    # |f~_i(xi)| = eps |xi_0|^{d_i} is invariant under xi -> lam xi, the
    # printed |f~_i(xi)| = eps/tau^{d_i} is not; in the chart xi_{n+1} = 1,
    # |xi_0| = 1/tau
    fq = lambda a, b: a * b + b**2              # a form of degree 2
    pt, lam_ = (QQ(1), QQ(2)), QQ(3)
    eps_ = abs(fq(*pt)) / abs(pt[0])**2
    check(abs(fq(lam_ * pt[0], lam_ * pt[1])) == eps_ * abs(lam_ * pt[0])**2,
          "E4f eps |xi_0|^d is homogeneous")
    refuted(abs(fq(lam_ * pt[0], lam_ * pt[1])) == abs(fq(*pt)),
            "E4f printed eps/tau^d (a condition on the representative)")

    # E5. Theorem of 20.3 and the lemma (p155-blowup-exponent,
    # p156-branch-multiplicities, p156-alpha-bound, m4-p155-remainder-term).
    # Example n = 2: f = (z1 + z2^3, z1 z2 + z2^5), d = (1, 2), mu = 4.
    L2 = local_ring('z1,z2')
    a1, a2 = L2.gens()
    fl = [a1 + a2**3, a1 * a2 + a2**5]
    mu = local_mult(fl)
    D, dd = 1 * 2, 1 + 2 - 2 + 1
    beta = mu - D + dd
    check(mu == 4 and local_order(fl) == beta == 4,
          "E5 n=2: rho = beta = 4 (bound (4) attained)")
    W = PolynomialRing(QQ, 'w1,w2')
    b1, b2 = W.gens()
    fstar = [(b1 * b2 + b2**3) / b2, (b1 * b2 * b2 + b2**5) / b2**2]
    fstar = [W(p) for p in fstar]
    check(fstar == [b1 + b2**2, b1 + b2**3],
          "E5 f_j^* = w_n^{-d_j} f_j(sigma(w))")
    init = [b1, b1]                               # (f_j)_*(w', 1)
    check(all((fstar[j] - init[j]) % b2 == 0 for j in range(2)),
          "E5 f_j^* = (f_j)_*(w',1) + w_n g_j(w)")
    refuted(fstar[0] - init[0] == b2 * (b1 + b2**3),
            "E5 printed (f_j)_*(w',1) + w_n f_j(w)")
    Lw = local_ring('w1,w2')
    check(local_mult([Lw(str(p)) for p in fstar]) == mu - D,
          "E5 lemma: mu(f^*) = mu - d_1...d_n")
    # resultants: R(z2) = f2(-z2^3, z2), R^*(w2) = f2^*(-w2^2, w2) = w2^{-d1
    # d2} R
    T = PolynomialRing(QQ, 'u')
    uu = T.gen()
    Rz = T((-uu**3) * uu + uu**5)
    Rs = T((-uu**2) + uu**3)
    check(Rs * uu**(1 * 2) == Rz, "E5 R^*(u) = u^{-d_1 d_2} R(u)")
    refuted(Rs * uu**(2 * (1 * 2)) == Rz, "E5 printed sum mu_nu = d_1 d_2")
    # residues (7): res_0 f(z^alpha) = res_a f^*(w1^a1 w2^{|alpha| - d}); f1,
    # f1^* are linear in the first variable, so both are one-variable residues
    Lr = LaurentSeriesRing(QQ, 'x', default_prec=40)
    xx = Lr.gen()
    for al in [(i, j) for i in range(5) for j in range(7)]:
        left = ((-xx**3)**al[0] * xx**al[1]
                / ((-xx**3) * xx + xx**5)).residue()
        e = al[0] + al[1] - dd
        right = ((-xx**2)**al[0] * xx**e / ((-xx**2) + xx**3)).residue()
        check(left == right, "E5 (7) for alpha = %s" % (al,))
        if sum(al) >= beta:
            check(left == 0,
                  "E5 (8): res_0 f(z^alpha) = 0 for |alpha| >= beta")
    check(((-xx**3)**0 * xx**3 / ((-xx**3) * xx + xx**5)).residue() != 0,
          "E5 a nonzero residue below beta")
    # Example n = 3: f = (z1 + z3^2, z2 + z3^2, z1 z2 + z3^5), d = (1,1,2), mu
    # = 4
    L3 = local_ring('z1,z2,z3')
    c1, c2, c3 = L3.gens()
    f3 = [c1 + c3**2, c2 + c3**2, c1 * c2 + c3**5]
    mu3 = local_mult(f3)
    beta3 = mu3 - 2 + (1 + 1 + 2 - 3 + 1)
    check(mu3 == 4 and local_order(f3) <= beta3, "E5 n=3: rho <= beta")
    W3 = local_ring('w1,w2,w3')
    e1, e2, e3 = W3.gens()
    # w3^{-d_j} f_j(w1 w3, w2 w3, w3)
    fs3 = [e1 + e3, e2 + e3, e1 * e2 + e3**3]
    check(local_mult(fs3) == mu3 - 2, "E5 n=3 lemma: mu(f^*) = mu - d1 d2 d3")
    check(local_mult([c1 + c3**2, c2 + c3**2, c3]) == 1,
          "E5 n=3: one branch, mu_1 = d1 d2 = 1")
    # bound (5): isolated initial system => rho = sum d - n + 1 and the
    # Jacobian, of order sum d - n, is not in I_a(f)
    for f in [[a1**2 + a2**3, a2**2 + a1**3 * a2],
              [a1 * a2 + a1**3, a1**2 - a2**2 + a2**4],
              [c1**2 + c3**3, c2**2 + c1**3, c3**2 + c1 * c2**2]]:
        R = f[0].parent()
        n = R.ngens()
        ds_ = [min(m.degree() for m in fi.monomials()) for fi in f]
        check(local_mult(f) == prod(ds_) and
              local_order(f) == sum(ds_) - n + 1,
              "E5 bound (5) attained")
        Jac = matrix(R, n, n, lambda i, j: f[i].derivative(R.gen(j))).det()
        check(min(m.degree() for m in Jac.monomials()) == sum(ds_) - n and
              not local_in(Jac, f), "E5 Jacobian not in I_a(f)")
    # absolute bound (1): rho <= mu
    for f in [[a1**3 - a2**2, a1 * a2], [a1 + a2**3, a1 * a2 + a2**5],
              [a1**2 + a2**5, a1 * a2 + a2**4]]:
        check(local_order(f) <= local_mult(f), "E5 absolute bound rho <= mu")

    # E6. Proposition of 20.4: Hefer determinant H = sum chi_k(zeta) psi_k(z);
    # for the proper f = (z1^2 + z2, z2^2 - z1) the psi_k span Q[z]/(f) (so
    # generate C[z] over C[w]), and h in I(f) iff Res_f(h psi_k) = 0 for all k.
    R4 = PolynomialRing(QQ, 'u1,u2,z1,z2')
    U1, U2, Z1, Z2 = R4.gens()
    fu = [U1**2 + U2, U2**2 - U1]
    H = matrix(R4, [[U1 + Z1, 1], [-1, U2 + Z2]]).det()
    fz = [p.subs({U1: Z1, U2: Z2}) for p in fu]
    check(fu[0] - fz[0] == (U1 - Z1) * (U1 + Z1) + (U2 - Z2) and
          fu[1] - fz[1] == (U1 - Z1) * (-1) + (U2 - Z2) * (U2 + Z2),
          "E6 Hefer expansions")
    psis = sorted(set(m.subs({U1: 1, U2: 1}) for m in H.monomials()))
    G = PolynomialRing(QQ, 'z1,z2')
    psisG = [G(str(p)) for p in psis]
    Ig = G.ideal([G('z1^2 + z2'), G('z2^2 - z1')])
    basis = list(Ig.normal_basis())
    Mspan = matrix(QQ, [[Ig.reduce(p).monomial_coefficient(m)
                         for m in basis] for p in psisG])
    check(Mspan.rank() == len(basis), "E6 psi_k span Q[z]/(f)")
    Fg = [G('z1^2 + z2'), G('z2^2 - z1')]
    for hh, inI in [(G('z1'), False), (G('z1*z2 + 1'), False),
                    (G('z1') * Fg[0] + G('z2^3') * Fg[1], True)]:
        allzero = all(total_residue_simple(hh * p, Fg) == 0 for p in psisG)
        check(allzero == inI and (hh in Ig) == inI,
              "E6 global duality criterion")


if __name__ == "__main__":
    section16()
    section17()
    section18()
    section19()
    section20()
    print("ok ch4: %d checks" % COUNT[0])
