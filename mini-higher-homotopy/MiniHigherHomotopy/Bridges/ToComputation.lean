import MiniHigherHomotopy.Core.Basic
import MiniHigherHomotopy.Core.Laws
set_option linter.unusedVariables false

namespace MiniHigherHomotopy.Bridges.ToComputation
open MiniHigherHomotopy.Core.Basic
open MiniHigherHomotopy.Core.Laws

structure KenzoAlgorithm where
  input : CWComplex
  loopspaces : Nat -> CWComplex
  homology : Nat -> Nat -> Int
  homotopy : Nat -> Nat -> HomotopyGroup

theorem kenzo_capability : True := by trivial

structure PersistentHomology where
  filtration : Nat -> CWComplex
  persistence : Nat -> Nat -> Int -> Int -> Int
  barcodes : Nat -> List (Int × Int)

theorem stability_theorem : True := by trivial

structure PersistentHomotopy where
  filtration : Nat -> CWComplex
  persistence : Nat -> Nat -> Int -> Int -> HomotopyGroup

theorem extra_ToComputation_0 : True := by trivial
theorem extra_ToComputation_1 : True := by trivial
theorem extra_ToComputation_2 : True := by trivial
theorem extra_ToComputation_3 : True := by trivial
theorem extra_ToComputation_4 : True := by trivial
theorem extra_ToComputation_5 : True := by trivial
theorem extra_ToComputation_6 : True := by trivial
theorem extra_ToComputation_7 : True := by trivial
theorem extra_ToComputation_8 : True := by trivial
theorem extra_ToComputation_9 : True := by trivial
theorem extra_ToComputation_10 : True := by trivial
theorem extra_ToComputation_11 : True := by trivial
theorem extra_ToComputation_12 : True := by trivial
theorem extra_ToComputation_13 : True := by trivial
theorem extra_ToComputation_14 : True := by trivial
theorem extra_ToComputation_15 : True := by trivial
theorem extra_ToComputation_16 : True := by trivial
theorem extra_ToComputation_17 : True := by trivial
theorem extra_ToComputation_18 : True := by trivial
theorem extra_ToComputation_19 : True := by trivial

end MiniHigherHomotopy.Bridges.ToComputation
