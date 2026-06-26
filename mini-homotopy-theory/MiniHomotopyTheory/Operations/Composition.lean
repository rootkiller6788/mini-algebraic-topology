/-
# Path Composition and Groupoid Structure (L3)
-/

import MiniHomotopyTheory.Core.Basic
import MiniHomotopyTheory.Core.Paths

namespace MiniHomotopyTheory

def composeLoops {X : TwoComplex} {x0 : Nat} (l1 l2 : Loop X x0) : Loop X x0 :=
  Path.concat l1 l2

def invertLoop {X : TwoComplex} {x0 : Nat} (l : Loop X x0) : Loop X x0 :=
  Path.reverse l

def identityLoop (X : TwoComplex) (x0 : Nat) : Loop X x0 :=
  Path.const X x0

def reducedLoopSpace (X : TwoComplex) (x0 : Nat) (maxLen : Nat) : List (List EdgeStep) :=
  X.fundamentalGroupApprox x0 maxLen

#eval (reducedLoopSpace S1 0 3).length


end MiniHomotopyTheory

/-! ## Composition of Homotopy Classes

[f] o [g] := [f o g] for maps g : S^n -> Y, f : Y -> Z.
This gives a functor pi_n : Top_* -> Grp.
-/

theorem composition_respects_homotopy (X Y Z : Type u) (f1 f2 : ContinuousMap Y Z) (g1 g2 : ContinuousMap X Y)
    (h_f : Homotopic f1 f2) (h_g : Homotopic g1 g2) :
    Homotopic (f1 o g1) (f2 o g2) := by
  -- Concatenate homotopies: H(s,t) = h_f(h_g(s,t), t)
  sorry

theorem homotopy_group_functor (X Y : Type u) (f : ContinuousMap X Y) (x0 : X) (n : Nat) :
    GroupHomomorphism (HomotopyGroup X n x0) (HomotopyGroup Y n (f x0)) := by
  -- f induces map on homotopy classes by post-composition
  constructor
  exact fun g => f o g

#eval "Composition + functoriality"
