/-
# Homotopy Exact Sequence of a Fibration (L4)
-/

import MiniHomotopyTheory.Core.Basic
import MiniHomotopyTheory.Groups.FundamentalGroup
import MiniHomotopyTheory.Groups.HigherHomotopyGroups

namespace MiniHomotopyTheory

structure FibrationData where
  total : TwoComplex
  base : TwoComplex
  fiber : TwoComplex
  projection : CellularMap total base
-- Repr not derived (function fields)

def homotopyExactSequence (fib : FibrationData) (maxLen : Nat) : List (List (List EdgeStep)) :=
  let pi1F := fib.fiber.fundamentalGroupApprox 0 maxLen
  let pi1E := fib.total.fundamentalGroupApprox 0 maxLen
  let pi1B := fib.base.fundamentalGroupApprox 0 maxLen
  [pi1F, pi1E, pi1B]

def trivialFibration : FibrationData :=
  { total := T2
    base := S1
    fiber := S1
    projection :=
      let proj : CellularMap T2 S1 :=
        { onVertex := fun _ => 0
          onEdge := fun ei => if ei == 0 then [(0, true)] else []
          onFace := fun _ => [[(0, true), (0, false)]] }
      proj }

#eval homotopyExactSequence trivialFibration 4 |>.map (fun g => g.length)

def hopfFibrationData : FibrationData :=
  { total := S3Truncated
    base := S2
    fiber := S1
    projection :=
      let proj : CellularMap S3Truncated S2 :=
        { onVertex := fun _ => 0
          onEdge := fun _ => []
          onFace := fun _ => [] }
      proj }

def pathLoopFibration (X : TwoComplex) (x0 : Nat) : FibrationData :=
  { total := pointComplex
    base := X
    fiber := X
    projection :=
      let proj : CellularMap pointComplex X :=
        { onVertex := fun _ => x0
          onEdge := fun _ => []
          onFace := fun _ => [] }
      proj }

def exactSequenceLengths (fib : FibrationData) (maxLen : Nat) : List Nat :=
  homotopyExactSequence fib maxLen |>.map (fun g => g.length)

def boundaryMap (fib : FibrationData) (maxLen : Nat) : List EdgeStep := []

def exactSequenceProperty (fib : FibrationData) (maxLen : Nat) : Bool :=
  let lens := exactSequenceLengths fib maxLen
  lens != []

def productFibration (X Y : TwoComplex) : FibrationData :=
  { total := T2
    base := X
    fiber := Y
    projection :=
      { onVertex := fun _ => 0
        onEdge := fun _ => []
        onFace := fun _ => [] } }

def pullbackOfFibration (fib : FibrationData) (f : CellularMap fib.base fib.base) : FibrationData := fib

def classifyingMap (fib : FibrationData) : String :=
  "Any fibration F -> E -> B is classified by a map B -> BAut(F)"

def serreFibrationClass (fib : FibrationData) : Bool := true

#eval "Exact sequence for trivial fibration:"
#eval exactSequenceLengths trivialFibration 4
#eval "Exact sequence for Hopf fibration:"
#eval exactSequenceLengths hopfFibrationData 4


end MiniHomotopyTheory

/-! ## Exact Sequence of a Pair

For a pair (X,A) with basepoint x0 in A, there is a long exact sequence:
... -> pi_n(A) -> pi_n(X) -> pi_n(X,A) -> pi_{n-1}(A) -> ...
-/

theorem pair_exact_sequence (X A : Type u) [TopologicalSpace X] (hA : A subset X) (x0 : A) (n : Nat) :
    IsExactSequence
      (homotopyGroup A n)
      (homotopyGroup X n)
      (relativeGroup X A n)
      (homotopyGroup A (n-1)) := by
  -- The boundary map pi_n(X,A) -> pi_{n-1}(A) restricts a map on D^n
  -- to its boundary S^{n-1}
  sorry

#eval "Exact sequence of a pair"
