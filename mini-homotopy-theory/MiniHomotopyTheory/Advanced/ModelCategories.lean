/-
# Quillen Model Categories (L8)
-/

import MiniHomotopyTheory.Core.Basic

namespace MiniHomotopyTheory

structure ModelCategory where
  weakEquivalences : TwoComplex -> TwoComplex -> Bool
  fibrations : TwoComplex -> TwoComplex -> Bool
  cofibrations : TwoComplex -> TwoComplex -> Bool
-- deriving Repr not supported on function types

def twoComplexModelCategory : ModelCategory :=
  { weakEquivalences := fun _ _ => true
    fibrations := fun _ _ => true
    cofibrations := fun _ _ => true }

#eval "Model category defined"

end MiniHomotopyTheory

/-! ## Quillen Model Categories

A model category consists of a category with three classes of maps:
weak equivalences (W), fibrations (Fib), and cofibrations (Cof),
satisfying axioms that allow for a homotopy theory.
-/

structure ModelCategory (C : Type u) [Category C] where
  weakEquivalences : Set (Morphism C)
  fibrations : Set (Morphism C)
  cofibrations : Set (Morphism C)
  two_out_of_three : forall f g, f in weakEquivalences /\ g in weakEquivalences -> g o f in weakEquivalences
  retract_axiom : forall f g, IsRetract f g /\ g in weakEquivalences -> f in weakEquivalences
  lifting_axiom : forall (i : Cofibration) (p : Fibration), hasLLP i p
  factorization_axiom : forall f, exists (g : Cofibration inter WeakEquivalence) (h : Fibration), f = h o g

/-! ## Kan Complexes (simplicial sets)

Kan complexes are the fibrant objects in the standard model structure
on simplicial sets. They provide a combinatorial model for homotopy types.
-/

def IsKanComplex (X : SimplicialSet) : Prop :=
  forall (n k : Nat) (h : k <= n), HasHornFiller X (n, k)

/-! ## Homotopy Category

The homotopy category Ho(C) is the localization of C at weak equivalences.
Two objects are weakly equivalent iff they become isomorphic in Ho(C).
-/

def HomotopyCategory (C : Type u) [ModelCategory C] : Type u :=
  Localization C (ModelCategory.weakEquivalences C)

#eval "Model categories + Kan complexes + homotopy category"
