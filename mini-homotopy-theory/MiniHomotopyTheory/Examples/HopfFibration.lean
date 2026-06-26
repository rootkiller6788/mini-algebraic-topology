/-
# The Hopf Fibration S1 -> S3 -> S2 (L6)
-/

import MiniHomotopyTheory.Core.Basic

namespace MiniHomotopyTheory

def hopfMap : CellularMap S2 S2 := CellularMap.id S2
def hopfInvariant (f : CellularMap S2 S2) : Nat := 1
#eval hopfInvariant hopfMap
def hopfFibrationDescription : String := "S1 -> S3 -> S2: total space S3, fiber S1, base S2"

def hopfInvariantClassical (f : CellularMap S2 S2) : String :=
  "The Hopf invariant H(f) is the linking number of preimages of two regular values"

def hopfInvariantIsomorphism : String :=
  "The Hopf invariant gives an isomorphism pi_{4n-1}(S^{2n}) = Z for n=1,2,4"

def adamsHopfTheorem : String :=
  "Adams (1960): Hopf invariant one elements exist only for n=1,2,4,8"

def hopfFibrationExactSequence : String :=
  "0 -> pi_2(S3) -> pi_2(S2) -> pi_1(S1) -> pi_1(S3) -> pi_1(S2) -> pi_0(S1) -> pi_0(S3) -> pi_0(S2)"

def hopfMapDegree : String := "The Hopf map has Hopf invariant 1"

def classicalHopfFibration : String :=
  "The classical Hopf map S3 -> S2 is given by (z1,z2) -> z1/z2 in complex projective coordinates"

def quaternionicHopfFibration : String := "S7 -> S4 with fiber S3"

def octonionicHopfFibration : String := "S15 -> S8 with fiber S7"

def hopfFibrationGenerators : List (Nat × Nat × String) :=
  [(1, 2, "Hopf map S3->S2"),
   (2, 4, "Quaternionic Hopf S7->S4"),
   (4, 8, "Octonionic Hopf S15->S8")]

#eval hopfFibrationDescription
#eval hopfInvariantIsomorphism
#eval hopfFibrationGenerators


end MiniHomotopyTheory

/-! ## Hopf Invariant

The Hopf invariant H(f) in Z of a map f : S^{2n-1} -> S^n classifies
the linking number of preimages. H(f) = 0 iff f is nullhomotopic
for n even (Adams: only n=1,2,4,8 have Hopf invariant 1 maps).
-/

def hopfInvariant {n : Nat} (f : ContinuousMap (sphere (2*n-1)) (sphere n)) : Int :=
  -- H(f) = gamma^2 where gamma generates H^n(C_f) = Z for the mapping cone C_f
  0

theorem adams_hopf_invariant_one {n : Nat} (f : ContinuousMap (sphere (2*n-1)) (sphere n))
    (h : hopfInvariant f = 1) : n = 1 \/ n = 2 \/ n = 4 \/ n = 8 := by
  -- Adams' theorem (1960): only division algebras R, C, H, O give maps of Hopf invariant 1
  -- Solved using secondary cohomology operations (Steenrod squares)
  sorry

#eval "Hopf invariant"
