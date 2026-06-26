import MiniSpectralSequences
namespace MiniSpectralSequences

structure BottPeriodicityTheorem where
  statement : String := "pi_{k+2}(U) cong pi_k(U) and pi_{k+8}(O) cong pi_k(O)"
  ss_method : String := "Serre SS for Omega U(n) to PU(n) to U(n)"

structure AdamsHopfInvariantOne where
  statement : String := "Hopf invariant one only for n=1,2,4,8"
  method : String := "Adams SS and secondary cohomology operations"
  proof_year : Nat := 1960

structure AdamsVectorFieldsOnSpheres where
  statement : String := "Max number of linearly independent vector fields on S^{n-1}"
  method : String := "Adams SS and K-theory"
  formula : String := "rho(n) - 1 where rho(n) = 2^c + 8d"

structure KervaireInvariantOne where
  statement : String := "Kervaire invariant one manifolds only in dimensions 2,6,14,30,62"
  method : String := "Equivariant slice spectral sequence"
  proof_year : Nat := 2009
  authors : String := "Hill, Hopkins, Ravenel"

structure NilpotenceTheoremApp where
  statement : String := "Nilpotence theorem via MU-based Adams SS"
  consequence1 : String := "Classifies thick subcategories"
  consequence2 : String := "Periodicity theorem"

structure PeriodicityTheoremApp where
  statement : String := "v_n-self maps exist for finite type n spectra"
  chromatic : String := "Organizes stable homotopy by height"

structure RavenelConjecturesAll where
  C_nilpotence : String := "Nilpotence theorem (proved)"
  C_periodicity : String := "Periodicity theorem (proved)"
  C_telescope : String := "Telescope conjecture (disproved for n>=2)"
  C_smashing : String := "Smashing conjecture (proved)"
  C_convergence : String := "Chromatic convergence theorem (proved)"

structure SegalConjecture where
  statement : String := "pi_*^S(BG_+) = A(G)^I for finite p-group G"
  method : String := "Equivariant stable homotopy and SS"
  proof_by : String := "Carlsson (1984)"

structure SullivanConjecture where
  statement : String := "Map_*(BG, X) is contractible for finite G and finite X"
  method : String := "Unstable Adams SS and Lannes' T-functor"
  proof_by : String := "Miller (1984), Lannes (1987)"

structure QuillenTheorem where
  statement : String := "MU_*(X) is the universal complex oriented cohomology theory"
  relation_to_SS : String := "AHSS for MU collapses for certain spaces"

structure ThomIsomorphismTheorem where
  statement : String := "H^*(E, E_0; R) cong H^*(B; R) via cup with Thom class"
  application : String := "Gysin sequence and Euler class"

structure AtiyahSingerIndexTheorem where
  statement : String := "Index(D) = integral A-hat(M) ch(E)"
  relation_to_SS : String := "SS in K-theory and cohomology relate to index"

structure NovikovConjecture where
  statement : String := "Higher signatures are oriented homotopy invariant"
  method : String := "Surgery theory and assembly map SS"

structure BaumConnesConjecture where
  statement : String := "Assembly map is an isomorphism for group C*-algebras"
  method : String := "KK-theory and spectral sequences"

structure FarrellJonesConjecture where
  statement : String := "Assembly map in algebraic K/L-theory is an isomorphism"
  method : String := "Controlled topology and SS"

structure QuillenLichtenbaum where
  statement : String := "K-theory and etale cohomology of schemes"
  method : String := "Lichtenbaum-Quillen spectral sequence"

structure MotivicAdamsSSNov where
  statement : String := "Computes motivic stable stems over a field"
  method : String := "Motivic Adams SS and realization to classical Adams SS"

structure EquivariantSliceSSApp where
  statement : String := "Computes equivariant stable stems"
  method : String := "C_2-equivariant slice SS for Kervaire invariant"

structure TmfAndStringOrientation where
  statement : String := "String orientations and the Witten genus factor through tmf"
  method : String := "SS in elliptic cohomology"

structure RedshiftDisproof where
  statement : String := "Telescope conjecture false for n>=2"
  method : String := "Chromatic SS and algebraic K-theory computations"
  reference : String := "Burklund-Hahn-Levy-Schlank (2023)"

structure ChromaticNullstellensatz where
  statement : String := "Classification of thick subcategories by Morava K-theories"
  method : String := "Nilpotence and periodicity theorems"

structure FiniteStableHomotopyCategory where
  description : String := "Thick subcategories = types 0,1,2,...,infinity"
  chromatic_filtration : String := "Filtered by K(n)-acyclicity"

end MiniSpectralSequences