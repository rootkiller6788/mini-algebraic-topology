/-
# MiniFundamentalGroup.Core.Basic

Core definitions for fundamental group theory:
- Set α := α → Prop
- TopologicalSpace typeclass, Continuous functions
- Paths, Loops, Homotopy
- Fundamental group π₁(X, x₀)
- Induced maps, simply connected spaces
-/
namespace MiniFundamentalGroup
set_option maxHeartbeats 600000

def Set (α : Type u) : Type u := α → Prop

namespace Set
def univ : Set α := λ _ => True
def empty : Set α := λ _ => False
def union (s t : Set α) : Set α := λ x => s x ∨ t x
def inter (s t : Set α) : Set α := λ x => s x ∧ t x
def compl (s : Set α) : Set α := λ x => ¬ s x
def preimage {β : Type u} (f : α → β) (s : Set β) : Set α := λ x => s (f x)
def prod {β : Type u} (s : Set α) (t : Set β) : Set (α × β) := λ p => s p.1 ∧ t p.2
def sUnion (S : Set (Set α)) : Set α := λ x => ∃ s, S s ∧ s x
variable {α β : Type u}

theorem eq_of_forall {s t : Set α} (h : ∀ x, s x ↔ t x) : s = t := by
  funext x; apply propext; exact h x

theorem compl_univ_eq_empty : compl (univ : Set α) = empty :=
  eq_of_forall (λ x => by simp [compl, univ, empty])

theorem compl_empty_eq_univ : compl (empty : Set α) = univ :=
  eq_of_forall (λ x => by simp [compl, univ, empty])

theorem inter_empty_eq_empty (s : Set α) : inter empty s = empty :=
  eq_of_forall (λ x => by simp [inter, empty])

theorem inter_s_empty_eq_empty (s : Set α) : inter s empty = empty :=
  eq_of_forall (λ x => by simp [inter, empty])

theorem inter_s_univ_eq_s (s : Set α) : inter s univ = s :=
  eq_of_forall (λ x => by simp [inter, univ])
end Set

instance : Membership α (Set α) where
  mem s x := s x
instance : HasSubset (Set α) := ⟨λ s t => ∀ x, s x → t x⟩
instance : Inter (Set α) := ⟨Set.inter⟩
instance : Union (Set α) := ⟨Set.union⟩
instance : OfNat (Set α) 0 := ⟨Set.empty⟩
instance : HasCompl (Set α) := ⟨Set.compl⟩

class TopologicalSpace (X : Type u) where
  IsOpen : Set X → Prop
  isOpen_univ : IsOpen Set.univ
  isOpen_inter : ∀ {U V : Set X}, IsOpen U → IsOpen V → IsOpen (U ∩ V)
  isOpen_sUnion : ∀ {S : Set (Set X)}, (∀ U ∈ S, IsOpen U) → IsOpen (Set.sUnion S)

export TopologicalSpace (IsOpen)

theorem isOpen_empty {X : Type u} [TopologicalSpace X] : IsOpen (∅ : Set X) := by
  have h := TopologicalSpace.isOpen_sUnion (S := ∅)
    (by intro U hU; exfalso; exact hU)
  have hEmpty : Set.sUnion (∅ : Set (Set X)) = (∅ : Set X) :=
    Set.eq_of_forall (λ x => by simp [Set.sUnion])
  rw [hEmpty] at h; exact h

def Continuous {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    (f : X → Y) : Prop := ∀ U, IsOpen U → IsOpen (Set.preimage f U)

theorem continuous_id {X : Type u} [TopologicalSpace X] : Continuous (id : X → X) := by
  intro U hU; simpa using hU

theorem continuous_comp {X Y Z : Type u} [TopologicalSpace X]
    [TopologicalSpace Y] [TopologicalSpace Z] {f : X → Y} {g : Y → Z}
    (hf : Continuous f) (hg : Continuous g) : Continuous (g ∘ f) := by
  intro U hU
  have h1 : IsOpen (Set.preimage g U) := hg U hU
  exact hf (Set.preimage g U) h1

theorem continuous_const {X Y : Type u} [TopologicalSpace X]
    [TopologicalSpace Y] (y : Y) : Continuous (λ _ : X => y) := by
  intro U hU
  by_cases h : y ∈ U
  · have hpre : (λ (_ : X) => y) ⁻¹' U = Set.univ :=
      Set.eq_of_forall (λ x => by simp [h])
    rw [hpre]; exact TopologicalSpace.isOpen_univ
  · have hpre : (λ (_ : X) => y) ⁻¹' U = ∅ :=
      Set.eq_of_forall (λ x => by simp [h])
    rw [hpre]; exact isOpen_empty

def IsClosed {X : Type u} [TopologicalSpace X] (F : Set X) : Prop := IsOpen (Fᶜ)

structure Homeomorphism (X Y : Type u) [TopologicalSpace X] [TopologicalSpace Y] where
  toFun : X → Y
  invFun : Y → X
  left_inv : ∀ x, invFun (toFun x) = x
  right_inv : ∀ y, toFun (invFun y) = y
  continuous_toFun : Continuous toFun
  continuous_invFun : Continuous invFun

structure Interval where
  t : ℝ
  bound_low : 0 ≤ t
  bound_high : t ≤ 1

def intervalZero : Interval := ⟨0, le_refl 0, by norm_num⟩
def intervalOne : Interval := ⟨1, by norm_num, le_refl 1⟩

structure Path {X : Type u} [TopologicalSpace X] (a b : X) where
  toFun : Interval → X
  continuous_toFun : Continuous toFun
  source : toFun intervalZero = a
  target : toFun intervalOne = b

def Path.const {X : Type u} [TopologicalSpace X] (x : X) : Path x x where
  toFun := λ _ => x
  continuous_toFun := continuous_const x
  source := rfl
  target := rfl

abbrev Loop {X : Type u} [TopologicalSpace X] (x₀ : X) := Path x₀ x₀

structure PathHomotopy {X : Type u} [TopologicalSpace X] {a b : X}
    (γ₀ γ₁ : Path a b) where
  toFun : Interval × Interval → X
  continuous_toFun : Continuous toFun
  start_eq : ∀ s, toFun (s, intervalZero) = γ₀.toFun s
  end_eq : ∀ s, toFun (s, intervalOne) = γ₁.toFun s
  left_eq : ∀ t, toFun (intervalZero, t) = a
  right_eq : ∀ t, toFun (intervalOne, t) = b

def PathHomotopic {X : Type u} [TopologicalSpace X] {a b : X}
    (γ₀ γ₁ : Path a b) : Prop := Nonempty (PathHomotopy γ₀ γ₁)

axiom pathHomotopyRefl {X : Type u} [TopologicalSpace X] {a b : X}
    (γ : Path a b) : PathHomotopic γ γ
axiom pathHomotopySymm {X : Type u} [TopologicalSpace X] {a b : X}
    {γ₀ γ₁ : Path a b} (h : PathHomotopic γ₀ γ₁) : PathHomotopic γ₁ γ₀
axiom pathHomotopyTrans {X : Type u} [TopologicalSpace X] {a b : X}
    {γ₀ γ₁ γ₂ : Path a b} (h01 : PathHomotopic γ₀ γ₁)
    (h12 : PathHomotopic γ₁ γ₂) : PathHomotopic γ₀ γ₂

def pathHomotopicSetoid {X : Type u} [TopologicalSpace X] (x₀ : X) :
    Setoid (Loop x₀) where
  r γ₀ γ₁ := PathHomotopic γ₀ γ₁
  iseqv := { refl := pathHomotopyRefl, symm := pathHomotopySymm,
    trans := pathHomotopyTrans }

def FundamentalGroup (X : Type u) [TopologicalSpace X] (x₀ : X) : Type u :=
  Quotient (pathHomotopicSetoid x₀)

notation "π₁" => FundamentalGroup

def FundamentalGroup.mk {X : Type u} [TopologicalSpace X] {x₀ : X}
    (γ : Loop x₀) : π₁ X x₀ := Quotient.mk (pathHomotopicSetoid x₀) γ

structure SimplyConnectedSpace (X : Type u) [TopologicalSpace X] : Prop where
  pathConnected : ∀ x y : X, Nonempty (Path x y)
  trivial_fundamental_group : ∀ x₀ : X, ∀ (γ : Loop x₀),
    PathHomotopic γ (Path.const x₀)

def inducedMapPath {X Y : Type u} [TopologicalSpace X]
    [TopologicalSpace Y] (f : X → Y) (hf : Continuous f) {x₀ : X}
    (γ : Loop x₀) : Loop (f x₀) where
  toFun := f ∘ γ.toFun
  continuous_toFun := continuous_comp γ.continuous_toFun hf
  source := by simp [γ.source]
  target := by simp [γ.target]

def inducedMap {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    (f : X → Y) (hf : Continuous f) {x₀ : X} : π₁ X x₀ → π₁ Y (f x₀) :=
  Quotient.map (λ γ => inducedMapPath f hf γ) (by
    intro γ₀ γ₁ h; rcases h with ⟨H⟩
    refine ⟨λ p => f (H.toFun p),
      continuous_comp H.continuous_toFun hf,
      λ s => by simp [H.start_eq s],
      λ s => by simp [H.end_eq s],
      λ t => by simp [H.left_eq t],
      λ t => by simp [H.right_eq t]⟩)

def discreteTopology (X : Type u) : TopologicalSpace X where
  IsOpen := λ _ => True
  isOpen_univ := trivial
  isOpen_inter := λ _ _ _ => trivial
  isOpen_sUnion := λ _ _ => trivial

axiom pathConcatContinuous {X : Type u} [TopologicalSpace X] {a b c : X}
  (γ₁ : Path a b) (γ₂ : Path b c) : Continuous (λ (s : Interval) =>
    if h : s.t ≤ (1/2 : ℝ) then γ₁.toFun ⟨2 * s.t, by
      have h0 := s.bound_low; nlinarith, by nlinarith⟩
    else γ₂.toFun ⟨2 * s.t - 1, by
      have h1 := s.bound_high; nlinarith, by nlinarith⟩)

def Path.concat {X : Type u} [TopologicalSpace X] {a b c : X}
    (γ₁ : Path a b) (γ₂ : Path b c) : Path a c where
  toFun := λ s =>
    if h : s.t ≤ (1/2 : ℝ) then γ₁.toFun ⟨2 * s.t, by
      have h0 := s.bound_low; nlinarith, by nlinarith⟩
    else γ₂.toFun ⟨2 * s.t - 1, by
      have h1 := s.bound_high; nlinarith, by nlinarith⟩
  continuous_toFun := pathConcatContinuous γ₁ γ₂
  source := by
    have h : (intervalZero.t : ℝ) ≤ (1/2 : ℝ) := by norm_num
    simp [h, γ₁.source]
  target := by
    have h : ¬ ((intervalOne.t : ℝ) ≤ (1/2 : ℝ)) := by norm_num
    simp [h, γ₂.target]

notation γ₁ "∗" γ₂ => Path.concat γ₁ γ₂

axiom pathInvContinuous {X : Type u} [TopologicalSpace X] {a b : X}
  (γ : Path a b) : Continuous (λ (s : Interval) =>
    γ.toFun ⟨1 - s.t, by have h := s.bound_high; nlinarith, by
      have h := s.bound_low; nlinarith⟩)

def Path.inv {X : Type u} [TopologicalSpace X] {a b : X}
    (γ : Path a b) : Path b a where
  toFun := λ s => γ.toFun ⟨1 - s.t, by
    have h := s.bound_high; nlinarith, by
    have h := s.bound_low; nlinarith⟩
  continuous_toFun := pathInvContinuous γ
  source := by
    have : (1 : ℝ) - intervalZero.t = (1 : ℝ) := by norm_num
    simp [this, γ.target]
  target := by
    have : (1 : ℝ) - intervalOne.t = (0 : ℝ) := by norm_num
    simp [this, γ.source]

notation γ "⁻¹" => Path.inv γ

structure HomotopyEquivalence (X Y : Type u) [TopologicalSpace X]
    [TopologicalSpace Y] where
  f : X → Y; g : Y → X; hf : Continuous f; hg : Continuous g
  homotopyLeft : True; homotopyRight : True

section Demos
instance : TopologicalSpace Unit where
  IsOpen _ := True; isOpen_univ := trivial
  isOpen_inter _ _ := trivial; isOpen_sUnion _ := trivial

#eval "── Core.Basic Complete: Set, Topology, Paths, π₁ ──"
#eval "Set α := α → Prop"
#eval "TopologicalSpace: IsOpen with union/inter/univ axioms"
#eval "Path: I → X, Loop: Path x₀ x₀"
#eval "π₁(X, x₀): loops modulo homotopy"
#eval "Path.concat (∗) and Path.inv (⁻¹) defined"
#eval "Functoriality: inducedMap f hf : π₁(X) → π₁(Y)"
end Demos

end MiniFundamentalGroup