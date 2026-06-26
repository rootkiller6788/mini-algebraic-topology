/-
# MiniFundamentalGroup.Core.Functoriality

Functorial properties of the fundamental group:
- π₁ is a functor from Top* (pointed spaces) to Grp (groups)
- (id_X)_* = id_{π₁(X)}
- (g ∘ f)_* = g_* ∘ f_*
- Homotopic maps induce the same homomorphism on π₁
- Homotopy equivalences induce isomorphisms on π₁
- Deformation retracts induce isomorphisms
-/
import MiniFundamentalGroup.Core.Basic
import MiniFundamentalGroup.Core.GroupStructure

namespace MiniFundamentalGroup

set_option maxHeartbeats 600000

/-! ## Functoriality: π₁ Preserves Identity -/

/-- The identity map on X induces the identity map on π₁(X, x₀). -/
theorem inducedMap_id {X : Type u} [TopologicalSpace X] (x₀ : X) :
    inducedMap (id : X → X) continuous_id = id := by
  ext g
  apply Quotient.induction_on g
  intro γ
  rfl

/-! ## Functoriality: π₁ Preserves Composition -/

/-- (g ∘ f)_* = g_* ∘ f_*. -/
theorem inducedMap_comp {X Y Z : Type u} [TopologicalSpace X]
    [TopologicalSpace Y] [TopologicalSpace Z] (f : X → Y) (g : Y → Z)
    (hf : Continuous f) (hg : Continuous g) (x₀ : X) :
    inducedMap (g ∘ f) (continuous_comp hf hg) =
    (inducedMap g hg) ∘ (inducedMap f hf) := by
  ext h
  apply Quotient.induction_on h
  intro γ
  rfl

/-! ## Homotopy Invariance of Induced Maps -/

/-- If f₀, f₁: X → Y are homotopic (free homotopy), then
(f₀)_* and (f₁)_* are related by a change of basepoint.

If the homotopy fixes the basepoint, then (f₀)_* = (f₁)_*. -/

/-- A based homotopy between based maps f₀, f₁: (X,x₀) → (Y,y₀)
is a homotopy H: X × I → Y with H(-,0)=f₀, H(-,1)=f₁,
and H(x₀, t) = y₀ for all t. -/
structure BasedHomotopy {X Y : Type u} [TopologicalSpace X]
    [TopologicalSpace Y] (x₀ : X) (y₀ : Y) (f₀ f₁ : X → Y) where
  toFun : X × Interval → Y
  continuous_toFun : Continuous toFun
  start_eq : ∀ x, toFun (x, intervalZero) = f₀ x
  end_eq : ∀ x, toFun (x, intervalOne) = f₁ x
  basepoint_eq : ∀ t, toFun (x₀, t) = y₀

/-- Two based maps are based homotopic. -/
def BasedHomotopic {X Y : Type u} [TopologicalSpace X]
    [TopologicalSpace Y] {x₀ : X} {y₀ : Y} (f₀ f₁ : X → Y) : Prop :=
  Nonempty (BasedHomotopy x₀ y₀ f₀ f₁)

/-- If f₀ and f₁ are based homotopic, then
(f₀)_* = (f₁)_* as maps π₁(X,x₀) → π₁(Y,y₀). -/
theorem inducedMap_basedHomotopy {X Y : Type u} [TopologicalSpace X]
    [TopologicalSpace Y] {x₀ : X} {y₀ : Y} {f₀ f₁ : X → Y}
    (hf₀ : Continuous f₀) (hf₁ : Continuous f₁)
    (h : BasedHomotopic x₀ y₀ f₀ f₁) :
    inducedMap f₀ hf₀ = inducedMap f₁ hf₁ := by
  rcases h with ⟨H⟩
  ext g
  apply Quotient.induction_on g
  intro γ
  apply Quotient.sound
  -- Construct a loop homotopy using H
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_⟩
  · exact λ p => H.toFun (γ.toFun p.1, p.2)
  · exact continuous_comp
      (by
        intro U hU
        have hpre := H.continuous_toFun U hU
        exact continuous_comp
          (by
            intro V hV
            have hγ := γ.continuous_toFun V hV
            exact hγ)
          (by
            intro W hW
            exact H.continuous_toFun W hW))
      hf₀
  · intro s; simp [H.start_eq (γ.toFun s)]
  · intro s; simp [H.end_eq (γ.toFun s)]
  · intro t; simp [γ.source, H.basepoint_eq t]
  · intro t; simp [γ.target, H.basepoint_eq t]

/-! ## Homotopy Equivalence Induces Group Isomorphism -/

/-- A homotopy equivalence f: X → Y with homotopy inverse g: Y → X
induces an isomorphism f_*: π₁(X,x₀) → π₁(Y, f(x₀)). -/
theorem homotopyEquivalenceIsIso {X Y : Type u} [TopologicalSpace X]
    [TopologicalSpace Y] (x₀ : X) (he : HomotopyEquivalence X Y) :
    Function.Bijective (inducedMap he.f he.hf (x₀ := x₀)) := by
  -- g_* ∘ f_* = (g∘f)_* = (id_X)_* = id
  -- f_* ∘ g_* = (f∘g)_* = (id_Y)_* = id
  have hleft : (inducedMap he.g he.hg) ∘
      (inducedMap he.f he.hf) = id := by
    rw [← inducedMap_comp he.f he.g he.hf he.hg x₀]
    -- (g∘f) is homotopic to id_X
    apply inducedMap_basedHomotopy
    -- need continuity of g∘f and id_X, and based homotopy between them
    · exact continuous_comp he.hf he.hg
    · exact continuous_id
    · -- g∘f ≃ id_X via he.homotopyLeft
      exact he.homotopyLeft.elim
  have hright : (inducedMap he.f he.hf) ∘
      (inducedMap he.g he.hg) = id := by
    rw [← inducedMap_comp he.g he.f he.hg he.hf (he.f x₀)]
    apply inducedMap_basedHomotopy
    · exact continuous_comp he.hg he.hf
    · exact continuous_id
    · exact he.homotopyRight.elim
  -- Now f_* is bijective because it has a two-sided inverse g_*
  have hinjective : Function.Injective (inducedMap he.f he.hf) := by
    intro a b h
    apply (congrArg (inducedMap he.g he.hg)) at h
    simp [hleft] at h
    exact h
  have hsurjective : Function.Surjective (inducedMap he.f he.hf) := by
    intro b
    refine ⟨(inducedMap he.g he.hg) b, ?_⟩
    simp [hright]
  exact ⟨hinjective, hsurjective⟩

/-! ## Deformation Retracts -/

/-- If A is a deformation retract of X, then the inclusion i: A → X
induces an isomorphism i_*: π₁(A) → π₁(X). -/
theorem deformationRetractIsIso {X : Type u} [TopologicalSpace X]
    (A : Set X) (h : DeformationRetract A) (a₀ : Subtype A) :
    Function.Bijective (inducedMap Subtype.val
      (continuous_subtype_val A) (x₀ := a₀.val)) := by
  -- The retraction r: X → A gives the inverse
  let r : X → Subtype A := h.retraction
  have h_cont : Continuous r := h.continuous_retraction
  have h_r_on_A : ∀ a : Subtype A, r a.val = a := h.retraction_on_A
  -- r ∘ i = id_A (on the nose)
  have hr_comp : (r ∘ Subtype.val) = id := by
    ext a; exact h_r_on_A a
  -- i ∘ r ≃ id_X (via deformation)
  -- So i_* is an isomorphism with inverse r_*
  have hinverse : Function.LeftInverse
      (inducedMap r h_cont) (inducedMap Subtype.val
        (continuous_subtype_val A)) := by
    intro g
    calc
      inducedMap r h_cont (inducedMap Subtype.val
        (continuous_subtype_val A) g) = inducedMap (r ∘ Subtype.val)
        (continuous_comp (continuous_subtype_val A) h_cont) g := by rfl
      _ = inducedMap id continuous_id g := by rw [hr_comp]
      _ = g := by
        apply congrArg (λ f => f g)
        apply inducedMap_id
  exact ⟨
    λ a b h => by
      have := hinverse a
      have := hinverse b
      rw [h] at this
      -- actually need injectivity from left inverse
      apply hinverse.injective,
    λ b => ⟨inducedMap r h_cont b, by
      -- apply hinverse
      simp [hinverse b]
    ⟩
  ⟩

/-! ## π₁ as a Functor: Categorical Summary -/

/-- The fundamental group defines a functor:
π₁: Top* → Grp
  (X, x₀) ↦ π₁(X, x₀)
  (f: (X,x₀) → (Y,y₀)) ↦ f_*: π₁(X,x₀) → π₁(Y,y₀)

Satisfying:
- (id_X)_* = id_{π₁(X)}
- (g∘f)_* = g_* ∘ f_* -/

/-- π₁ is a functor from pointed spaces to groups. -/
structure Pi1Functor where
  onObjects : (X : Type u) → [TopologicalSpace X] → X → Type u
  onMorphisms : {X Y : Type u} → [TopologicalSpace X] → [TopologicalSpace Y] →
    (f : X → Y) → Continuous f → (x₀ : X) → π₁ X x₀ → π₁ Y (f x₀)
  preservesId : ∀ (X : Type u) [TopologicalSpace X] (x₀ : X),
    onMorphisms id continuous_id x₀ = id
  preservesComp : ∀ (X Y Z : Type u) [TopologicalSpace X]
    [TopologicalSpace Y] [TopologicalSpace Z] (f : X → Y) (g : Y → Z)
    (hf : Continuous f) (hg : Continuous g) (x₀ : X),
    onMorphisms (g ∘ f) (continuous_comp hf hg) x₀ =
    onMorphisms g hg (f x₀) ∘ onMorphisms f hf x₀

/-- The standard fundamental group functor. -/
def standardPi1Functor : Pi1Functor where
  onObjects _ _ x₀ := π₁ _ x₀
  onMorphisms f hf x₀ := inducedMap f hf
  preservesId _ _ _ := inducedMap_id _
  preservesComp _ _ _ _ _ _ _ _ := inducedMap_comp _ _ _ _ _

/-! ## #eval Demos -/

section Demos

#eval "── Functoriality: π₁ is a Functor ──"
#eval "π₁: Top* → Grp"
#eval "  On objects: (X, x₀) ↦ π₁(X, x₀)"
#eval "  On morphisms: f ↦ f_*"

#eval "── Functoriality: Properties ──"
#eval "(id_X)_* = id_{π₁(X)}"
#eval "(g ∘ f)_* = g_* ∘ f_*"

#eval "── Functoriality: Homotopy Invariance ──"
#eval "If f₀ ≃ f₁ (based homotopy), then (f₀)_* = (f₁)_*"

#eval "── Functoriality: Homotopy Equivalence ──"
#eval "A homotopy equivalence induces an isomorphism on π₁"

#eval "── Functoriality: Deformation Retract ──"
#eval "A deformation retract A ⊆ X induces π₁(A) ≅ π₁(X)"

end Demos

end MiniFundamentalGroup
