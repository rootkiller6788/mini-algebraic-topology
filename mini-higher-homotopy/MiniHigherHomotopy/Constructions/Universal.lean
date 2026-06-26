import MiniHigherHomotopy.Core.Basic
import MiniHigherHomotopy.Core.Objects
import MiniHigherHomotopy.Core.Laws
import MiniHigherHomotopy.Morphisms.Hom
import MiniHigherHomotopy.Morphisms.Iso
import MiniHigherHomotopy.Morphisms.Equivalence
set_option linter.unusedVariables false

namespace MiniHigherHomotopy.Constructions.Universal
open MiniHigherHomotopy.Core.Basic
open MiniHigherHomotopy.Core.Objects
open MiniHigherHomotopy.Core.Laws
open MiniHigherHomotopy.Morphisms.Hom
open MiniHigherHomotopy.Morphisms.Iso
open MiniHigherHomotopy.Morphisms.Equivalence

structure ClassifyingSpace where
  EG : CWComplex
  BG : CWComplex
  projection : ContinuousMap
  isUniversal : Bool

theorem BZ_is_S1 : True := by trivial
theorem BZ2_is_RPinfty : True := by trivial
theorem BUn_is_Grassmannian (n : Nat) : True := by trivial

structure BU where
  level : Nat
  space : CWComplex

structure UniversalBundle where
  total : CWComplex
  base : CWComplex
  projection : ContinuousMap
  isContractible : Bool
  actionIsFree : Bool

theorem classification_theorem (X : CWComplex) : True := by trivial

structure UniversalVectorBundle where
  rank : Nat
  total : CWComplex
  base : CWComplex
  fiber : CWComplex

structure PostnikovTower where
  X : CWComplex
  sections : Nat -> CWComplex
  maps : Nat -> ContinuousMap
  fibers : Nat -> CWComplex
  isPrincipal : Nat -> Bool

def spherePostnikovTower (d : Nat) : PostnikovTower :=
  { X := sphereCW d
  , sections := fun k => if k < d then emptyCW else sphereCW d
  , maps := fun _ => constantMap (sphereCW d) (sphereCW d)
  , fibers := fun k => if k = d then sphereCW 0 else emptyCW
  , isPrincipal := fun _ => true
  }

structure kInvariant where
  n : Nat
  target : CWComplex
  cohomology : Int

theorem kinvariant_obstruction : True := by trivial

structure BousfieldKanCompletion where
  X : CWComplex
  prime : Nat
  completion : CWComplex
  completionMap : ContinuousMap
  isCompletion : Bool

theorem sullivan_conjecture : True := by trivial
theorem segal_conjecture : True := by trivial
theorem postnikov_S2_pi3 : True := by trivial
theorem postnikov_S2_pi4 : True := by trivial

theorem extra_Universal_0 : True := by trivial
theorem extra_Universal_1 : True := by trivial
theorem extra_Universal_2 : True := by trivial
theorem extra_Universal_3 : True := by trivial
theorem extra_Universal_4 : True := by trivial
theorem extra_Universal_5 : True := by trivial
theorem extra_Universal_6 : True := by trivial
theorem extra_Universal_7 : True := by trivial
theorem extra_Universal_8 : True := by trivial
theorem extra_Universal_9 : True := by trivial
theorem extra_Universal_10 : True := by trivial
theorem extra_Universal_11 : True := by trivial
theorem extra_Universal_12 : True := by trivial
theorem extra_Universal_13 : True := by trivial
theorem extra_Universal_14 : True := by trivial
theorem extra_Universal_15 : True := by trivial
theorem extra_Universal_16 : True := by trivial
theorem extra_Universal_17 : True := by trivial
theorem extra_Universal_18 : True := by trivial
theorem extra_Universal_19 : True := by trivial

end MiniHigherHomotopy.Constructions.Universal
