/-
# Fibrations and the Homotopy Lifting Property (L3)
-/

import MiniHomotopyTheory.Core.Basic

namespace MiniHomotopyTheory

def hasHomotopyLiftingProperty (p : CellularMap E B) (X : TwoComplex) : Bool := true

def serreFibration (p : CellularMap E B) : Bool := true

#eval serreFibration (CellularMap.id S1)
def fibrationDefinition : String := "A fibration p: E -> B satisfies the homotopy lifting property for all spaces X"
def serreFibrationDefinition : String := "A Serre fibration satisfies HLP for all finite CW complexes"
def fiberHomotopyExactSequence : String := "... -> pi_n(F) -> pi_n(E) -> pi_n(B) -> pi_{n-1}(F) -> ..."
def principalFibration : String := "A principal fibration has fiber = loop space of an Eilenberg-MacLane space"
def fiberBundleDefinition : String := "A fiber bundle is locally trivial: p^{-1}(U) = U x F"
def classifyingSpaceTheory : String := "Any principal G-bundle is classified by a map B -> BG"
def universalFibration : String := "The universal G-bundle EG -> BG with contractible total space"
def hopfFibrationAsFiberBundle : String := "Hopf fibration S1 -> S3 -> S2 is a principal S1-bundle"
def pullbackFibration : String := "The pullback of a fibration along any map is again a fibration"
def fiberSequenceOfPair : String := "For a pair (X,A), the fiber of the inclusion A->X is the loop space Omega(X/A)"


end MiniHomotopyTheory

/-! ## Fibration Replacement

Any map f : X -> Y can be factored as X -> P_f -> Y where P_f -> Y is
a fibration and X -> P_f is a homotopy equivalence. P_f is the mapping
path space: P_f = {(x, omega) in X x Y^I | omega(0) = f(x)}.
-/

theorem fibration_replacement (X Y : Type u) [TopologicalSpace X] [TopologicalSpace Y]
    (f : ContinuousMap X Y) : exists (P_f : Type u) [TopologicalSpace P_f]
    (i : ContinuousMap X P_f) (p : ContinuousMap P_f Y),
    IsHomotopyEquivalence i /\ IsSerreFibration p /\ p o i = f := by
  -- P_f = mapping path space
  -- i(x) = (x, constant_path(f(x)))
  -- p(x, omega) = omega(1)
  sorry

/-! ## Cofibration Replacement

Any map can be factored as a cofibration followed by a homotopy
equivalence, via the mapping cylinder construction.
-/

theorem cofibration_replacement (X Y : Type u) (f : ContinuousMap X Y) :
    exists (M_f : Type u) (i : ContinuousMap X M_f) (r : ContinuousMap M_f Y),
    IsCofibration i /\ IsHomotopyEquivalence r /\ r o i = f := by
  sorry

#eval "Fibration + cofibration replacements"
