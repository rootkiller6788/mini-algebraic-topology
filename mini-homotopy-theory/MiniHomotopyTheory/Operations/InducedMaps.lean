/-
# Induced Maps on Homotopy Groups (L2)
-/

import MiniHomotopyTheory.Core.Basic
import MiniHomotopyTheory.Groups.FundamentalGroup

namespace MiniHomotopyTheory

structure InducedMaps (X Y : TwoComplex) (f : CellularMap X Y) where
  pi0map : Nat -> Nat
  pi1map : List EdgeStep -> List EdgeStep
  isHomomorphism : Bool

def computeInducedMaps {X Y : TwoComplex} (f : CellularMap X Y) : InducedMaps X Y f :=
  { pi0map := f.onVertex
    pi1map := fun alpha => inducedMapOnPi1 f 0 alpha
    isHomomorphism := true }

def identityInducedMap (X : TwoComplex) : InducedMaps X X (CellularMap.id X) :=
  { pi0map := id, pi1map := id, isHomomorphism := true }


end MiniHomotopyTheory

/-! ## Induced Maps on Homotopy Groups

A continuous map f : X -> Y induces f_* : pi_n(X) -> pi_n(Y) by
post-composition. This is functorial and homotopy invariant.
-/

theorem induced_map_homotopy_invariant (X Y : Type u) (f g : ContinuousMap X Y) (h : Homotopic f g)
    (n : Nat) : InducedMap f n = InducedMap g n := by
  -- If f ~ g, then for any sphere map alpha : S^n -> X, f o alpha ~ g o alpha
  sorry

#eval "Induced maps"

#eval "mini-everything-math/ loaded"
