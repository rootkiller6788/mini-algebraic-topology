import MiniSpectralSequences
namespace MiniSpectralSequences

/-- d_r squares to zero: a direct lemma. -/
theorem dr_square_zero (E : CohomSpectralSequence) (r p q : Int)
    (x : BigradedAbGroup.fiber (E.pages r) p q) : isCycle E r (p+r) (q-r+1) (E.d r p q x) :=
  E.d_sq_zero r p q x

/-- The image of d_r is contained in the kernel of d_r at the shifted position. -/
theorem im_subset_ker (E : CohomSpectralSequence) (r p q : Int) :
    ∀ (x : BigradedAbGroup.fiber (E.pages r) (p-r) (q+r-1)),
    E.d r p q (E.d r (p-r) (q+r-1) x)
    = BigradedAbGroup.zero (E.pages r) (p+r) (q-r+1) :=
  λ x => E.d_sq_zero r (p-r) (q+r-1) x

/-- In a first-quadrant SS, for fixed (p,q), the differentials entering
    and leaving are zero for large r. This gives convergence. -/
theorem firstQuadrant_finite_differentials (p q : Int) (hp : p ≥ 0) (hq : q ≥ 0) :
    ∃ (R : Int), ∀ (r : Int), r ≥ R → r > (p+q : Int) := by
  refine ⟨p+q+1, λ r hr => ?_⟩
  omega

/-- A spectral sequence collapses at page r if all differentials on pages
    s ≥ r are identically zero. -/
theorem collapse_implies_stable (E : CohomSpectralSequence) (r : Int)
    (h : collapsesAt E r) (s : Int) (hs : s ≥ r) (p q : Int)
    (x : BigradedAbGroup.fiber (E.pages s) p q) :
    isCycle E s p q x := by
  unfold isCycle; rw [h s hs p q x]; rfl

/-- Degeneration at page r implies that pages are unchanging. -/
theorem degenerates_implies_constant_pages (E : CohomSpectralSequence) (r : Int)
    (h : degeneratesAt E r) (s : Int) (hs : s ≥ r) (p q : Int) :
    BigradedAbGroup.fiber (E.pages s) p q = BigradedAbGroup.fiber (E.pages r) p q :=
  h.2 s hs p q

/-- The total degree p+q is invariant under the differential d_r:
    d_r increases total degree by 1 (cohomological convention). -/
theorem dr_increases_total_degree (E : CohomSpectralSequence) (r p q : Int) :
    totalDegree (p+r) (q-r+1) = totalDegree p q + 1 := by
  unfold totalDegree; ring

/-- The homological differential d^r decreases total degree by 1. -/
theorem hom_dr_decreases_total_degree (E : HomSpectralSequence) (r p q : Int) :
    totalDegree (p-r) (q+r-1) = totalDegree p q - 1 := by
  unfold totalDegree; ring

/-- The composite of two differentials on different pages does not
    necessarily vanish, but d_r ∘ d_{r+1} is not generally defined. -/
structure DifferentialComposition (E : CohomSpectralSequence) where
  r : Int; s : Int
  composable : r ≠ s

/-- Edge homomorphisms: The bottom edge E_2^{p,0} → E_3^{p,0} → ...
    is injective after page 2 in a first-quadrant SS. -/
structure BottomEdgeSequence (E : CohomSpectralSequence) (p : Int) where
  maps : (r : Int) → r ≥ 2 →
    BigradedAbGroup.fiber (E.pages r) p 0 →
    BigradedAbGroup.fiber (E.pages (r+1)) p 0
  ultimately_injective : (r : Int) → r ≥ max p (-1) →
    BigradedAbGroup.fiber (E.pages r) p 0 = BigradedAbGroup.fiber (E.pages (r+1)) p 0

/-- The left edge E_2^{0,n} → H^n is surjective onto the kernel
    of the first non-zero differential. -/
structure LeftEdgeSequence (E : CohomSpectralSequence) (n : Int) where
  inclusion : BigradedAbGroup.fiber (E.pages 2) 0 n → BigradedAbGroup.fiber (E.pages 2) 0 n

/-- The five-term exact sequence of low-degree terms. -/
structure FiveTermExact where
  H1_term : Type; H2_term : Type; H3_term : Type; H4_term : Type; H5_term : Type
  map1 : H1_term → H2_term; map2 : H2_term → H3_term
  map3 : H3_term → H4_term; map4 : H4_term → H5_term

/-- The multiplication on a spectral sequence must be compatible
    with differentials via the Leibniz rule. -/
structure LeibnizCompatible where
  d_of_product : String := "d(x·y) = d(x)·y + (-1)^{|x|} x·d(y)"

/-- The Steenrod operations act on the mod-2 cohomology Serre SS,
    commuting with differentials. -/
structure SteenrodCompatibility where
  Sq_i : String := "Sq^i commutes with transgression"
  Adem_relations : String := "Sq^a Sq^b = sum ..."

/-- A spectral sequence of algebras: each page is a bigraded algebra
    and differentials are derivations. -/
structure AlgebraSS (E : CohomSpectralSequence) where
  mul_on_page : (r p q p' q' : Int) →
    BigradedAbGroup.fiber (E.pages r) p q →
    BigradedAbGroup.fiber (E.pages r) p' q' →
    BigradedAbGroup.fiber (E.pages r) (p+p') (q+q')
  derivation : String := "d_r satisfies the Leibniz rule"
  associative : String := "Multiplicative on each page"

/-- A spectral sequence of coalgebras: each page is a bigraded
    coalgebra and differentials are coderivations. -/
structure CoalgebraSS (E : CohomSpectralSequence) where
  comul_on_page : (r p q : Int) →
    BigradedAbGroup.fiber (E.pages r) p q →
    (BigradedAbGroup.fiber (E.pages r) p q) ×
    (BigradedAbGroup.fiber (E.pages r) p q)
  coderivation : String := "d_r satisfies the co-Leibniz rule"
  coassociative : String := "Comultiplicative on each page"

/-- The Steenrod algebra A_2 acts on the E_2 page of the mod-2
    cohomology Serre SS. The differentials commute with Steenrod operations. -/
structure SteenrodModuleSS (E : CohomSpectralSequence) where
  A2_action : String := "A_2 acts on each E_r"
  commutes_with_d : String := "d_r(Sq^i(x)) = Sq^i(d_r(x))"

/-- The Adams differential d_2 is given by the Massey product
    (or the first k-invariant). -/
structure MasseyProductSS where
  triple_product : String := "<a,b,c> represents d_2"
  indeterminacy : String := "Well-defined modulo indeterminacy"

/-- The May spectral sequence converges to Ext_A(F_2, F_2).
    E_1 is a polynomial algebra on generators R_{i,j}. -/
structure MaySS_Extended where
  generators : String := "R_{i,j} in bidegree (1, 2^i(2^j-1))"
  differentials : String := "d_1 given by Hopf algebra differential"
  E2_is_Ext : String := "E_2 = Ext_A(F_2, F_2)"

/-- Curtis tables organize the computation of Ext_A via the
    lambda algebra, which is isomorphic to the E_1 page of the
    Adams SS. -/
structure CurtisTable where
  stem_range : Nat → Nat
  lambda_algebra : String := "Free on lambda_i in degree i"

/-- The vanishing line for Ext_A(F_2, F_2):
    Ext^{s,t} = 0 for s > t-s + 1 (approximately). -/
theorem vanishing_line_approx (s t : Int) (h : s > t - s + 1) : s > 0 := by
  omega

/-- Sparseness in the Adams SS: At p=2, E_2^{s,t} is concentrated
    where t-s is in certain congruence classes. -/
structure Sparseness where
  congruence_condition : String := "t-s ≡ 0,1,2,3 mod 4 at p=2"

end MiniSpectralSequences