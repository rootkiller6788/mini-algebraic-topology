import MiniSpectralSequences
namespace MiniSpectralSequences

/-- S^n cohomology: H^0 = Z, H^n = Z, all others 0. -/
def sphere_cohomology (n : Nat) : List (Int × String) :=
  [(0, "Z"), (n, "Z")]

/-- T^n = (S^1)^n cohomology: exterior algebra on n generators of degree 1. -/
def torus_cohomology (n : Nat) : String := s!"Lambda(x_1,...,x_{n}), |x_i|=1"

/-- CP^n cohomology: Z[c]/(c^{n+1}), |c|=2. -/
def cp_n_cohomology_desc (n : Nat) : String := s!"Z[c]/(c^{n+1}), |c|=2"

/-- HP^n cohomology: Z[y]/(y^{n+1}), |y|=4. -/
def hp_n_cohomology_desc (n : Nat) : String := s!"Z[y]/(y^{n+1}), |y|=4"

/-- RP^n mod 2 cohomology: F_2[w]/(w^{n+1}), |w|=1. -/
def rp_n_cohomology_mod2 (n : Nat) : String := s!"F_2[w]/(w^{n+1}), |w|=1"

/-- Lens space L^2_{p,q} cohomology: Z in degree 0, Z/p in degree 2. -/
def lens_space_cohomology (p : Nat) : List (Int × String) :=
  [(0, "Z"), (2, s!"Z/{p}")]

/-- Moore space M(Z/p, n) cohomology. -/
def moore_space_cohomology (p n : Nat) : List (Int × String) :=
  [(n, s!"Z/{p}"), (n+1, s!"Z/{p}")]

/-- Eilenberg-MacLane space K(Z, 2) cohomology: Z[c_1], |c_1|=2. -/
def K_Z_2_cohomology : String := "Z[c_1], |c_1|=2"

/-- K(Z/2, 1) = RP^∞ cohomology with F_2 coeffs: F_2[w_1], |w_1|=1. -/
def K_Z2_1_cohomology : String := "F_2[w_1], |w_1|=1"

/-- U(n) cohomology: Lambda(x_1, x_3, ..., x_{2n-1}). -/
def U_n_cohomology (n : Nat) : String := s!"Lambda(x_1, x_3, ..., x_{2n-1})"

/-- SU(n) cohomology: Lambda(x_3, x_5, ..., x_{2n-1}). -/
def SU_n_cohomology (n : Nat) : String := s!"Lambda(x_3, x_5, ..., x_{2n-1})"

/-- Sp(n) cohomology: Lambda(x_3, x_7, ..., x_{4n-1}). -/
def Sp_n_cohomology (n : Nat) : String := s!"Lambda(x_3, x_7, ..., x_{4n-1})"

/-- SO(n) mod 2 cohomology: F_2[w_2, ..., w_n]/(relations). -/
def SO_n_cohomology_mod2 (n : Nat) : String := s!"F_2[w_2,...,w_n]/(Sq^i relations)"

/-- BO(n) mod 2 cohomology: F_2[w_1,...,w_n], Stiefel-Whitney classes. -/
def BO_n_cohomology_mod2 (n : Nat) : String := s!"F_2[w_1,...,w_n], |w_k|=k"

/-- BU(n) cohomology: Z[c_1,...,c_n], Chern classes, |c_k|=2k. -/
def BU_n_cohomology (n : Nat) : String := s!"Z[c_1,...,c_n], |c_k|=2k"

/-- BSp(n) cohomology: Z[p_1,...,p_n], Pontryagin classes, |p_k|=4k. -/
def BSp_n_cohomology (n : Nat) : String := s!"Z[p_1,...,p_n], |p_k|=4k"

/-- ΩS^3 cohomology: Z[x_2], |x_2|=2 (polynomial algebra). -/
def OmegaS3_cohomology : String := "Z[x_2], |x_2|=2"

/-- Ω^2 S^3 cohomology: more complex, related to double loop spaces. -/
def Omega2S3_cohomology : String := "Z[x_1, x_2, ...] (divided powers)"

/-- H-space cohomology: Hopf algebras with commutative, associative products. -/
structure HSpaceCohomology where
  X : Type; h_space : Prop
  cohomology_ring : String
  hopf_algebra_structure : String := "comultiplication from H-space structure"

/-- The James construction J(X) on a connected space X:
    J(X) ≃ ΩΣX, and H^*(J(X)) is the tensor algebra on reduced H^*(X). -/
structure JamesConstruction where
  X : Type; connected : Prop
  J_X : Type
  cohomology : String := "H^*(J(X)) = T(H^*(X, *))"

/-- The Dold-Thom theorem: Symm^∞ X ≃ Π K(H_i(X), i). -/
structure DoldThom where
  X : Type
  infinite_symmetric_product : Type
  equivalence : String := "SP^∞ X ≃ Π_i K(H_i(X;Z), i)"

/-- Rational homotopy theory: The Quillen model of a simply-connected
    space is a differential graded Lie algebra. The Sullivan model
    is a commutative DGA. -/
structure RationalHomotopyTheory where
  X : Type; simply_connected : Prop
  Sullivan_model : String := "Commutative DGA model for X_Q"
  Quillen_model : String := "Differential graded Lie algebra model"

end MiniSpectralSequences