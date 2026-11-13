"""Exact checks of Chapter V, "Applications to the Calculation of Double
Series and Integrals", §§21-23 and the notes (printed pp. 161-175).

Run: sage -python checks/sage/ch5.py (plain asserts; do not use -O).
The last line of the output is "ok ch5: N checks".

Book: A. K. Tsikh, Multidimensional Residues and Their Applications, AMS
Translations of Mathematical Monographs 103, 1992.  Pages are the printed
pages, numbers of subsections and formulas those of the book; the ids in
parentheses are the entries of corrections.json.  Expected values are the
book's formulas, written below as literals (with the corrections where
marked); the Typst sources are not parsed.  Where the book is wrong, the
printed reading is kept as a refuted check (`refuted`: the printed reading
must fail) beside the corrected one.

Conventions (§5.1): res_a f (h) = (2 pi i)^(-2) int h dz/(f_1 f_2) over
{|f_1| = e_1, |f_2| = e_2} oriented by d arg f_1 ^ d arg f_2; at a simple
zero it is h(a)/J_f(a), J_f = det(df_j/dz_k) (Cauchy's formula, §5.3).
Local residues at multiple zeros are computed with the same orientation:
after a linear change w = A(z - a) with w_2 = the linear factor of f_2
through a (or of f_1, with a sign, when f_2 has several), the cycle
{|f_1| = e_1, |w_2^p| = e_2} gives the iterated integral
res = [w_2^(p-1)] sum_(zeros of f_1(., w_2) near 0) res_(w_1) H/f_1, with
H = h/(det A * unit of f_2); at simple zeros this reproduces h/J (checked).

Exact arithmetic only: Q, Q(i), Q(sqrt 2), Q(sqrt 5), QQbar (exact
absolute values), polynomial and rational function rings over them with
symbolic parameters, truncated power series, Singular standard bases in a
local ordering (intersection multiplicities), and Sage's exact symbolic
integration of u^(2n)/sqrt(1 - u^2) on [0, 1].  The integrals over R^2 of
§23 are computed independently of the book by Fubini and the
one-variable residue theorem (int_R P/Q dx = 2 pi i sum_(Im p > 0) res_p,
deg Q >= deg P + 2, no real poles; both conditions are asserted), so every
integral is exact: I/(2 pi i)^2 is an element of Q(i) or Q(i)(r1, r2, r3).
No floating-point value is used.

What is checked:

A  §21 (pp. 161-168).
   A1 21.1, (1)-(2) (p162-rational-b): for a = 1/(1 - z)(1 + 2z),
      b = 1/(1 - 3z)^2 = P/(z - beta)^2, beta = 1/3, the integrand of (2)
      has the denominator (t - beta z)^2; the residue at z = t/beta equals
      the Hadamard composition sum a_k b_k t^k (to degree 30), whose poles
      are exactly the products alpha_j beta = 1/3, -1/6.
   A2 21.2: A . A = C^2 for A = {z1 + z2 = 1}.
   A3 Example 1 (p166-example-form, p166-jacobian-argument,
      p166-discriminant): a(z) a(t/z)/z1 z2 is the corrected form, the
      printed one differs; no pole on the line at infinity for the
      corrected form, a pole for the printed one; F1, F2 meet in exactly two
      points; z^(1)(t) of the book solves the system, J = (z2 - z1) +
      (t1 - t2), J(z^(1)) = s, s^2 = (1 - t1 - t2)^2 - 4 t1 t2, s(0) = 1;
      the series sum binom(m+n, n)^2 t1^m t2^n is 1/s (to total degree
      24), the printed discriminant refuted; the printed form gives
      H(0) = 0 (refuted); second equality of (5) (total sum); on the
      diagonal t1 = t2: (1 - 4t)^(-1/2).  The recipe after the proof: the
      eliminant of z2 has constant leading coefficient (R_Pi empty) and
      discriminant s^2 (R_b); the printed (6) as one equation N - Q = 0
      (p165-system-6) defines a curve, the system N = Q = 0 two points.
   A4 Example 2: the composition is sum binom(2n, n)^2 (t1 t2 t3)^n (on
      all monomials with exponents <= 10), (2n)! = n! 2^n (2n - 1)!!, the
      hypergeometric coefficients, and the elliptic integral
      (2/pi) int_0^1 u^(2n) du/sqrt(1 - u^2) = binom(2n, n)/4^n (n <= 12,
      exact symbolic integrals), whence the series of
      (2/pi) int_0^1 du/sqrt((1 - u^2)(1 - u^2 xi)).
   A5 21.3: the diagonal of G = 1/(1 - z1 - z2) by local residues (the
      lemma of 21.2 for the integrand (3)): p = q = 1 gives
      1/sqrt(1 - 4t); p = 2, q = 1: the residues in U_(+-) are
      1/(2 - 3 z1) at the two small roots of z1^2 (1 - z1) = t, their sum
      is -1/(2 - 3 z1) at the third root (the trace over all roots is 0),
      and this is sum binom(3k, k) t^k (to degree 30); the ramification
      set: the discriminant t(4 - 27 t); no poles (monic eliminants).
      For G = a(z1) b(z2) the (1, 1)-diagonal (2) is the Hadamard
      composition (p167-diagonal-formula).
B  §22 (pp. 168-172).
   B1 (1) and (2) of 22.1: Q Y = P X for a two-dimensional filter with
      q_0 = 1 (exponents <= 8).
   B2 Theorem of 22.2 for G = 1/(3 - z1 - z2), holomorphic in the closed
      bidisk: J = sum binom(2N, N)/9^(N+1) = 1/(3 sqrt 5) (Vandermonde and
      the binomial series), equal to the residue in U_(+-) and to minus
      the residue in U_(-+).
   B3 Example of 22.2: G(z) G(1/z)/z1 z2 = -(z1 - z2)^2/f1 f2
      (p172-example-sign; printed sign refuted); deg f1 f2 - deg h = 4, no
      pole at infinity, and the pole order criterion "no less than three"
      (p172-degree-at-infinity; "no more than three" refuted on this
      example); F1 and F2 meet in 8 = 2 * 4 points counted with
      multiplicity, none at infinity: (1, 1), (-1, -1) of multiplicity 2
      on Gamma and four simple points, exactly a^(1), a^(2) in U_(+-);
      the residues there are sqrt(2)/16 (printed form: -sqrt(2)/16,
      refuted); sum sqrt(2)/8, and minus the sum over U_(-+) is the same.
      J computed independently: the Taylor coefficients
      (binom(2k, m-1) - binom(2k, m))/4^(k+1) on m + n = 2k + 1 (to degree
      40), sum over m of their squares 2 Cat(2k)/16^(k+1) (k <= 100;
      Vandermonde gives it for all k), the Catalan generating function and
      Abel's theorem: J = (1/8)(c(1/4) + c(-1/4))/2 = sqrt(2)/8.
   B4 The proof of the theorem of 22.2 on this example: R = L f1 + S f2
      with R the resultant in z2 (lift in Q[z1, z2]); the residues of
      omega' = h L dz/R f2 at a^(1), a^(2) equal those of omega; the inner
      integral I(z1)/(2 pi i) over |z2| = 1 (for |z1| = 1, z1 != +-1, the
      zeros z1/(2 z1 - 1), -z1/(2 z1 + 1) of f2 lie inside |z2| < 1 and
      those of f1, +-2 - z1, outside, by the triangle inequality; so it is
      the sum of the residues at the zeros of f2) is the same rational
      function for omega and omega' (the S-term drops), it has no poles on
      |z1| = 1 although R vanishes at z1 = +-1, and the sum of its
      residues in |z1| < 1 is sqrt(2)/8 (QQbar); with the printed sign of
      omega it is -sqrt(2)/8 < 0, impossible for a sum of squares.
C  §23 (pp. 172-175).
   C1 23.1: int_R dx/(x^2 + 1) = pi = 2 pi i res_i; the sum of residues
      alone, as printed, is -i/2 (refuted); the curve
      z1^2 + z2^2 + R = 0 is smooth.
   C2 Lemma of 23.2: Im phi_(j+) = a_j Im z1 + r_j on c_+ (and the minus
      case); the chart equation a_j z'_2 + b_j z'_1 + (c_j +- i r_j)
      z'_1 z'_2 = z'_1 z'_2 phi_(j+-) (p174-chart-prime; printed refuted);
      for a_j = 0, Im z'_2 = +-b_j r_j/(c_j^2 + r_j^2) != 0; for b_j = 0,
      Im z'_1 = +-a_j r_j/(c_j^2 + r_j^2) while Im(1/z1) = -Im z1/|z1|^2
      (p174-imaginary-sign; printed signs refuted).  The Cayley map
      w = (i - z)/(i + z): |i - z|^2 - |i + z|^2 = -4 Im z, its inverse,
      and dw/dx has argument derivative 2/(1 + x^2) > 0 on R; so
      {|w2| > 1} is {Im z2 < 0}.
   C3 Theorem of 23.2, formula (3) (p173-residue-sign,
      p173-residue-domain), on four integrands, I computed independently:
      T1 G = 1/(x1^2 + 1)(x2^2 + 1): I = pi^2, the residue at (-i, i) is
         -1/4, at (i, -i) 1/4;
      T2 the example of 23.2 with symbolic r1, r2, r3 > 0:
         I = pi^2/r1 r2 r3 (r1 + r2 + r3) identically; the six common
         zeros of f_-, f_+, three in each half; the three printed residues
         equal the local residues (also by the iterated method) and their
         sum is -1/4 r1 r2 r3 (r1 + r2 + r3); the roots are simple and
         distinct exactly off r1 + r3 = r2, r2 + r3 = r1;
      T3 the degenerate cases (r1, r2, r3) = (1, 2, 1) and (2, 1, 1): a
         double root, residues with multiplicity, same I;
      T4 G = (2 + x1 - 3 x1^2 + 5 x1 x2)/(x1^2 + 1)^2 (x2^2 + 4)^2
         ((x1 - x2 + 1)^2 + 9): roots of multiplicity 2, 4, 2 in each
         half-plane;
      in all cases I = (2 pi i)^2 sum over C x C_+ = -(2 pi i)^2 sum over
      C x C_-, and the printed (3) gives -I (refuted).  The example's
      "the integral I is equal to the sum of these residues" (p. 175) is
      refuted: the sum is -I/(4 pi^2).

Not established: the general theorems of the chapter (the theorem and the
lemma of 21.2, the proposition of 21.3, the theorems of 22.2 and 23.2) are
checked only on the stated examples; Hadamard's theorem, the proposition of
22.2 and its remark (Tsikh, 1985) are not checked; the transcendence of
F(1/2, 1/2, 1, xi) is not checked (it is classical); the identities of
power series are checked to the stated degrees, not proved, except where
noted.  The bounded steps of the lemma of 23.2 (signs of imaginary parts,
the chart at infinity, the Cayley map) are proved in Lean in
checks/lean/TsikhResidues/Ch5.lean.
"""

from sage.all import *

COUNT = [0]

# Under sage -python, binomial and factorial of Python ints return Python
# ints, and int/int is a float: wrap them so that all arithmetic is in ZZ.
_sage_binomial, _sage_factorial = binomial, factorial


def binomial(a, b):
    return ZZ(_sage_binomial(ZZ(a), ZZ(b)))


def factorial(n):
    return ZZ(_sage_factorial(ZZ(n)))


def dfact(n):
    """(2n - 1)!! in ZZ."""
    return prod([ZZ(j) for j in range(1, 2 * n, 2)], ZZ(1))


def check(cond, label):
    assert cond, label
    COUNT[0] += 1


def refuted(cond, label):
    """The printed reading `cond` must be false."""
    assert not cond, "printed reading unexpectedly holds: " + label
    COUNT[0] += 1


QI = QuadraticField(-1, 'i')
II = QI.gen()


def residue_1d(N, D, p):
    """Residue at x = p of N/D (polynomials in one variable over a field
    containing p)."""
    S = D.parent()
    x = S.gen()
    Ns = S(N)(x + p)
    Ds = D(x + p)
    m = Ds.valuation()
    if m == 0:
        return S.base_ring()(0)
    D1 = Ds.shift(-m)
    inv = D1.inverse_mod(x**m)
    return ((Ns * inv) % (x**m))[m - 1]


def low_terms_vanish(P, N):
    """All monomials of the polynomial P have total degree > N."""
    return all(sum(e) > N for e in P.dict())


def im_qi(e):
    return QI(e).list()[1]


def re_qi(e):
    return QI(e).list()[0]


def pole_order_at_infinity(h, f, R):
    """For omega = h dz1 ^ dz2/f on P_2: the exponent of u in the
    coefficient of du ^ dv in the chart z1 = 1/u, z2 = v/u (and the
    symmetric chart).  omega has no pole on the line at infinity iff it is
    >= 0."""
    B = PolynomialRing(R.base_ring(), 'u,v')
    u, v = B.gens()
    F = B.fraction_field()
    out = []
    for z1, z2 in [(1 / F(u), F(v) / u), (F(v) / u, 1 / F(u))]:
        jac = (matrix(F, [[F(z1).derivative(u), F(z1).derivative(v)],
                          [F(z2).derivative(u), F(z2).derivative(v)]])
               .det())
        c = F(h(z1, z2)) / F(f(z1, z2)) * jac
        num, den = c.numerator(), c.denominator()
        val = (min(m.degree(u) for m in num.monomials())
               - min(m.degree(u) for m in den.monomials()))
        out.append(val)
    assert out[0] == out[1]
    return out[0]


# ======================================================== A: section 21
def section21():
    # A1. 21.1: one-dimensional Hadamard composition by (1)-(2).
    Rt = PolynomialRing(QQ, 't')
    t = Rt.gen()
    Ft = Rt.fraction_field()
    S = PolynomialRing(Ft, 'z')
    z = S.gen()
    beta = QQ(1) / 3
    # b(z) = 1/(1 - 3z)^2 = P/(z - beta)^2 with P = 1/9; b(t/z)/z has the
    # denominator (t - beta z)^2 of f(z, t) = z^m prod (t - beta_k z)^(r_k),
    # m = 0 (p162-rational-b: the poles are beta_k, not the coefficients).
    bt = (QQ(1) / 9) / ((Ft(t) / z - beta)**2 * z)   # b(t/z)/z, in Frac(S)
    check(bt == (QQ(1) / 9) * z / (t - beta * z)**2,
          "A1 b(t/z)/z = P z/(t - beta z)^2")
    N = (QQ(1) / 9) * z
    D = (1 - z) * (1 + 2 * z) * (t - beta * z)**2
    H = residue_1d(N, D, Ft(3 * t))     # the pole t/beta inside |z| = eps
    Ps = PowerSeriesRing(QQ, 'T', default_prec=31)
    T = Ps.gen()
    Hser = Ps(H.numerator()(T)) / Ps(H.denominator()(T))
    ak = [(1 + 2 * (-2)**k) / QQ(3) for k in range(31)]
    bk = [(k + 1) * 3**k for k in range(31)]
    check(all(Hser[k] == ak[k] * bk[k] for k in range(31)),
          "A1 res of (2) = Hadamard composition, degree 30")
    poles = sorted(rt for rt, _ in H.denominator().roots(QQ))
    check(poles == sorted([QQ(1) / 3, QQ(-1) / 6]),
          "A1 singularities alpha_j beta_k = 1/3, -1/6")

    # A2. 21.2: A . A = C^2 for A = {z1 + z2 = 1}: for every t the
    # quadratic s^2 + (t2 - t1 - 1) s + t1 has a root s, and
    # (s, 1 - s) . (t1/s, t2/(1 - s)) = t with t1/s + t2/(1 - s) = 1.
    B = PolynomialRing(QQ, 't1,t2,s')
    t1, t2, s = B.gens()
    q = s**2 + (t2 - t1 - 1) * s + t1
    # t1 (1 - s) + t2 s - s (1 - s) is q up to sign
    check(t1 * (1 - s) + t2 * s - s * (1 - s) == q,
          "A2 w = t/z lies on A iff s solves the quadratic")

    # A3. Example 1.
    R4 = PolynomialRing(QQ, 't1,t2,z1,z2')
    t1, t2, z1, z2 = R4.gens()
    F4 = R4.fraction_field()
    a = lambda x, y: 1 / (1 - F4(x) - F4(y))
    form = a(z1, z2) * a(t1 / F4(z1), t2 / F4(z2)) / (z1 * z2)
    f1 = 1 - z1 - z2
    f2 = z1 * z2 - t2 * z1 - t1 * z2
    check(form == 1 / F4(f1 * f2), "A3 corrected omega (p166-example-form)")
    printed1 = 1 / (F4(f1) * (1 - t1 / F4(z1) - t2 / F4(z2)))
    printed2 = F4(z1 * z2) / F4(f1 * f2)
    check(printed1 == printed2, "A3 the two printed expressions agree")
    refuted(printed1 == form, "A3 printed omega lacks 1/z1 z2")
    Rz = PolynomialRing(PolynomialRing(QQ, 't1,t2').fraction_field(),
                        'z1,z2')
    Z1, Z2 = Rz.gens()
    T1, T2 = [Rz.base_ring()(g) for g in
              PolynomialRing(QQ, 't1,t2').gens()]
    g1 = 1 - Z1 - Z2
    g2 = Z1 * Z2 - T2 * Z1 - T1 * Z2
    check(pole_order_at_infinity(Rz(1), g1 * g2, Rz) == 0,
          "A3 corrected omega: no pole on the line at infinity")
    check(pole_order_at_infinity(Z1 * Z2, g1 * g2, Rz) < 0,
          "A3 printed omega has a pole on the line at infinity")
    Ig = Rz.ideal([g1, g2])
    check(Ig.dimension() == 0 and Ig.vector_space_dimension() == 2,
          "A3 F1, F2 meet in two points (with multiplicity)")
    # the printed system (6) as one equation N - Q = 0 is a curve
    refuted(Rz.ideal([g1 - g2]).dimension() == 0,
            "A3 printed (6) N - Q = 0 defines finitely many points")
    # z^(1)(t) in Q[t1, t2, s]/(s^2 - Delta)
    Bs = PolynomialRing(QQ, 't1,t2,s')
    t1, t2, s = Bs.gens()
    Delta = (1 - t1 - t2)**2 - 4 * t1 * t2
    Iq = Bs.ideal([s**2 - Delta])
    check((1 + t1 - t2)**2 - 4 * t1 == Delta,
          "A3 4((1 + t1 - t2)^2/4 - t1) = (1 - t1 - t2)^2 - 4 t1 t2")
    zz1 = (1 + t1 - t2 - s) / 2   # (1 + t1 - t2)/2 - sqrt(...), 2 sqrt = s
    zz2 = 1 - zz1
    ff1 = lambda x, y: 1 - x - y
    ff2 = lambda x, y: x * y - t2 * x - t1 * y
    check(Iq.reduce(ff1(zz1, zz2)) == 0 and Iq.reduce(ff2(zz1, zz2)) == 0,
          "A3 z^(1)(t) lies on F1 and F2")
    Jf = lambda x, y: (y - x) + (t1 - t2)
    # J = det d(f1, f2)/d(z1, z2) = det [[-1, -1], [z2 - t2, z1 - t1]]
    check(matrix([[g1.derivative(Z1), g1.derivative(Z2)],
                  [g2.derivative(Z1), g2.derivative(Z2)]]).det()
          == (Z2 - Z1) + (T1 - T2), "A3 Jacobian of the system")
    check(Iq.reduce(Jf(zz1, zz2) - s) == 0,
          "A3 J(z^(1)(t), t) = s, s^2 = Delta (p166-jacobian-argument)")
    # at t = 0 the branch s(0) = 1 gives z^(1)(0) = (0, 1) in U_(+-)
    check(zz1.subs(t1=0, t2=0, s=1) == 0 and zz2.subs(t1=0, t2=0, s=1) == 1,
          "A3 z^(1)(0) = (0, 1)")
    # the other point: s -> -s, J = -s, so -res = 1/s (second equality)
    zz1b = (1 + t1 - t2 + s) / 2
    check(Iq.reduce(Jf(zz1b, 1 - zz1b) + s) == 0,
          "A3 J at z^(2)(t) is -s: total sum of residues zero")
    # the residue 1/s is the series sum binom(m + n, n)^2 t1^m t2^n
    Np = 24
    P2 = PolynomialRing(QQ, 't1,t2')
    u1, u2 = P2.gens()
    Tser = sum(binomial(m + n, n)**2 * u1**m * u2**n
               for m in range(Np + 1) for n in range(Np + 1 - m))
    D2 = (1 - u1 - u2)**2 - 4 * u1 * u2
    check(low_terms_vanish(Tser**2 * D2 - 1, Np),
          "A3 H_(a,a)^2 ((1 - t1 - t2)^2 - 4 t1 t2) = 1 to degree 24 "
          "(p166-discriminant)")
    Dprinted = (1 - u1 - u2)**2 - 4 * u1 * 4 * u2
    refuted(low_terms_vanish(Tser**2 * Dprinted - 1, Np),
            "A3 printed discriminant (1 - t1 - t2)^2 - 4 t1 4 t2")
    # the printed form: residue z1 z2/J at z^(1)(0) = (0, 1), J = 1: 0 != 1
    refuted((zz1 * zz2).subs(t1=0, t2=0, s=1) == 1,
            "A3 printed omega gives H(0) = 1")
    # diagonal t1 = t2 = x: Delta = 1 - 4x and H = sum binom(2N, N) x^N
    Px = PolynomialRing(QQ, 'x')
    x = Px.gen()
    check(D2(x, x) == 1 - 4 * x, "A3 Delta(x, x) = 1 - 4x")
    check(all(sum(binomial(N, m)**2 for m in range(N + 1))
              == binomial(2 * N, N) for N in range(40)),
          "A3 Vandermonde on the diagonal")
    # recipe after the proof: eliminate z2 from (6)
    Rq = PolynomialRing(QQ, 't1,t2,z1,z2')
    t1, t2, z1, z2 = Rq.gens()
    R1 = (1 - z1 - z2).resultant(z1 * z2 - t2 * z1 - t1 * z2, z2)
    P1 = R1.polynomial(z1)
    check(P1.degree() == 2 and P1.leading_coefficient() in QQ
          and P1.leading_coefficient() != 0,
          "A3 eliminant in z1 has constant leading coefficient: R_Pi empty")
    disc = P1.discriminant()
    check(disc == (1 - t1 - t2)**2 - 4 * t1 * t2,
          "A3 the branch curve R_b is Delta = 0")

    # A4. Example 2.
    M = 10
    R3 = PolynomialRing(QQ, 'z1,z2,z3')
    y1, y2, y3 = R3.gens()

    def trunc_geom(w, deg):
        out = R3(0)
        powr = R3(1)
        for k in range(deg + 1):
            out += powr
            powr = powr * w
        return out
    A = trunc_geom(y1 + y2 * y3, 3 * M)
    Bb = trunc_geom(y1 * y2 + y3, 3 * M)
    ok = True
    for e1 in range(M + 1):
        for e2 in range(M + 1):
            for e3 in range(M + 1):
                c = (A.monomial_coefficient(y1**e1 * y2**e2 * y3**e3)
                     * Bb.monomial_coefficient(y1**e1 * y2**e2 * y3**e3))
                expect = (binomial(2 * e1, e1)**2
                          if e1 == e2 == e3 else 0)
                ok = ok and c == expect
    check(ok, "A4 H_(a,b) = sum binom(2n, n)^2 (t1 t2 t3)^n, exponents <= 10")
    check(all(factorial(2 * n) == factorial(n) * 2**n
              * dfact(n) for n in srange(40)),
          "A4 (2n)! = n! 2^n (2n - 1)!!")
    check(all(dfact(n)**2 / (factorial(n)**2 * 2**(2 * n))
              * 16**n == binomial(2 * n, n)**2 for n in srange(40)),
          "A4 [(2n - 1)!!]^2/(n!)^2 2^(2n) 16^n = binom(2n, n)^2")
    check(all(rising_factorial(QQ(1) / 2, n)**2 / factorial(n)**2
              == dfact(n)**2 / (factorial(n)**2 * 2**(2 * n))
              for n in srange(40)),
          "A4 coefficients of F(1/2, 1/2, 1, xi)")
    uu = var('uu')
    check(all(bool(2 / pi * integrate(uu**(2 * n) / sqrt(1 - uu**2),
                                      uu, 0, 1)
                   == binomial(2 * n, n) / 4**n) for n in srange(13)),
          "A4 (2/pi) int_0^1 u^(2n)/sqrt(1 - u^2) = binom(2n, n)/4^n")
    # (1 - u^2 xi)^(-1/2) = sum binom(2n, n)/4^n (u^2 xi)^n
    Pxi = PowerSeriesRing(QQ, 'xi', default_prec=20)
    xi = Pxi.gen()
    check((1 - xi).sqrt().inverse()
          == sum(binomial(2 * n, n) / QQ(4)**n * xi**n for n in range(20))
          + O(xi**20), "A4 binomial series of (1 - xi)^(-1/2)")

    # A5. 21.3: diagonals of G = 1/(1 - z1 - z2).
    Bd = PolynomialRing(QQ, 't,s')
    t, s = Bd.gens()
    Id = Bd.ideal([s**2 - (1 - 4 * t)])
    w1, w2 = (1 - s) / 2, (1 + s) / 2   # small root w1, w2 = 1 - w1
    check(Id.reduce(w1 * w2 - t) == 0, "A5 p = q = 1: point of the system")
    # res = h/J, h = 1, J = det [[-1, -1], [z2, z1]] = z2 - z1 = s
    check(Id.reduce((w2 - w1) - s) == 0, "A5 p = q = 1: J = sqrt(1 - 4t)")
    Pt = PowerSeriesRing(QQ, 'T', default_prec=31)
    T = Pt.gen()
    d11 = sum(binomial(2 * k, k) * T**k for k in range(31)) + O(T**31)
    check(d11**2 * (1 - 4 * T) == 1 + O(T**31),
          "A5 d_(1,1) = 1/sqrt(1 - 4t)")
    # p = 2, q = 1: omega = z1 dz/(1 - z1 - z2)(z1^2 z2 - t); on
    # z2 = 1 - z1: z1^2 (1 - z1) = t; J = det [[-1, -1], [2 z1 z2, z1^2]]
    Rz = PolynomialRing(QQ, 'z1,z2')
    z1, z2 = Rz.gens()
    check(matrix([[-1, -1], [2 * z1 * z2, z1**2]]).det()
          == 2 * z1 * z2 - z1**2, "A5 Jacobian, p = 2, q = 1")
    Ftt = PolynomialRing(QQ, 't').fraction_field()
    tt = Ftt.gen()
    Pz = PolynomialRing(Ftt, 'Z')
    Z = Pz.gen()
    cub = Z**3 - Z**2 + tt          # = -(z1^2 (1 - z1) - t)
    Mc = companion_matrix(cub, format='right')
    trace_all = (2 * identity_matrix(Ftt, 3) - 3 * Mc).inverse().trace()
    check(trace_all == 0,
          "A5 sum over all roots of 1/(2 - 3 z1) = z1/(2 z1 z2 - z1^2) is 0")
    # the root near 1 by Newton in Q[[t]]
    rho = Pt(1)
    for _ in range(8):
        rho = rho - (rho**3 - rho**2 + T) / (3 * rho**2 - 2 * rho)
    check(rho**3 - rho**2 + T == O(T**31), "A5 the root near z1 = 1")
    d21 = -1 / (2 - 3 * rho)
    check(d21 == sum(binomial(3 * k, k) * T**k for k in range(31))
          + O(T**31), "A5 d_(2,1) = sum binom(3k, k) t^k = sum of the "
          "residues at the two small roots")
    Pc = PolynomialRing(QQ, 't')
    tq = Pc.gen()
    discq = PolynomialRing(Pc, 'Z')([tq, 0, -1, 1]).discriminant()
    check(discq == tq * (4 - 27 * tq),
          "A5 ramification set: discriminant t(4 - 27t)")
    # G = a(z1) b(z2): the (1,1)-diagonal (2) is the Hadamard composition
    a_k = [QQ(1)] * 12
    b_k = [QQ(2)**k for k in range(12)]
    Rg = PolynomialRing(QQ, 'z1,z2')
    z1, z2 = Rg.gens()
    Gp = (sum(a_k[k] * z1**k for k in range(12))
          * sum(b_k[k] * z2**k for k in range(12)))
    check(all(Gp.monomial_coefficient(z1**k * z2**k) == a_k[k] * b_k[k]
              for k in range(12)),
          "A5 diagonal (2) of a(z1) b(z2) = Hadamard composition "
          "(p167-diagonal-formula)")


# ======================================================== B: section 22
def section22():
    # B1. (1) <=> Q Y = P X with q_0 = 1.
    Rf = PolynomialRing(QQ, 'z1,z2')
    z1, z2 = Rf.gens()
    Pf = 2 + z1 - 3 * z2 + z1 * z2
    Qf = 1 - z1 / 2 + z2 / 3 - z1 * z2 / 5
    X = sum(QQ((7 * k1 + 3 * k2) % 11 - 5) * z1**k1 * z2**k2
            for k1 in range(9) for k2 in range(9))
    p = {e: Pf.monomial_coefficient(z1**e[0] * z2**e[1])
         for e in [(0, 0), (1, 0), (0, 1), (1, 1)]}
    qq = {e: Qf.monomial_coefficient(z1**e[0] * z2**e[1])
          for e in [(0, 0), (1, 0), (0, 1), (1, 1)]}
    check(qq[(0, 0)] == 1, "B1 q_0 = 1")
    xk = {(k1, k2): X.monomial_coefficient(z1**k1 * z2**k2)
          for k1 in range(9) for k2 in range(9)}
    yk = {}
    for k1 in range(9):
        for k2 in range(9):
            val = sum(p[l] * xk[(k1 - l[0], k2 - l[1])] for l in p
                      if l[0] <= k1 and l[1] <= k2)
            val -= sum(qq[l] * yk[(k1 - l[0], k2 - l[1])] for l in qq
                       if l != (0, 0) and l[0] <= k1 and l[1] <= k2)
            yk[(k1, k2)] = val
    Y = sum(yk[e] * z1**e[0] * z2**e[1] for e in yk)
    diff_ = Qf * Y - Pf * X
    check(all(e[0] > 8 or e[1] > 8 for e in diff_.dict()),
          "B1 the recursion (1) gives Q Y = P X")

    # B2. Theorem of 22.2 for G = 1/(3 - z1 - z2): J = sum
    # binom(m + n, n)^2/9^(m+n+1) = (1/9) sum binom(2N, N)/9^N
    # = (1/9)(1 - 4/9)^(-1/2) = 1/(3 sqrt 5).
    K5 = QuadraticField(5, 's5')
    s5 = K5.gen()
    check(s5 > 0, "B2 sqrt 5 > 0 in the embedding")
    Jval = (1 / K5(9)) * 3 / s5          # (1 - 4/9)^(-1/2) = 3/sqrt 5
    check(Jval == 1 / (3 * s5), "B2 J = 1/(3 sqrt 5)")
    # omega = G(z) G(1/z) dz/z1 z2 = dz/(3 - z1 - z2)(3 z1 z2 - z1 - z2)
    F = Rf.fraction_field()
    G = 1 / F(3 - z1 - z2)
    om = G * G.subs(z1=1 / F(z1), z2=1 / F(z2)) / (z1 * z2)
    h1, e1, e2 = 1, 3 - z1 - z2, 3 * z1 * z2 - z1 - z2
    check(om == 1 / F(e1 * e2), "B2 the form omega")
    Jm = matrix([[e1.derivative(z1), e1.derivative(z2)],
                 [e2.derivative(z1), e2.derivative(z2)]]).det()
    pts = [((3 - s5) / 2, (3 + s5) / 2), ((3 + s5) / 2, (3 - s5) / 2)]
    for (c1, c2) in pts:
        check(e1(c1, c2) == 0 and e2(c1, c2) == 0, "B2 common zero")
    check(pts[0][0]**2 < 1 and pts[0][1]**2 > 1
          and pts[1][0]**2 > 1 and pts[1][1]**2 < 1,
          "B2 one point in U_(+-), one in U_(-+)")
    r_pm = 1 / Jm(*pts[0])
    r_mp = 1 / Jm(*pts[1])
    check(r_pm == Jval and -r_mp == Jval,
          "B2 J = res over U_(+-) = -res over U_(-+)")

    # B3. The example of 22.2.
    G = F(z1 - z2) / F((2 - z1 - z2) * (2 + z1 + z2))
    om = G * G.subs(z1=1 / F(z1), z2=1 / F(z2)) / (z1 * z2)
    f1 = (2 - z1 - z2) * (2 + z1 + z2)
    f2 = (2 * z1 * z2 - z1 - z2) * (2 * z1 * z2 + z1 + z2)
    h = -(z1 - z2)**2
    check(om == F(h) / F(f1 * f2),
          "B3 omega = -(z1 - z2)^2 dz/f1 f2 (p172-example-sign)")
    refuted(om == F((z1 - z2)**2) / F(f1 * f2),
            "B3 printed omega = (z1 - z2)^2 dz/f1 f2")
    check(f1.degree() + f2.degree() - h.degree() == 4,
          "B3 the degrees differ by 4")
    check(pole_order_at_infinity(h, f1 * f2, Rf) >= 0,
          "B3 no pole on the line at infinity")
    # criterion: the order of the pole is deg h + 3 - deg f1 f2, so "no
    # pole" iff deg f1 f2 - deg h >= 3 (p172-degree-at-infinity)
    check(pole_order_at_infinity(h, f1 * f2, Rf)
          == f1.degree() + f2.degree() - h.degree() - 3,
          "B3 pole order = deg f1 f2 - deg h - 3")
    check(pole_order_at_infinity(Rf(1), z1 * z2 * (z1 + z2 + 1), Rf)
          == 0, "B3 difference exactly 3: no pole")
    check(pole_order_at_infinity(z1, z1 * z2 * (z1 + z2 + 1), Rf)
          < 0, "B3 difference 2: a pole")
    refuted(f1.degree() + f2.degree() - h.degree() <= 3,
            "B3 printed 'exceeds by no more than three'")
    # zeros of the denominator on the closed bidisk: only (1, 1), (-1, -1)
    # (Re z1 + Re z2 = +-2 with |z_j| <= 1), where the numerator vanishes
    check((z1 - z2)(1, 1) == 0 and (z1 - z2)(-1, -1) == 0,
          "B3 numerator vanishes at (1, 1), (-1, -1)")
    Ib = Rf.ideal([f1, f2])
    check(Ib.dimension() == 0 and Ib.vector_space_dimension() == 8,
          "B3 F1 . F2 = 8 = 2 * 4 affine: nothing at infinity")
    Rl = PolynomialRing(QQ, 'x,y', order='negdegrevlex')
    x, y = Rl.gens()
    for (c1, c2) in [(1, 1), (-1, -1)]:
        loc = Rl.ideal([f1(x + c1, y + c2), f2(x + c1, y + c2)])
        check(loc.vector_space_dimension() == 2,
              "B3 multiplicity 2 at (%d, %d)" % (c1, c2))
    K2 = QuadraticField(2, 's2')
    s2 = K2.gen()
    check(s2 > 0, "B3 sqrt 2 > 0 in the embedding")
    simple = [(1 - s2, 1 + s2), (-1 + s2, -1 - s2),
              (1 + s2, 1 - s2), (-1 - s2, -1 + s2)]
    J = matrix([[f1.derivative(z1), f1.derivative(z2)],
                [f2.derivative(z1), f2.derivative(z2)]]).det()
    for (c1, c2) in simple:
        check(f1(c1, c2) == 0 and f2(c1, c2) == 0 and J(c1, c2) != 0,
              "B3 simple common zero")
    in_pm = [(c1, c2) for (c1, c2) in simple if c1**2 < 1 and c2**2 > 1]
    in_mp = [(c1, c2) for (c1, c2) in simple if c1**2 > 1 and c2**2 < 1]
    check(in_pm == [(1 - s2, 1 + s2), (-1 + s2, -1 - s2)]
          and len(in_mp) == 2, "B3 a^(1), a^(2) are the points in U_(+-)")
    # a_(+-)^(infinity) = (z0 : z1 : z2) = (0 : 0 : 1): the top-degree part
    # of f1 (its restriction to z0 = 0) does not vanish at (z1, z2) = (0, 1)
    top1 = sum(cf * m for cf, m in zip(f1.coefficients(), f1.monomials())
               if m.degree() == f1.degree())
    check(top1(0, 1) != 0, "B3 a_(+-)^(infinity) is not on F1")
    res_pm = [h(c1, c2) / J(c1, c2) for (c1, c2) in in_pm]
    check(all(rv == s2 / 16 for rv in res_pm),
          "B3 res_(a^(j)) omega = sqrt(2)/16")
    refuted(all(-h(c1, c2) / J(c1, c2) == s2 / 16 for (c1, c2) in in_pm),
            "B3 printed omega gives sqrt(2)/16")
    check(sum(res_pm) == s2 / 8, "B3 J = sqrt(2)/8 by (2)")
    check(-sum(h(c1, c2) / J(c1, c2) for (c1, c2) in in_mp) == s2 / 8,
          "B3 second equality of (2)")
    # independent value of J: Taylor coefficients of G
    Ntay = 40
    Tg = Rf(0)
    for k in range((Ntay + 1) // 2):
        for m in range(2 * k + 2):
            n = 2 * k + 1 - m
            cm = ((binomial(2 * k, m - 1) if m >= 1 else 0)
                  - binomial(2 * k, m)) / QQ(4)**(k + 1)
            Tg += cm * z1**m * z2**n
    check(low_terms_vanish((4 - (z1 + z2)**2) * Tg - (z1 - z2), Ntay),
          "B3 Taylor coefficients of G to degree 40")
    cat = lambda n: binomial(2 * n, n) / (n + 1)
    check(all(sum(((binomial(2 * k, m - 1) if m >= 1 else 0)
                   - binomial(2 * k, m))**2 for m in range(2 * k + 2))
              == 2 * cat(2 * k) for k in range(101)),
          "B3 sum over m of squares = 2 Cat(2k), k <= 100")
    Py = PowerSeriesRing(QQ, 'Y', default_prec=61)
    Yv = Py.gen()
    c = sum(cat(n) * Yv**n for n in range(61)) + O(Yv**61)
    check(Yv * c**2 - c + 1 == O(Yv**61), "B3 y c^2 - c + 1 = 0")
    # Abel: sum Cat(n)/4^n converges, c(1/4) = 2 (double root of
    # c^2/4 - c + 1); sum Cat(n)(-1/4)^n converges (alternating), its value
    # lies in [3/4, 1] and is a root of -c^2/4 - c + 1, i.e. 2 sqrt 2 - 2.
    cp = K2(2)
    cm_ = 2 * s2 - 2
    check(cp**2 / 4 - cp + 1 == 0 and -cm_**2 / 4 - cm_ + 1 == 0
          and QQ(3) / 4 <= cm_ <= 1, "B3 c(1/4) = 2, c(-1/4) = 2 sqrt 2 - 2")
    Jclosed = (cp + cm_) / 2 / 8   # sum 2 Cat(2k)/16^(k+1)
    check(Jclosed == s2 / 8, "B3 sum of squares of the coefficients = "
          "sqrt(2)/8")

    # B4. The proof of the theorem on the example.
    Rres = f1.resultant(f2, z2)
    check(Rres.degree(z2) == 0, "B4 R = R(z1)")
    L, Ss = Rres.lift(Rf.ideal([f1, f2]))
    check(L * f1 + Ss * f2 == Rres, "B4 R = L f1 + S f2")
    check(matrix([[L, Ss], [0, 1]]).det() == L, "B4 determinant L")
    Jp = matrix([[Rres.derivative(z1), 0],
                 [f2.derivative(z1), f2.derivative(z2)]]).det()
    for (c1, c2) in in_pm:
        check(Rres.derivative(z1)(c1, c2) != 0
              and h(c1, c2) * L(c1, c2) / Jp(c1, c2) == s2 / 16,
              "B4 res of omega' = res of omega")
    Fz = PolynomialRing(QQ, 'z1').fraction_field()
    Sz = PolynomialRing(Fz, 'Z2')
    Z2 = Sz.gen()
    zz = Fz.gen()
    conv = lambda P: Sz(P(zz, Z2))
    rts = [zz / (2 * zz - 1), -zz / (2 * zz + 1)]   # zeros of f2 in z2
    check(all(conv(f2)(rt) == 0 for rt in rts), "B4 zeros of f2 in z2")
    kappa = sum(residue_1d(conv(h), conv(f1 * f2), rt) for rt in rts)
    iota = sum(residue_1d(conv(h * L), conv(Rres * f2), rt) for rt in rts)
    check(kappa == iota, "B4 the S-term drops: same inner integral")
    for sign_, expect in [(1, QQbar(2).sqrt() / 8),
                          (-1, -QQbar(2).sqrt() / 8)]:
        kap = sign_ * kappa
        den = kap.denominator()
        num = kap.numerator()
        PQ = PolynomialRing(QQbar, 'X')
        tot = QQbar(0)
        on_circle = False
        for fac, _ in den.factor():
            for rt in fac.roots(QQbar, multiplicities=False):
                if rt.abs() == 1:
                    on_circle = True
                if rt.abs() < 1:
                    tot += residue_1d(PQ(num), PQ(den), rt)
        check(not on_circle, "B4 I(z1) has no poles on |z1| = 1")
        if sign_ == 1:
            check(tot == expect, "B4 J = sum of residues of I(z1)/2 pi i "
                  "in |z1| < 1 = sqrt(2)/8")
            check(Rres(1, 0) == 0 and Rres(-1, 0) == 0,
                  "B4 although R(+-1) = 0")
        else:
            refuted(tot > 0, "B4 printed omega: iterated integral is "
                    "positive (it is -sqrt(2)/8)")


# ======================================================== C: section 23
def lin_coeffs(phi, z1, z2):
    return (phi.monomial_coefficient(z1), phi.monomial_coefficient(z2),
            phi.constant_coefficient())


def local_residue(h, F1, F2, a):
    """res_a of h dz/(f1 f2) with respect to the ordered pair (f1, f2),
    f_k = prod phi^q over F_k (linear phi).  Iterated method of the
    docstring; requires one factor of f2 through a (else one of f1)."""
    R2 = h.parent()
    K = R2.base_ring()
    z1, z2 = R2.gens()
    S1 = [(phi, q) for (phi, q) in F1 if phi(a[0], a[1]) == 0]
    S2 = [(phi, q) for (phi, q) in F2 if phi(a[0], a[1]) == 0]
    assert S1 and S2
    if len(S2) != 1:
        assert len(S1) == 1
        return -local_residue(h, F2, F1, a)
    psi, p = S2[0]
    al1, al2, _ = lin_coeffs(psi, z1, z2)
    lrow = [1, 0] if al2 != 0 else [0, 1]
    A = matrix(K, [lrow, [al1, al2]])
    detA = A.det()
    assert detA != 0
    T = PolynomialRing(K, 'w1,w2')
    w1, w2 = T.gens()
    Ai = A.inverse()
    zw = [a[0] + Ai[0, 0] * w1 + Ai[0, 1] * w2,
          a[1] + Ai[1, 0] * w1 + Ai[1, 1] * w2]
    sub = lambda P: P(zw[0], zw[1])
    assert sub(psi) == w2
    u2 = T(1)
    used = False
    for (phi, q) in F2:
        if phi == psi and q == p and not used:
            used = True
            continue
        u2 *= sub(phi)**q
    g1 = T(1)
    for (phi, q) in F1:
        g1 *= sub(phi)**q
    Lv = PolynomialRing(K, 'v')
    v = Lv.gen()
    Lf = Lv.fraction_field()
    Lx = PolynomialRing(Lf, 'x')

    def to_Lx(P):
        d = {}
        for (e1, e2), c in P.dict().items():
            d[e1] = d.get(e1, Lv(0)) + c * v**e2
        return Lx({k: Lf(val) for k, val in d.items()})
    N = to_Lx(sub(h))
    D = to_Lx(detA * u2 * g1)
    poles = []
    for (phi, q) in S1:
        mu, nu, c0 = lin_coeffs(sub(phi), w1, w2)
        assert c0 == 0 and mu != 0
        pl = Lf(-nu * v / mu)
        if pl not in poles:
            poles.append(pl)
    rho = sum(residue_1d(N, D, pl) for pl in poles)
    num, den = Lv(rho.numerator()), Lv(rho.denominator())
    assert den(0) != 0
    inv = den.inverse_mod(v**p)
    return ((num * inv) % v**p)[p - 1]


def theorem23(F0, factors, hfun, outer=None, im_sign=None):
    """For G = h/prod((a x1 + b x2 + c)^2 + r^2)^q (a, b, c in Q, r in F0
    positive): returns (I/(2 pi i)^2 by iterated residues, sum of local
    residues over C x C_+, over C x C_-, the points).  `outer` gives the
    outer poles (upper, all) when F0 has parameters; `im_sign(e)` decides
    the sign of Im e for e in F0."""
    i = F0(II)
    U = PolynomialRing(F0, 'X1')
    X1 = U.gen()
    Kx = U.fraction_field()
    S = PolynomialRing(Kx, 'X2')
    X2 = S.gen()
    D = prod(((a * X1 + b * X2 + c)**2 + r**2)**q
             for (a, b, c, r, q) in factors)
    N = S(hfun(Kx(X1), X2))
    check(D.degree() - N.degree() >= 2, "C3 inner integral converges")
    allp, upper = [], []
    for (a, b, c, r, q) in factors:
        if b == 0:
            continue
        for sg in (1, -1):
            pl = Kx(-(a * X1 + c + sg * i * r) / b)   # Im = -sg r/b
            if pl not in allp:
                allp.append(pl)
                if -sg * b > 0:
                    upper.append(pl)
    check(sum(D(X2 + pl).valuation() for pl in allp) == D.degree(),
          "C3 all poles in x2 listed (none real)")
    S1 = sum(residue_1d(N, D, pl) for pl in upper)
    N1, D1 = S1.numerator(), S1.denominator()
    check(D1.degree() - N1.degree() >= 2, "C3 outer integral converges")
    if outer is None:
        rts = D1.roots(QI)
        check(sum(m for _, m in rts) == D1.degree()
              and all(im_qi(rt) != 0 for rt, _ in rts),
              "C3 outer poles in Q(i), none real")
        up1 = [rt for rt, _ in rts if im_qi(rt) > 0]
    else:
        up1, all1 = outer
        check(sum(D1(X1 + pl).valuation() for pl in all1) == D1.degree(),
              "C3 all outer poles listed")
    Ival = sum(residue_1d(N1, D1, pl) for pl in up1)
    # local residues
    R2 = PolynomialRing(F0, 'z1,z2')
    z1, z2 = R2.gens()
    Fm = [(a * z1 + b * z2 + c - i * r, q) for (a, b, c, r, q) in factors]
    Fp = [(a * z1 + b * z2 + c + i * r, q) for (a, b, c, r, q) in factors]
    h = R2(hfun(z1, z2))
    pts = []
    for (phi, _) in Fm:
        for (psi, _) in Fp:
            m1 = lin_coeffs(phi, z1, z2)
            m2 = lin_coeffs(psi, z1, z2)
            Mx = matrix(F0, [[m1[0], m1[1]], [m2[0], m2[1]]])
            if Mx.det() == 0:
                # parallel: no common point
                continue
            sol = Mx.solve_right(vector(F0, [-m1[2], -m2[2]]))
            pt = (sol[0], sol[1])
            if pt not in pts:
                pts.append(pt)
    sign = im_sign if im_sign is not None else (
        lambda e: 1 if im_qi(e) > 0 else (-1 if im_qi(e) < 0 else 0))
    up = [pt for pt in pts if sign(pt[1]) == 1]
    lo = [pt for pt in pts if sign(pt[1]) == -1]
    check(len(up) + len(lo) == len(pts), "C3 no common zero with Im z2 = 0")
    res = {pt: local_residue(h, Fm, Fp, pt) for pt in pts}
    return Ival, sum(res[pt] for pt in up), sum(res[pt] for pt in lo), \
        up, lo, res, (R2, Fm, Fp, h)


def section23():
    # C1. 23.1.
    Px = PolynomialRing(QI, 'x')
    x = Px.gen()
    r_i = residue_1d(Px(1), x**2 + 1, II)
    check(r_i == 1 / (2 * II), "C1 res_i 1/(x^2 + 1) = 1/2i")
    # int_R dx/(x^2 + 1) = pi: I/(2 pi i) = 1/(2i) = r_i
    check(r_i == QI(1) / (2 * II), "C1 int = 2 pi i res (corrected)")
    refuted(im_qi(r_i) == 0 and re_qi(r_i) > 0,
            "C1 printed: the integral pi equals the sum of residues -i/2")
    Rk = PolynomialRing(PolynomialRing(QQ, 'Rp').fraction_field(), 'z1,z2')
    y1, y2 = Rk.gens()
    Rp = Rk.base_ring().gen()
    check(Rk.ideal([y1**2 + y2**2 + Rp, 2 * y1, 2 * y2]) == Rk.ideal(1),
          "C1 K is smooth (R != 0)")

    # C2. Lemma of 23.2.
    Bl = PolynomialRing(QI, 'a,b,c,r,x,y,x2')
    a, b, c, r, x, y, x2 = Bl.gens()

    def im_poly(P):
        return sum(im_qi(cf) * m for cf, m in zip(P.coefficients(),
                                                   P.monomials()))
    # z1 = x + i y on c_+ (y >= 0), z2 = x2 real
    for sg in (1, -1):
        phi = a * (x + II * y) + b * x2 + c + sg * II * r
        check(im_poly(phi) == a * y + sg * r,
              "C2 Im phi_(j+-) = a_j Im z1 +- r_j")
    Fl = Bl.fraction_field()
    zp1, zp2 = Fl(x), Fl(y)   # z'_1, z'_2 as letters
    for sg in (1, -1):
        phi = a / zp1 + b / zp2 + c + sg * II * r
        check(zp1 * zp2 * phi == a * zp2 + b * zp1
              + (c + sg * II * r) * zp1 * zp2,
              "C2 chart equation (p174-chart-prime)")
        printed = a * Fl(x2) + b * zp1 + (c + sg * II * r) * zp1 * zp2
        refuted(printed == zp1 * zp2 * phi.subs(x2=x2),
                "C2 printed chart equation a_j z_2 + ...")
    # Im(-b/(c +- i r)) and Im(-a/(c +- i r)): multiply by the conjugate
    for sg in (1, -1):
        w = -(c - sg * II * r)            # -(c -+ i r), so
        # -a/(c +- i r) = a w/(c^2 + r^2)
        check(Fl(-1) / (c + sg * II * r) == Fl(w) / (c**2 + r**2),
              "C2 1/(c +- i r)")
        check(im_poly(a * w) == sg * a * r,
              "C2 Im z' = +-a_j r_j/(c_j^2 + r_j^2) (p174-imaginary-sign)")
    # on c_+: Im(1/z1) = -y/(x^2 + y^2) <= 0; F_(j+) has Im z'_1 > 0
    check(Fl(1) / (x + II * y) == Fl(x - II * y) / (x**2 + y**2)
          and im_poly(x - II * y) == -y, "C2 Im(1/z1) = -Im z1/|z1|^2")
    # printed: Im z'_1 < 0 on F_(j+): refuted for a = r = 1, c = 0
    zprime = QI(-1) / (0 + II * 1)
    refuted(im_qi(zprime) < 0, "C2 printed Im z'_1 < 0 on F_(j+)")
    # Cayley map
    check((x**2 + (1 - y)**2) - (x**2 + (1 + y)**2) == -4 * y,
          "C2 |i - z|^2 - |i + z|^2 = -4 Im z")
    Fw = PolynomialRing(QI, 'w').fraction_field()
    w = Fw.gen()
    zw = II * (1 - w) / (1 + w)
    check((II - zw) / (II + zw) == w, "C2 inverse z = i(1 - w)/(1 + w)")
    Fx = PolynomialRing(QQ, 'x').fraction_field()
    xx = Fx.gen()
    # w = (i - x)/(i + x), w'/w = 2i/(1 + x^2): d arg w/dx = 2/(1 + x^2)
    Fxi = PolynomialRing(QI, 'x').fraction_field()
    xi_ = Fxi.gen()
    wx = (II - xi_) / (II + xi_)
    check(wx.derivative(xi_) / wx == 2 * II / (1 + xi_**2),
          "C2 the real line goes counterclockwise round |w| = 1")

    # C3. Formula (3).
    # T1: G = 1/(x1^2 + 1)(x2^2 + 1), I = pi^2 = (2 pi i)^2 (-1/4).
    fac1 = [(0, 1, 0, QI(1), 1), (1, 0, 0, QI(1), 1)]
    Iv, sp, sm, up, lo, res, _ = theorem23(QI, fac1, lambda X1, X2: 1)
    check(Iv == QI(-1) / 4, "C3 T1 I/(2 pi i)^2 = -1/4, i.e. I = pi^2")
    check(up == [(-II, II)] and res[(-II, II)] == QI(-1) / 4
          and lo == [(II, -II)] and res[(II, -II)] == QI(1) / 4,
          "C3 T1 residues -1/4 at (-i, i), 1/4 at (i, -i)")
    check(Iv == sp and Iv == -sm, "C3 T1 corrected (3)")
    refuted(Iv == sm or Iv == -sp, "C3 T1 printed (3)")

    # T2: the example, symbolic r1, r2, r3 > 0.
    P3 = PolynomialRing(QI, 'r1,r2,r3')
    F3 = P3.fraction_field()
    r1, r2, r3 = [F3(g) for g in P3.gens()]
    i = F3(II)

    def im_sign_r(e):
        num, den = P3(e.numerator()), P3(e.denominator())
        assert all(im_qi(cf) == 0 for cf in den.coefficients())
        dsign = 1 if all(re_qi(cf) > 0 for cf in den.coefficients()) \
            else (-1 if all(re_qi(cf) < 0 for cf in den.coefficients())
                  else None)
        ims = [im_qi(cf) for cf in num.coefficients()]
        assert dsign is not None and all(v != 0 for v in ims)
        if all(v > 0 for v in ims):
            return dsign
        if all(v < 0 for v in ims):
            return -dsign
        raise ValueError("sign of Im undecided")
    fac2 = [(1, 0, 0, r1, 1), (0, 1, 0, r2, 1), (1, 1, 0, r3, 1)]
    up1 = [i * r1, i * (r2 + r3)]
    all1 = up1 + [-i * r1, -i * (r2 + r3)]
    Iv, sp, sm, up, lo, res, (R2, Fm, Fp, h) = theorem23(
        F3, fac2, lambda X1, X2: 1, outer=(up1, all1), im_sign=im_sign_r)
    closed = -1 / (4 * r1 * r2 * r3 * (r1 + r2 + r3))
    check(Iv == closed, "C3 T2 I = pi^2/r1 r2 r3 (r1 + r2 + r3), i.e. "
          "I/(2 pi i)^2 = -1/4 r1 r2 r3 (r1 + r2 + r3)")
    a1 = (-i * r1, i * r2)
    a2 = (-i * r1, i * (r1 + r3))
    a3 = (-i * (r2 + r3), i * r2)
    check(len(up) == 3 and set(up) == {a1, a2, a3} and len(lo) == 3,
          "C3 T2 six common zeros, a^(1), a^(2), a^(3) in Im z2 > 0")
    z1, z2 = R2.gens()
    fm = prod(phi for phi, _ in Fm)
    fp = prod(phi for phi, _ in Fp)
    Jm = matrix([[fm.derivative(z1), fm.derivative(z2)],
                 [fp.derivative(z1), fp.derivative(z2)]]).det()
    for pt in up + lo:
        check(Jm(*pt) != 0 and res[pt] == 1 / Jm(*pt),
              "C3 T2 iterated residue = h/J at a simple root")
    printed = [
        (a1, lambda u, v: -1 / ((u - i * r1) * (v + i * r2)
                                * ((u + v)**2 + r3**2))),
        (a2, lambda u, v: -1 / ((u - i * r1) * (v**2 + r2**2)
                                * (u + v + i * r3))),
        (a3, lambda u, v: -1 / ((u**2 + r1**2) * (v + i * r2)
                                * (u + v - i * r3)))]
    for pt, ex in printed:
        check(ex(*pt) == res[pt], "C3 T2 printed residue at a^(k)")
    check(sp == closed, "C3 T2 the sum of the three residues")
    check(Iv == sp and Iv == -sm, "C3 T2 corrected (3)")
    refuted(Iv == sm or Iv == -sp, "C3 T2 printed (3)")
    # p. 175: "the integral I is equal to the sum of these residues":
    # I = (2 pi i)^2 Iv = -4 pi^2 Iv, so I = sp would need
    # pi^2 = -sp/(4 Iv), which is -1/4 < 0.
    need = -sp / (4 * Iv)
    check(need == F3(-1) / 4, "C3 T2 I = sum would need pi^2 = -1/4")
    refuted(QQ(-1) / 4 > 0, "C3 T2 printed: I equals the sum of residues")
    # distinct and simple exactly off r1 + r3 = r2 and r2 + r3 = r1
    Pr = PolynomialRing(QQ, 'r1,r2,r3')
    q1, q2, q3 = Pr.gens()
    good = {q1 + q2, q1 + q3, q2 + q3, q1 + q2 + q3, q1, q2, q3}
    for pt in (a1, a2, a3):
        Jv = Jm(*pt)
        num = P3(Jv.numerator())
        # J = i^k * real polynomial; factors over Q
        cf = [cfx for cfx in num.coefficients()]
        unit = cf[0]
        realpoly = Pr({e: (cfx / unit).list()[0]
                       for e, cfx in num.dict().items()})
        assert all((cfx / unit).list()[1] == 0 for cfx in cf)
        facs = {fct for fct, _ in realpoly.factor()}
        bad = {fct for fct in facs if fct not in good and -fct not in good}
        check(bad <= {q1 - q2 + q3, -q1 + q2 + q3, q1 - q2 - q3,
                      -q1 + q2 - q3},
              "C3 T2 J(a^(k)) vanishes only for r1 + r3 = r2, r2 + r3 = r1")
    # a^(1) = a^(2) iff r2 = r1 + r3; a^(1) = a^(3) iff r1 = r2 + r3;
    # a^(2) = a^(3) would force r3 = 0
    check(a2[1] - a1[1] == i * (r1 + r3 - r2) and a3[0] - a1[0]
          == -i * (r2 + r3 - r1) and a1[0] == a2[0] and a1[1] == a3[1],
          "C3 T2 the roots coincide exactly when r1 + r3 = r2 or "
          "r2 + r3 = r1")

    # T3: degenerate cases.
    for (v1, v2, v3) in [(1, 2, 1), (2, 1, 1)]:
        fac3 = [(1, 0, 0, QI(v1), 1), (0, 1, 0, QI(v2), 1),
                (1, 1, 0, QI(v3), 1)]
        Iv, sp, sm, up, lo, res, _ = theorem23(QI, fac3, lambda X1, X2: 1)
        check(Iv == QI(-1) / (4 * v1 * v2 * v3 * (v1 + v2 + v3)),
              "C3 T3 I = pi^2/r1 r2 r3 (r1 + r2 + r3) at (%d, %d, %d)"
              % (v1, v2, v3))
        check(len(up) == 2, "C3 T3 two roots in Im z2 > 0, one multiple")
        check(Iv == sp and Iv == -sm, "C3 T3 corrected (3), multiple root")
        refuted(Iv == sm, "C3 T3 printed (3)")

    # T4: multiplicities 2, 4, 2; h not constant; a skew factor.
    fac4 = [(1, 0, 0, QI(1), 2), (0, 1, 0, QI(2), 2), (1, -1, 1, QI(3), 1)]
    hf = lambda X1, X2: 2 + X1 - 3 * X1**2 + 5 * X1 * X2
    Iv, sp, sm, up, lo, res, (R2, Fm, Fp, h) = theorem23(QI, fac4, hf)
    check(set(up) == {(II, 1 + 4 * II), (-II, 2 * II), (-1 - II, 2 * II)}
          and len(lo) == 3, "C3 T4 three roots in each half")
    check(Iv != 0 and Iv == sp and Iv == -sm, "C3 T4 corrected (3)")
    refuted(Iv == sm or Iv == -sp, "C3 T4 printed (3)")


if __name__ == "__main__":
    section21()
    section22()
    section23()
    print("ok ch5: %d checks" % COUNT[0])
