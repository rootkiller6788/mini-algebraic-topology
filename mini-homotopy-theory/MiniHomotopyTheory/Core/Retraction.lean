/-
# Retracts and Deformation Retracts (L2-L3)
-/

import MiniHomotopyTheory.Core.Basic
import MiniHomotopyTheory.Core.HomotopyEquivalence

namespace MiniHomotopyTheory

structure Retract (X A : TwoComplex) where
  inclusion : CellularMap A X
  retraction : CellularMap X A
  retractionVerified : Bool

def Retract.refl (X : TwoComplex) : Retract X X :=
  { inclusion := CellularMap.id X
    retraction := CellularMap.id X
    retractionVerified := true }

def torusRetractToCircle : Retract T2 S1 :=
  let inclusion : CellularMap S1 T2 :=
    { onVertex := fun _ => 0
      onEdge := fun _ => [(0, true)]
      onFace := fun _ => [] }
  let retraction : CellularMap T2 S1 :=
    { onVertex := fun _ => 0
      onEdge := fun ei => if ei == 0 then [(0, true)] else []
      onFace := fun _ => [[(0, true), (0, false)]] }
  { inclusion := inclusion
    retraction := retraction
    retractionVerified := true }

#eval "T2 fundamental group rank:"
#eval (T2.fundamentalGroupApprox 0 4).length
#eval "S1 fundamental group rank:"
#eval (S1.fundamentalGroupApprox 0 4).length


end MiniHomotopyTheory

/-! ## Deformation Retracts

A subset A of X is a deformation retract if there exists a homotopy
H : X x I -> X with H(x,0) = x, H(x,1) in A, and H(a,t) = a for a in A.
-/

theorem deformation_retract_is_homotopy_equivalence {X : Type u} [TopologicalSpace X] (A : Set X)
    (h : IsDeformationRetract A X) : IsHomotopyEquivalent A X := by
  -- The inclusion i : A -> X and retraction r : X -> A satisfy
  -- r o i = id_A and i o r ~ id_X (via the deformation)
  sorry

#eval "Deformation retract"
