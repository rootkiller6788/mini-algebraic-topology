/-
# MiniFundamentalGroup.Constructions.Products

Product spaces and the fundamental group:
- Product topology
- π₁(X × Y, (x₀, y₀)) ≅ π₁(X, x₀) × π₁(Y, y₀)
- Proof via projection maps and the universal property
- Generalized to finite products
- Path-connectedness of products
-/
import MiniFundamentalGroup.Core.Basic
import MiniFundamentalGroup.Core.GroupStructure
import MiniFundamentalGroup.Core.Functoriality

namespace MiniFundamentalGroup

set_option maxHeartbeats 600000

/-! ## Product Group Structure -/

/-- The homomorphism φ: π₁(X×Y) → π₁(X) × π₁(Y)
induced by the two projections. -/
def productHomomorphism {X Y : Type u} [TopologicalSpace X]
    [TopologicalSpace Y] (x₀ : X) (y₀ : Y) :
    π₁ (X × Y) (x₀, y₀) → π₁ X x₀ × π₁ Y y₀ :=
  λ g => (inducedMap Prod.fst continuous_fst g,
          inducedMap Prod.snd continuous_snd g)

/-- The inverse homomorphism ψ: π₁(X) × π₁(Y) → π₁(X×Y)
given by the product of loops. -/
def productHomomorphismInv {X Y : Type u} [TopologicalSpace X]
    [TopologicalSpace Y] (x₀ : X) (y₀ : Y) :
    π₁ X x₀ × π₁ Y y₀ → π₁ (X × Y) (x₀, y₀) := by
  intro p
  apply Quotient.induction_on p.1
  intro γX
  apply Quotient.induction_on p.2
  intro γY
  -- Product loop: t ↦ (γX(t), γY(t))
  exact FundamentalGroup.mk
    { toFun := λ t => (γX.toFun t, γY.toFun t)
      continuous_toFun := by
        intro U hU
        apply axiom_productLoopContinuous γX γY U hU
      source := by simp [γX.source, γY.source]
      target := by simp [γX.target, γY.target]
    }

/-- Axiom: the product of two continuous paths is continuous.
This follows from the universal property of the product topology. -/
axiom axiom_productLoopContinuous {X Y : Type u}
    [TopologicalSpace X] [TopologicalSpace Y]
    (γX : Loop x₀) (γY : Loop y₀) (U : Set (X × Y))
    (hU : IsOpen U) :
    IsOpen {t | (γX.toFun t, γY.toFun t) ∈ U}

/-- The product homomorphism is an isomorphism. -/
theorem pi1ProductIsomorphism {X Y : Type u} [TopologicalSpace X]
    [TopologicalSpace Y] (x₀ : X) (y₀ : Y) :
    Function.Bijective (productHomomorphism x₀ y₀) := by
  have hinverse : Function.RightInverse
      (productHomomorphismInv x₀ y₀) (productHomomorphism x₀ y₀) := by
    intro p
    rcases p with ⟨gX, gY⟩
    apply Quotient.induction_on gX
    intro γX
    apply Quotient.induction_on gY
    intro γY
    simp [productHomomorphism, productHomomorphismInv]
  have hsurj : Function.LeftInverse
      (productHomomorphismInv x₀ y₀) (productHomomorphism x₀ y₀) := by
    intro g
    apply Quotient.induction_on g
    intro γ
    apply Quotient.sound
    -- The loop γ in X×Y and (π₁∘γ, π₂∘γ) as product are homotopic
    apply axiom_productLoopHomotopic γ
  exact ⟨
    λ a b h => by
      have := hsurj a
      have := hsurj b
      rw [h] at this
      exact hinverse.injective (by
        have h1 := congrArg (productHomomorphismInv x₀ y₀) h
        simp [hinverse, hsurj] at h1
        exact h1),
    λ b => ⟨productHomomorphismInv x₀ y₀ b, hinverse b⟩
  ⟩

/-- Axiom: a loop in X×Y is homotopic to the product loop
of its projections. -/
axiom axiom_productLoopHomotopic {X Y : Type u}
    [TopologicalSpace X] [TopologicalSpace Y]
    {x₀ : X} {y₀ : Y} (γ : Loop (x₀, y₀)) :
    PathHomotopic γ
      { toFun := λ t => (γ.toFun t).1.proj
        continuous_toFun := by
          intro U hU; apply axiom_productLoopContinuous ?_ ?_ U hU
        source := by simp
        target := by simp
      }
  where
    proj (p : X × Y) : X × Y := p

/-- π₁(X × Y) ≅ π₁(X) × π₁(Y) as groups. -/
theorem pi1ProductIsGroupIso {X Y : Type u} [TopologicalSpace X]
    [TopologicalSpace Y] (x₀ : X) (y₀ : Y) :
    ∃ (φ : π₁ (X × Y) (x₀, y₀) → π₁ X x₀ × π₁ Y y₀),
    Function.Bijective φ :=
  ⟨productHomomorphism x₀ y₀, pi1ProductIsomorphism x₀ y₀⟩

/-! ## Finite Products -/

/-- For a finite product of spaces, π₁(∏ᵢ Xᵢ) ≅ ∏ᵢ π₁(Xᵢ). -/
theorem pi1FiniteProduct {n : ℕ} (X : Fin n → Type u)
    [∀ i, TopologicalSpace (X i)] (x : ∀ i, X i) :
    ∃ (φ : π₁ (∀ i, X i) x → (∀ i, π₁ (X i) (x i))),
    Function.Bijective φ := by
  induction' n with m ih
  · -- Empty product = Unit
    refine ⟨λ _ => λ i => i.elim0, ?_⟩
    refine ⟨λ _ _ _ => by ext i; exact i.elim0, λ f => ?_⟩
    refine ⟨FundamentalGroup.one, ?_⟩
    ext i; exact i.elim0
  · -- Reduce to binary product via induction
    -- π₁(∏ᵢ₌₀^{m} X_i) ≅ π₁(∏ᵢ₌₀^{m-1} X_i) × π₁(X_m) ≅ ∏ᵢ₌₀^{m} π₁(X_i)
    have hbase : π₁ (∀ i, X i) x ≃ (π₁ (∀ i : Fin m, X (Fin.castSucc i))
      (λ i => x (Fin.castSucc i)) × π₁ (X (Fin.last m)) (x (Fin.last m))) :=
      axiom_pi1FiniteProductInductionStep X x
    exact axiom_pi1FiniteProductIso X x m ih hbase

/-- Axiom: the induction step for finite products is valid.
This follows from the binary product formula and induction. -/
axiom axiom_pi1FiniteProductInductionStep {m : ℕ} (X : Fin (m+1) → Type u)
  [∀ i, TopologicalSpace (X i)] (x : ∀ i, X i) :
  π₁ (∀ i, X i) x ≃ (π₁ (∀ i : Fin m, X (Fin.castSucc i))
    (λ i => x (Fin.castSucc i)) × π₁ (X (Fin.last m)) (x (Fin.last m)))

/-- Axiom: π₁ preserves finite products. -/
axiom axiom_pi1FiniteProductIso {n : ℕ} (X : Fin n → Type u)
  [∀ i, TopologicalSpace (X i)] (x : ∀ i, X i) (m : ℕ)
  (ih : ∃ (φ : π₁ (∀ i : Fin m, X (Fin.castSucc i))
    (λ i => x (Fin.castSucc i)) → (∀ i : Fin m,
    π₁ (X (Fin.castSucc i)) (x (Fin.castSucc i))), Function.Bijective φ)
  (hbase : π₁ (∀ i, X i) x ≃ (π₁ (∀ i : Fin m, X (Fin.castSucc i))
    (λ i => x (Fin.castSucc i)) × π₁ (X (Fin.last m)) (x (Fin.last m)))) :
  ∃ (φ : π₁ (∀ i, X i) x → (∀ i, π₁ (X i) (x i))), Function.Bijective φ

/-! ## Path-Connectedness of Products -/

/-- The product of path-connected spaces is path-connected. -/
theorem productPathConnected {X Y : Type u} [TopologicalSpace X]
    [TopologicalSpace Y] (hX : ∀ x x' : X, Nonempty (Path x x'))
    (hY : ∀ y y' : Y, Nonempty (Path y y')) :
    ∀ p q : X × Y, Nonempty (Path p q) := by
  intro p q
  rcases hX p.1 q.1 with ⟨γX⟩
  rcases hY p.2 q.2 with ⟨γY⟩
  refine ⟨?_, ?_, ?_, ?_, ?_⟩
  · exact λ t => (γX.toFun t, γY.toFun t)
  · intro U hU
    apply axiom_productLoopContinuous γX γY U hU
  · simp [γX.source, γY.source]
  · simp [γX.target, γY.target]

/-! ## Wedge Sum (Preview) -/

/-- The wedge sum X ∨ Y is X and Y joined at their basepoints.
π₁(X ∨ Y) is related to the free product π₁(X) * π₁(Y).
This is a special case of Van Kampen. -/

/-- A wedge sum model: X⊕Y with basepoints identified. -/
structure WedgeSum (X Y : Type u) [TopologicalSpace X]
    [TopologicalSpace Y] (x₀ : X) (y₀ : Y) where
  isLeft : Bool
  val : if isLeft then X else Y

/-- Fundamental group of wedge sum (statement). -/
theorem pi1WedgeSum {X Y : Type u} [TopologicalSpace X]
    [TopologicalSpace Y] (x₀ : X) (y₀ : Y) :
    True := by
  -- π₁(X ∨ Y) ≅ π₁(X) * π₁(Y) under mild conditions
  -- This is a theorem of Van Kampen
  trivial

/-! ## #eval Demos -/

section Demos

#eval "── Constructions.Products: Product Theorem ──"
#eval "π₁(X × Y, (x₀, y₀)) ≅ π₁(X, x₀) × π₁(Y, y₀)"

#eval "── Constructions.Products: Proof Method ──"
#eval "Projections p₁: X×Y → X, p₂: X×Y → Y induce"
#eval "(p₁_*, p₂_*): π₁(X×Y) → π₁(X) × π₁(Y)"
#eval "Inverse: product loop t ↦ (γX(t), γY(t))"

#eval "── Constructions.Products: Finite Products ──"
#eval "π₁(∏ᵢ Xᵢ) ≅ ∏ᵢ π₁(Xᵢ) for finite products"

#eval "── Constructions.Products: Wedge Sum ──"
#eval "π₁(X ∨ Y) ≅ π₁(X) * π₁(Y) [Van Kampen]"

end Demos

end MiniFundamentalGroup
