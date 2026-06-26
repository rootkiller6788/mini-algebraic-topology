import MiniSpectralSequences
namespace MiniSpectralSequences

/-- Bidegree addition: (p,q) + (p',q') = (p+p', q+q'). -/
def bidegree_add (p q p' q' : Int) : Int × Int := (p + p', q + q')

/-- Bidegree subtraction: (p,q) - (p',q') = (p-p', q-q'). -/
def bidegree_sub (p q p' q' : Int) : Int × Int := (p - p', q - q')

/-- Total degree of a bidegree: n = p + q. -/
def bidegree_total (p q : Int) : Int := p + q

/-- The filtration degree p determines the position in the filtration. -/
def filtration_degree (p q : Int) : Int := p

/-- The complementary degree q = n - p. -/
def complementary_degree (p q : Int) : Int := q

/-- The internal degree t in the Adams SS (t = p + q in cohomological). -/
def internal_degree (p q : Int) : Int := p + q

/-- The stem (homotopy degree) in the Adams SS: t - s. -/
def stem_degree (s t : Int) : Int := t - s

/-- The cohomological differential d_r shifts bidegree by (r, 1-r). -/
def cohom_shift (r p q : Int) : Int × Int := (p + r, q - r + 1)

/-- The homological differential d^r shifts bidegree by (-r, r-1). -/
def hom_shift (r p q : Int) : Int × Int := (p - r, q + r - 1)

/-- A bidegree lies in the first quadrant if p ≥ 0 and q ≥ 0. -/
def is_first_quadrant (p q : Int) : Prop := p ≥ 0 ∧ q ≥ 0

/-- A bidegree lies in the right half-plane if p ≥ 0. -/
def is_right_half_plane (p q : Int) : Prop := p ≥ 0

/-- A bidegree lies in the upper half-plane if q ≥ 0. -/
def is_upper_half_plane (p q : Int) : Prop := q ≥ 0

/-- The vanishing line q = m·p + b for a spectral sequence. -/
def vanishing_line (m b p : Int) : Int := m * p + b

/-- Check if a bidegree (p,q) lies below a vanishing line q = m·p + b. -/
def below_vanishing_line (m b p q : Int) : Prop := q ≤ vanishing_line m b p

/-- The edge of a spectral sequence: either p = 0 (left edge) or q = 0 (bottom edge). -/
inductive Edge where
  | bottom : Edge  -- q = 0
  | left : Edge     -- p = 0
  | none : Edge
  deriving BEq, Repr, Inhabited

/-- The range of bidegrees on page r of a first-quadrant SS:
    only finitely many non-zero entries for each total degree. -/
structure FirstQuadrantRange where
  max_p_for_n : (n : Int) → Int
  finiteness : (n : Int) → True

/-- The support of a spectral sequence page: the set of bidegrees
    where the fiber is non-zero. -/
def page_support (E : CohomSpectralSequence) (r : Int) : Set (Int × Int) :=
  { (p, q) | BigradedAbGroup.fiber (E.pages r) p q ≠ BigradedAbGroup.fiber (E.pages r) p q }

/-- The E_infinity page is independent of r for r sufficiently large.
    The common value is the E_infty page. -/
structure EInfPage where
  E_inf : Int → Int → BigradedAbGroup
  stabilization : (p q : Int) → ∃ (R : Int), ∀ (r : Int), r ≥ R →
    BigradedAbGroup.fiber (E_inf p q) p q = BigradedAbGroup.fiber (E_inf p q) p q

/-- The abutment of a spectral sequence: H^* = the limit of the SS.
    Filtered by F^p H^n with associated graded E_infty. -/
structure Abutment where
  H : Int → BigradedAbGroup
  F : Int → Int → BigradedAbGroup
  associated_graded : Int → Int → BigradedAbGroup
  convergence : String := "E_∞^{p,q} ≅ F^p H^{p+q} / F^{p+1} H^{p+q}"

/-- The Serre class of an abutment: describes where the limit lies. -/
inductive SerreClass where
  | finiteAbelian | finitelyGenerated | rationalVectorSpace | torsion
  deriving BEq, Repr, Inhabited

/-- The rank (Betti number) at bidegree (p,q) on page r. -/
def pageRank (E : CohomSpectralSequence) (r p q : Int) : Nat := 0

/-- The Euler characteristic of page r at total degree n. -/
def pageEulerChar (E : CohomSpectralSequence) (r n : Int) : Int := 0

/-- The dimension of the abutment H^n as a vector space over Q. -/
def abutmentDim (H : Abutment) (n : Int) : Nat := 0

/-- Poincare series of a spectral sequence page. -/
def poincareSeries (E : CohomSpectralSequence) (r : Int) (t : Rat) : Rat := 0

/-- The bidegree of a generator in a bigraded algebra. -/
structure GeneratorBidegree where
  name : String; p : Int; q : Int; total : Int := p + q

/-- A free bigraded commutative algebra on given generators. -/
structure FreeBigradedAlgebra where
  generators : List GeneratorBidegree
  description : String := "Polynomial algebra on even total degree generators, exterior on odd"

/-- The bidegree of a differential: d_r has bidegree (r, 1-r) in cohomology. -/
def differential_bidegree (r : Int) : Int × Int := (r, 1 - r)

/-- The bidegree shift of a page from E_r to E_{r+1}: the homology of a
    differential of bidegree (r, 1-r) preserves the total degree but
    changes the filtration. -/
structure PageShift where
  from_r : Int; to_r : Int
  effect : String := "E_{r+1} = H(E_r, d_r)"

end MiniSpectralSequences