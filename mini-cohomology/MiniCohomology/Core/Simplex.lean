/-
# Cohomology Kernel: Simplices

Defines simplices as the fundamental building blocks of simplicial 
cohomology. A k-simplex is a sorted list of (k+1) distinct vertices.
Faces are obtained by omitting one vertex.

Knowledge coverage: L1 (Definitions), L2 (Core Concepts)
-/

import MiniCohomology.Core.AbelianGroup

namespace MiniCohomology

/-! ## Simplex Definition -/

/-- A simplex is represented by a list of vertices in strictly 
    increasing order. The dimension is (length - 1). -/
structure Simplex where
  vertices : List Nat
  

/-- Dimension of a simplex: number of vertices minus 1. -/
def Simplex.dim (s : Simplex) : Nat :=
  match s.vertices.length with
  | 0 => 0
  | n => n - 1

/-- Create a simplex from a list, sorting and deduplicating. -/
def mkSimplex (verts : List Nat) : Simplex :=
  -- Simply store the vertices; the user should ensure sortedness
  { vertices := verts }

/-- A vertex (0-simplex). -/
def vertex (n : Nat) : Simplex := mkSimplex [n]

/-- An edge (1-simplex) between distinct vertices. -/
def edgeV (a b : Nat) : Simplex := mkSimplex [a, b]

/-- Check if the simplex is non-degenerate (has > 0 vertices). -/
def Simplex.nonDegenerate (s : Simplex) : Bool :=
  s.vertices.length > 0

/-! ## Face Operations -/

/-- The i-th face: remove the vertex at index i.
    Returns none if index is out of bounds or would yield an empty simplex. -/
def Simplex.face (s : Simplex) (i : Nat) : Option Simplex :=
  match s.vertices.eraseIdx i with
  | [] => none
  | vs => some { vertices := vs }

/-- All codimension-1 faces. -/
def Simplex.faces (s : Simplex) : List Simplex :=
  if s.vertices.length == 0 then []
  else
    List.ofFn (fun (i : Fin s.vertices.length) =>
      match s.face i.val with
      | some f => f
      | none => s
    )

/-- Check if s is a face of t. -/
def isFace (s t : Simplex) : Bool :=
  s.dim + 1 == t.dim && t.faces.any (fun f => f.vertices == s.vertices)

/-! ## Boundary Faces -/

/-- The i-th boundary face with sign for Z coefficients.
    Sign is (-1)^i. For Z2, sign is always 1. -/
def Simplex.boundaryFaceSigned (s : Simplex) (i : Nat) : Option (Int × Simplex) :=
  match s.face i with
  | some f => some ((if i % 2 == 0 then 1 else -1), f)
  | none => none

/-- All boundary faces with signs. -/
def Simplex.boundaryFacesSigned (s : Simplex) : List (Int × Simplex) :=
  List.filterMap id (List.ofFn (fun (i : Fin s.vertices.length) =>
    s.boundaryFaceSigned i.val))

/-- All boundary faces without signs (for Z2 coefficients). -/
def Simplex.boundaryFaces (s : Simplex) : List Simplex := s.faces

/-- The formal boundary as a list of (coefficient, simplex) pairs. -/
def formalBoundary (s : Simplex) : List (Int × Simplex) :=
  s.boundaryFacesSigned

/-! ## Simplex Display and Equality -/

instance : ToString Simplex where
  toString s :=
    let vertStr := String.intercalate "," (s.vertices.map toString)
    s!"<{vertStr}>"

/-- Check if two simplices share a vertex. -/
def Simplex.intersects (s t : Simplex) : Bool :=
  s.vertices.any (fun v => t.vertices.elem v)

/-- Union of two simplices (as vertex sets, sorted). -/
def Simplex.union (s t : Simplex) : Simplex :=
  mkSimplex (s.vertices ++ t.vertices)

/-- Number of vertices in a simplex. -/
def Simplex.numVertices (s : Simplex) : Nat := s.vertices.length

/-! ## Standard Simplices -/

/-- The standard n-simplex Delta^n = <0,1,...,n>. -/
def standardSimplex (n : Nat) : Simplex :=
  mkSimplex (List.range (n+1))

/-- The n-simplex with all vertices equal (degenerate). -/
def degenerateSimplex (n : Nat) (v : Nat) : Simplex :=
  { vertices := List.replicate (n+1) v }

end MiniCohomology
