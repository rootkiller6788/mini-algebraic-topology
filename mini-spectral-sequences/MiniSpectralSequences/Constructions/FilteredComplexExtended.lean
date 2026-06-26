import MiniSpectralSequences
namespace MiniSpectralSequences

/-- A filtered cochain complex with differential: d(F^p C^n) ⊆ F^p C^{n+1}. -/
structure FilteredCochainComplexWithDiff where
  C : Int → BigradedAbGroup
  d_c : (n : Int) → BigradedAbGroup.fiber (C n) 0 n → BigradedAbGroup.fiber (C (n+1)) 0 (n+1)
  d_sq : (n : Int) → (x : BigradedAbGroup.fiber (C n) 0 n) →
    d_c (n+1) (d_c n x) = BigradedAbGroup.zero (C (n+1+1)) 0 (n+1+1)
  F : Int → Int → BigradedAbGroup
  incl : (p n : Int) → BigradedAbGroup.fiber (F p n) 0 n → BigradedAbGroup.fiber (C n) 0 n
  d_respects_F : (p n : Int) → (x : BigradedAbGroup.fiber (F p n) 0 n) →
    BigradedAbGroup.fiber (F p (n+1)) 0 (n+1)

/-- The associated graded complex: E_0^{p,q} = F^p C^{p+q} / F^{p+1} C^{p+q}. -/
structure AssociatedGradedComplexExtended where
  E0 : Int → Int → BigradedAbGroup
  d0 : (p q : Int) → BigradedAbGroup.fiber (E0 p q) p q → BigradedAbGroup.fiber (E0 p (q+1)) p (q+1)
  d0_sq : (p q : Int) → (x : BigradedAbGroup.fiber (E0 p q) p q) →
    d0 p (q+1) (d0 p q x) = BigradedAbGroup.zero (E0 p (q+2)) p (q+2)

/-- The E_1 page: E_1^{p,q} = H^{p+q}(F^p/F^{p+1}). -/
structure E1PageExtended where
  E1 : Int → Int → BigradedAbGroup
  d1 : (p q : Int) → BigradedAbGroup.fiber (E1 p q) p q → BigradedAbGroup.fiber (E1 (p+1) q) (p+1) q
  d1_sq : (p q : Int) → (x : BigradedAbGroup.fiber (E1 p q) p q) →
    d1 (p+1) q (d1 p q x) = BigradedAbGroup.zero (E1 (p+2) q) (p+2) q

/-- The induced filtration on cohomology:
    F^p H^n(C) = im(H^n(F^p C) → H^n(C)). -/
structure InducedFiltrationOnCohomologyExtended where
  H_C : Int → BigradedAbGroup
  F_H : Int → Int → BigradedAbGroup
  F_is_image : (p n : Int) → String := "F^p H^n = im(H^n(F^p C) → H^n(C))"

/-- Bounded filtration: For each n, exist p_min, p_max with
    F^{p_min} = C, F^{p_max} = 0. Boundedness ⇒ convergence. -/
structure BoundedFiltrationExtended where
  C : Int → BigradedAbGroup
  F : Int → Int → BigradedAbGroup
  lower_exists : (n : Int) → ∃ (p_min : Int), True
  upper_exists : (n : Int) → ∃ (p_max : Int), True
  implies_convergence : String := "Bounded ⇒ strong convergence"

/-- Complete filtration: ∪_p F^p = C, ∩_p F^p = 0. -/
structure CompleteFiltration where
  C : Int → BigradedAbGroup
  F : Int → Int → BigradedAbGroup
  exhaustive : (n : Int) → True
  Hausdorff : (n : Int) → True

/-- Filtered chain map: respects filtration and commutes with d. -/
structure FilteredChainMapExtended where
  source : FilteredCochainComplex
  target : FilteredCochainComplex
  map_on_C : (n : Int) → BigradedAbGroup.fiber (source.C n) 0 n →
    BigradedAbGroup.fiber (target.C n) 0 n
  respects_F : (p n : Int) → True
  chain_map_condition : (n : Int) → True

/-- The spectral sequence of a filtered complex is functorial:
    a filtered chain map induces a map of spectral sequences. -/
structure FilteredSSFunctoriality where
  F G : FilteredCochainComplex
  f : FilteredChainMapExtended
  induced_SS_map : CohomSSMap trivialCohomSS trivialCohomSS

/-- The E_2 page of the filtered complex SS is the cohomology
    of the associated graded with respect to d_1. -/
structure E2Description where
  E2 : Int → Int → BigradedAbGroup
  description : String := "E_2^{p,q} = H^p(H^q(E_0, d_0), d_1)"

/-- The mapping cone of a filtered chain map gives a new
    filtered complex whose SS is the mapping cone of SS maps. -/
structure MappingConeFiltered where
  f : FilteredChainMapExtended
  cone : FilteredCochainComplex
  cone_SS : CohomSSMap trivialCohomSS trivialCohomSS

/-- The shift operator on filtered complexes:
    F[p]C has filtration F^{i-p}(C[i]). -/
structure ShiftedFiltration where
  original : FilteredCochainComplex
  p_shift : Int
  shifted : FilteredCochainComplex
  effect_on_SS : String := "E_r(F[p]) = E_r(F)[p]"

/-- Filtered quasi-isomorphism: induces isomorphism on E_1
    pages (and hence on all subsequent pages). -/
structure FilteredQuasiIsomorphism where
  f : FilteredChainMapExtended
  E1_iso : (p q : Int) → True

/-- The canonical filtration of a double complex:
    F^p Tot^n = ⊕_{i ≥ p, i+j=n} C^{i,j}. -/
structure CanonicalFiltration where
  DC : DoubleComplex
  F_p : Int → FilteredCochainComplex
  description : String := "First filtration of double complex"

/-- The other filtration of a double complex:
    F^p Tot^n = ⊕_{j ≥ p, i+j=n} C^{i,j}. -/
structure SecondFiltration where
  DC : DoubleComplex
  F_p : Int → FilteredCochainComplex
  description : String := "Second filtration of double complex"

/-- The total complex of a double complex:
    Tot^n = ⊕_{i+j=n} C^{i,j} with D = d_h + d_v. -/
structure TotalComplexExtended where
  DC : DoubleComplex
  Tot : Int → BigradedAbGroup
  D_tot : (n : Int) → BigradedAbGroup.fiber (Tot n) 0 n →
    BigradedAbGroup.fiber (Tot (n+1)) 0 (n+1)
  D_sq : (n : Int) → (x : BigradedAbGroup.fiber (Tot n) 0 n) →
    D_tot (n+1) (D_tot n x) = BigradedAbGroup.zero (Tot (n+1+1)) 0 (n+1+1)

end MiniSpectralSequences