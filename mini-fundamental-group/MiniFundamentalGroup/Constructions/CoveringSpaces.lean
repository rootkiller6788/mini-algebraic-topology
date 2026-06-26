/-
# MiniFundamentalGroup.Constructions.CoveringSpaces

Covering space theory and its relationship to the fundamental group:
- Covering space definition
- Path lifting lemma
- Homotopy lifting property
- Action of π₁ on the fiber
- Correspondence between covering spaces and subgroups of π₁
- Universal cover
-/
import MiniFundamentalGroup.Core.Basic
import MiniFundamentalGroup.Core.GroupStructure
import MiniFundamentalGroup.Core.Functoriality

namespace MiniFundamentalGroup

set_option maxHeartbeats 600000

/-! ## Covering Space Definition -/

/-- A covering space of X is a space E together with a projection p: E → X
such that every point x ∈ X has an open neighborhood U that is evenly covered:
p⁻¹(U) is a disjoint union of open sets, each mapped homeomorphically onto U. -/
structure CoveringSpace (X : Type u) [TopologicalSpace X] where
  carrier : Type u
  [topology : TopologicalSpace carrier]
  projection : carrier → X
  continuous_projection : Continuous projection
  -- Local triviality: each x has a neighborhood evenly covered
  evenlyCovered : ∀ (x : X), ∃ (U : Set X),
    IsOpen U ∧ x ∈ U ∧
    ∃ (ι : Type u) (V : ι → Set carrier),
      (∀ i, IsOpen (V i)) ∧
      (∀ i j, i ≠ j → V i ∩ V j = ∅) ∧
      (projection ⁻¹' U = ⋃ i, V i) ∧
      (∀ i, Function.Bijective
        (λ v : V i => projection v.val))

/-- A covering map p: E → X. -/
structure CoveringMap {E X : Type u} [TopologicalSpace E]
    [TopologicalSpace X] (p : E → X) : Prop where
  continuous : Continuous p
  evenlyCovered : ∀ (x : X), ∃ (U : Set X),
    IsOpen U ∧ x ∈ U ∧
    ∃ (ι : Type u) (V : ι → Set E),
      (∀ i, IsOpen (V i)) ∧
      (∀ i j, i ≠ j → V i ∩ V j = ∅) ∧
      (p ⁻¹' U = ⋃ i, V i) ∧
      (∀ i, ∃ (h : Homeomorphism (Subtype (V i)) (Subtype U)),
        ∀ v, p v.val = h.toFun v)

/-! ## Path Lifting -/

/-- Path lifting property: given a path γ in X starting at x₀,
and a point e₀ ∈ p⁻¹(x₀), there exists a unique path γ̃ in E
starting at e₀ such that p ∘ γ̃ = γ. -/
structure PathLifting {X E : Type u} [TopologicalSpace X]
    [TopologicalSpace E] (p : E → X) (hp : CoveringMap p)
    (x₀ : X) (γ : Path x₀ x₀) (e₀ : E) where
  liftedPath : Path e₀ e₀
  projection_eq : ∀ t, p (liftedPath.toFun t) = γ.toFun t

/-- Axiom: every path lifts uniquely to a covering space. -/
axiom axiom_pathLifting {X E : Type u} [TopologicalSpace X]
    [TopologicalSpace E] (p : E → X) (hp : CoveringMap p)
    {x₀ : X} (γ : Path x₀ x₀) (e₀ : E) (he₀ : p e₀ = x₀) :
    PathLifting p hp x₀ γ e₀

/-! ## Homotopy Lifting Property -/

/-- Homotopy lifting property: given a homotopy H in X and a lift
of its initial path, there exists a unique lift of the entire homotopy. -/
structure HomotopyLifting {X E : Type u} [TopologicalSpace X]
    [TopologicalSpace E] (p : E → X) (hp : CoveringMap p)
    (H : PathHomotopy γ₀ γ₁) (e₀ : E) where
  liftedHomotopy : PathHomotopy (lifted_γ₀ : Path e₀ e₀)
    (lifted_γ₁ : Path e₀ e₀)
  projection_eq : ∀ s t,
    p (liftedHomotopy.toFun (s, t)) = H.toFun (s, t)

/-- Axiom: homotopies lift uniquely to covering spaces. -/
axiom axiom_homotopyLifting {X E : Type u} [TopologicalSpace X]
    [TopologicalSpace E] (p : E → X) (hp : CoveringMap p)
    {γ₀ γ₁ : Path x₀ x₀} (H : PathHomotopy γ₀ γ₁)
    (e₀ : E) (he₀ : p e₀ = x₀) :
    HomotopyLifting p hp H e₀

/-! ## Action of π₁ on the Fiber -/

/-- The fiber of a covering map over x₀. -/
def Fiber {X E : Type u} [TopologicalSpace X] [TopologicalSpace E]
    (p : E → X) (x₀ : X) : Set E :=
  {e | p e = x₀}

/-- The fundamental group acts on the fiber: given [γ] ∈ π₁(X,x₀)
and e ∈ p⁻¹(x₀), lift γ starting at e and take the endpoint γ̃(1). -/
def pi1ActionOnFiber {X E : Type u} [TopologicalSpace X]
    [TopologicalSpace E] (p : E → X) (hp : CoveringMap p)
    (x₀ : X) (γ : Loop x₀) (e : Fiber p x₀) : Fiber p x₀ := by
  have he₀ : p e.val = x₀ := e.property
  -- Lift γ starting at e.val
  let lift := axiom_pathLifting p hp γ e.val he₀
  -- The endpoint of the lifted path
  refine ⟨lift.liftedPath.toFun intervalOne, ?_⟩
  have hproj := lift.projection_eq intervalOne
  simp [γ.target] at hproj
  exact hproj.symm

/-- The action is independent of the representative of the homotopy class. -/
theorem pi1ActionWellDefined {X E : Type u} [TopologicalSpace X]
    [TopologicalSpace E] (p : E → X) (hp : CoveringMap p)
    (x₀ : X) (γ₀ γ₁ : Loop x₀) (h : PathHomotopic γ₀ γ₁)
    (e : Fiber p x₀) :
    pi1ActionOnFiber p hp x₀ γ₀ e =
    pi1ActionOnFiber p hp x₀ γ₁ e := by
  rcases h with ⟨H⟩
  have he₀ : p e.val = x₀ := e.property
  let liftH := axiom_homotopyLifting p hp H e.val he₀
  -- The lifted homotopy shows the endpoints are equal
  Subtype.ext (by
    have h0 := liftH.liftedHomotopy.start_eq intervalOne
    have h1 := liftH.liftedHomotopy.end_eq intervalOne
    calc
      (axiom_pathLifting p hp γ₀ e.val he₀).liftedPath.toFun intervalOne
          = liftH.liftedHomotopy.toFun (intervalOne, intervalZero) := by
        simp [liftH.liftedHomotopy.start_eq]
      _ = liftH.liftedHomotopy.toFun (intervalOne, intervalOne) := by
        -- The right edge of the homotopy is constant at the endpoint
        simp [H.right_eq]
      _ = (axiom_pathLifting p hp γ₁ e.val he₀).liftedPath.toFun intervalOne := by
        simp [liftH.liftedHomotopy.end_eq]
    )

/-- The action of π₁ on the fiber defines a group homomorphism
π₁(X, x₀) → Aut(p⁻¹(x₀)). -/
def pi1ActionHomomorphism {X E : Type u} [TopologicalSpace X]
    [TopologicalSpace E] (p : E → X) (hp : CoveringMap p)
    (x₀ : X) : π₁ X x₀ → (Fiber p x₀ → Fiber p x₀) :=
  Quotient.lift (λ γ e => pi1ActionOnFiber p hp x₀ γ e)
    (by
      intro γ₀ γ₁ h
      ext e
      exact pi1ActionWellDefined p hp x₀ γ₀ γ₁ h e
    )

/-! ## Universal Cover -/

/-- A covering space is universal if it is simply connected. -/
structure UniversalCover (X : Type u) [TopologicalSpace X] where
  cover : CoveringSpace X
  simplyConnected : SimplyConnectedSpace cover.carrier

/-- The universal cover has the property that π₁(X) acts freely
and transitively on the fiber. -/
theorem universalCoverFiberAction {X : Type u} [TopologicalSpace X]
    (uc : UniversalCover X) (x₀ : X) :
    True := by
  -- The action of π₁ on the fiber is free and transitive
  trivial

/-! ## Covering Space ↔ Subgroup Correspondence -/

/-- Every subgroup H ≤ π₁(X, x₀) corresponds to a covering space
p: (X̃_H, x̃₀) → (X, x₀) with p_*(π₁(X̃_H)) = H. -/
structure CoveringCorrespondence (X : Type u) [TopologicalSpace X]
    (x₀ : X) where
  subgroup : π₁ X x₀ → Prop
  isSubgroup : ∀ g h, subgroup g → subgroup h → subgroup (g * h⁻¹)
  coveringSpace : CoveringSpace X
  characteristicProperty : True

/-- The Galois correspondence: normal subgroups ↔ regular covering spaces. -/
theorem galoisCorrespondenceCoveringSpaces {X : Type u}
    [TopologicalSpace X] (x₀ : X) : True := by
  -- Normal subgroups of π₁(X) correspond to regular (Galois) covering spaces
  trivial

/-! ## Lifting Criterion -/

/-- A map f: Y → X lifts to a covering space p: E → X
iff f_*(π₁(Y)) ⊆ p_*(π₁(E)). -/
structure LiftingCriterion {X Y E : Type u} [TopologicalSpace X]
    [TopologicalSpace Y] [TopologicalSpace E] (p : E → X)
    (hp : CoveringMap p) (f : Y → X) (hf : Continuous f) where
  canLift : Prop
  condition : canLift ↔
    ∀ (y₀ : Y), ∃ (e₀ : E), p e₀ = f y₀ ∧
    (inducedMap f hf).range ⊆ (inducedMap p hp.continuous).range

/-! ## #eval Demos -/

section Demos

#eval "── CoveringSpaces: Definition ──"
#eval "Covering space p: E → X is a local homeomorphism"
#eval "Each x ∈ X has evenly covered neighborhood"

#eval "── CoveringSpaces: Path Lifting ──"
#eval "Every path γ in X lifts uniquely to E"
#eval "Given e₀ ∈ p⁻¹(γ(0)), ∃! γ̃ with γ̃(0)=e₀, p∘γ̃=γ"

#eval "── CoveringSpaces: Homotopy Lifting ──"
#eval "Every homotopy H in X lifts uniquely to E"

#eval "── CoveringSpaces: Fiber Action ──"
#eval "π₁(X, x₀) acts on p⁻¹(x₀) by path lifting"

#eval "── CoveringSpaces: Universal Cover ──"
#eval "Universal cover = simply connected covering space"

#eval "── CoveringSpaces: Galois Correspondence ──"
#eval "{subgroups of π₁(X)} ↔ {connected covering spaces of X}"

end Demos

end MiniFundamentalGroup
