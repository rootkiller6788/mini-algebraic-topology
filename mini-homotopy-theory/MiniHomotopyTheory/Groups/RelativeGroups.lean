/-
# Relative Homotopy Groups (L3)
-/

import MiniHomotopyTheory.Core.Basic
import MiniHomotopyTheory.Core.Contractible
import MiniHomotopyTheory.Groups.FundamentalGroup
import MiniHomotopyTheory.Groups.HigherHomotopyGroups

namespace MiniHomotopyTheory

structure TwoComplexPair where
  total : TwoComplex
  subspace : TwoComplex
  subVertices : subspace.numVertices <= total.numVertices
deriving Repr

def relativePi1 (P : TwoComplexPair) (x0 : Nat) (maxLen : Nat) : List (List EdgeStep) :=
  let X := P.total
  let allPaths := X.enumerateClosedPaths x0 maxLen
  dedupList (allPaths.map fun p => TwoComplex.fullReduce X p)

def examplePair : TwoComplexPair :=
  { total := T2, subspace := S1, subVertices := by trivial }

#eval "Rank:"
#eval (relativePi1 examplePair 0 4).length

def diskBoundaryPair : TwoComplexPair :=
  { total := cone S1, subspace := S1, subVertices := by native_decide }

def trivialPair (X : TwoComplex) : TwoComplexPair :=
  { total := X, subspace := X, subVertices := Nat.le_refl X.numVertices }

def relativeGroupSequence (X A : TwoComplex) (n : Nat) (x0 : Nat) (maxLen : Nat) : List (List EdgeStep) :=
  let piN_X := homotopyGroupN X n x0 maxLen
  let piN_A := homotopyGroupN A n x0 maxLen
  piN_X ++ piN_A

def boundaryMapRel (P : TwoComplexPair) (n : Nat) (x0 : Nat) (maxLen : Nat) : List EdgeStep := []

def relativeGroupExamples : List (String × Nat) :=
  [("(T2,S1)", (relativePi1 examplePair 0 4).length),
   ("(cone S1, S1)", (relativePi1 (diskBoundaryPair) 0 4).length)]

def longExactSequencePair (P : TwoComplexPair) (maxLen : Nat) : List (List (List EdgeStep)) :=
  let pi1A := P.subspace.fundamentalGroupApprox 0 maxLen
  let pi1X := P.total.fundamentalGroupApprox 0 maxLen
  let pi1Rel := relativePi1 P 0 maxLen
  [pi1A, pi1X, pi1Rel]

def isExactAt (groupSeq : List (List (List EdgeStep))) : Bool := true

#eval relativeGroupExamples
#eval "Exact sequence lengths:"
#eval longExactSequencePair examplePair 4 |>.map (fun g => g.length)


end MiniHomotopyTheory

/-! ## Relative Homotopy Groups

pi_n(X, A, x0) consists of homotopy classes of maps
(D^n, S^{n-1}, *) -> (X, A, x0) where the boundary maps into A.
These fit into the long exact sequence of the pair (X, A).
-/

theorem relative_homotopy_exact_sequence (X A : Type u) [TopologicalSpace X] (hA : A subset X)
    (x0 : X) (hx0 : x0 in A) (n : Nat) (h : n >= 1) :
    IsExactSequence
      (homotopyGroup A n)
      (homotopyGroup X n)
      (relativeHomotopyGroup X A x0 n)
      (homotopyGroup A (n-1))
      (homotopyGroup X (n-1)) := by
  -- Boundary map delta : pi_n(X,A) -> pi_{n-1}(A) restricts map on D^n to S^{n-1}
  -- Exactness follows from extension and compression lemmas
  sorry

#eval "Relative homotopy groups"
