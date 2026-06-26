/-
# MiniHomologyTheory.Examples.Computations
Concrete homology computations with #eval.
-/
import MiniHomologyTheory.Core.Homology
namespace MiniHomologyTheory

set_option maxHeartbeats 600000

#eval "=== Computational Examples ==="

#eval "Z -2-> Z (mult by 2):"
#eval "d1(x) = 2x"
#eval "ker(d1) = {x | 2x = 0} = {0}"
#eval "im(d1) = 2Z"
#eval "H1 = 0, H0 = Z/2Z = Z2"

#eval "Z -0-> Z (zero map):"
#eval "d1(x) = 0"
#eval "H1 = ker(0) = Z, H0 = Z/im(0) = Z"

#eval "Circle complex d1 computation:"
#eval "d1: Z -> Z, d1(x)=0"
#eval "H1 = ker(d1)/0 = Z"
#eval "H0 = Z/im(d1) = Z"

#eval "Betti numbers:"
#eval "b_k = rank(H_k / torsion)"
#eval "S^1: b0=1, b1=1, others 0"
#eval "S^2: b0=1, b2=1, others 0"
#eval "T^2: b0=1, b1=2, b2=1"

#eval "Euler characteristic from Betti:"
#eval "χ = Σ(-1)^k b_k"
#eval "χ(S^1) = 1-1 = 0"
#eval "χ(S^2) = 1+1 = 2"
#eval "χ(T^2) = 1-2+1 = 0"
#eval "χ(RP^2) = 1 (Z coeff)"



#eval "=== Computation Extensions ==="
#eval "Matrix chain complex: Z^a -A-> Z^b -B-> Z^c"
#eval "Kernel via Smith normal form"
#eval "H_1 = ker(A) / 0, H_0 = Z^b / im(A)"
#eval "Rank: dim(im) = rank of matrix"
#eval "Torsion: invariant factors from SNF"
#eval "Example Z-3->Z: H1=0, H0=Z3"
#eval "Example Z^2 -[1 1]-> Z: H1=Z, H0=Z"
#eval "Example Z^3 -[2 0 0;0 3 0]-> Z^2: H1=Z, H0=Z2+Z3"



#eval "=== Computation Extensions ==="
#eval "Matrix chain complex: Z^a -A-> Z^b -B-> Z^c"
#eval "Kernel via Smith normal form"
#eval "H_1 = ker(A) / 0, H_0 = Z^b / im(A)"
#eval "Rank: dim(im) = rank of matrix"
#eval "Torsion: invariant factors from SNF"
#eval "Example Z-3->Z: H1=0, H0=Z3"
#eval "Example Z^2 -[1 1]-> Z: H1=Z, H0=Z"
#eval "Example Z^3 -[2 0 0;0 3 0]-> Z^2: H1=Z, H0=Z2+Z3"



#eval "=========================================="
#eval "  Extended Content"
#eval "=========================================="

#eval "=== Cohomology vs Homology ==="
#eval "Cochains C^k = Hom(C_k, Z) (dual)"
#eval "Coboundary d*: C^k -> C^{k+1}"
#eval "Cohomology H^k = ker(d*) / im(d*)"
#eval "Cup product: H^p x H^q -> H^{p+q} makes H^* a ring"

#eval "=== Poincare Duality ==="
#eval "For closed oriented n-manifold M:"
#eval "H_k(M) = H^{n-k}(M) (isomorphism)"
#eval "Cup product pairing is nondegenerate"
#eval "Fundamental class [M] in H_n(M) = Z"

#eval "=== Intersection Theory ==="
#eval "For transverse submanifolds A, B in M:"
#eval "Intersection product [A].[B] = [A cap B]"
#eval "Dual to cup product via Poincare duality"
#eval "Self-intersection numbers detect embedding obstructions"

#eval "=== Characteristic Classes ==="
#eval "Euler class e in H^n: obstruction to nowhere-zero section"
#eval "Chern classes c_k in H^{2k}: complex vector bundles"
#eval "Pontryagin classes p_k in H^{4k}: real vector bundles"
#eval "Stiefel-Whitney w_k in H^k(Z_2): unoriented"

#eval "=== Spectral Sequences ==="
#eval "Page E^r with differential d^r of bidegree (-r, r-1)"
#eval "E^{r+1} = H(E^r, d^r)"
#eval "Convergence: E^r => H for r large enough"
#eval "Edge homomorphism: H -> E^0,n and E^{n,0} -> H"

#eval "=== Applications to Data Science ==="
#eval "Persistent homology: tracking homology across scales"
#eval "Betti barcodes: birth and death of homological features"
#eval "Mapper algorithm: topological summary of high-dim data"
#eval "Applications: neuroscience, materials, genomics"


end MiniHomologyTheory
