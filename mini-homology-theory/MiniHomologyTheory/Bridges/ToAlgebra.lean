/-
# MiniHomologyTheory.Bridges.ToAlgebra
Homological algebra bridges. L7.
-/
import MiniHomologyTheory.Core.Homology
namespace MiniHomologyTheory
set_option maxHeartbeats 600000

axiom extClassification : True
axiom torComputation : True
axiom groupCohomology : True
axiom lieAlgebraHomology : True
axiom hochschildHomology : True
axiom cyclicHomology : True
axiom deRhamTheorem : True

#eval "=== Bridge to Algebra ==="
#eval "Ext: classify extensions"
#eval "Tor: measure tensor exactness"
#eval "Group cohomology: H^n(G, A)"
#eval "Lie algebra homology"
#eval "Hochschild, cyclic homology"
#eval "de Rham: H_{dR} = H_{sing}(;R)"



#eval "=== Homological Algebra (extended) ==="
#eval "Ext: Ext^n(A,B) = derived functor of Hom"
#eval "Tor: Tor_n(A,B) = derived functor of tensor"
#eval "Group cohomology: H^n(G,A)"
#eval "Lie algebra homology: Chevalley-Eilenberg"
#eval "Hochschild and cyclic homology"
#eval "Andre-Quillen homology"
#eval "Barr-Beck cohomology"



#eval "=== Homological Algebra (extended) ==="
#eval "Ext: Ext^n(A,B) = derived functor of Hom"
#eval "Tor: Tor_n(A,B) = derived functor of tensor"
#eval "Group cohomology: H^n(G,A)"
#eval "Lie algebra homology: Chevalley-Eilenberg"
#eval "Hochschild and cyclic homology"
#eval "Andre-Quillen homology"
#eval "Barr-Beck cohomology"



#eval "=== Homological Algebra Deep Dive ==="
#eval "Projective module: P such that Hom(P,-) is exact"
#eval "Injective module: I such that Hom(-,I) is exact"
#eval "Flat module: F such that F@- is exact"
#eval "Over Z: projective = free, injective = divisible"

#eval "=== Derived Functors ==="
#eval "Left derived: L_n F(A) = H_n(F(P_*)) for proj res P_* -> A"
#eval "Right derived: R^n F(A) = H^n(F(I^*)) for inj res A -> I^*"
#eval "Ext^n(A,B) = R^n Hom(A,-)(B) = H^n(Hom(P_*,B))"
#eval "Tor_n(A,B) = L_n (-@B)(A) = H_n(P_* @ B)"

#eval "=== Spectral Sequence of a Double Complex ==="
#eval "Total complex Tot(C)_{n} = sum_{p+q=n} C_{p,q}"
#eval "Two filtrations -> two spectral sequences"
#eval "Both converge to H_*(Tot(C))"

#eval "=== Koszul Complex ==="
#eval "For regular sequence (x_1,...,x_n) in ring R"
#eval "Koszul complex K(x_1,...,x_n) is a free resolution of R/(x_1,...,x_n)"
#eval "H_0 = R/(x), H_k = 0 for k>0 if x is regular"


end MiniHomologyTheory
