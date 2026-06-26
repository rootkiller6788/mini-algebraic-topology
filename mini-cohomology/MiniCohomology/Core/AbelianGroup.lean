/-
# Cohomology Kernel: Abelian Groups

Defines the minimal abelian group infrastructure needed for 
cohomology theory: abelian groups, group homomorphisms, 
subgroups, quotient groups.

Knowledge coverage: L1 (Definitions), L2 (Core Concepts)
-/

namespace MiniCohomology

/-! ## Abelian Group Typeclass -/

class AbGroup (G : Type) where
  zero : G
  add  : G → G → G
  neg  : G → G
  add_assoc     : ∀ a b c : G, add (add a b) c = add a (add b c)
  add_comm      : ∀ a b : G, add a b = add b a
  add_zero      : ∀ a : G, add a zero = a
  add_neg_self  : ∀ a : G, add a (neg a) = zero

open AbGroup

variable {G : Type} [AbGroup G]

theorem add_zero_right (a : G) : add a zero = a := add_zero a

theorem zero_add (a : G) : add zero a = a := by
  rw [add_comm, add_zero]

theorem neg_add_self (a : G) : add (neg a) a = zero := by
  rw [add_comm, add_neg_self]

theorem add_left_cancel (a b c : G) (h : add a b = add a c) : b = c := by
  calc
    b = add zero b := by rw [zero_add]
    _ = add (add (neg a) a) b := by rw [neg_add_self]
    _ = add (neg a) (add a b) := by rw [add_assoc]
    _ = add (neg a) (add a c) := by rw [h]
    _ = add (add (neg a) a) c := by rw [add_assoc]
    _ = add zero c := by rw [neg_add_self]
    _ = c := by rw [zero_add]

theorem add_right_cancel (a b c : G) (h : add b a = add c a) : b = c := by
  rw [add_comm b a, add_comm c a] at h
  exact add_left_cancel a b c h

theorem neg_unique (a b : G) (h : add a b = zero) : b = neg a := by
  apply add_left_cancel a b (neg a)
  rw [h, add_neg_self]

theorem neg_neg (a : G) : neg (neg a) = a := by
  symm
  apply neg_unique (neg a) a
  rw [add_comm, add_neg_self]

theorem add_neg_cancel_right (a b : G) : add (add a b) (neg b) = a := by
  rw [add_assoc, add_neg_self, add_zero_right]

theorem neg_zero : neg (zero : G) = zero := by
  symm
  apply neg_unique zero zero
  rw [add_zero]

/-! ## ℤ as an Abelian Group -/

instance : AbGroup Int where
  zero := 0
  add  := Int.add
  neg  := Int.neg
  add_assoc    := Int.add_assoc
  add_comm     := Int.add_comm
  add_zero     := Int.add_zero
  add_neg_self := by
    intro a
    exact Int.add_right_neg a

/-! ## ℤ₂ as an Abelian Group (Bool with XOR) -/

instance : AbGroup Bool where
  zero := false
  add  := xor
  neg  := id
  add_assoc := by
    intro a b c
    cases a <;> cases b <;> cases c <;> rfl
  add_comm := by
    intro a b
    cases a <;> cases b <;> rfl
  add_zero := by
    intro a; cases a <;> rfl
  add_neg_self := by
    intro a; cases a <;> rfl

/-! ## ℤ₂ Multiplication -/

def z2Mul (a b : Bool) : Bool := a && b

/-! ## Abelian Group Homomorphisms -/

structure AbGroupHom (G H : Type) [AbGroup G] [AbGroup H] where
  map : G → H
  map_add : ∀ a b : G, map (add a b) = add (map a) (map b)

def idHom (G : Type) [AbGroup G] : AbGroupHom G G where
  map := fun a => a
  map_add := by intro a b; rfl

def compHom {G H K : Type} [AbGroup G] [AbGroup H] [AbGroup K]
    (f : AbGroupHom H K) (g : AbGroupHom G H) : AbGroupHom G K where
  map := fun a => f.map (g.map a)
  map_add := by
    intro a b
    rw [g.map_add, f.map_add]

def zeroHom (G H : Type) [AbGroup G] [AbGroup H] : AbGroupHom G H where
  map := fun _ => zero
  map_add := by
    intro a b
    rw [add_zero]

end MiniCohomology
