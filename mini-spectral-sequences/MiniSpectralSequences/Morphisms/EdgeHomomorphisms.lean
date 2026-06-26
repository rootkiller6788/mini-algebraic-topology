import MiniSpectralSequences
namespace MiniSpectralSequences

/-- The bottom edge homomorphism for a first-quadrant SS:
    E_2^{p,0} → E_3^{p,0} → ... → E_infty^{p,0} → H^p. -/
structure BottomEdgeHomomorphismExtended where
  ss : CohomSpectralSequence
  p : Int
  maps : List (Type → Type)
  description : String := "E_2^{p,0}↠E_3^{p,0}↠...↠E_∞^{p,0}↪H^p"

/-- The left edge homomorphism for a first-quadrant SS:
    H^n → E_infty^{0,n} → ... → E_2^{0,n}. -/
structure LeftEdgeHomomorphismExtended where
  ss : CohomSpectralSequence
  n : Int
  description : String := "H^n↠E_∞^{0,n}↪...↪E_2^{0,n}"

/-- The five-term exact sequence of low-degree terms:
    0 → E_2^{1,0} → H^1 → E_2^{0,1} →^d_2 E_2^{2,0} → H^2. -/
structure FiveTermLowDegree where
  E2_10 : Type; E2_01 : Type; E2_20 : Type; H1 : Type; H2 : Type
  d2 : E2_01 → E2_20
  exactness_statement : String :=
    "0→E_2^{1,0}→H^1→E_2^{0,1}→^{d_2}E_2^{2,0}→H^2 is exact"

/-- The transgression in a Serre SS: τ = d_n : E_n^{0,n-1} → E_n^{n,0}. -/
structure TransgressionExtended where
  ss : CohomSpectralSequence
  n : Int
  source : Type; target : Type
  tau : source → target
  relation_to_boundary : String :=
    "τ corresponds to ∂: H_{n-1}(F)→H_n(B) in the homotopy LES"

/-- The edge-to-edge composite:
    E_2^{p,0} → H^p → E_2^{0,p} factors through the transgression. -/
structure EdgeToEdge where
  p : Int
  composition : Type → Type
  factorization : String := "E_2^{p,0}→H^p→E_2^{0,p}"

/-- The Wang sequence from the Serre SS of a fibration over S^n. -/
structure WangSequence where
  n : Int; F : Type; B : Type
  exact_sequence : String := "...→H^k(B)→H^k(E)→H^{k-n}(F)→H^{k+1}(B)→..."

/-- The Gysin sequence from the Serre SS of an S^{n-1} fibration. -/
structure GysinSequence where
  n : Int; sphere_fiber : Bool
  exact_sequence : String := "...→H^k(B)→H^k(E)→H^{k-n}(B)→H^{k+1}(B)→..."

/-- Naturality of the edge homomorphism: a map of fibrations
    induces a commutative diagram of edge maps. -/
structure NaturalEdgeMap where
  source_ss : CohomSpectralSequence; target_ss : CohomSpectralSequence
  commutative_square : String := "Edge maps commute with induced maps"

/-- The Kudo-Araki theorem: Steenrod operations commute with
    the transgression in the Serre SS. -/
structure KudoAraki where
  p : Nat; n : Int
  transgression_formula : String := "Sq^i ∘ τ = τ ∘ Sq^i"

/-- Edge homomorphisms and the Hurewicz theorem.
    In the Serre SS of Omega X → PX → X, the bottom edge
    corresponds to the Hurewicz map h: pi_*(X) → H_*(X). -/
structure HurewiczEdge where
  X : Type; n : Int
  hurewicz_map : String := "h: pi_n(X) → H_n(X) factors through edge"

/-- The dual edge homomorphisms in homology Serre SS. -/
structure DualEdgeHomomorphism where
  ss_hom : HomSpectralSequence
  p : Int
  description : String := "E^2_{p,0} → H_p (in homology SS)"

/-- The abutment filtration: F^p H^n / F^{p+1} H^n ≅ E_infty^{p,q}. -/
structure AbutmentFiltration where
  H : Int → BigradedAbGroup
  F : Int → Int → BigradedAbGroup
  E_inf : Int → Int → BigradedAbGroup
  associated_graded_iso : String := "E_∞^{p,q} ≅ F^p H^{p+q} / F^{p+1} H^{p+q}"

/-- The extension problem: recovering H^n from E_infty^{p,q}. -/
structure ExtensionProblemSolver where
  n : Int
  strategy : String
  solvability_condition : String

/-- In the Leray-Serre SS, the local coefficient system
    H^*(F) over B is trivial when B is simply-connected. -/
structure TrivialLocalCoefficients where
  base : Type; simply_connected : Prop
  constant_fiber_cohomology : String := "H^*(F) constant over B"

end MiniSpectralSequences