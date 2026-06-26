/-
# MiniHomotopyTheory: Brown Representability

Every cohomology theory (contravariant homotopy functor on CW complexes
satisfying wedge and Mayer-Vietoris axioms) is representable by a
spectrum (or space, for ordinary cohomology).
-/

import MiniHomotopyTheory.Core.Basic

namespace MiniHomotopyTheory

/-! ## Brown Representability Theorem

Let F : Ho(CW_*)^op -> Set_* be a contravariant functor satisfying:
1. F(X v Y) = F(X) x F(Y) (wedge axiom)
2. For a CW triad (X; A, B), the Mayer-Vietoris sequence is exact.

Then there exists a CW complex Z and a natural isomorphism
F(-) = [-, Z]_* (based homotopy classes of maps).
-/

theorem brown_representability (F : ContravariantFunctor HoCWSetStar)
    (h_wedge : forall X Y, F (X wedge Y) = F X product F Y)
    (h_mayer_vietoris : forall X A B, IsExact (mayerVietorisSequence F X A B)) :
    exists (Z : Type u) [CWComplex Z], IsNaturallyIsomorphic F (RepresentableFunctor Z) := by
  -- Construct Z inductively: Z_0 = discrete set (one point per element of F(S^0))
  -- Having built Z_{n-1}, for each element alpha in F(S^n) and map f : S^n -> Z
  -- with F(f)(iota_n) = restriction of alpha, attach a cell to kill the obstruction
  sorry

/-! ## Eilenberg-MacLane Spaces

K(G,n) is the space with pi_n(K(G,n)) = G and all other homotopy
groups trivial. These classify cohomology: H^n(X; G) = [X, K(G,n)].
-/

structure EilenbergMacLane (G : AbGroup) (n : Nat) where
  space : Type u
  isCW : CWComplex space
  homotopyAtN : HomotopyGroup space n = G
  homotopyOtherwise : forall k, k != n -> HomotopyGroup space k = 0

theorem eilenberg_maclane_represents_cohomology (X : Type u) [CWComplex X] (G : AbGroup) (n : Nat) :
    CohomologyGroup X n G = [X, (EilenbergMacLane G n).space] := by
  -- Brown representability applied to the cohomology functor H^n(-; G)
  sorry

#eval "-- Brown Representability --"
#check brown_representability

end MiniHomotopyTheory

#eval "Brown representability theorem"
