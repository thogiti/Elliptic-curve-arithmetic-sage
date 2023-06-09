
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

# Executing multiscalar multiplication in SageMath
p = 13
F = IntegerModRing(p)
E = EllipticCurve(F, [0, 7])

points = [E.random_element() for _ in range(5)]
scalars = [randint(1, E.order() - 1) for _ in range(5)]

R = E(0)  # Initialize R as the identity element of the elliptic curve group
for i in range(len(points)):
    R += scalars[i] * points[i]
print (" Multiscalar Multipliciation: ", R)
R = sum(scalars[i] * points[i] for i in range(len(points)))
print (" Multiscalar Multipliciation: ", R)


# Find points on an elliptic curve
p = 13
F = IntegerModRing(p)
E = EllipticCurve(F, [0, 7])
points = E.points()
print(points)


# Securing Communications with Elliptic Curve Cryptography
# ECC: Key generation, encryption, and decryption
# Generate an elliptic curve and a base point
E = EllipticCurve(GF(2^256 - 2^32 - 2^9 - 2^8 - 2^7 - 2^6 - 2^4 - 1), [0, 7])
G = E.random_point()

# Generate a private-public key pair for Alice
a = randint(1, E.order() - 1)
A = a * G

# Generate a private-public key pair for Bob
b = randint(1, E.order() - 1)
B = b * G

# Alice and Bob compute the shared secret
shared_secret_A = a * B
shared_secret_B = b * A
print ("shared_secret_A == shared_secret_B? ", shared_secret_A == shared_secret_B)


# Ensuring Data Integrity with Digital Signatures ECDSA
# ECDSA: Key generation, signing, and verification
from hashlib import sha256

E = EllipticCurve(GF(2^256 - 2^32 - 2^9 - 2^8 - 2^7 - 2^6 - 2^4 - 1), [0, 7])
G = E.random_point()

# Generate a private-public key pair for the signer
d = randint(1, E.order() - 1)
Q = d * G

# Sign a message
message = b"Hello, world!"
hash_value = int.from_bytes(sha256(message).digest(), 'big')
k = randint(1, E.order() - 1)
R = k * G
r = Integer(R[0]) % E.order()  # Convert R[0] to an integer before performing modulo
s = ((hash_value + d * r) * inverse_mod(k, E.order())) % E.order()

# Verify the signature
w = inverse_mod(s, E.order())
u1 = (hash_value * w) % E.order()
u2 = (r * w) % E.order()
X = u1 * G + u2 * Q
print("Are the signatures same? ", r % E.order() == Integer(X[0]) % E.order())  # Convert X[0] to an integer before performing modulo

# Establishing Secure Connections with Key Exchange ECDH
# ECDH: Key exchange
# Define the Elliptic Curve
E = EllipticCurve(GF(2^256 - 2^32 - 2^9 - 2^8 - 2^7 - 2^6 - 2^4 - 1), [0, 7])
G = E.random_point()

# Generate a private-public key pair for Alice
a = randint(1, E.order() - 1)
A = a * G

# Generate a private-public key pair for Bob
b = randint(1, E.order() - 1)
B = b * G

# Alice and Bob compute the shared secret
shared_secret_A = a * B
shared_secret_B = b * A
print (" shared_secret_A == shared_secret_B? ", shared_secret_A == shared_secret_B)


# Ethereum: Key generation and address derivation
from hashlib import sha256

# Define the secp256k1 elliptic curve
p = 2^256 - 2^32 - 977
E = EllipticCurve(GF(p), [0, 7])
G = E.lift_x(55066263022277343669578718895168534326250603453777594175500187360389116729240)

# Generate a private-public key pair for an Ethereum user
private_key = randint(1, E.order() - 1)
public_key = private_key * G

# Ethereum address generation (simplified)
address = sha256(str(public_key).encode()).hexdigest()[-40:]
print("Ethereum address:", "0x"+address)


# Plonk: KZG commitment example
p = 2^256 - 2^32 - 977
E = EllipticCurve(GF(p), [0, 7])
G = E.lift_x(55066263022277343669578718895168534326250603453777594175500187360389116729240)

# Generate a KZG commitment to a polynomial
def kzg_commit(poly_coeffs, G):
    return sum(coeff * (G * i) for i, coeff in enumerate(poly_coeffs))

# Example polynomial and its commitment
poly_coeffs = [1, 2, 3, 4]
C = kzg_commit(poly_coeffs, G)
print(C)
