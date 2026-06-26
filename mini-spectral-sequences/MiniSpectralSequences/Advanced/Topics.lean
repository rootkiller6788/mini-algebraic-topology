import MiniSpectralSequences
namespace MiniSpectralSequences

/-- The chromatic spectral sequence in stable homotopy:
    E_1^{n,*} = pi_* L_{K(n)} S^0 ⇒ pi_* S^0_{p}. -/
structure ChromaticSS where
  prime : Nat
  ss : CohomSpectralSequence
  E1_description : String := "E_1^{n,*} = pi_* L_{K(n)} S^0"
  convergence_to : String := "pi_* S^0_{(p)}"

/-- The chromatic tower: ... → L_2 X → L_1 X → L_0 X.
    Each layer is the K(n)-localization. -/
structure ChromaticTower where
  X : Type; p : Nat
  L_n : Nat → Type
  fiber_sequence : String := "M_n X → L_n X → L_{n-1} X"
  monochromatic_layer : String := "M_n X is K(n)-local"

/-- The Morava K-theory K(n) is a height n theory.
    K(n)_* = F_p[v_n, v_n^{-1}] with |v_n| = 2(p^n-1). -/
structure MoravaKTheory where
  p : Nat; n : Nat
  coefficient_ring : String := "K(n)_* = F_p[v_n^{±1}], |v_n| = 2(p^n-1)"
  formal_group_height : Nat := n

/-- The Adams-Novikov SS: E_2 = Ext_{BP_*BP}(BP_*, BP_*).
    Uses BP (Brown-Peterson) spectrum instead of HZ/p. -/
structure AdamsNovikovSS where
  prime : Nat
  ss : CohomSpectralSequence
  E2_description : String := "E_2 = Ext_{BP_*BP}(BP_*, BP_*)"
  sparseness : String := "E_2^{s,t} = 0 unless 2(p-1) divides t-s"

/-- The chromatic splitting conjecture:
    L_{K(n)} L_{K(n-1)} X splits in a specific way. -/
structure ChromaticSplitting where
  n : Nat; p : Nat; X : Type
  statement : String := "A conjecture about how K(n)-localizations interact"

/-- The Ravenel conjectures: A series of conjectures
    (now mostly theorems) about the chromatic filtration. -/
structure RavenelConjectures where
  nilpotence : String := "Nilpotence theorem (Devinatz-Hopkins-Smith)"
  periodicity : String := "Periodicity theorem (Hopkins-Smith)"
  telescope : String := "Telescope conjecture (partially open)"
  smashing : String := "Smashing conjecture (proved)"

/-- The telescope conjecture: The v_n-telescope T(n)
    is equivalent to the K(n)-localization L_{K(n)}.
    Known for n=0,1; open for n≥2. -/
structure TelescopeConjectureDetail where
  n : Nat
  known : String := "True for n=0 (rational) and n=1 (p-local K-theory)"
  open_for : String := "n ≥ 2"

/-- The redshift conjecture: K(n+1)-local K(n)-local sphere
    behaves like a v_{n+1}-periodic spectrum. -/
structure RedshiftConjectureDetail where
  n : Nat
  statement : String := "L_{K(n+1)} L_{K(n)} S ≅ v_{n+1}^{-1} ..."

/-- The Gross-Hopkins periodicity theorem:
    In the K(n)-local category, there is a periodicity element. -/
structure GrossHopkins where
  n : Nat; p : Nat
  periodicity : String := "v_n^{p^n-1}-self map on the sphere"

/-- The Devinatz-Hopkins-Smith nilpotence theorem:
    The only nilpotent elements in pi_* S^0 are torsion. -/
structure NilpotenceTheorem where
  statement : String := "Nilpotence theorem: torsion = nilpotent in MU_*"

/-- The thick subcategory theorem (Hopkins-Smith):
    Thick subcategories of the finite stable homotopy category
    correspond to subsets of primes. -/
structure ThickSubcategoryTheorem where
  statement : String := "Classification of thick subcategories by type n"

end MiniSpectralSequences