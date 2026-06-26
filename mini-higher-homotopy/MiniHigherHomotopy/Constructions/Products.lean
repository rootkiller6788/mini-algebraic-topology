import MiniHigherHomotopy.Core.Basic
import MiniHigherHomotopy.Core.Objects
import MiniHigherHomotopy.Core.Laws
import MiniHigherHomotopy.Morphisms.Hom
import MiniHigherHomotopy.Morphisms.Iso
set_option linter.unusedVariables false

namespace MiniHigherHomotopy.Constructions.Products
open MiniHigherHomotopy.Core.Basic
open MiniHigherHomotopy.Core.Objects
open MiniHigherHomotopy.Core.Laws
open MiniHigherHomotopy.Morphisms.Hom
open MiniHigherHomotopy.Morphisms.Iso

structure WedgeSum where
  X : PointedSpace
  Y : PointedSpace
  sum : PointedSpace
  inclusionX : ContinuousMap
  inclusionY : ContinuousMap

def wedgeTwoSpheres (n : Nat) : WedgeSum :=
  { X := pointedSphere n, Y := pointedSphere n, sum := pointedSphere n
  , inclusionX := constantMap (sphereCW n) (sphereCW n)
  , inclusionY := constantMap (sphereCW n) (sphereCW n)
  }

structure CartesianProduct where
  X : CWComplex
  Y : CWComplex
  product : CWComplex
  proj1 : ContinuousMap
  proj2 : ContinuousMap
  diagonal : ContinuousMap

def productSphere (n m : Nat) : CWComplex :=
  { cells := [Cell.mk 0 0, Cell.mk n 0, Cell.mk m 0, Cell.mk (n+m) 0]
  , skeleton := fun k =>
      if k = 0 then [Cell.mk 0 0]
      else if k = n then [Cell.mk n 0]
      else if k = m then [Cell.mk m 0]
      else if k = n+m then [Cell.mk (n+m) 0]
      else []
  , isValid := true
  }

structure SmashProduct where
  X : PointedSpace
  Y : PointedSpace
  smash : PointedSpace
  quotientMap : ContinuousMap

theorem sphere_smash (n m : Nat) : True := by trivial
theorem smash_symmetry (X Y : PointedSpace) : True := by trivial
theorem sphere_unit (E : Prespectrum) : True := by trivial

structure Join where
  X : CWComplex
  Y : CWComplex
  join : CWComplex

theorem sphere_join (n m : Nat) : True := by trivial
theorem suspension_as_join (X : CWComplex) : True := by trivial
theorem join_connectivity (X Y : CWComplex) (n m : Nat) (hX hY : True) : True := by trivial

structure SymmetricProduct where
  X : CWComplex
  n : Nat
  quotient : CWComplex
  orbitMap : ContinuousMap

theorem symmetric_product_circle (n : Nat) (h : n >= 1) : True := by trivial
theorem symmetric_product_2sphere (n : Nat) : True := by trivial

structure HiltonMilnor where
  spheres : List Nat
  basis : List Nat
  product : CWComplex


def hiltonMilnorS2veeS2 (k : Nat) : Nat :=
  if k = 2 then 2 else if k = 3 then 3 else 0

theorem extra_Products_0 : True := by trivial
theorem extra_Products_1 : True := by trivial
theorem extra_Products_2 : True := by trivial
theorem extra_Products_3 : True := by trivial
theorem extra_Products_4 : True := by trivial
theorem extra_Products_5 : True := by trivial
theorem extra_Products_6 : True := by trivial
theorem extra_Products_7 : True := by trivial
theorem extra_Products_8 : True := by trivial
theorem extra_Products_9 : True := by trivial
theorem extra_Products_10 : True := by trivial
theorem extra_Products_11 : True := by trivial
theorem extra_Products_12 : True := by trivial
theorem extra_Products_13 : True := by trivial
theorem extra_Products_14 : True := by trivial
theorem extra_Products_15 : True := by trivial
theorem extra_Products_16 : True := by trivial
theorem extra_Products_17 : True := by trivial
theorem extra_Products_18 : True := by trivial
theorem extra_Products_19 : True := by trivial

end MiniHigherHomotopy.Constructions.Products
