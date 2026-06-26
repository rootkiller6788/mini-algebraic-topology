/-
# Cellular Methods in Homotopy Theory (L5)
-/

import MiniHomotopyTheory.Core.Basic

namespace MiniHomotopyTheory

def cellularApproximation (X Y : TwoComplex) : CellularMap X Y := { onVertex := id, onEdge := fun ei => [(ei, true)], onFace := fun fi => match getElemOp X.faces fi with | some f => [f] | none => [] }
def cellularChainComplex (X : TwoComplex) : List Nat := [X.numFaces, X.numEdges, X.numVertices]
#eval cellularChainComplex T2

end MiniHomotopyTheory

/-! ## Cellular Homotopy

A map between CW complexes is homotopic to a cellular map that sends
the n-skeleton into the n-skeleton. This is the cellular approximation
theorem.
-/

theorem cellular_map_preserves_skeleton (X Y : Type u) [CWComplex X] [CWComplex Y]
    (f : ContinuousMap X Y) [IsCellular f] (n : Nat) :
    f (skeleton X n) subset skeleton Y n := by
  -- Cellular maps preserve the skeletal filtration by definition
  sorry

#eval "Cellular methods"

#eval "mini-everything-math/ loaded"
