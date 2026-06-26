/-
# Cohomology Kernel: Known Cohomology Rings

Complete tables of Betti numbers and cohomology ring structures
for common topological spaces.

Knowledge coverage: L6 (Canonical Examples), L7 (Applications)
-/

import MiniCohomology.Core.CohomologyGroup

namespace MiniCohomology

/-- Helper: safe list access with default 0. -/
def listNatGet (xs : List Nat) (i : Nat) : Nat :=
  match xs with
  | [] => 0
  | x :: rest => if i == 0 then x else listNatGet rest (i-1)

/-! ## Spheres S^n -/

def sphereBetti (n : Nat) : List Nat :=
  match n with
  | 0 => [2]
  | 1 => [1, 1]
  | 2 => [1, 0, 1]
  | 3 => [1, 0, 0, 1]
  | 4 => [1, 0, 0, 0, 1]
  | 5 => [1, 0, 0, 0, 0, 1]
  | _ => []

def sphereCohomRing (n : Nat) : String :=
  if n == 0 then "Z2 + Z2"
  else s!"Z2[x]/(x^2), |x|={n}"

/-! ## Real Projective Spaces RP^n -/

def rpnBetti (n : Nat) : List Nat :=
  match n with
  | 0 => [1]
  | 1 => [1, 1]
  | 2 => [1, 1, 1]
  | 3 => [1, 1, 1, 1]
  | 4 => [1, 1, 1, 1, 1]
  | _ => []

def rpnCohomRing (n : Nat) : String :=
  if n == 1 then "Z2[x]/(x^2), |x|=1"
  else s!"Z2[x]/(x^{n+1}), |x|=1"

/-! ## Complex Projective Spaces CP^n -/

def cpnBetti (n : Nat) : List Nat :=
  match n with
  | 0 => [1]
  | 1 => [1, 0, 1]
  | 2 => [1, 0, 1, 0, 1]
  | 3 => [1, 0, 1, 0, 1, 0, 1]
  | _ => []

def cpnCohomRing (n : Nat) : String := s!"Z2[x]/(x^{n+1}), |x|=2"

/-! ## Tori T^n -/

def tnBetti (n : Nat) : List Nat :=
  match n with
  | 0 => [1]
  | 1 => [1, 1]
  | 2 => [1, 2, 1]
  | 3 => [1, 3, 3, 1]
  | 4 => [1, 4, 6, 4, 1]
  | _ => []

def tnCohomRing (n : Nat) : String := s!"Lambda_Z2[a_1,...,a_{n}], |a_i|=1"

/-! ## Lens Spaces -/

def lensSpaceBettiZ2 (p : Nat) (_q : Nat) : List Nat :=
  if p % 2 == 0 then [1, 1, 1, 1]
  else [1, 0, 0, 1]

/-! ## Kunneth Formula for Products -/

def kunnethBetti (bX bY : List Nat) (k : Nat) : Nat :=
  let nX := bX.length
  let nY := bY.length
  List.foldl (fun sum i =>
    let j := k - i
    if i < nX && j < nY then
      sum + listNatGet bX i * listNatGet bY j
    else sum
  ) 0 (List.range (k+1))

def productBetti (bX bY : List Nat) : List Nat :=
  let maxK := bX.length + bY.length - 2
  List.map (fun k => kunnethBetti bX bY k) (List.range (maxK+1))

/-! ## Product Space Examples -/

def s1xs1Betti : List Nat := productBetti [1, 1] [1, 1]
def s1xs2Betti : List Nat := productBetti [1, 1] [1, 0, 1]
def s2xs2Betti : List Nat := productBetti [1, 0, 1] [1, 0, 1]

/-! ## Surfaces -/

def surfaceBetti (g : Nat) : List Nat := [1, 2*g, 1]

def nonorientSurfaceBetti (g : Nat) : List Nat :=
  [1, g, if g % 2 == 0 then 1 else 0]

/-! ## Wedge Sums -/

def wedgeBetti (bX bY : List Nat) (k : Nat) : Nat :=
  if k == 0 then 1
  else listNatGet bX k + listNatGet bY k

/-! ## Suspension -/

def suspensionShift (bettiX : List Nat) (k : Nat) : Nat :=
  if k == 0 then 1
  else listNatGet bettiX (k-1)

/-! ## Connectivity -/

def isNConnected (betti : List Nat) (n : Nat) : Bool :=
  -- Check that all Betti numbers from 1 to n are 0
  -- A space is n-connected if it has trivial reduced cohomology up to degree n
  List.all (List.range (n+1)) (fun k =>
    if k == 0 then true
    else listNatGet betti k == 0
  )
where
  List.all (xs : List Nat) (p : Nat -> Bool) : Bool :=
    match xs with
    | [] => true
    | x :: rest => p x && List.all rest p

/-! ## Cohomology Table -/

def manifoldBettiTable : List (String × List Nat × String) :=
  [ ("S^1", sphereBetti 1, sphereCohomRing 1),
    ("S^2", sphereBetti 2, sphereCohomRing 2),
    ("S^3", sphereBetti 3, sphereCohomRing 3),
    ("S^4", sphereBetti 4, sphereCohomRing 4),
    ("T^2", tnBetti 2, tnCohomRing 2),
    ("T^3", tnBetti 3, tnCohomRing 3),
    ("RP^2", rpnBetti 2, rpnCohomRing 2),
    ("RP^3", rpnBetti 3, rpnCohomRing 3),
    ("CP^2", cpnBetti 2, cpnCohomRing 2),
    ("S^1 x S^1", s1xs1Betti, tnCohomRing 2),
    ("S^1 x S^2", s1xs2Betti, "Z2[a,b]/(a^2) |a|=1,|b|=2"),
    ("S^2 x S^2", s2xs2Betti, "Z2[a,b]/(a^3,b^3) |a|=|b|=2"),
    ("Sigma_2", surfaceBetti 2, "Lambda_Z2[a1,b1,a2,b2]"),
    ("N_2", nonorientSurfaceBetti 2, "Z2[a,b]/(a^2,b^2)")
  ]

end MiniCohomology
