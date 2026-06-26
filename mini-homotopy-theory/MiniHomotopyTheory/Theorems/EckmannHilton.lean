/-
# MiniHomotopyTheory: Eckmann-Hilton Argument

The Eckmann-Hilton theorem: two compatible monoid structures on a
set are commutative and coincide. Specializing to homotopy groups
shows pi_n is abelian for n >= 2.
-/

import MiniHomotopyTheory.Core.Basic

namespace MiniHomotopyTheory

/-! ## Eckmann-Hilton Theorem

Let * and . be two binary operations on a set M with a common
identity element e, satisfying the interchange law:
(a * b) . (c * d) = (a . c) * (b . d)

Then * and . coincide and are commutative and associative.
-/

structure EckmannHilton (M : Type u) where
  starOp : M -> M -> M
  dotOp : M -> M -> M
  unit : M
  starUnitLeft : forall a, starOp unit a = a
  starUnitRight : forall a, starOp a unit = a
  dotUnitLeft : forall a, dotOp unit a = a
  dotUnitRight : forall a, dotOp a unit = a
  interchange : forall a b c d, dotOp (starOp a b) (starOp c d) = starOp (dotOp a c) (dotOp b d)

theorem eckmann_hilton_star_comm (M : Type u) (eh : EckmannHilton M) :
    forall a b, eh.starOp a b = eh.starOp b a /\ forall a b, eh.dotOp a b = eh.dotOp b a := by
  intro a b
  have h_star_dot : eh.starOp a b = eh.dotOp a b := by
    calc
      eh.starOp a b = eh.starOp (eh.dotOp a eh.unit) (eh.dotOp eh.unit b) := by
        simp [eh.dotUnitRight, eh.dotUnitLeft]
      _ = eh.dotOp (eh.starOp a eh.unit) (eh.starOp eh.unit b) := by rw [eh.interchange]
      _ = eh.dotOp a b := by simp [eh.starUnitRight, eh.starUnitLeft]
  have h_comm : eh.starOp a b = eh.starOp b a := by
    calc
      eh.starOp a b = eh.dotOp a b := h_star_dot
      _ = eh.starOp eh.unit a . eh.starOp b eh.unit := by
        -- interchange with units
        sorry
      _ = eh.dotOp eh.unit b := by sorry
      _ = eh.starOp b a := by
        simp [h_star_dot]
  exact And.intro h_comm (by rw [h_star_dot, h_comm, <- h_star_dot])

/-! ## Application: pi_2(X) is abelian

The two group structures on pi_2 come from pinching S^2 at the equator
(vertical composition of homotopies) vs pinching at the meridian
(horizontal composition). These satisfy Eckmann-Hilton.
-/

theorem pi_two_abelian (X : Type u) [TopologicalSpace X] (x0 : X) :
    IsAbelian (HomotopyGroup X 2 x0) := by
  -- The two binary operations on pi_2 satisfy the interchange law
  -- because the domain S^2 has two independent coordinate directions
  apply eckmann_hilton_star_comm (HomotopyGroup X 2 x0)
  -- Construct the EckmannHilton structure from the two pinching maps
  sorry

#eval "-- Eckmann-Hilton Theorem --"
#check eckmann_hilton_star_comm
#check pi_two_abelian

end MiniHomotopyTheory

#eval "mini-everything-math/ loaded"
