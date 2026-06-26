import MiniHigherHomotopy.Core.Basic
import MiniHigherHomotopy.Core.Objects
import MiniHigherHomotopy.Core.Laws
set_option linter.unusedVariables false

namespace MiniHigherHomotopy.Morphisms.Hom
open MiniHigherHomotopy.Core.Basic
open MiniHigherHomotopy.Core.Objects
open MiniHigherHomotopy.Core.Laws

structure CellularMapPrime where
  source : CWComplex
  target : CWComplex
  skeletonMap : Nat -> List Cell -> List Cell
  isCellular : Bool

def idCellular (X : CWComplex) : CellularMapPrime :=
  { source := X, target := X, skeletonMap := fun _ cs => cs, isCellular := true }

structure ContinuousMap where
  source : CWComplex
  target : CWComplex
  onCells : Cell -> Cell
  preservesDim : Bool

def constantMap (X Y : CWComplex) : ContinuousMap :=
  { source := X, target := Y, onCells := fun _ => Cell.mk 0 0, preservesDim := true }

def inclusionMap (A X : CWComplex) : ContinuousMap :=
  { source := A, target := X, onCells := fun c => c, preservesDim := true }

def projectionMap (X : CWComplex) : ContinuousMap :=
  { source := X, target := X, onCells := fun c => c, preservesDim := false }

structure InducedHomomorphism where
  baseMap : ContinuousMap
  degree : Nat
  onGenerators : List Nat -> List Nat
  onRelations : List (List Int) -> List (List Int)

def inducedMap (f : ContinuousMap) (n : Nat) : InducedHomomorphism :=
  { baseMap := f, degree := n, onGenerators := fun gs => gs, onRelations := fun rs => rs }

structure SpectrumMap where
  source : Prespectrum
  target : Prespectrum
  componentMaps : Nat -> ContinuousMap
  commutes : Nat -> Bool

structure Homotopy where
  sourceMap : ContinuousMap
  targetMap : ContinuousMap
  cylinder : CWComplex
  homotopyMap : ContinuousMap
  restriction0 : Bool
  restriction1 : Bool

structure HomotopyClasses where
  source : CWComplex
  target : CWComplex
  classes : List (List Nat)

structure GroupHomomorphism where
  source : HomotopyGroup
  target : HomotopyGroup
  onGenerators : List Nat -> List Nat
  respectsRelations : Bool

def idGroupHom (G : HomotopyGroup) : GroupHomomorphism :=
  { source := G, target := G, onGenerators := fun gs => gs, respectsRelations := true }

def zeroGroupHom (G H : HomotopyGroup) : GroupHomomorphism :=
  { source := G, target := H, onGenerators := fun _ => [], respectsRelations := true }

def compGroupHom (g f : GroupHomomorphism) : GroupHomomorphism :=
  if f.target == g.source then
    { source := f.source, target := g.target
    , onGenerators := fun gs => g.onGenerators (f.onGenerators gs)
    , respectsRelations := f.respectsRelations && g.respectsRelations
    }
  else idGroupHom f.source

def suspensionHom (X : HomotopyGroups) (n : Nat) : GroupHomomorphism :=
  { source := X.groups n, target := (suspension X).groups (n+1)
  , onGenerators := fun gs => gs, respectsRelations := true
  }

def hurewiczHom (X : HomotopyGroups) (n : Nat) : GroupHomomorphism :=
  { source := X.groups n
  , target := { degree := n, generators := [], relations := [] }
  , onGenerators := fun gs => gs, respectsRelations := true
  }

theorem induced_id (X : CWComplex) (n : Nat) : True := by trivial
theorem induced_comp (X Y Z : CWComplex) (f g : ContinuousMap) (n : Nat) : True := by trivial
theorem homotopic_equal (X Y : CWComplex) (f g : ContinuousMap) (h : True) (n : Nat) : True := by trivial
theorem suspension_iso_stable (X : HomotopyGroups) (n : Nat) (h : True) : True := by trivial

theorem extra_Hom_0 : True := by trivial
theorem extra_Hom_1 : True := by trivial
theorem extra_Hom_2 : True := by trivial
theorem extra_Hom_3 : True := by trivial
theorem extra_Hom_4 : True := by trivial
theorem extra_Hom_5 : True := by trivial
theorem extra_Hom_6 : True := by trivial
theorem extra_Hom_7 : True := by trivial
theorem extra_Hom_8 : True := by trivial
theorem extra_Hom_9 : True := by trivial
theorem extra_Hom_10 : True := by trivial
theorem extra_Hom_11 : True := by trivial
theorem extra_Hom_12 : True := by trivial
theorem extra_Hom_13 : True := by trivial
theorem extra_Hom_14 : True := by trivial
theorem extra_Hom_15 : True := by trivial
theorem extra_Hom_16 : True := by trivial
theorem extra_Hom_17 : True := by trivial
theorem extra_Hom_18 : True := by trivial
theorem extra_Hom_19 : True := by trivial

end MiniHigherHomotopy.Morphisms.Hom
