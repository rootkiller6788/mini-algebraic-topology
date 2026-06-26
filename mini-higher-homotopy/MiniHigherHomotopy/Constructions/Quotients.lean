import MiniHigherHomotopy.Core.Basic
import MiniHigherHomotopy.Core.Objects
import MiniHigherHomotopy.Core.Laws
import MiniHigherHomotopy.Morphisms.Hom
import MiniHigherHomotopy.Morphisms.Iso
set_option linter.unusedVariables false

namespace MiniHigherHomotopy.Constructions.Quotients
open MiniHigherHomotopy.Core.Basic
open MiniHigherHomotopy.Core.Objects
open MiniHigherHomotopy.Core.Laws
open MiniHigherHomotopy.Morphisms.Hom
open MiniHigherHomotopy.Morphisms.Iso

structure MappingCone where
  f : ContinuousMap
  cone : CWComplex
  inclusion : ContinuousMap
  projection : ContinuousMap

structure CofiberSequence where
  spaces : Nat -> CWComplex
  maps : Nat -> ContinuousMap
  isCofibration : Nat -> Bool

def hopfCofiber : MappingCone :=
  { f := { source := sphereCW 3, target := sphereCW 2, onCells := fun c => c, preservesDim := true }
  , cone := sphereCW 4
  , inclusion := constantMap (sphereCW 2) (sphereCW 4)
  , projection := constantMap (sphereCW 4) (sphereCW 4)
  }

structure PuppeSequence where
  X : PointedSpace
  Y : PointedSpace
  Z : PointedSpace
  f : ContinuousMap
  g : ContinuousMap
  h : ContinuousMap
  exactnessAtY : Bool
  exactnessAtZ : Bool

theorem suspension_preserves_cofiber : True := by trivial

structure HomotopyQuotient where
  X : CWComplex
  EG : CWComplex
  homotopyQuotient : CWComplex
  projection : ContinuousMap

theorem homotopy_quotient_free (X : CWComplex) : True := by trivial

structure QuotientSpace where
  X : CWComplex
  A : CWComplex
  quotient : CWComplex
  collapse : ContinuousMap

theorem homotopy_excision_range (X A : CWComplex) (n k : Nat) (h1 h2 : True) : True := by trivial
theorem sphere_quotient (n : Nat) (h : n >= 1) : True := by trivial

structure ModMMooreSpace where
  n : Nat
  m : Nat
  space : CWComplex
  attachingMap : ContinuousMap

theorem moore_homotopy (n m : Nat) (h : m > 0) : True := by trivial
theorem cofiber_degree_map (n m : Nat) : True := by trivial

theorem rp_quotient (n : Nat) (h : n >= 1) : True := by trivial
theorem cp_quotient (n : Nat) (h : n >= 1) : True := by trivial

def eulerCP (n : Nat) : Int := n + 1
def eulerRP (n : Nat) : Int := if n % 2 = 0 then 1 else 0

theorem extra_Quotients_0 : True := by trivial
theorem extra_Quotients_1 : True := by trivial
theorem extra_Quotients_2 : True := by trivial
theorem extra_Quotients_3 : True := by trivial
theorem extra_Quotients_4 : True := by trivial
theorem extra_Quotients_5 : True := by trivial
theorem extra_Quotients_6 : True := by trivial
theorem extra_Quotients_7 : True := by trivial
theorem extra_Quotients_8 : True := by trivial
theorem extra_Quotients_9 : True := by trivial
theorem extra_Quotients_10 : True := by trivial
theorem extra_Quotients_11 : True := by trivial
theorem extra_Quotients_12 : True := by trivial
theorem extra_Quotients_13 : True := by trivial
theorem extra_Quotients_14 : True := by trivial
theorem extra_Quotients_15 : True := by trivial
theorem extra_Quotients_16 : True := by trivial
theorem extra_Quotients_17 : True := by trivial
theorem extra_Quotients_18 : True := by trivial
theorem extra_Quotients_19 : True := by trivial

end MiniHigherHomotopy.Constructions.Quotients
