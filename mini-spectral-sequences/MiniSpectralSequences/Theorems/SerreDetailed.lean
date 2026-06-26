import MiniSpectralSequences
namespace MiniSpectralSequences

/-- The Serre SS for a fibration F → E → B with B simply-connected:
    E_2^{p,q} = H^p(B; H^q(F)) ⇒ H^{p+q}(E). -/
structure SerreSS_Full where
  F E B : Type
  fibration : SerreFibration
  B_simply_connected : Prop
  ss : CohomSpectralSequence
  E2_term : String := "H^p(B; H^q(F))"
  abutment : String := "H^{p+q}(E)"
  differential_dr : String := "d_r: E_r^{p,q} → E_r^{p+r, q-r+1}"

/-- The Serre SS with local coefficients:
    When B is not simply-connected, H^q(F) forms a local system
    over B, and E_2 = H^p(B; H^q(F)) with twisted coefficients. -/
structure SerreSS_LocalCoefficients where
  F E B : Type
  pi_1_action : String := "pi_1(B) acts on H^*(F)"
  ss : CohomSpectralSequence

/-- The cohomology Serre SS for a fibration:
    For each p,q, E_2^{p,q} = H^p(B; H^q(F)). The differential
    d_r has bidegree (r, 1-r) in the cohomological convention. -/
structure CohomSerreSS where
  ss : CohomSpectralSequence
  E2_bidegree_condition : (p q : Int) → q < 0 → True

/-- The homology Serre SS: E^2_{p,q} = H_p(B; H_q(F)) ⇒ H_{p+q}(E).
    Uses the homological convention with d^r of bidegree (-r, r-1). -/
structure HomSerreSS where
  ss : HomSpectralSequence
  E2_term : String := "H_p(B; H_q(F))"
  abutment : String := "H_{p+q}(E)"

/-- Edge homomorphism in the Serre SS:
    Bottom edge: H^p(B) = E_2^{p,0} → H^p(E) induced by p: E → B.
    Left edge: H^n(E) → E_2^{0,n} = H^n(F) induced by i: F → E. -/
structure SerreEdgeHomomorphisms where
  p_star : (p : Int) → Type → Type
  i_star : (n : Int) → Type → Type
  relation : String := "p^* ∘ i^* factors through the transgression"

/-- The Wang sequence for a fibration over S^n:
    long exact sequence ... → H^k(B) → H^k(E) → H^{k-n+1}(B) → ... -/
structure WangSequenceDetail where
  base_is_sphere : Prop; n : Int
  exact_sequence : String := "... → H^k(B) → H^k(E) → H^{k-n+1}(F) → H^{k+1}(B) → ..."

/-- The Gysin sequence for an S^{n-1}-fibration:
    ... → H^k(B) → H^k(E) → H^{k-n}(B) → H^{k+1}(B) → ... -/
structure GysinSequenceDetail where
  fiber_is_sphere : Prop; n_sub_1 : Int
  integration_map : String := "pi_!: H^k(E) → H^{k-n}(B)"

/-- The Thom isomorphism: H^*(E, E_0) ≅ H^*(B) for a vector bundle,
    via the cup product with the Thom class U ∈ H^n(E, E_0). -/
structure ThomIsomorphism where
  vector_bundle : Type; rank : Nat
  thom_class : String := "U ∈ H^n(E, E_0)"
  isomorphism : String := "φ_U: H^*(B) → H^{*+n}(E, E_0), x ↦ π^*(x) ∪ U"

/-- The Gysin-Thom relation: The Euler class e = i^* U ∈ H^n(B)
    is the pullback of the Thom class. The Gysin sequence
    incorporates the Euler class. -/
structure GysinThomRelation where
  euler_class : String := "e = i^* U ∈ H^n(B)"
  sequence : String := "→ H^{k-n}(B) →^e∪ H^k(B) → H^k(E) → H^{k-n+1}(B) →"

/-- The Leray-Hirsch theorem: If H^*(F) is a free R-module
    with a basis that extends to E, then H^*(E) ≅ H^*(B) ⊗ H^*(F)
    as R-modules (but not necessarily as rings). -/
structure LerayHirschTheorem where
  F E B : Type; R : Type
  basis_extends : Prop
  module_iso : String := "H^*(E; R) ≅ H^*(B; R) ⊗_R H^*(F; R)"

/-- The cohomology of classifying spaces:
    The Serre SS for EG → BG with fiber G gives relations
    between H^*(BG) and H^*(G). -/
structure ClassifyingSpaceSS where
  G : Type; topological_group : Prop
  EG : Type; contractible : Prop
  BG : Type; classifying_space : Prop
  ss : CohomSpectralSequence

/-- The cohomology of the loop space Omega X:
    The Serre SS for Omega X → PX → X collapses at E_2 when
    X is a suspension (Kudo-Araki-Kudo theorem). -/
structure LoopSpaceCohomologySS where
  X : Type; Omega_X : Type; PX : Type
  PX_contractible : Prop
  ss : CohomSpectralSequence

end MiniSpectralSequences