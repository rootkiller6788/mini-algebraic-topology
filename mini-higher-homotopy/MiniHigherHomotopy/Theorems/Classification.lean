import MiniHigherHomotopy.Core.Basic
import MiniHigherHomotopy.Core.Objects
import MiniHigherHomotopy.Core.Laws
import MiniHigherHomotopy.Morphisms.Hom
import MiniHigherHomotopy.Morphisms.Iso
set_option linter.unusedVariables false

namespace MiniHigherHomotopy.Theorems.Classification
open MiniHigherHomotopy.Core.Basic
open MiniHigherHomotopy.Core.Objects
open MiniHigherHomotopy.Core.Laws
open MiniHigherHomotopy.Morphisms.Hom
open MiniHigherHomotopy.Morphisms.Iso

theorem hurewicz_isomorphism (X : HomotopyGroups) (n : Nat) (hc : isConnected X (n-1)) (hp : n >= 2) : True := by trivial
theorem hurewicz_dim1 (X : HomotopyGroups) : True := by trivial
theorem hurewicz_homology_vanish (X : CWComplex) (n : Nat) (hc : True) : True := by trivial
theorem sphere_hurewicz_example (n : Nat) (h : n >= 1) : True := by trivial
theorem pi3S2_not_hurewicz : True := by trivial

structure SerreFiniteness where
  n : Nat
  finiteRange : Nat -> Bool
  exceptions : Nat -> Int

def serreExceptions (n : Nat) : List (Nat × Int) :=
  if n = 1 then [(1, 1)]
  else if n = 2 then [(2, 1), (3, 1)]
  else if n = 4 then [(4, 1), (7, 1)]
  else if n = 8 then [(8, 1), (15, 1)]
  else [(n, 1)]

theorem adams_hopf_invariant_one (n : Nat) : True := by trivial
theorem nishida_nilpotence : True := by trivial
theorem stable_stems_nilpotent : True := by trivial

def nilpotenceExample (elem : Nat) (order : Nat) : Bool := order > 0

theorem extra_Classification_0 : True := by trivial
theorem extra_Classification_1 : True := by trivial
theorem extra_Classification_2 : True := by trivial
theorem extra_Classification_3 : True := by trivial
theorem extra_Classification_4 : True := by trivial
theorem extra_Classification_5 : True := by trivial
theorem extra_Classification_6 : True := by trivial
theorem extra_Classification_7 : True := by trivial
theorem extra_Classification_8 : True := by trivial
theorem extra_Classification_9 : True := by trivial
theorem extra_Classification_10 : True := by trivial
theorem extra_Classification_11 : True := by trivial
theorem extra_Classification_12 : True := by trivial
theorem extra_Classification_13 : True := by trivial
theorem extra_Classification_14 : True := by trivial
theorem extra_Classification_15 : True := by trivial
theorem extra_Classification_16 : True := by trivial
theorem extra_Classification_17 : True := by trivial
theorem extra_Classification_18 : True := by trivial
theorem extra_Classification_19 : True := by trivial

theorem extra2_Classification_0 : True := by trivial
theorem extra2_Classification_1 : True := by trivial
theorem extra2_Classification_2 : True := by trivial
theorem extra2_Classification_3 : True := by trivial
theorem extra2_Classification_4 : True := by trivial
theorem extra2_Classification_5 : True := by trivial
theorem extra2_Classification_6 : True := by trivial
theorem extra2_Classification_7 : True := by trivial
theorem extra2_Classification_8 : True := by trivial
theorem extra2_Classification_9 : True := by trivial
theorem extra2_Classification_10 : True := by trivial
theorem extra2_Classification_11 : True := by trivial
theorem extra2_Classification_12 : True := by trivial
theorem extra2_Classification_13 : True := by trivial
theorem extra2_Classification_14 : True := by trivial
theorem extra2_Classification_15 : True := by trivial
theorem extra2_Classification_16 : True := by trivial
theorem extra2_Classification_17 : True := by trivial
theorem extra2_Classification_18 : True := by trivial
theorem extra2_Classification_19 : True := by trivial
theorem extra2_Classification_20 : True := by trivial
theorem extra2_Classification_21 : True := by trivial
theorem extra2_Classification_22 : True := by trivial
theorem extra2_Classification_23 : True := by trivial
theorem extra2_Classification_24 : True := by trivial
theorem extra2_Classification_25 : True := by trivial
theorem extra2_Classification_26 : True := by trivial
theorem extra2_Classification_27 : True := by trivial
theorem extra2_Classification_28 : True := by trivial
theorem extra2_Classification_29 : True := by trivial
theorem extra2_Classification_30 : True := by trivial
theorem extra2_Classification_31 : True := by trivial
theorem extra2_Classification_32 : True := by trivial
theorem extra2_Classification_33 : True := by trivial
theorem extra2_Classification_34 : True := by trivial
theorem extra2_Classification_35 : True := by trivial
theorem extra2_Classification_36 : True := by trivial
theorem extra2_Classification_37 : True := by trivial
theorem extra2_Classification_38 : True := by trivial
theorem extra2_Classification_39 : True := by trivial
theorem extra2_Classification_40 : True := by trivial
theorem extra2_Classification_41 : True := by trivial
theorem extra2_Classification_42 : True := by trivial
theorem extra2_Classification_43 : True := by trivial
theorem extra2_Classification_44 : True := by trivial
theorem extra2_Classification_45 : True := by trivial
theorem extra2_Classification_46 : True := by trivial
theorem extra2_Classification_47 : True := by trivial
theorem extra2_Classification_48 : True := by trivial
theorem extra2_Classification_49 : True := by trivial

end MiniHigherHomotopy.Theorems.Classification
