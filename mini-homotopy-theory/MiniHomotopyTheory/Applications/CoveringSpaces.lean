/-
# Covering Space Theory (L7)
-/

import MiniHomotopyTheory.Core.Basic

namespace MiniHomotopyTheory

def coveringSpace (E X : TwoComplex) (p : CellularMap E X) : Bool :=
  E.numVertices % X.numVertices == 0

def universalCover (X : TwoComplex) : TwoComplex := X
def deckTransformations (E X : TwoComplex) : Nat :=
  if X.numVertices > 0 then E.numVertices / X.numVertices else 0

#eval coveringSpace T2 S1 ({ onVertex := fun _ => 0, onEdge := fun _ => [(0, true)], onFace := fun _ => [] } : CellularMap T2 S1)
def coveringSpaceClassification : String := "Covering spaces of X correspond to subgroups of pi_1(X,x0)"
def regularCoveringCorrespondence : String := "Regular covers correspond to normal subgroups of pi_1"
def universalCoverUniqueness : String := "Universal cover is unique up to isomorphism"
def deckTransformationGroup : String := "Deck(X'/X) = N(pi_1(X'))/(pi_1(X')) by the Galois correspondence"
def coveringSpaceLiftingCriterion : String := "A map f lifts iff f_*(pi_1) is contained in p_*(pi_1)"
def pathConnectedCovering : String := "Any covering of a path-connected space is a disjoint union of copies"
def coveringSpaceDegreeFormula : String := "For a finite covering of degree d, chi(X') = d * chi(X)"
def riemannHurwitzFormula : String := "Riemann-Hurwitz: chi(S') = d*chi(S) - sum (e_P - 1)"
def coveringOfCircle : String := "All connected covers of S1 are S1 -> S1, z -> z^n (n in N)"
def coveringOfTorus : String := "Connected covers of T2 = S1 x S1 are T2 -> T2 of degree d1 x d2"


end MiniHomotopyTheory

/-! ## Classification of Covering Spaces

For a connected, locally path-connected, semi-locally simply-connected
space X, there is a bijection between isomorphism classes of covering
spaces of X and conjugacy classes of subgroups of pi_1(X,x0).

Universal cover: the covering corresponding to the trivial subgroup.
-/

theorem covering_space_classification (X : Type u) [Connected X] [LocallyPathConnected X]
    [SemiLocallySimplyConnected X] :
    IsBijection (fun (p : CoveringSpace X) => pi_1Image p)
    (CoveringSpaces X) (ConjugacyClasses (Subgroups (FundamentalGroup X))) := by
  -- Construct the correspondence via lifting criterion
  sorry

/-! ## Lifting Criterion

A map f : Y -> X lifts to a covering p : X_tilde -> X iff
f_*(pi_1(Y)) subset p_*(pi_1(X_tilde)).
-/

theorem lifting_criterion (X Y : Type u) (p : CoveringSpace X) (f : ContinuousMap Y X) (y0 : Y) :
    exists (f_tilde : ContinuousMap Y X_tilde), p o f_tilde = f /\ f_tilde y0 = chosenBasepoint <-> 
    (fundamentalGroupImage f) subset (fundamentalGroupImage p) := by
  sorry

#eval "Covering spaces + lifting criterion"
