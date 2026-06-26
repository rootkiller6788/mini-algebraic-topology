/-
# Obstruction Theory Methods (L5)
-/

import MiniHomotopyTheory.Core.Basic

namespace MiniHomotopyTheory

def obstructionCocycle (X : TwoComplex) (n : Nat) (f : CellularMap X S2) : List EdgeStep := []
def primaryObstruction (X : TwoComplex) (f : CellularMap X S1) : Bool := true
#eval primaryObstruction S1 (CellularMap.id S1)

end MiniHomotopyTheory

/-! ## Moore-Postnikov Factorization

Any map f : X -> Y factors through a sequence of principal fibrations
classified by k-invariants. This is the dual of cellular decomposition.
-/

theorem moore_postnikov_factorization (X Y : Type u) [CWComplex X] (f : ContinuousMap X Y) :
    exists (M : Nat -> Type u) (p : forall n, ContinuousMap (M (n+1)) (M n)),
    (forall n, IsSerreFibration (p n)) /\ IsLimit (M, p) f := by
  sorry

#eval "Moore-Postnikov"

#eval "mini-everything-math/ loaded"
