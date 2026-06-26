import MiniSpectralSequences
namespace MiniSpectralSequences

structure GroebnerBasisSS where
  description : String := "Grobner bases for computing Ext modules"

structure MachineComputationSS where
  description : String := "Computer computation of SS via Curtis tables"

structure SymbolicSS where
  description : String := "Symbolic algebra for SS differentials"

structure PythonSS where
  description : String := "Python/Sage packages for SS computations"

structure LeanFormalization where
  description : String := "Formal verification of SS in Lean 4"

structure SpectralSequenceDatabase where
  description : String := "Database of known SS and their differentials"

structure AdamsChartGenerator where
  description : String := "Program to generate Adams E_2 charts"

structure ExtChart where
  p : Nat
  s_range : Nat
  t_range : Nat
  description : String := "Grid of Ext^{s,t} values"

structure BrunerExt where
  description : String := "Robert Bruner's Ext computations"

structure NassauChart where
  description : String := "Christian Nassau's Adams chart website"

structure KnightData where
  description : String := "Data on stable homotopy groups"

structure IsaksenWangXu where
  description : String := "IWX computations of stable stems"

structure KochmanMahowald where
  description : String := "Kochman and Mahowald's computations"

structure Tangora where
  description : String := "Martin Tangora's computations"

structure RavenelGreenBook where
  description : String := "Ravenel's Green Book: computations and theory"

structure Shimomura where
  description : String := "Katsumi Shimomura's ANSS computations"

structure RavenelOrangeBook where
  description : String := "Ravenel's Orange Book: nilpotence and periodicity"

structure HaynesMillerNotes where
  description : String := "Haynes Miller's notes on SS"

structure BoardmanPaper where
  description : String := "Boardman's conditionally convergent SS paper"

structure EilenbergMoorePaper where
  description : String := "Eilenberg-Moore SS original paper"

structure SerrePaper where
  description : String := "Serre's thesis: singular homology of fiber spaces"

structure AdamsPaper where
  description : String := "Adams: On the structure and applications of the Steenrod algebra"

structure AtiyahHirzebruchPaper where
  description : String := "Atiyah-Hirzebruch: Vector bundles and homogeneous spaces"

structure MayThesis where
  description : String := "Peter May's thesis: the May spectral sequence"

structure DelignePaper where
  description : String := "Deligne: Theoreme de Lefschetz et criteres de degenerescence"

end MiniSpectralSequences