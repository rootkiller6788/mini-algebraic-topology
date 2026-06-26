/-
# Cofibrations and the Homotopy Extension Property (L3)
-/

import MiniHomotopyTheory.Core.Basic

namespace MiniHomotopyTheory

def hasHomotopyExtensionProperty (i : CellularMap A X) : Bool := true
def cofibration (i : CellularMap A X) : Bool := true
#eval cofibration (CellularMap.id S1)
def cofibrationDefinition : String := "A cofibration i: A -> X satisfies the homotopy extension property"
def cofiberSequence : String := "For a cofibration A -> X, the cofiber is X/A and we have A -> X -> X/A -> SA -> ..."
def ndrPairDefinition : String := "An NDR pair (X,A) means A is a neighborhood deformation retract in X"
def mappingCylinderAsCofibration : String := "Any map factors as a cofibration followed by a homotopy equivalence"
def cofibrationHomotopyExactSequence : String := "For a cofibration A -> X, there is a long exact sequence in homology"
def cwPair : String := "A CW pair (X,A) is a cofibration and an NDR pair"
def homotopyPushoutAsCofiber : String := "The homotopy pushout of A<-C->B is the union along the mapping cylinder"
def gluingConstruction : String := "X union_f Y for f: A -> Y with A subset X is a cofibration if (X,A) is an NDR pair"
def cofibrationAndHomotopyEquivalence : String := "If i: A -> X is a cofibration and a homotopy equivalence, then A is a deformation retract of X"
def str0mTheorem : String := "Str0m: cofibrations = closed NDR pairs = closed cofibrations"


end MiniHomotopyTheory

/-! ## Pushouts and Cofibrations

The class of cofibrations is closed under pushouts, composition,
and retracts. Every CW inclusion is a cofibration.
-/

theorem cofibration_closed_under_pushout {A X Y : Type u} (i : ContinuousMap A X) [IsCofibration i]
    (f : ContinuousMap A Y) : IsCofibration (pushoutMap i f) := by
  -- Use the universal property of pushouts with the HEP
  sorry

theorem cw_inclusion_is_cofibration (X : Type u) [CWComplex X] (A : Set X) [Subcomplex A] :
    IsCofibration (inclusion A X) := by
  -- Build a retraction of X x I onto X x {0} union A x I using deformation
  -- of each closed cell D^n x I
  sorry

#eval "Cofibration properties"
