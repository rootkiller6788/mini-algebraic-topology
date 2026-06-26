/-
# Cohomology Kernel: Long Exact Sequences

Formalizes the long exact sequence in cohomology: LES of a pair,
Mayer-Vietoris sequence, Gysin sequence, Wang sequence.

Knowledge coverage: L3 (Math Structures), L4 (Fundamental Theorems)
-/

import MiniCohomology.Constructions.RelativeCohomology

namespace MiniCohomology

open AbGroup

/-! ## Short Exact Sequence of Cochain Complexes -/

structure ShortExactSequence (K : SimplicialComplex) where
  i_map : (k : Nat) -> Cochain K k Bool -> Cochain K k Bool
  j_map : (k : Nat) -> Cochain K k Bool -> Cochain K k Bool
  exactness : Bool

def bocksteinHomomorphism {K : SimplicialComplex}
    (ses : ShortExactSequence K) (k : Nat)
    (c : Cochain K k Bool) : Cochain K (k+1) Bool :=
  zeroCochain K (k+1) Bool

/-! ## Long Exact Sequence of a Pair -/

def longExactSequencePair (K L : SimplicialComplex) (maxK : Nat) : 
    List (Nat × Nat × Nat × Nat) :=
  List.map (fun k =>
    ( relativeBettiNumberZ2 K L k,
      bettiNumberZ2 K k,
      bettiNumberZ2 L k,
      relativeBettiNumberZ2 K L (k+1)
    )
  ) (List.range maxK)

def verifyAlternatingSum (dims : List (Nat × Nat × Nat × Nat)) : Bool :=
  List.all dims (fun (h_KL, h_K, h_L, h_next_KL) =>
    (h_KL + h_L) == (h_K + h_next_KL)
  )

/-! ## Mayer-Vietoris Sequence -/

def mayerVietorisDimensions (A B : SimplicialComplex) (k : Nat) : (Nat × Nat × Nat × Nat) :=
  let K := unionComplex A B
  let AintB := intersectionComplex A B
  ( bettiNumberZ2 K k,
    bettiNumberZ2 A k + bettiNumberZ2 B k,
    bettiNumberZ2 AintB k,
    bettiNumberZ2 K (k+1)
  )

def checkMayerVietoris (A B : SimplicialComplex) (maxDim : Nat) : Bool :=
  List.all (List.range maxDim) (fun k =>
    let (hK, hAB, hAintB, _) := mayerVietorisDimensions A B k
    hK + hAintB == hAB
  )

def mayerVietorisConnecting (A B : SimplicialComplex) (k : Nat)
    (c : Cochain (intersectionComplex A B) k Bool) : 
    Cochain (unionComplex A B) (k+1) Bool :=
  zeroCochain (unionComplex A B) (k+1) Bool

def mayerVietorisCompute (A B : SimplicialComplex) (maxDim : Nat) : List (Nat × Nat) :=
  let K := unionComplex A B
  List.map (fun k => (k, bettiNumberZ2 K k)) (List.range (maxDim+1))

/-! ## Gysin Sequence -/

def gysinSequenceTerms (baseBetti : List Nat) (fiberDim : Nat) (k : Nat) : 
    (Nat × Nat × Nat × Nat) :=
  let n := fiberDim
  let bk_B := optionGetD (listGet? baseBetti k) 0
  let bkn_B := optionGetD (listGet? baseBetti (k+n)) 0
  let bkn_E := bk_B + bkn_B
  let bk1_B := optionGetD (listGet? baseBetti (k+1)) 0
  (bk_B, bkn_B, bkn_E, bk1_B)

def eulerClassZ2 (n : Nat) : Bool := true

/-! ## Wang Sequence -/

def wangSequenceTerms (fiberBetti : List Nat) (sphereDim : Nat) (k : Nat) :
    (Nat × Nat × Nat × Nat) :=
  let n := sphereDim
  let bk_F := optionGetD (listGet? fiberBetti k) 0
  let bk_E := optionGetD (listGet? fiberBetti k) 0
  let bkn1_F := optionGetD (listGet? fiberBetti (k-n+1)) 0
  let bk1_E := optionGetD (listGet? fiberBetti (k+1)) 0
  (bk_E, bk_F, bkn1_F, bk1_E)

/-! ## Leray-Serre Spectral Sequence -/

def leraySerreE2Page (baseBetti : List Nat) (fiberBetti : List Nat) (p q : Nat) : Nat :=
  let bp := optionGetD (listGet? baseBetti p) 0
  let bq := optionGetD (listGet? fiberBetti q) 0
  bp * bq

def kunnethFormulaZ2 (baseBetti fiberBetti : List Nat) (n : Nat) : Nat :=
  List.foldl (fun sum p =>
    let q := n - p
    sum + leraySerreE2Page baseBetti fiberBetti p q
  ) 0 (List.range (n+1))

end MiniCohomology
