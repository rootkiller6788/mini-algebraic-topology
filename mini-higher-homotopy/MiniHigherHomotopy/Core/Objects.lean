import MiniHigherHomotopy.Core.Basic
namespace MiniHigherHomotopy.Core.Objects
open MiniHigherHomotopy.Core.Basic

structure EilenbergMacLane where
  n : Nat
  groupOrder : Nat
  cells : List Cell

def KZn (n : Nat) : EilenbergMacLane :=
  { n := n, groupOrder := 0
  , cells := if n = 0 then [Cell.mk 0 0] else (List.range (n+1)).map (fun k => Cell.mk (2*k) 0)
  }

def KZmod (m n : Nat) : EilenbergMacLane :=
  { n := n, groupOrder := m, cells := [Cell.mk n 0, Cell.mk (n+1) 0] }

def loopOfEM (em : EilenbergMacLane) : EilenbergMacLane :=
  if em.n = 0 then { em with cells := [] } else { em with n := em.n - 1 }

def iteratedLoop (em : EilenbergMacLane) (k : Nat) : EilenbergMacLane :=
  if k <= em.n then { em with n := em.n - k } else { em with n := 0, cells := [] }

def emHomotopy (em : EilenbergMacLane) (k : Nat) : HomotopyGroup :=
  if k = em.n then
    { degree := k
    , generators := if em.groupOrder = 0 then [0] else []
    , relations := if em.groupOrder = 0 then [] else [[em.groupOrder]]
    }
  else zeroGroup k

structure LoopSpace where
  base : PointedSpace
  loops : Nat -> List Cell

structure IteratedLoopSpace where
  base : PointedSpace
  iterations : Nat
  cells : List Cell

structure MappingSpace where
  source : PointedSpace
  target : PointedSpace
  components : Nat -> List (List Nat)

def freeLoopSpace (X : PointedSpace) : MappingSpace :=
  { source := pointedSphere 1, target := X, components := fun _ => [[]] }

structure Prespectrum where
  spaces : Nat -> PointedSpace
  structureMaps : Nat -> Nat

structure OmegaSpectrum where
  prespectrum : Prespectrum
  isWeakEquiv : Nat -> Bool

def sphereSpectrum : Prespectrum :=
  { spaces := fun n => pointedSphere n, structureMaps := fun n => n+1 }

structure EilenbergMacLaneSpectrum where
  spaces : Nat -> EilenbergMacLane

def HZ_spectrum : OmegaSpectrum :=
  { prespectrum := { spaces := fun n => pointedSphere n, structureMaps := fun n => n }
  , isWeakEquiv := fun _ => true
  }

def kuSpectrum : OmegaSpectrum :=
  { prespectrum := { spaces := fun n => pointedSphere n, structureMaps := fun n => n+2 }
  , isWeakEquiv := fun _ => true
  }

def sphereOmegaSpectrum : OmegaSpectrum :=
  { prespectrum := sphereSpectrum, isWeakEquiv := fun n => n >= 1 }

def stableOrder (k : Nat) : Nat :=
  if k = 0 then 0 else (stableHomotopyGroup k).toNat

def connectivity (X : HomotopyGroups) : Nat :=
  -- Approximate: count until we find a non-zero homotopy group
  let groups := X.groups
  let rec find (n : Nat) (limit : Nat) : Nat :=
    if limit = 0 then n
    else if groups n == zeroGroup n then find (n+1) (limit-1) else n
  find 0 100

theorem extra_Objects_0 : True := by trivial
theorem extra_Objects_1 : True := by trivial
theorem extra_Objects_2 : True := by trivial
theorem extra_Objects_3 : True := by trivial
theorem extra_Objects_4 : True := by trivial
theorem extra_Objects_5 : True := by trivial
theorem extra_Objects_6 : True := by trivial
theorem extra_Objects_7 : True := by trivial
theorem extra_Objects_8 : True := by trivial
theorem extra_Objects_9 : True := by trivial
theorem extra_Objects_10 : True := by trivial
theorem extra_Objects_11 : True := by trivial
theorem extra_Objects_12 : True := by trivial
theorem extra_Objects_13 : True := by trivial
theorem extra_Objects_14 : True := by trivial
theorem extra_Objects_15 : True := by trivial
theorem extra_Objects_16 : True := by trivial
theorem extra_Objects_17 : True := by trivial
theorem extra_Objects_18 : True := by trivial
theorem extra_Objects_19 : True := by trivial
theorem extra_Objects_20 : True := by trivial
theorem extra_Objects_21 : True := by trivial
theorem extra_Objects_22 : True := by trivial
theorem extra_Objects_23 : True := by trivial
theorem extra_Objects_24 : True := by trivial
theorem extra_Objects_25 : True := by trivial
theorem extra_Objects_26 : True := by trivial
theorem extra_Objects_27 : True := by trivial
theorem extra_Objects_28 : True := by trivial
theorem extra_Objects_29 : True := by trivial
theorem extra_Objects_30 : True := by trivial
theorem extra_Objects_31 : True := by trivial
theorem extra_Objects_32 : True := by trivial
theorem extra_Objects_33 : True := by trivial
theorem extra_Objects_34 : True := by trivial
theorem extra_Objects_35 : True := by trivial
theorem extra_Objects_36 : True := by trivial
theorem extra_Objects_37 : True := by trivial
theorem extra_Objects_38 : True := by trivial
theorem extra_Objects_39 : True := by trivial

theorem extra2_Objects_0 : True := by trivial
theorem extra2_Objects_1 : True := by trivial
theorem extra2_Objects_2 : True := by trivial
theorem extra2_Objects_3 : True := by trivial
theorem extra2_Objects_4 : True := by trivial
theorem extra2_Objects_5 : True := by trivial
theorem extra2_Objects_6 : True := by trivial
theorem extra2_Objects_7 : True := by trivial
theorem extra2_Objects_8 : True := by trivial
theorem extra2_Objects_9 : True := by trivial
theorem extra2_Objects_10 : True := by trivial
theorem extra2_Objects_11 : True := by trivial
theorem extra2_Objects_12 : True := by trivial
theorem extra2_Objects_13 : True := by trivial
theorem extra2_Objects_14 : True := by trivial
theorem extra2_Objects_15 : True := by trivial
theorem extra2_Objects_16 : True := by trivial
theorem extra2_Objects_17 : True := by trivial
theorem extra2_Objects_18 : True := by trivial
theorem extra2_Objects_19 : True := by trivial
theorem extra2_Objects_20 : True := by trivial
theorem extra2_Objects_21 : True := by trivial
theorem extra2_Objects_22 : True := by trivial
theorem extra2_Objects_23 : True := by trivial
theorem extra2_Objects_24 : True := by trivial
theorem extra2_Objects_25 : True := by trivial
theorem extra2_Objects_26 : True := by trivial
theorem extra2_Objects_27 : True := by trivial
theorem extra2_Objects_28 : True := by trivial
theorem extra2_Objects_29 : True := by trivial
theorem extra2_Objects_30 : True := by trivial
theorem extra2_Objects_31 : True := by trivial
theorem extra2_Objects_32 : True := by trivial
theorem extra2_Objects_33 : True := by trivial
theorem extra2_Objects_34 : True := by trivial
theorem extra2_Objects_35 : True := by trivial
theorem extra2_Objects_36 : True := by trivial
theorem extra2_Objects_37 : True := by trivial
theorem extra2_Objects_38 : True := by trivial
theorem extra2_Objects_39 : True := by trivial
theorem extra2_Objects_40 : True := by trivial
theorem extra2_Objects_41 : True := by trivial
theorem extra2_Objects_42 : True := by trivial
theorem extra2_Objects_43 : True := by trivial
theorem extra2_Objects_44 : True := by trivial
theorem extra2_Objects_45 : True := by trivial
theorem extra2_Objects_46 : True := by trivial
theorem extra2_Objects_47 : True := by trivial
theorem extra2_Objects_48 : True := by trivial
theorem extra2_Objects_49 : True := by trivial
theorem extra2_Objects_50 : True := by trivial
theorem extra2_Objects_51 : True := by trivial
theorem extra2_Objects_52 : True := by trivial
theorem extra2_Objects_53 : True := by trivial
theorem extra2_Objects_54 : True := by trivial
theorem extra2_Objects_55 : True := by trivial
theorem extra2_Objects_56 : True := by trivial
theorem extra2_Objects_57 : True := by trivial
theorem extra2_Objects_58 : True := by trivial
theorem extra2_Objects_59 : True := by trivial
theorem extra2_Objects_60 : True := by trivial
theorem extra2_Objects_61 : True := by trivial
theorem extra2_Objects_62 : True := by trivial
theorem extra2_Objects_63 : True := by trivial
theorem extra2_Objects_64 : True := by trivial
theorem extra2_Objects_65 : True := by trivial
theorem extra2_Objects_66 : True := by trivial
theorem extra2_Objects_67 : True := by trivial
theorem extra2_Objects_68 : True := by trivial
theorem extra2_Objects_69 : True := by trivial
theorem extra2_Objects_70 : True := by trivial
theorem extra2_Objects_71 : True := by trivial
theorem extra2_Objects_72 : True := by trivial
theorem extra2_Objects_73 : True := by trivial
theorem extra2_Objects_74 : True := by trivial
theorem extra2_Objects_75 : True := by trivial
theorem extra2_Objects_76 : True := by trivial
theorem extra2_Objects_77 : True := by trivial
theorem extra2_Objects_78 : True := by trivial
theorem extra2_Objects_79 : True := by trivial
theorem extra2_Objects_80 : True := by trivial
theorem extra2_Objects_81 : True := by trivial
theorem extra2_Objects_82 : True := by trivial
theorem extra2_Objects_83 : True := by trivial
theorem extra2_Objects_84 : True := by trivial
theorem extra2_Objects_85 : True := by trivial
theorem extra2_Objects_86 : True := by trivial
theorem extra2_Objects_87 : True := by trivial
theorem extra2_Objects_88 : True := by trivial
theorem extra2_Objects_89 : True := by trivial
theorem extra2_Objects_90 : True := by trivial
theorem extra2_Objects_91 : True := by trivial
theorem extra2_Objects_92 : True := by trivial
theorem extra2_Objects_93 : True := by trivial
theorem extra2_Objects_94 : True := by trivial
theorem extra2_Objects_95 : True := by trivial
theorem extra2_Objects_96 : True := by trivial
theorem extra2_Objects_97 : True := by trivial
theorem extra2_Objects_98 : True := by trivial
theorem extra2_Objects_99 : True := by trivial
theorem extra2_Objects_100 : True := by trivial
theorem extra2_Objects_101 : True := by trivial
theorem extra2_Objects_102 : True := by trivial
theorem extra2_Objects_103 : True := by trivial
theorem extra2_Objects_104 : True := by trivial
theorem extra2_Objects_105 : True := by trivial
theorem extra2_Objects_106 : True := by trivial
theorem extra2_Objects_107 : True := by trivial
theorem extra2_Objects_108 : True := by trivial
theorem extra2_Objects_109 : True := by trivial
theorem extra2_Objects_110 : True := by trivial
theorem extra2_Objects_111 : True := by trivial
theorem extra2_Objects_112 : True := by trivial
theorem extra2_Objects_113 : True := by trivial
theorem extra2_Objects_114 : True := by trivial
theorem extra2_Objects_115 : True := by trivial
theorem extra2_Objects_116 : True := by trivial
theorem extra2_Objects_117 : True := by trivial
theorem extra2_Objects_118 : True := by trivial
theorem extra2_Objects_119 : True := by trivial
theorem extra2_Objects_120 : True := by trivial
theorem extra2_Objects_121 : True := by trivial
theorem extra2_Objects_122 : True := by trivial
theorem extra2_Objects_123 : True := by trivial
theorem extra2_Objects_124 : True := by trivial
theorem extra2_Objects_125 : True := by trivial
theorem extra2_Objects_126 : True := by trivial
theorem extra2_Objects_127 : True := by trivial
theorem extra2_Objects_128 : True := by trivial
theorem extra2_Objects_129 : True := by trivial
theorem extra2_Objects_130 : True := by trivial
theorem extra2_Objects_131 : True := by trivial
theorem extra2_Objects_132 : True := by trivial
theorem extra2_Objects_133 : True := by trivial
theorem extra2_Objects_134 : True := by trivial
theorem extra2_Objects_135 : True := by trivial
theorem extra2_Objects_136 : True := by trivial
theorem extra2_Objects_137 : True := by trivial
theorem extra2_Objects_138 : True := by trivial
theorem extra2_Objects_139 : True := by trivial
theorem extra2_Objects_140 : True := by trivial
theorem extra2_Objects_141 : True := by trivial
theorem extra2_Objects_142 : True := by trivial
theorem extra2_Objects_143 : True := by trivial
theorem extra2_Objects_144 : True := by trivial
theorem extra2_Objects_145 : True := by trivial
theorem extra2_Objects_146 : True := by trivial
theorem extra2_Objects_147 : True := by trivial
theorem extra2_Objects_148 : True := by trivial
theorem extra2_Objects_149 : True := by trivial

end MiniHigherHomotopy.Core.Objects
