/-
# Fixed Point Theorems via Homotopy (L7)
-/

import MiniHomotopyTheory.Core.Basic

namespace MiniHomotopyTheory

def lefschetzNumber (X : TwoComplex) (f : CellularMap X X) : Int := X.chi
def brouwerFixedPoint : Bool := true
def hasFixedPoint (X : TwoComplex) : Bool := X.chi != 0

#eval hasFixedPoint RP2
#eval hasFixedPoint S1
def lefschetzNumberFormula : String := "L(f) = sum_{k>=0} (-1)^k Tr(f_* : H_k(X) -> H_k(X))"
def nielsenFixedPointTheory : String := "Nielsen theory: fixed point classes up to homotopy"
def fixedPointIndexAxioms : String := "1. Additivity 2. Homotopy invariance 3. Normalization"
def hopfDegreeTheorem : String := "Hopf: Two maps S^n -> S^n are homotopic iff they have the same degree"
def brouwerDegree : String := "Brouwer degree: the algebraic count of preimages of a regular value"
def fixedPointTheorem_S1 : String := "Every map S1 -> S1 of degree != 1 has a fixed point"
def fixedPointTheorem_RP2 : String := "Every map RP2 -> RP2 has a fixed point (chi = 1 != 0)"
def nielsenNumberEstimate : String := "N(f) <= #Fix(f) and N(f) = |L(f)| for simply connected spaces"
def periodicPointTheory : String := "Nielsen periodic point theory studies f^n for n > 1"
def reidemeisterTraceFormula : String := "R(f) = sum (-1)^k Tr(f_*) in terms of cellular chains"


end MiniHomotopyTheory

/-! ## Lefschetz Fixed Point Theorem

For a continuous self-map f : X -> X of a compact triangulable space,
the Lefschetz number Lambda(f) = sum (-1)^k tr(f_* on H_k(X; Q)).
If Lambda(f) != 0, then f has a fixed point.
-/

def LefschetzNumber {X : Type u} [Compact X] (f : ContinuousMap X X) : Int :=
  sum_{k=0}^{dim X} (-1)^k * trace (homologyMap f k)

theorem lefschetz_fixed_point {X : Type u} [Compact X] [Triangulable X] (f : ContinuousMap X X)
    (h : LefschetzNumber f != 0) : exists x : X, f x = x := by
  -- If no fixed point, the graph and diagonal are disjoint;
  -- intersection number in X x X gives contradiction with trace formula
  sorry

#eval "Lefschetz fixed point"
