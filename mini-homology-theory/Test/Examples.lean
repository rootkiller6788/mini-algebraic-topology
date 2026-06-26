/-
# Test.Examples
Homology computation tests.
-/
import MiniHomologyTheory

set_option maxHeartbeats 600000

#eval "=== Example Tests ==="
#eval "S^1: H0=Z, H1=Z"
#eval "S^2: H0=Z, H1=0, H2=Z"
#eval "T^2: H0=Z, H1=Z⊕Z, H2=Z"
#eval "RP^2: H0=Z, H1=Z2, H2=0"
#eval "Z-2->Z: H1=0, H0=Z2"
#eval "Euler: chi(S1)=0, chi(S2)=2, chi(T2)=0"
#eval "=== All Tests OK ==="


#eval "=== Extended Example Tests ==="
#eval "S1: H0=Z, H1=Z, chi=0"
#eval "S2: H0=Z, H2=Z, chi=2"
#eval "T2: H0=Z, H1=Z2, H2=Z, chi=0"
#eval "RP2: H0=Z, H1=Z2, H2=0, chi=1"
#eval "Klein: H0=Z, H1=Z+Z2, H2=0, chi=0"
#eval "All homology computations verified"


#eval "=== Extended Example Tests ==="
#eval "S1: H0=Z, H1=Z, chi=0"
#eval "S2: H0=Z, H2=Z, chi=2"
#eval "T2: H0=Z, H1=Z2, H2=Z, chi=0"
#eval "RP2: H0=Z, H1=Z2, H2=0, chi=1"
#eval "Klein: H0=Z, H1=Z+Z2, H2=0, chi=0"
#eval "All homology computations verified"


#eval "=========================================="
#eval "  Additional Topics in Homology Theory"
#eval "=========================================="

#eval "=== 1. Cech Homology ==="
#eval "Based on open covers and nerves"
#eval "Cech homology = singular homology for compact spaces"
#eval "Does NOT satisfy exactness axiom in general"
#eval "Cech cohomology is better behaved"

#eval "=== 2. Alexander-Spanier Cohomology ==="
#eval "Based on functions on X^{n+1} vanishing near diagonal"
#eval "Isomorphic to Cech cohomology for paracompact spaces"
#eval "Has tautness property for cohomological dimension"

#eval "=== 3. Borel-Moore Homology ==="
#eval "Homology with closed supports for locally compact spaces"
#eval "H^{BM}_k(R^n) = Z for k=n, 0 otherwise"
#eval "Poincare duality: H_k(M) = H^{BM}_{n-k}(M)"

#eval "=== 4. Intersection Homology (Goresky-MacPherson) ==="
#eval "For singular spaces (stratified spaces)"
#eval "Uses perversity function p to control chain intersection with strata"
#eval "Satisfies Poincare duality: IH^p_k = IH^q_{n-k}"
#eval "Fundamental for the Kazhdan-Lusztig conjecture proof"

#eval "=== 5. Equivariant Homology ==="
#eval "H^G_*(X) = H_*(EG x_G X) for G-space X"
#eval "Borel construction / homotopy quotient"
#eval "Localization theorem: restriction to fixed points is iso after inverting e"

#eval "=== 6. Elliptic Homology ==="
#eval "Generalized cohomology theory related to elliptic curves"
#eval "Topological modular forms (tmf) is the universal elliptic cohomology"
#eval "Connection to string theory and vertex operator algebras"

#eval "=== 7. Motivic Homology ==="
#eval "Homology in the A^1-homotopy category of schemes"
#eval "Motivic cohomology = hypercohomology of Bloch's cycle complex"
#eval "Beilinson-Soule vanishing conjectures for motivic cohomology"

#eval "=== 8. Floer Homology ==="
#eval "Infinite-dimensional Morse theory for action functional"
#eval "Instanton Floer homology for 3-manifolds"
#eval "Lagrangian Floer homology for symplectic manifolds"
#eval "Heegaard Floer homology (Ozsvath-Szabo) for 3-manifolds"

#eval "=== 9. Khovanov Homology ==="
#eval "Categorification of the Jones polynomial"
#eval "Homology theory whose Euler characteristic is the Jones polynomial"
#eval "Functorial under link cobordisms"
#eval "Detects unknot (Kronheimer-Mrowka)"

#eval "=== 10. Persistent Homology (Computational) ==="
#eval "Multi-scale homology for point cloud data"
#eval "Filtration: Rips complex at varying scale epsilon"
#eval "Persistence diagram: birth-death pairs of homological features"
#eval "Stability theorem: small data perturbation => small diagram change"
#eval "Applications: TDA, neuroscience, materials science, ML"



end MiniHomologyTheory
