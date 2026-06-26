/-
# Basepoint Change and Dependence (L2)
-/

import MiniHomotopyTheory.Core.Basic
import MiniHomotopyTheory.Core.Paths
import MiniHomotopyTheory.Groups.FundamentalGroup

namespace MiniHomotopyTheory

def changeBasepoint {X : TwoComplex} {x0 x1 : Nat} (path : Path X x0 x1)
    (loopAtX0 : List EdgeStep) : List EdgeStep :=
  TwoComplex.fullReduce X (reverseEdgePath path.steps ++ loopAtX0 ++ path.steps)

def isBasepointIndependent (X : TwoComplex) (maxLen : Nat) : Bool :=
  if X.numVertices <= 1 then true
  else
    let groups := (List.range X.numVertices).map fun v =>
      (X.fundamentalGroupApprox v maxLen).length
    groups.all fun g => g == groups.head?.getD 0

#eval isBasepointIndependent S1 4
#eval isBasepointIndependent S2 4


end MiniHomotopyTheory

/-! ## Basepoint Independence

For a path-connected space X, pi_n(X, x0) = pi_n(X, x1) for any two
basepoints x0, x1. The isomorphism is given by conjugating with a
path from x0 to x1.
-/

theorem basepoint_isomorphism_path_connected (X : Type u) [TopologicalSpace X] [PathConnected X]
    (x0 x1 : X) (n : Nat) (h : n >= 1) :
    IsIsomorphic (HomotopyGroup X n x0) (HomotopyGroup X n x1) := by
  -- Pick a path gamma from x0 to x1
  -- Define isomorphism gamma_*: pi_n(X,x0) -> pi_n(X,x1) by
  -- [f] |-> [gamma concatenated with f concatenated with gamma^{-1}] at the basepoint level
  sorry

theorem basepoint_independent_for_abelian (X : Type u) [TopologicalSpace X] [PathConnected X] (n : Nat) (h : n >= 2) :
    IsCanonicallyIsomorphic (pi_n_X x0) (pi_n_X x1) := by
  -- pi_n is abelian for n>=2, so conjugation by a path is trivial
  -- Therefore the isomorphism is independent of the choice of path
  sorry

#eval "Basepoint independence"

#eval "Basepoint operations"
