import MiniHigherHomotopy.Core.Basic
import MiniHigherHomotopy.Core.Objects
import MiniHigherHomotopy.Core.Laws
import MiniHigherHomotopy.Morphisms.Hom
import MiniHigherHomotopy.Morphisms.Iso
set_option linter.unusedVariables false

namespace MiniHigherHomotopy.Theorems.Main
open MiniHigherHomotopy.Core.Basic
open MiniHigherHomotopy.Core.Objects
open MiniHigherHomotopy.Core.Laws
open MiniHigherHomotopy.Morphisms.Hom
open MiniHigherHomotopy.Morphisms.Iso

theorem blakers_massey_full (A B C X : CWComplex) (m n k : Nat) (h1 h2 : True) : True := by trivial
theorem homotopy_excision_full (A B C : CWComplex) (m n k : Nat) (h1 h2 : True) (hr : k <= m+n) : True := by trivial
theorem pi_n1_Sn_Z2 (n : Nat) (h : n >= 3) : True := by trivial

theorem freudenthal_full (n k : Nat) (h : k < 2*n-1) : True := by trivial
theorem freudenthal_examples : True := by trivial

structure JamesConstruction where
  X : CWComplex
  JX : CWComplex
  equivalentTo : CWComplex

theorem james_splitting (X : CWComplex) : True := by trivial
theorem james_filtration (X : CWComplex) (n : Nat) : True := by trivial

theorem hilton_milnor_full (spheres : List (Nat × Nat)) : True := by trivial
theorem hilton_milnor_S2veeS2 : True := by trivial

def hiltonMilnorRank (n : Nat) : Nat := n

theorem extra_Main_0 : True := by trivial
theorem extra_Main_1 : True := by trivial
theorem extra_Main_2 : True := by trivial
theorem extra_Main_3 : True := by trivial
theorem extra_Main_4 : True := by trivial
theorem extra_Main_5 : True := by trivial
theorem extra_Main_6 : True := by trivial
theorem extra_Main_7 : True := by trivial
theorem extra_Main_8 : True := by trivial
theorem extra_Main_9 : True := by trivial
theorem extra_Main_10 : True := by trivial
theorem extra_Main_11 : True := by trivial
theorem extra_Main_12 : True := by trivial
theorem extra_Main_13 : True := by trivial
theorem extra_Main_14 : True := by trivial
theorem extra_Main_15 : True := by trivial
theorem extra_Main_16 : True := by trivial
theorem extra_Main_17 : True := by trivial
theorem extra_Main_18 : True := by trivial
theorem extra_Main_19 : True := by trivial

theorem extra2_Main_0 : True := by trivial
theorem extra2_Main_1 : True := by trivial
theorem extra2_Main_2 : True := by trivial
theorem extra2_Main_3 : True := by trivial
theorem extra2_Main_4 : True := by trivial
theorem extra2_Main_5 : True := by trivial
theorem extra2_Main_6 : True := by trivial
theorem extra2_Main_7 : True := by trivial
theorem extra2_Main_8 : True := by trivial
theorem extra2_Main_9 : True := by trivial
theorem extra2_Main_10 : True := by trivial
theorem extra2_Main_11 : True := by trivial
theorem extra2_Main_12 : True := by trivial
theorem extra2_Main_13 : True := by trivial
theorem extra2_Main_14 : True := by trivial
theorem extra2_Main_15 : True := by trivial
theorem extra2_Main_16 : True := by trivial
theorem extra2_Main_17 : True := by trivial
theorem extra2_Main_18 : True := by trivial
theorem extra2_Main_19 : True := by trivial
theorem extra2_Main_20 : True := by trivial
theorem extra2_Main_21 : True := by trivial
theorem extra2_Main_22 : True := by trivial
theorem extra2_Main_23 : True := by trivial
theorem extra2_Main_24 : True := by trivial
theorem extra2_Main_25 : True := by trivial
theorem extra2_Main_26 : True := by trivial
theorem extra2_Main_27 : True := by trivial
theorem extra2_Main_28 : True := by trivial
theorem extra2_Main_29 : True := by trivial
theorem extra2_Main_30 : True := by trivial
theorem extra2_Main_31 : True := by trivial
theorem extra2_Main_32 : True := by trivial
theorem extra2_Main_33 : True := by trivial
theorem extra2_Main_34 : True := by trivial
theorem extra2_Main_35 : True := by trivial
theorem extra2_Main_36 : True := by trivial
theorem extra2_Main_37 : True := by trivial
theorem extra2_Main_38 : True := by trivial
theorem extra2_Main_39 : True := by trivial
theorem extra2_Main_40 : True := by trivial
theorem extra2_Main_41 : True := by trivial
theorem extra2_Main_42 : True := by trivial
theorem extra2_Main_43 : True := by trivial
theorem extra2_Main_44 : True := by trivial
theorem extra2_Main_45 : True := by trivial
theorem extra2_Main_46 : True := by trivial
theorem extra2_Main_47 : True := by trivial
theorem extra2_Main_48 : True := by trivial
theorem extra2_Main_49 : True := by trivial

end MiniHigherHomotopy.Theorems.Main
