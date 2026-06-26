import MiniSpectralSequences
namespace MiniSpectralSequences

/-- The Leray SS in algebraic geometry: For a morphism f: X → Y
    of schemes, R^q f_* F computes higher direct images. -/
structure LeraySS_Geometry where
  X Y : Type; f : X → Y; quasi_projective : Prop
  sheaf_F : Type
  ss : CohomSpectralSequence
  E2 : String := "E_2^{p,q} = H^p(Y, R^q f_* F)"

/-- The Hodge-de Rham SS for a smooth proper variety:
    E_1^{p,q} = H^q(X, Ω^p_X) ⇒ H^{p+q}(X, C). -/
structure HDR_SS_Geometry where
  X : Type; smooth_proper : Prop; char_zero : Prop
  ss : CohomSpectralSequence
  degenerates_E1 : Prop

/-- The conjugate spectral sequence:
    E_2^{p,q} = H^p(X, Ω^q_X) for a complex manifold. -/
structure ConjugateHodgeSS where
  X : Type; complex_manifold : Prop
  ss : CohomSpectralSequence

/-- The Froelicher SS for a complex manifold:
    E_1^{p,q} = H^q(X, Ω^p) ⇒ H^{p+q}(X, C). -/
structure FroelicherSS where
  X : Type; complex_manifold : Prop
  E1 : String := "Dolbeault cohomology"
  degenerates_at_E1_for_Kaehler : Prop

/-- The de Rham-Witt SS: relates crystalline cohomology
    to de Rham-Witt complex. -/
structure DeRhamWittSS where
  X : Type; p : Nat; perfect_field : Prop
  ss : CohomSpectralSequence
  E1 : String := "W_n Ω^*_X"

/-- The Hochschild-Serre SS for group schemes. -/
structure HochschildSerre_Geometry where
  G : Type; N : Type; normal_subgroup : Prop; M : Type
  ss : CohomSpectralSequence

/-- The spectral sequence of a double cover: For a double cover
    p: Y → X, the Gysin sequence describes H^*(Y) in terms of H^*(X). -/
structure DoubleCoverSS where
  X Y : Type; double_cover : Prop
  Gysin : String := "→ H^k(Y) → H^k(X) → H^{k+1}(X) → H^{k+1}(Y) →"

/-- The Hochschild homology SS: For a smooth algebra A,
    HH_*(A) ≅ Ω^*_A (Hochschild-Kostant-Rosenberg). -/
structure HochschildKostantRosenbergSS where
  A : Type; smooth_algebra : Prop
  ss : CohomSpectralSequence
  HKR_isomorphism : String := "HH_n(A) ≅ Ω^n_A"

end MiniSpectralSequences