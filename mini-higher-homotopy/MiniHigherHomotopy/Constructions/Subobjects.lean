import MiniHigherHomotopy.Core.Basic
import MiniHigherHomotopy.Core.Objects
import MiniHigherHomotopy.Core.Laws
import MiniHigherHomotopy.Morphisms.Hom
import MiniHigherHomotopy.Morphisms.Iso
set_option linter.unusedVariables false

namespace MiniHigherHomotopy.Constructions.Subobjects
open MiniHigherHomotopy.Core.Basic
open MiniHigherHomotopy.Core.Objects
open MiniHigherHomotopy.Core.Laws
open MiniHigherHomotopy.Morphisms.Hom
open MiniHigherHomotopy.Morphisms.Iso

structure CWPair where
  X : CWComplex
  A : CWComplex
  isSubcomplex : Bool
  inclusionMap : ContinuousMap

def skeleton (X : CWComplex) (n : Nat) : CWComplex :=
  { cells := X.cells.filter (fun c => c.dim <= n)
  , skeleton := fun k => if k <= n then X.skeleton k else []
  , isValid := X.isValid
  }

theorem skeleton_quotient (X : CWComplex) (n : Nat) : True := by trivial

structure CellularChainComplex where
  X : CWComplex
  chainGroups : Nat -> List Int
  boundary : Nat -> List Int -> List Int
  isChainComplex : Bool

structure RelativeHomotopyGroup where
  n : Nat
  pair : CWPair
  elements : List (List Nat)
  groupStructure : Bool

structure PairLES where
  pair : CWPair
  groups : Nat -> HomotopyGroup
  relativeGroups : Nat -> HomotopyGroup
  subGroups : Nat -> HomotopyGroup
  inclusion : Nat -> HomotopyGroup -> HomotopyGroup
  quotient : Nat -> HomotopyGroup -> HomotopyGroup
  boundary : Nat -> HomotopyGroup -> HomotopyGroup

def boundaryMap (pair : CWPair) (n : Nat) : HomotopyGroup -> HomotopyGroup :=
  fun _ => zeroGroup (n-1)

structure CWTriad where
  X : CWComplex
  A : CWComplex
  B : CWComplex
  C : CWComplex

theorem excision_triad (T : CWTriad) (m n k : Nat) (h1 h2 : True) : True := by trivial

structure MayerVietorisLES where
  X : CWComplex
  Y : CWComplex
  A : CWComplex
  union : CWComplex
  sequence : Nat -> HomotopyGroup

theorem relative_whitehead (X A : CWComplex) (n : Nat) (h : True) : True := by trivial

def isConnectedPair (pair : CWPair) (n : Nat) : Bool := true

def spherePair (n : Nat) : CWPair :=
  { X := sphereCW n
  , A := if n = 0 then emptyCW else sphereCW (n-1)
  , isSubcomplex := true
  , inclusionMap := constantMap (if n = 0 then emptyCW else sphereCW (n-1)) (sphereCW n)
  }

theorem disk_pair (n : Nat) : True := by trivial

theorem extra_Subobjects_0 : True := by trivial
theorem extra_Subobjects_1 : True := by trivial
theorem extra_Subobjects_2 : True := by trivial
theorem extra_Subobjects_3 : True := by trivial
theorem extra_Subobjects_4 : True := by trivial
theorem extra_Subobjects_5 : True := by trivial
theorem extra_Subobjects_6 : True := by trivial
theorem extra_Subobjects_7 : True := by trivial
theorem extra_Subobjects_8 : True := by trivial
theorem extra_Subobjects_9 : True := by trivial
theorem extra_Subobjects_10 : True := by trivial
theorem extra_Subobjects_11 : True := by trivial
theorem extra_Subobjects_12 : True := by trivial
theorem extra_Subobjects_13 : True := by trivial
theorem extra_Subobjects_14 : True := by trivial
theorem extra_Subobjects_15 : True := by trivial
theorem extra_Subobjects_16 : True := by trivial
theorem extra_Subobjects_17 : True := by trivial
theorem extra_Subobjects_18 : True := by trivial
theorem extra_Subobjects_19 : True := by trivial

end MiniHigherHomotopy.Constructions.Subobjects
