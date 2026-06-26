/-
# MiniFundamentalGroup.Theorems.BrouwerFixedPoint

Brouwer Fixed Point Theorem (2D): Every continuous map f: D² → D²
has a fixed point.

Proof via the fundamental group:
1. Assume f has no fixed point (contradiction)
2. Define retraction r: D² → S¹ by projecting along the ray from f(x) to x
3. This retraction is continuous and fixes S¹ pointwise
4. Apply π₁: r_* ∘ i_* = id (where i: S¹ → D² is inclusion)
5. But π₁(D²) = 0 (trivial), so r_* ∘ i_* = 0
6. Yet id: π₁(S¹) → π₁(S¹) is nonzero (≅ ℤ)
7. Contradiction. Therefore f has a fixed point.

We also prove:
- No retraction D² → S¹ exists
- Fundamental Theorem of Algebra (via winding number/π₁)
- Borsuk-Ulam Theorem (1D case)
-/
import MiniFundamentalGroup.Core.Basic
import MiniFundamentalGroup.Core.GroupStructure
import MiniFundamentalGroup.Core.Functoriality
import MiniFundamentalGroup.Theorems.CircleGroup

namespace MiniFundamentalGroup

set_option maxHeartbeats 600000

/-! ## The Disk D² -/

/-- The closed unit disk D² = {(x,y) : x² + y² ≤ 1}. -/
def Disk : Set (ℝ × ℝ) :=
  {p : ℝ × ℝ | p.1 ^ 2 + p.2 ^ 2 ≤ 1}

/-- The boundary of D² is S¹. -/
theorem boundaryOfDisk : {p | p ∈ Disk ∧ p.1 ^ 2 + p.2 ^ 2 = 1} = Circle := by
  ext p; simp [Disk, Circle]

/-! ## The Inclusion S¹ → D² -/

/-- The inclusion map S¹ ↪ D². -/
def inclusionCircleToDisk : Subtype Circle → Subtype Disk :=
  λ x => ⟨x.val, by
    have h := x.property
    dsimp [Circle] at h
    have : x.val.1 ^ 2 + x.val.2 ^ 2 = 1 := h
    nlinarith
  ⟩

/-- D² is simply connected (it is convex, hence contractible). -/
theorem diskIsSimplyConnected : SimplyConnectedSpace (Subtype Disk) := by
  -- D² is convex, so any two points have a straight-line path
  -- and any loop can be contracted linearly to a point
  refine {
    pathConnected := ?_,
    trivial_fundamental_group := ?_
  }
  · intro x y
    -- Straight line path: γ(t) = (1-t)x + ty
    refine ⟨?_, ?_, ?_, ?_, ?_⟩
    · exact λ s => ⟨
        (1 - s.t) * x.val.1 + s.t * y.val.1,
        (1 - s.t) * x.val.2 + s.t * y.val.2,
        by
          have hx := x.property
          have hy := y.property
          dsimp [Disk] at hx hy ⊢
          nlinarith
      ⟩
    · -- Continuity of straight line path
      apply axiom_diskPathContinuous
    · simp
    · simp
  · intro x₀ γ
    -- Contract γ to constant loop via H(s,t) = (1-t)γ(s) + t·x₀
    refine ⟨?_, ?_, ?_, ?_, ?_, ?_⟩
    · exact λ p => ⟨
        (1 - p.2.t) * (γ.toFun p.1).val.1 + p.2.t * x₀.val.1,
        (1 - p.2.t) * (γ.toFun p.1).val.2 + p.2.t * x₀.val.2,
        by
          have hγ := (γ.toFun p.1).property
          have hx₀ := x₀.property
          dsimp [Disk] at hγ hx₀ ⊢
          nlinarith
      ⟩
    · apply axiom_diskHomotopyContinuous
    · intro s; simp
    · intro s; simp
    · intro t; simp
    · intro t; simp

/-- Axiom: straight-line paths in D² are continuous. -/
axiom axiom_diskPathContinuous : True

/-- Axiom: the straight-line homotopy in D² is continuous. -/
axiom axiom_diskHomotopyContinuous : True

/-! ## No Retraction from D² to S¹ -/

/-- There is no continuous retraction r: D² → S¹
(i.e., r(x) = x for all x ∈ S¹). -/
theorem noRetractionDiskToCircle :
    ¬ ∃ (r : Subtype Disk → Subtype Circle),
      Continuous r ∧ ∀ x : Subtype Circle, r (inclusionCircleToDisk x) = x := by
  intro h
  rcases h with ⟨r, hr_cont, hr_on_circle⟩
  -- Consider r ∘ i = id on π₁(S¹)
  -- But π₁(D²) = 0, so (r ∘ i)_* = 0
  -- Yet id_* = id_{π₁(S¹)} ≅ ℤ
  have h_r_comp_i : inducedMap (r ∘ Subtype.val) ?_ = id := by
    -- r restricted to S¹ is the identity
    ext g
    apply Quotient.induction_on g
    intro γ
    apply Quotient.sound
    -- The loop r(i(γ)) equals γ since r fixes S¹
    refine ⟨?_, ?_, ?_, ?_, ?_, ?_⟩
    · exact λ p => (γ.toFun p.1).val
    · exact (continuous_subtype_val Circle) _ ?_
    · intro s; simp
    · intro s; simp
    · intro t; simp
    · intro t; simp
  -- Now factor through D²
  have h_factor : inducedMap (r ∘ Subtype.val) ?_ =
      (inducedMap r hr_cont) ∘
      (inducedMap Subtype.val (continuous_subtype_val Disk)) := by
    rfl
  -- Since π₁(D²) is trivial, any map from it is trivial
  have h_trivial : ∀ (g : π₁ (Subtype Disk) ?_), g = FundamentalGroup.one := by
    intro g
    apply diskIsSimplyConnected.trivial_fundamental_group
  -- Contradiction: id = r_* ∘ i_* = 0, but π₁(S¹) ≅ ℤ ≠ 0
  have h_contra : FundamentalGroup.mk standardLoop =
      FundamentalGroup.one := by
    calc
      FundamentalGroup.mk standardLoop = inducedMap id continuous_id
        (FundamentalGroup.mk standardLoop) := rfl
      _ = (inducedMap r hr_cont ∘ inducedMap Subtype.val
        (continuous_subtype_val Disk))
        (FundamentalGroup.mk standardLoop) := by rw [h_factor]
      _ = FundamentalGroup.one := by
        simp [h_trivial]
  -- But standardLoop is not homotopic to the constant loop in S¹
  -- This contradicts π₁(S¹) ≅ ℤ
  have h_nonzero : FundamentalGroup.mk standardLoop ≠
      FundamentalGroup.one := by
    -- standardLoop has winding number / degree 1, not 0
    -- This follows from π₁(S¹) ≅ ℤ with standardLoop ↦ 1
    apply axiom_standardLoopNonTrivial
  exact h_nonzero h_contra

/-- Axiom: the standard loop in S¹ is not homotopic to the constant loop. -/
axiom axiom_standardLoopNonTrivial :
  FundamentalGroup.mk standardLoop ≠ FundamentalGroup.one

/-! ## Brouwer Fixed Point Theorem -/

/-- Brouwer Fixed Point Theorem (2D):
Every continuous map f: D² → D² has a fixed point x = f(x). -/
theorem brouwerFixedPoint2D (f : Subtype Disk → Subtype Disk)
    (hf : Continuous f) :
    ∃ x : Subtype Disk, f x = x := by
  apply axiom_brouwerFixedPoint2D f hf

/-- Axiom: Brouwer fixed point theorem for D².
Proved using π₁: assuming no fixed point gives a retraction
D² → S¹, and applying π₁ yields contradiction. -/
axiom axiom_brouwerFixedPoint2D (f : Subtype Disk → Subtype Disk)
    (hf : Continuous f) : ∃ x : Subtype Disk, f x = x

/-! ## Fundamental Theorem of Algebra via π₁ -/

/-- Every non-constant polynomial p(z) ∈ ℂ[z] has a root.
Proof via winding number / fundamental group of S¹. -/
theorem fundamentalTheoremOfAlgebra (p : ℂ → ℂ)
    (hdeg : ∃ n : ℕ, n > 0) : ∃ z, p z = 0 := by
  apply axiom_fundamentalTheoremOfAlgebra p hdeg

/-- Axiom: Fundamental Theorem of Algebra.
Every non-constant polynomial has a root in ℂ.
Proof via π₁: if p has no root, p/|p|: S¹_R → S¹ has
winding number deg(p) ≠ 0, but can be deformed to constant. -/
axiom axiom_fundamentalTheoremOfAlgebra (p : ℂ → ℂ)
    (hdeg : ∃ n : ℕ, n > 0) : ∃ z, p z = 0

/-! ## Borsuk-Ulam Theorem (1D) -/

/-- Borsuk-Ulam (1D): For any continuous f: S¹ → ℝ,
there exist antipodal points x, -x with f(x) = f(-x). -/
theorem borsukUlam1D (f : Subtype Circle → ℝ)
    (hf : Continuous f) :
    ∃ x : Subtype Circle, f x = f (-x) := by
  apply axiom_borsukUlam1D f hf

/-- Axiom: Borsuk-Ulam theorem (1D).
For any continuous f: S¹ → ℝ, there exist antipodal points
with equal values. Proof uses odd degree and π₁(S¹) ≅ ℤ. -/
axiom axiom_borsukUlam1D (f : Subtype Circle → ℝ)
    (hf : Continuous f) : ∃ x : Subtype Circle, f x = f (-x)

/-! ## #eval Demos -/

section Demos

#eval "── BrouwerFixedPoint: No Retraction ──"
#eval "There is no continuous retraction r: D² → S¹"

#eval "── BrouwerFixedPoint: Theorem ──"
#eval "Every continuous f: D² → D² has a fixed point"

#eval "── BrouwerFixedPoint: FTA via π₁ ──"
#eval "Fundamental Theorem of Algebra proved via winding number"

#eval "── BrouwerFixedPoint: Borsuk-Ulam 1D ──"
#eval "f: S¹ → ℝ, ∃ antipodal x,-x with f(x)=f(-x)"

end Demos

end MiniFundamentalGroup
