import MiniSpectralSequences
namespace MiniSpectralSequences

structure CupProduct where
  space : Type
  cup : String := "cup: H^p(X) tensor H^q(X) to H^{p+q}(X)"

structure CapProduct where
  space : Type
  cap : String := "cap: H^p(X) tensor H_n(X) to H_{n-p}(X)"

structure SlantProduct where
  space : Type
  slant : String := "slant: H^p(X times Y) tensor H_q(Y) to H^{p-q}(X)"

structure CrossProduct where
  X Y : Type
  cross : String := "cross: H^p(X) tensor H^q(Y) to H^{p+q}(X times Y)"

structure KroneckerPairing where
  space : Type
  pairing : String := "pairing: H^p(X) tensor H_p(X) to Z"

structure EvaluationMap where
  space : Type
  ev : String := "ev: H^p(X) tensor H_p(X) to Z"

structure PoincareDuality where
  M : Type; closed_manifold : Prop; orientable : Prop; dim : Nat
  isomorphism : String := "H^k(M) cong H_{n-k}(M)"

structure AlexanderDuality where
  X : Type; subspace_of_sphere : Prop; n : Nat
  isomorphism : String := "H^k(X) cong H_{n-k-1}(S^n minus X)"

structure LefschetzDuality where
  M : Type; compact_manifold_with_boundary : Prop; dim : Nat
  isomorphism : String := "H^k(M) cong H_{n-k}(M, boundary M)"

structure UniversalCoefficientTheorem where
  C : Type; chain_complex : Prop; G : Type; abelian_group : Prop
  short_exact : String := "0 to Ext(H_{n-1}(C), G) to H^n(C; G) to Hom(H_n(C), G) to 0"

structure KunnethTheorem where
  X Y : Type; CW_complexes : Prop; R : Type; PID : Prop
  short_exact : String := "0 to sum H_p(X) tensor H_q(Y) to H_n(X times Y) to sum Tor(H_p(X), H_q(Y)) to 0"

structure EilenbergZilberTheorem where
  X Y : Type
  quasi_iso : String := "C_*(X) tensor C_*(Y) to C_*(X times Y) is a quasi-isomorphism"

structure AlexanderWhitneyMap where
  X Y : Type
  AW : String := "AW: C_*(X times Y) to C_*(X) tensor C_*(Y)"

structure ShihMap where
  X Y : Type
  shih : String := "Shih: C_*(X) tensor C_*(Y) to C_*(X times Y)"

structure CechCohomology where
  X : Type; cover : Type
  cech : String := "Cech cohomology with respect to an open cover"

structure DerivedFunctorCohomology where
  X : Type; sheaf : Type
  description : String := "Sheaf cohomology as derived functor of global sections"

structure DeRhamCohomology where
  M : Type; smooth_manifold : Prop
  de_rham : String := "H^*_{dR}(M) = ker(d) / im(d) on differential forms"

structure DolbeaultCohomology where
  M : Type; complex_manifold : Prop
  dolbeault : String := "H^{p,q}_{bar partial}(M)"

structure SingularCohomology where
  X : Type; topological_space : Prop
  singular : String := "H^*(X; G) = Hom(H_*(X), G)"

structure CellularCohomology where
  X : Type; CW_complex : Prop
  cellular : String := "Cochain complex from cellular chain complex"

structure SimplicialCohomology where
  K : Type; simplicial_complex : Prop
  simplicial : String := "Cohomology of a simplicial complex"

end MiniSpectralSequences