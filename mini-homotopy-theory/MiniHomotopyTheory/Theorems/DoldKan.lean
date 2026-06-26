/-
# MiniHomotopyTheory: Dold-Kan Correspondence

The Dold-Kan theorem establishes an equivalence between simplicial
abelian groups and chain complexes concentrated in non-negative degrees.
-/

import MiniHomotopyTheory.Core.Basic

namespace MiniHomotopyTheory

/-! ## Dold-Kan Theorem

There is an equivalence of categories:
N : SimplicialAbGroup <-> ChainComplex_{>=0} AbGroup : Gamma

where N is the normalized Moore complex functor.
-/

def normalizedMooreComplex (A : SimplicialAbGroup) : ChainComplex :=
  { chains := fun n => intersection_{i < n} ker (faceMap A i)
    differential := fun n => (-1)^n * faceMap A n }

theorem dold_kan_equivalence : IsEquivalenceOfCategories SimplicialAbGroup ChainComplexNonNeg := by
  -- Construct Gamma: C_n |-> C_n (+) sum_{surjections [n]->>[k]} C_k
  -- Verify N o Gamma = id and Gamma o N = id up to natural isomorphism
  sorry

/-! ## Homotopy Groups via the Moore Complex

For a simplicial set X, the homotopy groups can be computed from the
Moore complex of its free abelian group:
pi_n(|X|) = H_n(N(Z[X]))
-/

theorem homotopy_via_moore_complex (X : SimplicialSet) (n : Nat) :
    HomotopyGroup (GeometricRealization X) n = HomologyGroup (normalizedMooreComplex (FreeAbelianGroup X)) n := by
  -- This is the Dold-Thom theorem: pi_n(Sym^inf(X)) = H_n(X)
  sorry

#eval "-- Dold-Kan Theorem --"
#check dold_kan_equivalence

end MiniHomotopyTheory

#eval "Dold-Kan correspondence"
