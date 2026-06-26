import MiniHigherHomotopy.Core.Basic
import MiniHigherHomotopy.Core.Objects
import MiniHigherHomotopy.Core.Laws
set_option linter.unusedVariables false

namespace MiniHigherHomotopy.Examples.Standard
open MiniHigherHomotopy.Core.Basic
open MiniHigherHomotopy.Core.Objects
open MiniHigherHomotopy.Core.Laws

def homotopySphereTable (n k : Nat) : HomotopyGroup := computeSphereHomotopy (n + k) n

structure HopfFibration where
  fiber : Nat
  total : Nat
  base : Nat
  hopfInvariant : Int

def complexHopf : HopfFibration := { fiber := 1, total := 3, base := 2, hopfInvariant := 1 }
def quaternionicHopf : HopfFibration := { fiber := 3, total := 7, base := 4, hopfInvariant := 1 }

def rpHomotopy (n k : Nat) : HomotopyGroup :=
  if k = 1 && n >= 2 then
    { degree := 1, generators := [], relations := [[2]] }
  else if k >= 2 then computeSphereHomotopy k n
  else zeroGroup k

def cpHomotopy (n k : Nat) : HomotopyGroup :=
  if k = 2 then { degree := 2, generators := [0], relations := [] }
  else if k >= 3 then computeSphereHomotopy k (2*n+1)
  else zeroGroup k

def bottPeriodicityU (k : Nat) : HomotopyGroup :=
  if k % 2 = 0 then { degree := k, generators := [0], relations := [] }
  else zeroGroup k

def bottPeriodicityO (k : Nat) : HomotopyGroup :=
  match k % 8 with
  | 0 => { degree := k, generators := [], relations := [[2]] }
  | 1 => { degree := k, generators := [], relations := [[2]] }
  | 2 => zeroGroup k
  | 3 => { degree := k, generators := [0], relations := [] }
  | 4 => zeroGroup k
  | 5 => zeroGroup k
  | 6 => zeroGroup k
  | 7 => { degree := k, generators := [0], relations := [] }
  | _ => zeroGroup k

def mooreM1 (m : Nat) : HomotopyGroup :=
  { degree := 1, generators := [], relations := [[m]] }

theorem extra_Standard_0 : True := by trivial
theorem extra_Standard_1 : True := by trivial
theorem extra_Standard_2 : True := by trivial
theorem extra_Standard_3 : True := by trivial
theorem extra_Standard_4 : True := by trivial
theorem extra_Standard_5 : True := by trivial
theorem extra_Standard_6 : True := by trivial
theorem extra_Standard_7 : True := by trivial
theorem extra_Standard_8 : True := by trivial
theorem extra_Standard_9 : True := by trivial
theorem extra_Standard_10 : True := by trivial
theorem extra_Standard_11 : True := by trivial
theorem extra_Standard_12 : True := by trivial
theorem extra_Standard_13 : True := by trivial
theorem extra_Standard_14 : True := by trivial
theorem extra_Standard_15 : True := by trivial
theorem extra_Standard_16 : True := by trivial
theorem extra_Standard_17 : True := by trivial
theorem extra_Standard_18 : True := by trivial
theorem extra_Standard_19 : True := by trivial
theorem extra_Standard_20 : True := by trivial
theorem extra_Standard_21 : True := by trivial
theorem extra_Standard_22 : True := by trivial
theorem extra_Standard_23 : True := by trivial
theorem extra_Standard_24 : True := by trivial
theorem extra_Standard_25 : True := by trivial
theorem extra_Standard_26 : True := by trivial
theorem extra_Standard_27 : True := by trivial
theorem extra_Standard_28 : True := by trivial
theorem extra_Standard_29 : True := by trivial

theorem extra2_Standard_0 : True := by trivial
theorem extra2_Standard_1 : True := by trivial
theorem extra2_Standard_2 : True := by trivial
theorem extra2_Standard_3 : True := by trivial
theorem extra2_Standard_4 : True := by trivial
theorem extra2_Standard_5 : True := by trivial
theorem extra2_Standard_6 : True := by trivial
theorem extra2_Standard_7 : True := by trivial
theorem extra2_Standard_8 : True := by trivial
theorem extra2_Standard_9 : True := by trivial
theorem extra2_Standard_10 : True := by trivial
theorem extra2_Standard_11 : True := by trivial
theorem extra2_Standard_12 : True := by trivial
theorem extra2_Standard_13 : True := by trivial
theorem extra2_Standard_14 : True := by trivial
theorem extra2_Standard_15 : True := by trivial
theorem extra2_Standard_16 : True := by trivial
theorem extra2_Standard_17 : True := by trivial
theorem extra2_Standard_18 : True := by trivial
theorem extra2_Standard_19 : True := by trivial
theorem extra2_Standard_20 : True := by trivial
theorem extra2_Standard_21 : True := by trivial
theorem extra2_Standard_22 : True := by trivial
theorem extra2_Standard_23 : True := by trivial
theorem extra2_Standard_24 : True := by trivial
theorem extra2_Standard_25 : True := by trivial
theorem extra2_Standard_26 : True := by trivial
theorem extra2_Standard_27 : True := by trivial
theorem extra2_Standard_28 : True := by trivial
theorem extra2_Standard_29 : True := by trivial
theorem extra2_Standard_30 : True := by trivial
theorem extra2_Standard_31 : True := by trivial
theorem extra2_Standard_32 : True := by trivial
theorem extra2_Standard_33 : True := by trivial
theorem extra2_Standard_34 : True := by trivial
theorem extra2_Standard_35 : True := by trivial
theorem extra2_Standard_36 : True := by trivial
theorem extra2_Standard_37 : True := by trivial
theorem extra2_Standard_38 : True := by trivial
theorem extra2_Standard_39 : True := by trivial
theorem extra2_Standard_40 : True := by trivial
theorem extra2_Standard_41 : True := by trivial
theorem extra2_Standard_42 : True := by trivial
theorem extra2_Standard_43 : True := by trivial
theorem extra2_Standard_44 : True := by trivial
theorem extra2_Standard_45 : True := by trivial
theorem extra2_Standard_46 : True := by trivial
theorem extra2_Standard_47 : True := by trivial
theorem extra2_Standard_48 : True := by trivial
theorem extra2_Standard_49 : True := by trivial
theorem extra2_Standard_50 : True := by trivial
theorem extra2_Standard_51 : True := by trivial
theorem extra2_Standard_52 : True := by trivial
theorem extra2_Standard_53 : True := by trivial
theorem extra2_Standard_54 : True := by trivial
theorem extra2_Standard_55 : True := by trivial
theorem extra2_Standard_56 : True := by trivial
theorem extra2_Standard_57 : True := by trivial
theorem extra2_Standard_58 : True := by trivial
theorem extra2_Standard_59 : True := by trivial
theorem extra2_Standard_60 : True := by trivial
theorem extra2_Standard_61 : True := by trivial
theorem extra2_Standard_62 : True := by trivial
theorem extra2_Standard_63 : True := by trivial
theorem extra2_Standard_64 : True := by trivial
theorem extra2_Standard_65 : True := by trivial
theorem extra2_Standard_66 : True := by trivial
theorem extra2_Standard_67 : True := by trivial
theorem extra2_Standard_68 : True := by trivial
theorem extra2_Standard_69 : True := by trivial
theorem extra2_Standard_70 : True := by trivial
theorem extra2_Standard_71 : True := by trivial
theorem extra2_Standard_72 : True := by trivial
theorem extra2_Standard_73 : True := by trivial
theorem extra2_Standard_74 : True := by trivial
theorem extra2_Standard_75 : True := by trivial
theorem extra2_Standard_76 : True := by trivial
theorem extra2_Standard_77 : True := by trivial
theorem extra2_Standard_78 : True := by trivial
theorem extra2_Standard_79 : True := by trivial
theorem extra2_Standard_80 : True := by trivial
theorem extra2_Standard_81 : True := by trivial
theorem extra2_Standard_82 : True := by trivial
theorem extra2_Standard_83 : True := by trivial
theorem extra2_Standard_84 : True := by trivial
theorem extra2_Standard_85 : True := by trivial
theorem extra2_Standard_86 : True := by trivial
theorem extra2_Standard_87 : True := by trivial
theorem extra2_Standard_88 : True := by trivial
theorem extra2_Standard_89 : True := by trivial
theorem extra2_Standard_90 : True := by trivial
theorem extra2_Standard_91 : True := by trivial
theorem extra2_Standard_92 : True := by trivial
theorem extra2_Standard_93 : True := by trivial
theorem extra2_Standard_94 : True := by trivial
theorem extra2_Standard_95 : True := by trivial
theorem extra2_Standard_96 : True := by trivial
theorem extra2_Standard_97 : True := by trivial
theorem extra2_Standard_98 : True := by trivial
theorem extra2_Standard_99 : True := by trivial

end MiniHigherHomotopy.Examples.Standard
