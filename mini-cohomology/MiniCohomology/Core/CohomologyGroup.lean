/-
# Cohomology Kernel: Cohomology Groups

Defines cohomology groups H^k(K; G) = ker delta_k / im delta_{k-1}
as the quotient of k-cocycles by k-coboundaries.

Provides matrix-based computation of Betti numbers for Z2 coefficients
using Gaussian elimination.

Knowledge coverage: L1 (Definitions), L2 (Core Concepts), L3 (Math Structures)
-/

import MiniCohomology.Core.Cochain

namespace MiniCohomology

open AbGroup

/-- Safe list access: returns none if index out of bounds. -/
def listGet? {α : Type} : List α → Nat → Option α
  | [], _ => none
  | x :: _, 0 => some x
  | _ :: xs, n+1 => listGet? xs n

/-- Safe option unwrapping with default. -/
def optionGetD {α : Type} : Option α → α → α
  | some x, _ => x
  | none, d => d

/-! ## Cohomology Group Definition -/

/-- The k-th cohomology group of K with coefficients in G.
    Represented by a cocycle representative. -/
structure CohomologyGroup (K : SimplicialComplex) (k : Nat) (G : Type) [AbGroup G] where
  representative : Cochain K k G
  isCocycle : Bool

/-- Trivial cohomology class (the zero class). -/
def zeroCohomologyClass (K : SimplicialComplex) (k : Nat) (G : Type) [AbGroup G] : 
    CohomologyGroup K k G where
  representative := zeroCochain K k G
  isCocycle := true

/-! ## Coboundary Matrix Construction -/

/-- Build the incidence matrix of delta_k: C^k -> C^{k+1} over Z2.
    Entry (i,j) = 1 iff the j-th k-simplex is a face of the i-th (k+1)-simplex.
    Rows = (k+1)-simplices, Columns = k-simplices. -/
def buildCoboundaryMatrixZ2 (K : SimplicialComplex) (k : Nat) : List (List Bool) :=
  let kSimplices := K.kSimplices k
  let kplus1Simplices := K.kSimplices (k+1)
  if kSimplices.length == 0 || kplus1Simplices.length == 0 then []
  else
    kplus1Simplices.map (fun sigma =>
      kSimplices.map (fun tau =>
        sigma.faces.any (fun face => face.vertices == tau.vertices)
      )
    )

/-! ## Matrix Operations over Z2 -/

/-- Swap two rows in a matrix. -/
def swapRows (mat : List (List Bool)) (i j : Nat) : List (List Bool) :=
  let ri := listGet? mat i
  let rj := listGet? mat j
  match ri, rj with
  | some rix, some rjx =>
    -- Replace row i with rjx, row j with rix
    mat.mapIdx (fun idx row =>
      if idx == i then rjx
      else if idx == j then rix
      else row)
  | _, _ => mat

/-- Find a pivot row (row with true at given column) starting from startRow. -/
def findPivot (mat : List (List Bool)) (startRow col : Nat) : Option Nat :=
  -- Simple linear search
  let rec go (idx : Nat) : Option Nat :=
    if idx >= mat.length then none
    else
      match listGet? mat idx with
      | some row =>
        match listGet? row col with
        | some true => some idx
        | _ => go (idx+1)
      | none => none
  go startRow

/-- XOR-add pivot row to target row (addition in Z2). -/
def xorRow (row pivot : List Bool) : List Bool :=
  match row, pivot with
  | [], _ => pivot
  | _, [] => row
  | r::rs, p::ps => (xor r p) :: xorRow rs ps

/-- Gaussian elimination over Z2, counting pivots (returns rank). -/
partial def gaussElimZ2 (mat : List (List Bool)) (row col : Nat) : Nat :=
  if row >= mat.length then 0
  else
    let ncols := if mat.length == 0 then 0 else
      let fr := optionGetD (listGet? mat 0) []
      fr.length
    if col >= ncols then 0
    else
      match findPivot mat row col with
      | none => gaussElimZ2 mat row (col+1)
      | some pRow =>
        let mat1 := swapRows mat row pRow
        let pivotRow := optionGetD (listGet? mat1 row) []
        let mat2 := mat1.mapIdx (fun i r =>
          if i == row then r
          else
            match listGet? r col with
            | some true => xorRow r pivotRow
            | _ => r
        )
        1 + gaussElimZ2 mat2 (row+1) (col+1)

/-- Compute rank of a matrix over Z2. -/
def matrixRankZ2 (matrix : List (List Bool)) : Nat :=
  if matrix.length == 0 then 0
  else
    let ncols := optionGetD (listGet? matrix 0) [] |>.length
    if ncols == 0 then 0
    else gaussElimZ2 matrix 0 0

/-! ## Betti Number Computation -/

/-- The k-th Betti number for Z2 coefficients:
    beta_k = dim(ker delta_k) - dim(im delta_{k-1})
          = n_k - rank(delta_k) - rank(delta_{k-1}) -/
def bettiNumberZ2 (K : SimplicialComplex) (k : Nat) : Nat :=
  let n_k := K.countK k
  let delta_k := buildCoboundaryMatrixZ2 K k
  let delta_km1 := buildCoboundaryMatrixZ2 K (k-1)
  let rk := matrixRankZ2 delta_k
  let rkm1 := matrixRankZ2 delta_km1
  if n_k >= rk + rkm1 then n_k - rk - rkm1 else 0

/-- dim(ker delta_k) = n_k - rank(delta_k). -/
def dimCocyclesZ2 (K : SimplicialComplex) (k : Nat) : Nat :=
  let n_k := K.countK k
  let delta_k := buildCoboundaryMatrixZ2 K k
  let rk := matrixRankZ2 delta_k
  if n_k >= rk then n_k - rk else 0

/-- dim(im delta_{k-1}) = rank(delta_{k-1}). -/
def dimCoboundariesZ2 (K : SimplicialComplex) (k : Nat) : Nat :=
  let delta_km1 := buildCoboundaryMatrixZ2 K (k-1)
  matrixRankZ2 delta_km1

/-- Compute all Betti numbers of a simplicial complex over Z2. -/
def allBettiNumbersZ2 (K : SimplicialComplex) : List Nat :=
  let maxDim := K.dim
  List.range (maxDim+1) |>.map (fun k => bettiNumberZ2 K k)

/-! ## Cohomology Ring -/

/-- The cohomology ring H^*(K; Z2) metadata. -/
structure CohomologyRing (K : SimplicialComplex) where
  bettiNumbers : List Nat

/-! ## Poincare Polynomial -/

/-- Format Betti numbers as a readable string. -/
def formatBettiNumbers (K : SimplicialComplex) : String :=
  let bettis := allBettiNumbersZ2 K
  let pairs := List.zip bettis (List.range bettis.length)
  String.intercalate ", " (pairs.map (fun (b, k) => s!"b_{k}={b}"))

/-! ## Cohomology Operations -/

/-- Cohomology of disjoint union: H^*(K disjointUnion L) ~= H^*(K) + H^*(L). -/
def cohomologyOfDisjointUnion (K L : SimplicialComplex) (k : Nat) : Nat :=
  bettiNumberZ2 K k + bettiNumberZ2 L k

/-- Cohomology of wedge sum for k > 0: H^k(K wedge L) ~= H^k(K) + H^k(L). -/
def cohomologyOfWedge (K L : SimplicialComplex) (k : Nat) : Nat :=
  if k == 0 then 1 else bettiNumberZ2 K k + bettiNumberZ2 L k

/-! ## Verifying Coboundary Lemma: delta^2 = 0 -/

/-- The fundamental cohomology lemma: delta o delta = 0.
    We verify this computationally by checking that for each
    concrete finite simplicial complex, the matrix product
    delta_{k+1} * delta_k = 0 over Z2.
    
    This is a key property ensuring that cohomology is well-defined. -/
def checkDeltaSquareZeroZ2 (K : SimplicialComplex) (k : Nat) : Bool :=
  let delta_k := buildCoboundaryMatrixZ2 K k
  let delta_kplus1 := buildCoboundaryMatrixZ2 K (k+1)
  -- Check that delta_{k+1} * delta_k = 0 as matrices
  -- For each row r of delta_kplus1 and each column c of delta_k:
  -- sum_j delta_kplus1[r][j] * delta_k[j][c] = 0 mod 2
  if delta_k.length == 0 || delta_kplus1.length == 0 then true
  else
    let n := optionGetD (listGet? delta_k 0) [] |>.length  -- columns of delta_k = rows of delta_kplus1
    let m := delta_kplus1.length  -- rows of delta_kplus1
    let p := optionGetD (listGet? delta_k 0) [] |>.length  -- columns
    -- For each output simplex (row of delta_kplus1) and each k-simplex (col of delta_k)
    List.range m |>.all (fun r =>
      List.range n |>.all (fun c =>
        -- Compute dot product of row r of delta_kplus1 with column c of delta_k
        let dot := List.range delta_k.length |>.foldl (fun acc j =>
          let a := optionGetD (listGet? (optionGetD (listGet? delta_kplus1 r) []) j) false
          let b := optionGetD (listGet? (optionGetD (listGet? delta_k j) []) c) false
          xor acc (a && b)
        ) false
        dot == false
      )
    )

/-! ## Computing Cohomology from Chain Complex Data -/

/-- Given the ranks of coboundary maps, compute all Betti numbers. -/
def bettiFromRanks (numSimplices : List Nat) (coboundaryRanks : List Nat) : List Nat :=
  match numSimplices, coboundaryRanks with
  | [], _ => []
  | _, [] => []
  | n0::ns, r0::rs =>
    let b0 := if n0 >= r0 then n0 - r0 else 0
    b0 :: aux ns (r0 :: rs)
where
  aux : List Nat -> List Nat -> List Nat
    | [], _ => []
    | [nk], [] => [nk]
    | [nk], [rk] => [if nk >= rk then nk - rk else 0]
    | nk::ns', rk::rnext::rs' =>
      let bk := if nk >= rk + rnext then nk - rk - rnext else 0
      bk :: aux ns' (rnext::rs')
    | _, _ => []

end MiniCohomology
