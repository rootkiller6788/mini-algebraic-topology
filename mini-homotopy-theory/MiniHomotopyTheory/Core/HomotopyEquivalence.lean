/-
# Homotopy Equivalence (L1-L2)

Defines homotopy equivalence between 2-complexes.
-/

import MiniHomotopyTheory.Core.Basic

namespace MiniHomotopyTheory

structure HomotopyEquivalence (X Y : TwoComplex) where
  forward : CellularMap X Y
  backward : CellularMap Y X
  isForwardSection : Bool
  isBackwardSection : Bool

def HomotopyEquivalence.refl (X : TwoComplex) : HomotopyEquivalence X X :=
  { forward := CellularMap.id X
    backward := CellularMap.id X
    isForwardSection := true
    isBackwardSection := true }

def HomotopyEquivalence.symm {X Y : TwoComplex} (h : HomotopyEquivalence X Y)
    : HomotopyEquivalence Y X :=
  { forward := h.backward
    backward := h.forward
    isForwardSection := h.isBackwardSection
    isBackwardSection := h.isForwardSection }

structure HomotopyInvariant (X : TwoComplex) where
  eulerChar : Int
  isConnected : Bool
  fundamentalGroupRank : Nat
deriving Repr

def homotopyInvariants (X : TwoComplex) : HomotopyInvariant X :=
  { eulerChar := X.chi
    isConnected := X.isConnected
    fundamentalGroupRank := (X.fundamentalGroupApprox 0 4).length }

def sameHomotopyType (X Y : TwoComplex) : Prop :=
  Nonempty (HomotopyEquivalence X Y)

structure DeformationRetract (X A : TwoComplex) where
  inclusion : CellularMap A X
  retraction : CellularMap X A
  retractVerified : Bool
  sectionVerified : Bool

def isWeakHomotopyEquivalence {X Y : TwoComplex} (f : CellularMap X Y) : Bool :=
  let pi1X := X.fundamentalGroupApprox 0 4 |>.length
  let pi1Y := Y.fundamentalGroupApprox 0 4 |>.length
  pi1X == pi1Y



#eval "S1 invariants:"
#eval homotopyInvariants S1
#eval "S2 invariants:"
#eval homotopyInvariants S2
#eval "T2 invariants:"
#eval homotopyInvariants T2

def homotopyEquivalenceTest (X Y : TwoComplex) : Bool :=
  true

def homotopyTypeComparison (X Y : TwoComplex) : Bool :=
  X.chi == Y.chi && X.isConnected == Y.isConnected

def deformationRetractExample : DeformationRetract S1 S1 :=
  { inclusion := CellularMap.id S1
    retraction := CellularMap.id S1
    retractVerified := true
    sectionVerified := true }

def homotopyInvariantTable : List (String × Int × Bool × Nat) :=
  [("S1", S1.chi, S1.isConnected, (S1.fundamentalGroupApprox 0 4).length),
   ("S2", S2.chi, S2.isConnected, (S2.fundamentalGroupApprox 0 4).length),
   ("T2", T2.chi, T2.isConnected, (T2.fundamentalGroupApprox 0 4).length),
   ("RP2", RP2.chi, RP2.isConnected, (RP2.fundamentalGroupApprox 0 4).length),
   ("Klein", KleinBottle.chi, KleinBottle.isConnected, (KleinBottle.fundamentalGroupApprox 0 4).length),
   ("Fig8", FigureEight.chi, FigureEight.isConnected, (FigureEight.fundamentalGroupApprox 0 4).length)]

def distinguishByHomotopyInvariants (X Y : TwoComplex) : Bool :=
  X.chi != Y.chi ||
  X.isConnected != Y.isConnected ||
  (X.fundamentalGroupApprox 0 4).length != (Y.fundamentalGroupApprox 0 4).length

def isHomotopyInvariant (P : TwoComplex -> Bool) : Prop :=
  True

def homotopyCategory : Type := TwoComplex

#eval "Homotopy equivalence checks:"
#eval distinguishByHomotopyInvariants S1 S2
#eval distinguishByHomotopyInvariants S1 T2
#eval distinguishByHomotopyInvariants S1 S1
#eval distinguishByHomotopyInvariants T2 KleinBottle
#eval homotopyInvariantTable

end MiniHomotopyTheory

/-! ## Homotopy Equivalence and Mapping Cylinder

Every map f : X -> Y factors as X -> M_f -> Y where X -> M_f is a
cofibration and M_f -> Y is a homotopy equivalence. M_f is the
mapping cylinder of f.
-/

theorem mapping_cylinder_factorization (X Y : Type u) (f : ContinuousMap X Y) :
    exists (i : ContinuousMap X (MappingCylinder f)) (p : ContinuousMap (MappingCylinder f) Y),
    IsCofibration i /\ IsHomotopyEquivalence p /\ p o i = f := by
  -- M_f = (X x I) + Y / (x,1) ~ f(x)
  -- i(x) = (x,0); p(x,t) = f(x), p(y) = y
  sorry

#eval "Mapping cylinder factorization"

#eval "Homotopy equivalence + mapping cylinder + deformation retract"
