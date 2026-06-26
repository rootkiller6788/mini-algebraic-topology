import MiniSpectralSequences
namespace MiniSpectralSequences

structure StableStemsTable where
  p : Nat
  description : String := "Table of stable homotopy groups of spheres"

structure AlphaFamily where
  description : String := "alpha_t in pi_{t(p-1)-1}(S^0)_{(p)}"

structure BetaFamily where
  description : String := "beta_{t/j} in pi_* detected by ANSS at height 2"

structure GammaFamily where
  description : String := "gamma_t in pi_* at height 3"

structure DeltaFamily where
  description : String := "Higher chromatic families in stable stems"

structure EtaElement where
  description : String := "eta in pi_1 S^0 = Z/2"

structure NuElement where
  description : String := "nu in pi_3 S^0 = Z/24"

structure SigmaElement where
  description : String := "sigma in pi_7 S^0 = Z/240"

structure EpsilonElement where
  description : String := "epsilon in pi_8 S^0"

structure KappaElement where
  description : String := "kappa in pi_14 S^0"

structure MuElement where
  description : String := "mu in pi_9 S^0"

structure ZetaElement where
  description : String := "zeta in pi_11 S^0"

structure TodaBracket where
  a b c : String
  description : String := "Toda bracket <a,b,c>"

structure MasseyProduct where
  a b c : String
  description : String := "Massey product detects higher differentials"

structure EHPSequence where
  description : String := "EHP: pi_{n+k}(S^n) to pi_{n+k+1}(S^{n+1}) to ..."

structure FreudenthalSuspension where
  description : String := "Suspension isomorphism in the stable range"

structure JamesConstruction where
  description : String := "J(X) is homotopy equivalent to Omega Sigma X"

structure JamesHopfInvariant where
  description : String := "Hopf invariant via James construction"

structure HiltonMilnor where
  description : String := "Omega Sigma(X vee Y) as product of loop spaces"

structure SamelsonProduct where
  description : String := "Samelson product on homotopy of H-spaces"

structure WhiteheadProduct where
  description : String := "Whitehead product on homotopy groups"

structure BlakersMassey where
  description : String := "Blakers-Massey excision theorem"

structure HurewiczMap where
  description : String := "Hurewicz map from homotopy to homology"

structure SerreClass where
  description : String := "Serre class theory for homotopy groups"

structure C_theory where
  description : String := "Serre's mod-C theory for homotopy groups"

structure PostnikovTower where
  description : String := "Postnikov tower decomposition of a space"

structure WhiteheadTower where
  description : String := "Whitehead tower: n-connected cover"

structure MoorePostnikov where
  description : String := "Moore-Postnikov tower of a map"

structure RationalHomotopy where
  description : String := "Rational homotopy theory: Sullivan and Quillen models"

structure HomotopyOfSpheres where
  max_n : Nat := 20
  description : String := "Table of pi_{n+k}(S^n) for low n,k"

structure UnstableStems where
  description : String := "Unstable homotopy groups pi_{n+k}(S^n)"

structure MetastableRange where
  description : String := "Metastable homotopy groups of spheres"

structure KervaireMilnor where
  description : String := "Classification of exotic spheres"

structure KervaireInvariant where
  description : String := "Kervaire invariant of a framed manifold"

structure BrowderTheorem where
  description : String := "Kervaire invariant one only in dimensions 2^i - 2"

structure SurgeryTheory where
  description : String := "Surgery exact sequence and structure sets"

structure AssemblyMap where
  description : String := "Assembly map in algebraic K-theory"

structure WaldhausenKTheory where
  description : String := "Waldhausen's algebraic K-theory of spaces"

structure GoodwillieCalculus where
  description : String := "Goodwillie's calculus of homotopy functors"

structure ChromaticTower where
  description : String := "Chromatic tower of the sphere spectrum"

end MiniSpectralSequences