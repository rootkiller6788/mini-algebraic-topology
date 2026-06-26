import MiniSpectralSequences
namespace MiniSpectralSequences

structure EtaleCohomologySS where
  X : Type; scheme : Prop
  description : String := "Etale cohomology and spectral sequences"

structure LisseSheafSS where
  X : Type; l : Nat; prime : Prop
  description : String := "Weil II: weights and spectral sequences"

structure PerverseSheafSS where
  X : Type; middle_perversity : Prop
  description : String := "Perverse t-structure and spectral sequences"

structure BBDGDecomposition where
  X : Type; proper_map : Prop
  description : String := "Beilinson-Bernstein-Deligne-Gabber decomposition"

structure MotivicCohomologySS where
  X : Type; smooth_scheme : Prop
  description : String := "Motivic cohomology and weight SS"

structure BlochKatoSS where
  description : String := "Bloch-Kato conjecture and norm residue"

structure VoevodskyMotivic where
  description : String := "Voevodsky's motivic stable homotopy category"

structure MilnorKTheorySS where
  description : String := "Milnor K-theory and Galois cohomology"

structure GaloisCohomologySS where
  field : Type; absolute_galois : Prop
  description : String := "Galois cohomology spectral sequences"

structure ClassFieldTheorySS where
  field : Type
  description : String := "Class field theory and spectral sequences"

structure IwasawaTheorySS where
  field : Type; p : Nat
  description : String := "Iwasawa theory and spectral sequences"

structure ModularFormsSS where
  description : String := "Modular forms and Hecke algebras"

structure LanglandsProgramSS where
  description : String := "Langlands program and spectral sequences"

structure ShimuraVarietiesSS where
  description : String := "Shimura varieties and automorphic forms"

structure ArithmeticGeometrySS where
  description : String := "Arithmetic geometry and spectral sequences"

structure AnabelianGeometrySS where
  description : String := "Anabelian geometry: Grothendieck's program"

end MiniSpectralSequences