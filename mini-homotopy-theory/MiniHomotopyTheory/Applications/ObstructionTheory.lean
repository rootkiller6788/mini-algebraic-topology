/-
# Obstruction Theory Applications (L7)
-/

import MiniHomotopyTheory.Core.Basic

namespace MiniHomotopyTheory

def obstructionClass (X : TwoComplex) (n : Nat) (f : CellularMap X S1) : List EdgeStep := []
def extensionProblem (A X : TwoComplex) (f : CellularMap A S1) : Bool := false
#eval (obstructionClass S1 1 (CellularMap.id S1)).length

def obstructionCohomologyClass : String := "Primary obstruction is a cohomology class in H^{n+1}(X; pi_n(Y))"
def eilenbergExtensionTheorem : String := "Eilenberg: Maps extend from n-skeleton to (n+1)-skeleton iff obstruction vanishes"
def obstructionToLifting : String := "Lifting f: X->B through p: E->B has obstruction in H^{n+1}(X; pi_n(F))"
def obstructionToSection : String := "Section of p: E->B has primary obstruction in H^n(B; pi_n(F))"
def moorePostnikovDecomposition : String := "Each space X has a Postnikov tower X -> ... -> P_n -> ... -> P_0 = pt"
def kInvariants : String := "k-invariants k_n in H^{n+1}(P_{n-1}; pi_n(X)) classify Postnikov extensions"
def obstructionExactSequence : String := "0 -> H^n(X;pi)->[X,P_n]->[X,P_{n-1}]->H^{n+1}(X;pi) is exact"
def eilenbergMacLaneObstruction : String := "K(G,n) represents cohomology H^n(X;G) = [X, K(G,n)]"
def obstructionTheoryApplications : String := "Applications: existence of cross-sections, non-vanishing vector fields"
def steenrodObstruction : String := "Steenrod squares Sqi: H^n -> H^{n+i} detect secondary obstructions"


end MiniHomotopyTheory

/-! ## Obstruction Theory

For extending a map from the n-skeleton to the (n+1)-skeleton of a
CW complex, the obstruction lies in H^{n+1}(X; pi_n(Y)). The map
extends iff all obstruction cocycles vanish.
-/

def obstructionCocycle {X Y : Type u} [CWComplex X] (f : ContinuousMap (skeleton X n) Y)
    (n : Nat) : CohomologyClass X (n+1) (HomotopyGroup Y n) := ...

theorem extension_iff_obstruction_vanishes {X Y : Type u} [CWComplex X] (f : ContinuousMap (skeleton X n) Y) (n : Nat) :
    (exists (g : ContinuousMap (skeleton X (n+1)) Y), g|_(skeleton X n) = f) <->
    obstructionCocycle f n = 0 := by
  -- For each (n+1)-cell e_alpha with attaching map phi_alpha : S^n -> X^n,
  -- the obstruction is the homotopy class of f o phi_alpha in pi_n(Y)
  sorry

#eval "Obstruction theory"
