/-
# MiniHomologyTheory.Examples.Standard
Standard examples of homology computations.
L6: Canonical Examples with #eval.
-/
import MiniHomologyTheory.Core.Homology
namespace MiniHomologyTheory

set_option maxHeartbeats 600000

#eval "=== Standard Examples ==="

#eval "Point:"
#eval "  H_0(pt) = Z, H_n(pt) = 0 (n>0)"

#eval "Circle S^1:"
#eval "  H_0 = Z, H_1 = Z, H_n = 0 (n>1)"
#eval "  Generator of H_1: the fundamental class [S^1]"

#eval "2-Sphere S^2:"
#eval "  H_0 = Z, H_2 = Z, H_n = 0 (n≠0,2)"
#eval "  H_1 = 0 (simply connected)"
#eval "  H_2 = Z (fundamental class)"

#eval "n-Sphere S^n:"
#eval "  H_0 = Z, H_n = Z, H_k = 0 (k≠0,n)"

#eval "Torus T^2 = S^1 × S^1:"
#eval "  H_0 = Z, H_1 = Z⊕Z, H_2 = Z"
#eval "  Generators: meridian, longitude, fundamental class"

#eval "Real Projective Plane RP^2:"
#eval "  H_0(Z) = Z, H_1(Z) = Z_2, H_2(Z) = 0"
#eval "  H_0(Z_2) = Z_2, H_1(Z_2) = Z_2, H_2(Z_2) = Z_2"

#eval "Klein Bottle:"
#eval "  H_0 = Z, H_1 = Z⊕Z_2, H_2 = 0"

#eval "Genus g surface Σ_g:"
#eval "  H_0 = Z, H_1 = Z^{2g}, H_2 = Z"

#eval "Complex Projective Space CP^n:"
#eval "  H_{2k}(CP^n) = Z (0≤k≤n), odd homology = 0"

#eval "Betti numbers demo:"
#eval "  S^1: b0=1, b1=1"
#eval "  T^2: b0=1, b1=2, b2=1"
#eval "  RP^2: b0=1, b1=0, b2=0"



#eval "=== Additional Examples ==="

#eval "SO(3) ≅ RP^3: H_0=Z, H_1=Z_2, H_2=0, H_3=Z"
#eval "SU(2) ≅ S^3: H_0=Z, H_1=0, H_2=0, H_3=Z"

#eval "Genus g surface Σ_g:"
#eval "  H_0 = Z, H_1 = Z^{2g}, H_2 = Z"
#eval "  χ(Σ_g) = 2 - 2g"

#eval "Non-orientable surface N_g (g crosscaps):"
#eval "  H_0 = Z, H_1 = Z^{g-1}⊕Z_2, H_2 = 0"
#eval "  χ(N_g) = 2 - g"

#eval "Complex projective space CP^n:"
#eval "  H_{2k} = Z for k=0,1,...,n"
#eval "  H_{2k+1} = 0 for all k"
#eval "  χ(CP^n) = n + 1"

#eval "Real projective space RP^n:"
#eval "  H_0 = Z"
#eval "  H_k = Z_2 for odd k, 0<k<n"
#eval "  H_n = Z if n is odd, 0 if n is even"
#eval "  χ(RP^n) = 1 if n even, 0 if n odd"

#eval "Lens space L(p; q_1,...,q_n):"
#eval "  H_0 = Z, H_1 = Z_p, H_2 = 0, H_3 = Z_p, ..."
#eval "  alternating Z_p and 0 (odd dims)"
#eval "  χ(L(p,q)) = 0 for all lens spaces"




#eval "=========================================="
#eval "  Extended Standard Examples"
#eval "=========================================="

#eval "=== Homology of Spheres ==="
#eval "S^0 = {two points}: H_0 = Z+Z, H_k = 0 (k>0)"
#eval "S^1 = circle: H_0 = Z, H_1 = Z"
#eval "S^2 = sphere: H_0 = Z, H_2 = Z"
#eval "S^3: H_0 = Z, H_3 = Z"
#eval "General S^n: H_0 = Z, H_n = Z, others 0"

#eval "=== Homology of Projective Spaces ==="
#eval "RP^1 = S^1: H_0=Z, H_1=Z"
#eval "RP^2: H_0=Z, H_1=Z_2, H_2=0"
#eval "RP^3: H_0=Z, H_1=Z_2, H_2=0, H_3=Z"
#eval "RP^n (Z): H_0=Z, H_k=Z_2 (odd k<n), H_n=Z (n odd)"
#eval "CP^1 = S^2: H_0=Z, H_2=Z"
#eval "CP^2: H_0=Z, H_2=Z, H_4=Z"

#eval "=== Homology of Surfaces ==="
#eval "Sphere (g=0): H_0=Z, H_1=0, H_2=Z"
#eval "Torus (g=1): H_0=Z, H_1=Z^2, H_2=Z"
#eval "Genus 2: H_0=Z, H_1=Z^4, H_2=Z"
#eval "Genus g: H_0=Z, H_1=Z^{2g}, H_2=Z"
#eval "Klein bottle: H_0=Z, H_1=Z+Z_2, H_2=0"

#eval "=== Homology of Lie Groups ==="
#eval "U(n): H_* is exterior algebra on generators in deg 1,3,...,2n-1"
#eval "SO(3) = RP^3: H_0=Z, H_1=Z_2, H_2=0, H_3=Z"
#eval "SU(2) = S^3: H_0=Z, H_3=Z"
#eval "SO(4): H_0=Z, H_3=Z+Z, H_4=Z, H_5=Z_2, H_7=Z"

#eval "=== Homology of Eilenberg-MacLane Spaces ==="
#eval "K(Z,1) = S^1: H_0=Z, H_1=Z"
#eval "K(Z,2) = CP^infinity: H_{2k}=Z, H_{2k+1}=0"
#eval "K(Z_2,1) = RP^infinity: H_k(Z_2)=Z_2, H_k(Z)=Z_2 (odd k)"


end MiniHomologyTheory
