import MiniSpectralSequences
namespace MiniSpectralSequences

/-- The Serre SS in algebraic geometry: For a smooth proper morphism
    f: X → Y, the Leray SS computes H^*(X) from H^*(Y) and H^*(fiber). -/
structure LeraySS_AlgebraicGeometry where
  X Y : Type; f : X → Y; smooth : Prop; proper : Prop
  ss : CohomSpectralSequence
  E2_description : String := "E_2^{p,q} = H^p(Y, R^q f_* Q)"
  degenerates_E2 : Prop

/-- The Hodge-de Rham SS for a Kaehler manifold:
    E_1^{p,q} = H^q(X, Ω^p) ⇒ H^{p+q}(X, C). -/
structure HodgeDeRhamSS_AG where
  X : Type; kaehler : Prop
  E1_groups : String := "H^q(X, Ω^p)"
  degenerates_at_E1 : Prop

/-- The weight spectral sequence in mixed Hodge theory:
    relates the weight filtration to Hodge structures. -/
structure WeightSS where
  X : Type; mixed_hodge : Prop
  E1_description : String := "E_1 = H^*(Gr^W_*) with d_1"

/-- The Grothendieck spectral sequence in group cohomology:
    For N ◁ G, H^p(G/N, H^q(N, M)) ⇒ H^{p+q}(G, M). -/
structure HochschildSerreSS where
  G : Type; N : Type; normal : Prop; M : Type
  ss : CohomSpectralSequence
  E2_description : String := "E_2^{p,q} = H^p(G/N, H^q(N, M))"

/-- The Connes spectral sequence for cyclic homology:
    E_1 = HH_*(A) ⇒ HC_*(A). -/
structure ConnesCyclicSS where
  A : Type; algebra : Prop
  ss : CohomSpectralSequence
  periodicity : String := "S: HC_n → HC_{n-2}"

/-- The van Est spectral sequence:
    H^p(G, H^q(g, M)) ⇒ H^{p+q}(g, M) for a Lie group G
    and its Lie algebra g. -/
structure VanEst_SS where
  G : Type; g : Type; M : Type
  ss : CohomSpectralSequence
  application : String := "Differentiable cohomology = Lie algebra cohomology"

/-- The Bousfield-Kan SS for a cosimplicial space:
    E_2^{s,t} = pi^s pi_t X^• ⇒ pi_{t-s} Tot(X^•). -/
structure BousfieldKanSS_Application where
  X_cosimplicial : Type
  ss : CohomSpectralSequence
  homotopy_limit : String := "Tot = holim"

/-- The Goodwillie SS for the Taylor tower:
    E_1 = pi_*(D_n F / D_{n-1} F) ⇒ pi_*(F). -/
structure GoodwillieSS_Application where
  F : Type → Type; X : Type
  ss : CohomSpectralSequence
  layers : String := "n-th layer = Omega^∞ ∂_n F ∧ X^{∧n}_{hΣ_n}"

/-- The EHP SS for computing unstable homotopy groups
    of spheres from the homotopy of odd spheres. -/
structure EHP_SS_Application where
  ss : CohomSpectralSequence
  E1_description : String := "E_1^{n,k} = π_{n+k}(S^{2n+1})"
  converge_to : String := "π_*(S^n)"

/-- The Miller spectral sequence for the Steenrod algebra:
    computing Ext_A from the May SS. -/
structure MillerSS where
  ss : CohomSpectralSequence
  technique : String := "Lambda algebra = cobar complex"

/-- The Goerss-Hopkins obstruction theory SS for
    E_infty ring spectra structures. -/
structure GoerssHopkinsSS where
  spectrum : Type
  ss : CohomSpectralSequence
  resolution_model : String := "resolves operadic obstructions"

/-- The topological Hochschild homology (THH) SS:
    computing THH from THH of the coefficients. -/
structure THH_SS where
  ring_spectrum : Type
  ss : CohomSpectralSequence
  Bokstedt : String := "Bokstedt's SS for THH"

/-- The descent SS for the sphere spectrum in
    motivic homotopy theory. -/
structure DescentSS_Application where
  field : Type
  ss : CohomSpectralSequence
  motivic_sphere : String := "1 = motivic sphere spectrum"

end MiniSpectralSequences