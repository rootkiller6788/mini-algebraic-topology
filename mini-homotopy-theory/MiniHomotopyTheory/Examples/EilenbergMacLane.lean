/-
# Eilenberg-MacLane Spaces K(G,n) (L6)
-/

import MiniHomotopyTheory.Core.Basic
import MiniHomotopyTheory.Groups.FundamentalGroup

namespace MiniHomotopyTheory

def eilenbergMacLaneSpace (G : Nat) (n : Nat) : TwoComplex := match G, n with
  | _, 1 => mooreSpaceZmod G
  | _, _ => S2

def K_Z_1 : TwoComplex := S1
def K_Z2_1 : TwoComplex := mooreSpaceZmod 2

#eval K_Z_1.chi
#eval K_Z2_1.chi
#eval "pi_1(K(Z/2,1)) rank:"
#eval K_Z2_1.fundamentalGroupApprox 0 6 |>.length
def K_Z_2 : TwoComplex := mooreSpaceZmod 0
def K_Z3_1 : TwoComplex := mooreSpaceZmod 3
def K_Z5_1 : TwoComplex := mooreSpaceZmod 5

def KGroupTable : List (Nat × Int × Nat) :=
  (List.range 9).map fun n =>
    let m := n+1
    let K := mooreSpaceZmod m
    (m, K.chi, (K.fundamentalGroupApprox 0 8).length)

def eilenbergMacLaneProperty (G : Nat) (n : Nat) : String :=
  "pi_n(K(G,n)) = G, pi_k(K(G,n)) = 0 for k != n"

def classifyingSpaceBG (G : Nat) : TwoComplex := mooreSpaceZmod G

def groupCohomology (G : Nat) : String := "H^1(K(G,1); Z) = Hom(G, Z)"

def kTheorySpectrum : List TwoComplex := [S1, S2, S2]

def omegaSpectrum : String := "Omega-spectrum: K_n = Omega K_{n+1}"

def infiniteLoopSpace : String := "Infinite loop space: 0-th space of a spectrum"

def eilenbergMacLaneSpectrum : String := "HG: pi_n(HG) = G for n=0"

def cohomologyOperations : String := "Steenrod operations on H^*(X; Z/p)"

#eval KGroupTable
#eval eilenbergMacLaneProperty 2 1
#eval eilenbergMacLaneProperty 0 2
#eval groupCohomology 2
#eval classifyingSpaceBG 2 |>.chi


end MiniHomotopyTheory

/-! ## Construction of K(G,n)

K(Z,1) = S^1 (circle)
K(Z,2) = CP^inf (infinite complex projective space)
K(Z_2,1) = RP^inf (infinite real projective space)
-/

theorem KZ1_is_circle : HomotopyEquivalent (EilenbergMacLane Z 1) (sphere 1) := by
  sorry

theorem KZ2_is_CPinf : HomotopyEquivalent (EilenbergMacLane Z 2) (infiniteProjectiveSpace Complex) := by
  -- CP^inf has pi_2 = Z by Hurewicz (H_2 = Z) and all others trivial
  sorry

#eval "Eilenberg-MacLane spaces"
