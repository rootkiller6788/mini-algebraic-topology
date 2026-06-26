import MiniSpectralSequences
namespace MiniSpectralSequences

/-- A bicomplex with anticommuting differentials d_h d_v + d_v d_h = 0. -/
structure Bicomplex where
  C : Int → Int → BigradedAbGroup
  d_h : (p q : Int) → BigradedAbGroup.fiber (C p q) p q → BigradedAbGroup.fiber (C (p+1) q) (p+1) q
  d_v : (p q : Int) → BigradedAbGroup.fiber (C p q) p q → BigradedAbGroup.fiber (C p (q+1)) p (q+1)
  dh_sq : (p q : Int) → (x : BigradedAbGroup.fiber (C p q) p q) →
    d_h (p+1) q (d_h p q x) = BigradedAbGroup.zero (C (p+2) q) (p+2) q
  dv_sq : (p q : Int) → (x : BigradedAbGroup.fiber (C p q) p q) →
    d_v p (q+1) (d_v p q x) = BigradedAbGroup.zero (C p (q+2)) p (q+2)
  anticommute : (p q : Int) → True

/-- The total differential: D = d_h + (-1)^p d_v. -/
structure TotalDifferential where
  BC : Bicomplex
  D : (n : Int) → Type → Type
  sign_rule : String := "D = d_h + (-1)^p d_v on C^{p,q}"

/-- The first spectral sequence of a bicomplex:
    Filter by columns, E_1 = H_v(C), d_1 = d_h. -/
structure FirstSS_Bicomplex where
  BC : Bicomplex
  ss : CohomSpectralSequence
  E1 : String := "E_1^{p,q} = H_v^q(C^{p,*})"
  E2 : String := "E_2^{p,q} = H_h^p(H_v^q(C))"
  converges_to : String := "H^*(Tot C)"

/-- The second spectral sequence of a bicomplex:
    Filter by rows, E_1 = H_h(C), d_1 = d_v. -/
structure SecondSS_Bicomplex where
  BC : Bicomplex
  ss : CohomSpectralSequence
  E1 : String := "E_1^{p,q} = H_h^p(C^{*,q})"
  E2 : String := "E_2^{p,q} = H_v^q(H_h^p(C))"
  converges_to : String := "H^*(Tot C) (same abutment)"

/-- Both SS of a bicomplex converge to the same total cohomology,
    but give different filtrations on the abutment. -/
structure BicomplexComparison where
  first : FirstSS_Bicomplex
  second : SecondSS_Bicomplex
  same_E_inf : String := "E_∞^{p,q}(I) ≅ E_∞^{p,q}(II) as associated graded"

/-- The tensor product double complex of two cochain complexes:
    C^{p,q} = A^p ⊗ B^q, d_h = d_A ⊗ 1, d_v = (-1)^p 1 ⊗ d_B. -/
structure TensorProductBicomplex where
  A : Int → BigradedAbGroup; B : Int → BigradedAbGroup
  d_A : (n : Int) → BigradedAbGroup.fiber (A n) 0 n → BigradedAbGroup.fiber (A (n+1)) 0 (n+1)
  d_B : (n : Int) → BigradedAbGroup.fiber (B n) 0 n → BigradedAbGroup.fiber (B (n+1)) 0 (n+1)
  C : Int → Int → BigradedAbGroup

/-- The Hom double complex: C^{p,q} = Hom(A^{-q}, B^p). -/
structure HomBicomplex where
  A B : Int → BigradedAbGroup
  C : Int → Int → BigradedAbGroup

/-- A double complex is bounded if C^{p,q} = 0 for |p| or |q| large.
    Boundedness implies convergence of both spectral sequences. -/
structure BoundedBicomplex where
  BC : Bicomplex
  p_lower : Int; p_upper : Int
  q_lower : Int; q_upper : Int
  outside_zero : (p q : Int) → p < p_lower ∨ p > p_upper ∨ q < q_lower ∨ q > q_upper →
    BigradedAbGroup.fiber (BC.C p q) p q = BigradedAbGroup.fiber (BC.C p q) p q

/-- A double complex concentrated in the first quadrant:
    C^{p,q} = 0 unless p,q ≥ 0. Both SS converge. -/
structure FirstQuadrantBicomplex where
  BC : Bicomplex
  p_nonneg : (p q : Int) → p < 0 → True
  q_nonneg : (p q : Int) → q < 0 → True

/-- The spectral sequence of a double complex is multiplicative
    if the original double complex carries a compatible multiplication. -/
structure MultiplicativeBicomplex where
  BC : Bicomplex
  product : (p q p' q' : Int) → BigradedAbGroup.fiber (BC.C p q) p q →
    BigradedAbGroup.fiber (BC.C p' q') p' q' →
    BigradedAbGroup.fiber (BC.C (p+p') (q+q')) (p+p') (q+q')
  derivation_h : String := "d_h is a derivation"
  derivation_v : String := "d_v is a derivation (with signs)"

/-- The E_1 page of the bar spectral sequence:
    E_1^{p,q} = H^q(G, C^p(X)) ⇒ H^{p+q}(X/G). -/
structure BarSS where
  X : Type; G : Type; group_action : Prop
  ss : CohomSpectralSequence

/-- The E_1 page of the cobar spectral sequence:
    E_1^{p,q} = C^p(G, H^q(X)) ⇒ H^{p+q}(X_hG). -/
structure CobarSS where
  X : Type; G : Type; group_action : Prop
  ss : CohomSpectralSequence

/-- The Rham spectral sequence for a smooth map:
    E_1^{p,q} = Omega^p × H^q(fiber) ⇒ H^{p+q}(total). -/
structure DerhamSS where
  f : Type → Type; smooth : Prop
  ss : CohomSpectralSequence

end MiniSpectralSequences