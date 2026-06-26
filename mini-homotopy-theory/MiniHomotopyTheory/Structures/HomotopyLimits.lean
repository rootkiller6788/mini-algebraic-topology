/-
# Homotopy Limits and Colimits (L8)
-/

import MiniHomotopyTheory.Core.Basic

namespace MiniHomotopyTheory


def homotopyPullback (X Y Z : TwoComplex) (f : CellularMap X Z) (g : CellularMap Y Z) : TwoComplex := pointComplex
def homotopyPushout (X Y Z : TwoComplex) (f : CellularMap Z X) (g : CellularMap Z Y) : TwoComplex := pointComplex
#eval homotopyPullback S1 S1 S1 (CellularMap.id S1) (CellularMap.id S1) |>.chi
def homotopyPullbackSquare : String := "A homotopy pullback square is a commutative square that is a homotopy limit"
def homotopyPushoutSquare : String := "A homotopy pushout square is a commutative square that is a homotopy colimit"
def blakersMasseyTheorem : String := "Blakers-Massey: pi_i(X u_A B, X, B) -> pi_i(S(A), S(XnB)) is iso in a range"
def homotopyColimitOfSequence : String := "The homotopy colimit of X_0 -> X_1 -> ... is the mapping telescope"
def homotopyLimitOfTower : String := "The homotopy limit of ... -> X_2 -> X_1 is the homotopy pullback of the tower"
def homotopyKanExtensionDefinition : String := "Homotopy Kan extensions are the derived functors of ordinary Kan extensions"
def homotopyCoherentDiagrams : String := "A homotopy coherent diagram has higher homotopies witnessing commutativity"
def infinityCategoryAsHomotopyCoherentNerve : String := "An infinity-category is a simplicial set satisfying the inner horn filling condition"
def homotopyLimitAsDerivedFunctor : String := "holim = R lim is the total right derived functor of the limit functor"
def rezkCompletion : String := "The Rezk completion of a homotopy theory is the homotopy category of its model structure"


end MiniHomotopyTheory

/-! ## Homotopy Limits and Colimits

Homotopy limits replace ordinary (co)limits to make them homotopy
invariant. The homotopy pullback of X -> Z <- Y is:
X x_Z^h Y = {(x, y, gamma) | gamma(0) = f(x), gamma(1) = g(y)}
-/

def HomotopyPullback (X Y Z : Type u) (f : ContinuousMap X Z) (g : ContinuousMap Y Z) :
    Type u :=
  {p : (X product Y product (PathSpace Z)) // (g o proj_Y) p = (f o proj_X) p}

theorem homotopy_pullback_homotopy_invariant {X Y Z : Type u}
    (f1 f2 : ContinuousMap X Z) (g1 g2 : ContinuousMap Y Z)
    (hf : Homotopic f1 f2) (hg : Homotopic g1 g2) :
    HomotopyEquivalent (HomotopyPullback X Y Z f1 g1) (HomotopyPullback X Y Z f2 g2) := by
  -- The homotopy pullback only depends on the homotopy classes of f and g
  sorry

/-! ## Homotopy Pushout

The homotopy pushout (double mapping cylinder) is the homotopy
colimit of the diagram X <- A -> Y.
-/

def HomotopyPushout (A X Y : Type u) (f : ContinuousMap A X) (g : ContinuousMap A Y) : Type u :=
  (X + (A product I) + Y) / (forall a, (f a = (a,0), g a = (a,1)))

#eval "Homotopy limits + colimits"

/-! ## Homotopy Fiber Sequence

For a pointed map f : X -> Y, the homotopy fiber F_f and the
homotopy cofiber C_f give long exact sequences in homotopy and
cohomology respectively.
-/

theorem homotopy_fiber_sequence (X Y : Type u) (f : ContinuousMap X Y) (x0 : X) (n : Nat) :
    IsExactSequence
      (HomotopyGroup (HomotopyFiber f) n)
      (HomotopyGroup X n x0)
      (HomotopyGroup Y n (f x0))
      (HomotopyGroup (HomotopyFiber f) (n-1)) := by
  -- The homotopy fiber F_f = {(x, gamma) | gamma(0) = f(x), gamma(1) = y0}
  -- The map F_f -> X is the projection
  sorry

#eval "Homotopy fiber sequence"

#eval "mini-everything-math/ loaded"
