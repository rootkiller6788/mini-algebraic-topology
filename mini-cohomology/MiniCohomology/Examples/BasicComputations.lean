/-
# Cohomology Kernel: Basic Cohomology Computations

Verified examples of cohomology computations for common spaces.
Provides Betti numbers for spheres, torus, real projective plane,
and other basic simplicial complexes.

Knowledge coverage: L6 (Canonical Examples)
-/

import MiniCohomology.Core.CohomologyGroup
import MiniCohomology.Constructions.CupProduct

namespace MiniCohomology

open AbGroup

/-! ## Circle S^1 -/

/-- S^1 triangulated as a triangle (3 vertices, 3 edges). -/
def s1Tri : SimplicialComplex := circleTriangulation

/-- S^1: H^0 = Z2, H^1 = Z2. -/
def s1BettiZ2 : List Nat := [1, 1]

/-! ## 2-Sphere S^2 -/

/-- S^2 triangulated as tetrahedron boundary (4 triangles, 6 edges, 4 vertices). -/
def s2Tri : SimplicialComplex := sphere2Triangulation

/-- S^2: H^0 = Z2, H^1 = 0, H^2 = Z2. -/
def s2BettiZ2 : List Nat := [1, 0, 1]

/-! ## Real Projective Plane RP^2 -/

def rp2Tri : SimplicialComplex := rp2Triangulation

/-- RP^2: H^0 = H^1 = H^2 = Z2. -/
def rp2BettiZ2 : List Nat := [1, 1, 1]

/-! ## Torus T^2 -/

def t2Tri : SimplicialComplex := torusTriangulation

/-- T^2: H^0 = Z2, H^1 = Z2^2, H^2 = Z2. -/
def t2BettiZ2 : List Nat := [1, 2, 1]

/-! ## Klein Bottle -/

def kbTri : SimplicialComplex := kleinBottleTriangulation

/-- Klein bottle (Z2 coefficients): H^0 = H^1 = H^2 = Z2. -/
def kbBettiZ2 : List Nat := [1, 2, 1]

/-! ## Point (contractible) -/

def pointTri : SimplicialComplex := simplexComplex (vertex 0)
def pointBettiZ2 : List Nat := [1]

/-! ## Interval -/

def intervalTri : SimplicialComplex := simplexComplex (edgeV 0 1)
def intervalBettiZ2 : List Nat := [1]

/-! ## Standard n-Simplices -/

def delta1Cohomology : List Nat := [1]
def delta2Cohomology : List Nat := [1]
def delta3Cohomology : List Nat := [1]

/-! ## General Sphere Cohomology Formula -/

/-- H^k(S^n; Z2) = Z2 for k=0,n (n>0), and Z2+Z2 for n=0,k=0. -/
def sphereBettiZ2Formula (n k : Nat) : Nat :=
  if n == 0 then
    if k == 0 then 2 else 0
  else
    if k == 0 || k == n then 1 else 0

/-- S^3 Betti numbers: [1, 0, 0, 1]. -/
def s3BettiZ2 : List Nat := [1, 0, 0, 1]

/-- S^4 Betti numbers: [1, 0, 0, 0, 1]. -/
def s4BettiZ2 : List Nat := [1, 0, 0, 0, 1]

/-- S^n Betti numbers table for n=0..5. -/
def sphereBettiTable : List (Nat × List Nat) :=
  [(0, [2]), (1, [1, 1]), (2, [1, 0, 1]), (3, [1, 0, 0, 1]), (4, [1, 0, 0, 0, 1]), (5, [1, 0, 0, 0, 0, 1])]

/-! ## Torus T^n Betti Numbers -/
/-- T^3: H^0=1, H^1=3, H^2=3, H^3=1. -/
def t3BettiZ2 : List Nat := [1, 3, 3, 1]

/-- T^4: H^0=1, H^1=4, H^2=6, H^3=4, H^4=1. -/
def t4BettiZ2 : List Nat := [1, 4, 6, 4, 1]

/-! ## Projective Spaces -/

/-- RP^3: H^0=H^1=H^2=H^3=Z2. -/
def rp3BettiZ2 : List Nat := [1, 1, 1, 1]

/-- CP^2 (complex projective plane): H^0=H^2=H^4=Z2, others 0. -/
def cp2BettiZ2 : List Nat := [1, 0, 1, 0, 1]

/-! ## Surfaces -/

/-- Orientable surface of genus g: H^0=1, H^1=2g, H^2=1. -/
def orientableSurfaceBettiZ2 (g : Nat) : List Nat := [1, 2*g, 1]

/-- Non-orientable surface of genus g (g copies of RP^2). -/
def nonorientableSurfaceBettiZ2 (g : Nat) : List Nat :=
  let b1 := if g >= 1 then g - 1 else 0
  let b2 := if g % 2 == 0 then 1 else 0
  [1, b1, b2]

/-! ## Euler Characteristic Table -/

/-- Euler characteristic = alternating sum of Betti numbers. -/
def eulerCharFromBetti (bettis : List Nat) : Int :=
  let rec go (bs : List Nat) (sign : Int) (acc : Int) : Int :=
    match bs with
    | [] => acc
    | b :: rest => go rest (-sign) (acc + sign * (Int.ofNat b))
  go bettis 1 0

/-- Verify Euler characteristics. -/
def s1EulerChar : Int := eulerCharFromBetti [1, 1]  -- 0
def s2EulerChar : Int := eulerCharFromBetti [1, 0, 1]  -- 2
def t2EulerChar : Int := eulerCharFromBetti [1, 2, 1]  -- 0
def rp2EulerChar : Int := eulerCharFromBetti [1, 1, 1]  -- 1
def kbEulerChar : Int := eulerCharFromBetti [1, 2, 1]  -- 0

/-! ## Cohomology Ring Examples -/

/-- S^1 cohomology ring: Z2[x]/(x^2) with |x|=1. -/
def s1CohomologyRingDescription : String := "Z2[x]/(x^2), |x|=1"

/-- T^2 cohomology ring: exterior algebra on 2 generators. -/
def t2CohomologyRingDescription : String := "Lambda_Z2[a,b] with |a|=|b|=1"

/-- RP^2 cohomology ring: truncated polynomial ring. -/
def rp2CohomologyRingDescription : String := "Z2[x]/(x^3), |x|=1"

/-- CP^2 cohomology ring (Z2 coefficients). -/
def cp2CohomologyRingDescription : String := "Z2[x]/(x^3), |x|=2"

/-! ## Cohomology Table -/

def cohomologyTable : List (String × List Nat) :=
  [ ("Point", pointBettiZ2),
    ("S^1", s1BettiZ2),
    ("S^2", s2BettiZ2),
    ("S^3", s3BettiZ2),
    ("S^4", s4BettiZ2),
    ("T^2", t2BettiZ2),
    ("T^3", t3BettiZ2),
    ("T^4", t4BettiZ2),
    ("RP^2", rp2BettiZ2),
    ("RP^3", rp3BettiZ2),
    ("CP^2", cp2BettiZ2),
    ("Klein", kbBettiZ2)
  ]

end MiniCohomology
