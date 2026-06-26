import MiniSpectralSequences
namespace MiniSpectralSequences

structure ChromaticRedshift where
  description : String := "K(n+1)-local K(n)-local sphere behavior"
  reference : String := "Burklund-Hahn-Levy-Schlank (2023)"

structure TelescopeDisproof where
  n : Nat
  result : String := "Telescope conjecture false for n=2 (2023)"
  authors : String := "Burklund, Hahn, Levy, Schlank"

structure EvenFiltration where
  description : String := "New filtration on stable homotopy by evenness"
  reference : String := "Pstragowski, Patchkoria"

structure SyntheticSpectra where
  description : String := "Yoneda embedding into sheaves on finite spectra"
  reference : String := "Pstragowski (2022)"

structure StratifiedHomotopy where
  description : String := "Stratified categories in homotopy theory"
  reference : String := "Ayala, Mazel-Gee, Rozenblyum"

structure EquivariantStableHomotopy where
  G : Type; finite_group : Prop
  description : String := "G-spectra and fixed point functors"

structure GlobalHomotopy where
  description : String := "Orthogonal spectra with all group actions"
  reference : String := "Schwede (2018)"

structure AbstractHomotopy where
  description : String := "Infinity-categories and spectral algebra"
  reference : String := "Lurie (HTT, HA, SAG)"

structure MotivicStableHomotopy where
  field : Type
  description : String := "A1-homotopy theory of schemes"
  reference : String := "Morel, Voevodsky"

structure EquivariantMotivic where
  G : Type; k : Type
  description : String := "G-equivariant motivic homotopy over k"

structure PrismaticCohomology where
  description : String := "Delta-rings and prisms"
  reference : String := "Bhatt-Scholze (2021)"

structure CondensedMathematics where
  description : String := "Condensed sets and abelian groups"
  reference : String := "Scholze (2019)"

structure AnalyticStacks where
  description : String := "Analytic geometry via condensed math"
  reference : String := "Clausen-Scholze"

structure SolidAbelianGroups where
  description : String := "Solid modules and 6-functor formalism"
  reference : String := "Scholze"

structure PyknoticSets where
  description : String := "Alternative to condensed sets"
  reference : String := "Barwick-Haine (2019)"

structure TopologicalCyclicHomology where
  description : String := "TC via cyclotomic spectra"
  reference : String := "Nikolaus-Scholze (2018)"

structure AlgebraicKTheory where
  description : String := "K-theory of rings and schemes"
  reference : String := "Quillen, Thomason, Blumberg-Gepner-Tabuada"

structure HermitianKTheory where
  description : String := "K-theory of forms and duality"
  reference : String := "Karoubi, Schlichting"

structure WittVectorSS where
  description : String := "de Rham-Witt complex and crystalline cohomology"
  reference : String := "Illusie, Bhatt-Lurie-Mathew"

structure PrismaticDieudonne where
  description : String := "Prismatic Dieudonne theory"
  reference : String := "Anschuetz-Le Bras"

structure FarguesFontaineCurve where
  description : String := "The fundamental curve of p-adic Hodge theory"
  reference : String := "Fargues-Fontaine"

structure IntegralPAdicHodge where
  description : String := "A_inf cohomology and Breuil-Kisin modules"
  reference : String := "Bhatt-Morrow-Scholze"

structure PAdicLanglands where
  description : String := "p-adic and mod-p Langlands program"
  reference : String := "Breuil, Colmez, Emerton"

structure GeometricLanglands where
  description : String := "Proof of the geometric Langlands conjecture"
  reference : String := "Gaitsgory et al. (2024)"

structure EllipticCohomology where
  description : String := "Tmf and elliptic genera"
  reference : String := "Goerss-Hopkins-Miller, Lurie"

structure TopologicalAutomorphicForms where
  description : String := "Higher real K-theories and automorphic forms"
  reference : String := "Behrens, Lawson"

structure ChromaticHomotopy where
  description : String := "Structure of the stable homotopy category"
  reference : String := "Hopkins, Ravenel"

structure ExoticSpheres where
  description : String := "Kervaire-Milnor classification of exotic spheres"
  reference : String := "Kervaire-Milnor (1963)"

structure HomotopyTypeTheory where
  description : String := "Synthetic homotopy theory in type theory"
  reference : String := "Univalent Foundations Program (2013)"

structure CubicalTypeTheory where
  description : String := "Cubical methods in HoTT"
  reference : String := "Cohen, Coquand, Huber, Moertberg"

structure DirectedHomotopy where
  description : String := "Directed type theory and (infinity,2)-categories"
  reference : String := "Riehl-Shulman, North"

structure FormalizationOfMath where
  description : String := "Formalization of algebraic topology in Lean"
  reference : String := "Various contributors"

end MiniSpectralSequences