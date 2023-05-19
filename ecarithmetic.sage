
# Elliptic Curve Arithmetic Operations

# Import necessary libraries
from hashlib import sha256
import random
from sage.rings.finite_rings.integer_mod_ring import IntegerModRing

# Visualizing Points on an Elliptic Curve
a, b = -1, 1
E = EllipticCurve([a, b])
plot(E, xmin=-3, xmax=3, ymin=-3, ymax=3)

# Define the secp256k1 elliptic curve
p = 2^256 - 2^32 - 977
F = IntegerModRing(p)
E = EllipticCurve(F, [0, 7])

# Performing Point Addition on Elliptic Curves
P = E.random_element()
Q = E.random_element()
R = P + Q
print (" P+Q = ", R)

# Point Doubling 
P = E.random_element()
R = 2 * P
print (" 2*P = ", R)

# Efficient Scalar Multiplication
P = E.random_element()
k = randint(1, E.order() - 1)
R = k * P
print(" k*P = ", R)

# Computing the inverse of a point
P = E.random_element()
P_inv = -P
print(" P_inv = ", P_inv)

# Verifying Associativity and Commutativity in Elliptic Curve Arithmetic
P = E.random_element()
Q = E.random_element()
R = E.random_element()

# Verify associativity: (P + Q) + R == P + (Q + R)
print ((P + Q) + R == P + (Q + R))

# Verify commutativity: P + Q == Q + P
print (P + Q == Q + P)

# Visualizing Elliptic Curve Arithmetic Operations
p = 13
F = IntegerModRing(p)
E = EllipticCurve(F, [0, 7])

def plot_points_on_curve(E, points, labels, colors):
    curve_plot = plot(E, xmin=-5, xmax=5, ymin=-5, ymax=5)
    real_points = [(float(pt[0]), float(pt[1])) for pt in points]
    point_plots = [point2d(pt, color=colors[i], size=30, zorder=5) + text(labels[i], pt, fontsize=10, color=colors[i], horizontal_alignment='left', vertical_alignment='bottom') for i, pt in enumerate(real_points)]
    return curve_plot + sum(point_plots)

P = E.random_element()
Q = E.random_element()
R = P + Q

plot_points_on_curve(E, [P.xy(), Q.xy(), R.xy()], ['P', 'Q', 'R'], ['red', 'blue', 'green'])

# Executing multiscalar multiplication in SageMath
n1 = randint(1, E.order() - 1)
n2 = randint(1, E.order() - 1)
P1 = E.random_point()
P2 = E.random_point()
multiscalar_result = n1 * P1 + n2 * P2
print("multiscalar_result ",multiscalar_result)

# Find points on an elliptic curve
p = 13
F = IntegerModRing(p)
E = EllipticCurve(F, [0, 7])
points = E.points()
print(points)

# Define the secp256k1 elliptic curve
p = 2^256 - 2^32 - 977
F = IntegerModRing(p)
E = EllipticCurve(F, [0, 7])
G = E.lift_x(55066263022277343669578718895168534326250603453777594175500187360389116729240)

# ECC: Key generation, encryption, and decryption
a = randint(1, E.order() - 1)
A = a * G
b = randint(1, E.order() - 1)
B = b * G
shared_secret_A = a * B
shared_secret_B = b * A
assert shared_secret_A == shared_secret_B

# ECDSA: Key generation, signing, and verification
d = randint(1, E.order() - 1)
Q = d * G
message = b"Hello, world!"
hash_value = int.from_bytes(sha256(message).digest(), 'big')
k = randint(1, E.order() - 1)
R = k * G
r = R[0] % E.order()
s = ((hash_value + d * r) * inverse_mod(k, E.order())) % E.order()
w = inverse_mod(s, E.order())
u1 = (hash_value * w) % E.order()
u2 = (r * w) % E.order()
X = u1 * G + u2 * Q
assert r % E.order() == X[0] % E.order()

# ECDH: Key exchange
a = randint(1, E.order() - 1)
A = a * G
b = randint(1, E.order() - 1)
B = b * G
shared_secret_A = a * B
shared_secret_B = b * A
assert shared_secret_A == shared_secret_B

# Ethereum: Key generation and address derivation
private_key = randint(1, E.order() - 1)
public_key = private_key * G
address = sha256(str(public_key).encode()).hexdigest()[-40:]
print("Ethereum address:", address)

# Plonk: KZG commitment example
def kzg_commit(poly_coeffs, G):
    return sum(coeff * (G * i) for i, coeff in enumerate(poly_coeffs))

poly_coeffs = [1, 2, 3, 4]
C = kzg_commit(poly_coeffs, G)

