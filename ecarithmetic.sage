
# Elliptic Curve Arithmetic Operations

# Import necessary libraries
from hashlib import sha256
from sage.crypto.util import randint
from sage.rings.finite_rings.integer_mod_ring import IntegerModRing

# Define the secp256k1 elliptic curve
p = 2^256 - 2^32 - 977
F = IntegerModRing(p)
E = EllipticCurve(F, [0, 7])
G = E.lift_x(55066263022277343669578718895168534326250603453777594175500187360389116729240)


# Point addition
P = E.random_point()
Q = E.random_point()
R = P + Q

# Point doubling
P_doubled = 2 * P

# Efficient scalar multiplication
n = randint(1, E.order() - 1)
P_mult = n * P

# Computing the inverse of a point
P_inv = -P

# Verifying associativity and commutativity in elliptic curve arithmetic
A = E.random_point()
B = E.random_point()
C = E.random_point()
assert (A + B) + C == A + (B + C)  # Associativity
assert A + B == B + A  # Commutativity

# Defining and visualizing elliptic curves with SageMath
E_alt = EllipticCurve(F, [2, 3])
E_alt.plot()

# Executing multiscalar multiplication in SageMath
n1 = randint(1, E.order() - 1)
n2 = randint(1, E.order() - 1)
P1 = E.random_point()
P2 = E.random_point()
multiscalar_result = n1 * P1 + n2 * P2

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

