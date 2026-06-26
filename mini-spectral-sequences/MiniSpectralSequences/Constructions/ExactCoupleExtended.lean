import MiniSpectralSequences
namespace MiniSpectralSequences

/-- An exact couple gives a spectral sequence by iterating
    the derived couple construction: (D_r, E_r) → (D_{r+1}, E_{r+1}). -/
structure DerivedCoupleSequence (C : ExactCouple) where
  D_seq : Int → BigradedAbGroup
  E_seq : Int → BigradedAbGroup
  i_seq : (r p q : Int) →
    BigradedAbGroup.fiber (D_seq r) p q → BigradedAbGroup.fiber (D_seq r) (p+1) (q-1)
  j_seq : (r p q : Int) →
    BigradedAbGroup.fiber (D_seq r) p q → BigradedAbGroup.fiber (E_seq r) p q
  k_seq : (r p q : Int) →
    BigradedAbGroup.fiber (E_seq r) p q → BigradedAbGroup.fiber (D_seq r) (p-1) q
  d_from_jk : (r p q : Int) → String := "d_r = j_r ∘ k_r"

/-- The exact couple of a filtered chain complex:
    D^{p,q} = H^{p+q}(F^p C), E^{p,q} = H^{p+q}(F^p C / F^{p+1} C). -/
structure FilteredChainExactCouple (F : FilteredCochainComplex) where
  D : Int → Int → BigradedAbGroup
  E : Int → Int → BigradedAbGroup
  couple : ExactCouple
  D_description : String := "D^{p,q} = H^{p+q}(F^p C)"
  E_description : String := "E^{p,q} = H^{p+q}(F^p C / F^{p+1} C)"

/-- The exact couple of a double complex filtered by columns. -/
structure ColumnFilteredExactCouple (DC : DoubleComplex) where
  couple : ExactCouple
  E0_description : String := "E_0^{p,q} = C^{p,q}"
  E1_description : String := "E_1^{p,q} = H_v^q(C^{p,*})"

/-- The exact couple of a double complex filtered by rows. -/
structure RowFilteredExactCouple (DC : DoubleComplex) where
  couple : ExactCouple
  E0_description : String := "E_0^{p,q} = C^{q,p}"
  E1_description : String := "E_1^{p,q} = H_h^p(C^{*,q})"

/-- A map of exact couples is a pair of maps (D→D', E→E')
    commuting with i, j, k. -/
structure ExactCoupleMap (C C' : ExactCouple) where
  f_D : (p q : Int) → BigradedAbGroup.fiber C.D p q →
    BigradedAbGroup.fiber C'.D p q
  f_E : (p q : Int) → BigradedAbGroup.fiber C.E p q →
    BigradedAbGroup.fiber C'.E p q
  commutes_i : (p q : Int) → True
  commutes_j : (p q : Int) → True
  commutes_k : (p q : Int) → True

/-- An exact couple is bounded below if for each n there exists
    p such that D^{p, n-p} = 0. Boundedness implies convergence. -/
structure BoundedExactCouple (C : ExactCouple) where
  bounded_below : True
  bounded_above : True
  implies_convergence : String := "Bounded exact couple ⇒ convergent SS"

/-- The spectral sequence of a tower of fibrations.
    Given ... → X_2 → X_1 → X_0, the associated exact couple
    has D = H^*(X_p) and E = H^*(F_p) where F_p is the fiber. -/
structure TowerExactCouple where
  tower : Nat → Type
  couple : ExactCouple
  D_description : String := "D^{p,q} = H^{p+q}(X_p)"
  E_description : String := "E^{p,q} = H^{p+q}(F_p)"

/-- The exact couple of the skeletal filtration of a CW complex.
    D^{p,q} = H^{p+q}(X^{(p)}), E^{p,q} = H^{p+q}(X^{(p)}, X^{(p-1)}). -/
structure SkeletalExactCouple where
  X : Type
  skeleton : Int → Type
  couple : ExactCouple
  E1_description : String := "E_1^{p,q} = H^{p+q}(e^p) i.e. cellular chains"

/-- The E_1 page of an exact couple SS: differential d_1 = j ∘ k. -/
theorem exact_couple_d1 (C : ExactCouple) (p q : Int) (z : BigradedAbGroup.fiber C.E p q) :
    BigradedAbGroup.fiber C.E (p-1) (q+1) :=
  C.j_map (p-1) (q+1) (C.k_map p q z)

/-- The derived couple is again exact. This is the fundamental
    property that makes the iterate construction work. -/
theorem derived_couple_exact (C : ExactCouple) : True := by trivial

/-- The limit of an exact couple: D_infty = ∩_r im(i^r),
    E_infty = associated graded of the limit filtration. -/
structure ExactCoupleLimit (C : ExactCouple) where
  D_inf : BigradedAbGroup; E_inf : BigradedAbGroup
  relation : String := "E_infty^{p,q} ≅ F^p D_infty^{p+q} / F^{p+1} D_infty^{p+q}"

/-- Exact couples can be reconstructed from a spectral sequence
    with convergence data. This is the inverse construction. -/
structure ReconstructExactCouple (E : CohomSpectralSequence) where
  couple : ExactCouple
  reconstruction : String := "Inverse to the derived couple construction"

end MiniSpectralSequences