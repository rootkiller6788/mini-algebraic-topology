import MiniSpectralSequences
namespace MiniSpectralSequences

structure SteenrodOperations where
  prime : Nat
  degree : Nat → Int
  Adem_relations : Bool

structure AdamsOperations where
  k : Nat
  psi_k : String := "Adams operation on K-theory"

def total_steenrod_square : String := "Sq = 1 + Sq^1 + Sq^2 + ..."

def cartan_formula : String := "Sq^n(xy) = sum_{i+j=n} Sq^i(x) Sq^j(y)"

structure BocksteinHomomorphism where
  p : Nat
  beta : String := "beta = boundary map for 0 to Z/p to Z/p^2 to Z/p to 0"

structure SteenrodReducedPowers where
  p : Nat; odd_prime : Prop
  degree : Int := 0
  Adem_relations : String := "P^a P^b = sum ... binomial coefficients"

structure NishidaRelations where
  description : String := "Sq^i composed with Q^j = ..."

structure KudoArakiTheorem where
  statement : String := "tau composed with Sq^i = Sq^i composed with tau"

structure MotivicSteenrodOps where
  field : Type
  operations : String := "Sq^{2i}: H^{p,q} to H^{p+2i, q+i}"
  tau : String := "tau: H^{p,q} to H^{p+1,q}"

structure DyerLashofOperations where
  p : Nat
  Q_i : String := "Q^i: H_k(X) to H_{2k+i}(X) (at p=2)"

structure KudoArakiDyerLashof where
  n : Nat; X : Type
  ss : CohomSpectralSequence

structure LambdaAlgebra where
  generators : String := "lambda_i, i >= -1"
  degree : String := "|lambda_i| = i"
  differential : String := "d(lambda_n) = sum_{i+j=n} lambda_i lambda_j"

structure CobarComplex where
  A : Type
  cobar : String := "C^*(A) = A tensor n with d_cobar"

structure BarSSExtended where
  A : Type
  ss : CohomSpectralSequence

end MiniSpectralSequences