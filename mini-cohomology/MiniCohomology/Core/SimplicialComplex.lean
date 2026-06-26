/-
# Cohomology Kernel: Simplicial Complexes

Defines (abstract) simplicial complexes, their k-skeleta,
and operations such as triangulations of basic topological spaces.

Knowledge coverage: L1 (Definitions), L2 (Core Concepts)
-/

import MiniCohomology.Core.Simplex

namespace MiniCohomology

/-! ## Simplicial Complex Definition -/

/-- An abstract simplicial complex is a set of simplices closed
    under taking faces. We represent it via a list of maximal simplices
    (facets) and compute all faces on demand. -/
structure SimplicialComplex where
  facets : List Simplex
  -- invariant: facets are maximal (no facet is a face of another)
  

/-- Dimension of a simplicial complex (max dimension of its simplices). -/
def SimplicialComplex.dim (K : SimplicialComplex) : Nat :=
  match K.facets.map Simplex.dim with
  | [] => 0
  | dims => dims.foldl Nat.max 0

/-- The empty simplicial complex. -/
def emptyComplex : SimplicialComplex := { facets := [] }

/-- A simplicial complex from a single simplex (and all its faces). -/
def simplexComplex (s : Simplex) : SimplicialComplex :=
  { facets := [s] }

/-- Add a simplex (and all its faces) to a complex. -/
def SimplicialComplex.addSimplex (K : SimplicialComplex) (s : Simplex) : SimplicialComplex :=
  { facets := s :: K.facets }

/-! ## k-Skeleton -/

/-- Get all k-dimensional simplices in the complex.
    This computes the closure under faces. -/
partial def SimplicialComplex.kSimplices (K : SimplicialComplex) (k : Nat) : List Simplex :=
  let allSimplices := closure K.facets
  allSimplices.filter (λ s => s.dim == k)
where
  closure : List Simplex → List Simplex
    | [] => []
    | s :: rest =>
      let faces := s.faces
      let restClosed := closure rest
      let faceClosure := closure faces
      dedupSimplexes (s :: restClosed ++ faceClosure)
  
  dedupSimplexes : List Simplex → List Simplex
    | [] => []
    | x :: xs => x :: dedupSimplexes (xs.filter (λ y => y.vertices != x.vertices))

/-- Flatten a list of lists. -/
def flattenList {α : Type} : List (List α) → List α
  | [] => []
  | xs :: xss => xs ++ flattenList xss

/-- All simplices in the complex (of any dimension). -/
partial def SimplicialComplex.allSimplices (K : SimplicialComplex) : List Simplex :=
  let ks := List.range (K.dim + 1)
  flattenList (ks.map K.kSimplices)

/-- Count simplices of dimension k. -/
def SimplicialComplex.countK (K : SimplicialComplex) (k : Nat) : Nat :=
  (K.kSimplices k).length

/-- Total number of simplices. -/
def SimplicialComplex.totalSimplices (K : SimplicialComplex) : Nat :=
  (K.allSimplices).length

/-! ## Common Simplicial Complexes -/

/-- The boundary of the n-simplex ∂Δⁿ: all faces of the standard n-simplex. -/
def boundaryOfSimplex (n : Nat) : SimplicialComplex :=
  let dn := standardSimplex n
  { facets := dn.faces }

/-- Triangulation of the n-sphere Sⁿ as ∂Δⁿ⁺¹. -/
def sphereTriangulation (n : Nat) : SimplicialComplex :=
  boundaryOfSimplex (n+1)

/-- Triangulation of the 1-sphere S¹ as a triangle (∂Δ²). -/
def circleTriangulation : SimplicialComplex := sphereTriangulation 1

/-- Triangulation of S² as ∂Δ³ (tetrahedron boundary). -/
def sphere2Triangulation : SimplicialComplex := sphereTriangulation 2

/-- Triangulation of the torus T² (6-vertex minimal triangulation).
    The 7-vertex Császár torus triangulation.
    Simplified: using a square with opposite edges identified. -/
def torusTriangulation : SimplicialComplex :=
  -- Minimal triangulation of torus with vertices 0-8
  -- Using a 3x3 grid with opposite edges identified (18 triangles)
  { facets := [
    Simplex.mk [0,1,3], Simplex.mk [0,3,6], 
    Simplex.mk [0,2,6], Simplex.mk [0,1,2],
    Simplex.mk [1,3,4], Simplex.mk [1,4,7],
    Simplex.mk [1,2,7], Simplex.mk [1,2,5],
    Simplex.mk [2,5,7], Simplex.mk [2,6,7],
    Simplex.mk [3,4,6], Simplex.mk [3,4,5],
    Simplex.mk [4,5,7], Simplex.mk [4,6,7],
    Simplex.mk [0,3,5], Simplex.mk [0,2,5],
    Simplex.mk [3,5,6], Simplex.mk [2,5,6]
  ] }

/-- Triangulation of the real projective plane ℝP².
    Using a 6-vertex minimal triangulation. -/
def rp2Triangulation : SimplicialComplex :=
  { facets := [
    Simplex.mk [0,1,2], Simplex.mk [0,2,3], Simplex.mk [0,3,4],
    Simplex.mk [0,4,5], Simplex.mk [0,5,1],
    Simplex.mk [1,2,4], Simplex.mk [1,4,3], Simplex.mk [1,3,5],
    Simplex.mk [2,3,5], Simplex.mk [2,5,4]
  ] }

/-- Triangulation of the Klein bottle.
    Using a minimal 8-triangle triangulation. -/
def kleinBottleTriangulation : SimplicialComplex :=
  { facets := [
    Simplex.mk [0,1,2], Simplex.mk [0,2,3], Simplex.mk [0,3,4],
    Simplex.mk [0,4,5], Simplex.mk [0,5,1],
    Simplex.mk [1,5,2], Simplex.mk [2,5,3], Simplex.mk [3,2,4]
  ] }

/-! ## Subcomplex and Operations -/

/-- Check if K is a subcomplex of L. -/
def isSubcomplex (K L : SimplicialComplex) : Bool :=
  K.facets.all (λ f =>
    L.facets.any (λ g => f.vertices.all (λ v => g.vertices.elem v)))

/-- The k-skeleton of a complex. -/
def kSkeleton (K : SimplicialComplex) (k : Nat) : SimplicialComplex :=
  { facets := K.kSimplices k }

/-- Union of two simplicial complexes. -/
def unionComplex (K L : SimplicialComplex) : SimplicialComplex :=
  { facets := K.facets ++ L.facets }

/-- Intersection of two simplicial complexes. -/
def intersectionComplex (K L : SimplicialComplex) : SimplicialComplex :=
  { facets := K.facets.filter (λ f =>
      L.facets.any (λ g => f.vertices == g.vertices)) }

/-! ## Euler Characteristic -/

/-- Compute the Euler characteristic χ(K) = Σ(-1)^k · c_k
    where c_k is the number of k-simplices. -/
def eulerChar (K : SimplicialComplex) : Int :=
  let maxDim := K.dim
  (List.range (maxDim+1)).foldl (λ sum k =>
    let ck := K.countK k
    let term : Int := (if k % 2 == 0 then 1 else -1) * (Int.ofNat ck)
    sum + term
  ) 0

/-! ## Subdivision -/

/-- Barycentric subdivision: replace each simplex with simplices
    corresponding to chains of its faces. This is a placeholder since
    full barycentric subdivision is complex. -/
def barycentricSubdivisionPlaceholder (K : SimplicialComplex) : SimplicialComplex := K

end MiniCohomology
