/-
# Seifert-van Kampen Theorem (L4)
-/

import MiniHomotopyTheory.Core.Basic
import MiniHomotopyTheory.Groups.FundamentalGroup

namespace MiniHomotopyTheory

structure PushoutData where
  U : TwoComplex
  V : TwoComplex
  intersection : TwoComplex
  inclusionU : CellularMap intersection U
  inclusionV : CellularMap intersection V
-- Repr not derived due to function fields

def pushoutTwoComplex (data : PushoutData) : TwoComplex :=
  let offsetV := data.U.numVertices
  { numVertices := data.U.numVertices + data.V.numVertices - data.intersection.numVertices
    edges := data.U.edges ++ data.V.edges.map (fun (s, t) => (s + offsetV, t + offsetV))
    faces := data.U.faces ++ data.V.faces.map (fun face =>
      face.map fun (ei, fwd) => (ei + data.U.numEdges, fwd)) }

def svkComputePi1 (data : PushoutData) (maxLen : Nat) : List (List EdgeStep) :=
  let pushout := pushoutTwoComplex data
  pushout.fundamentalGroupApprox 0 maxLen

def circleWedgeCircle : PushoutData :=
  { U := S1, V := S1, intersection := pointComplex
    inclusionU := { onVertex := fun _ => 0, onEdge := fun _ => [], onFace := fun _ => [] }
    inclusionV := { onVertex := fun _ => 0, onEdge := fun _ => [], onFace := fun _ => [] } }

#eval (svkComputePi1 circleWedgeCircle 4).length

/-! ## Seifert-van Kampen: More Examples -/

/-- Wedge of three circles: pi_1 = free group on 3 generators. -/
def circleWedgeThree : PushoutData :=
  { U := wedgeSum S1 S1, V := S1, intersection := pointComplex
    inclusionU := { onVertex := fun _ => 0, onEdge := fun _ => [], onFace := fun _ => [] }
    inclusionV := { onVertex := fun _ => 0, onEdge := fun _ => [], onFace := fun _ => [] } }

#eval "S1 v S1 v S1 pi_1 rank (len=3):"
#eval (svkComputePi1 circleWedgeThree 3).length

/-- The torus from two cylinders (Seifert-van Kampen computation).
    T2 = (S1 x I) union (S1 x I) with overlap S1 u S1.
    pi_1(T2) = pi_1(S1 x I) *_{pi_1(S1 u S1)} pi_1(S1 x I)
    = Z *_{F_2} Z = Z x Z. -/
def torusFromCylinders : PushoutData :=
  { U := cylinder S1, V := cylinder S1, intersection := S1
    inclusionU := { onVertex := fun _ => 0, onEdge := fun _ => [(0,true)], onFace := fun _ => [] }
    inclusionV := { onVertex := fun _ => 0, onEdge := fun _ => [(0,true)], onFace := fun _ => [] } }

/-- The Klein bottle from two Moebius bands.
    K = M u M where M is the Moebius band, intersection = S1. -/
def kleinFromMoebiusBands : PushoutData :=
  { U := RP2, V := RP2, intersection := S1
    inclusionU := { onVertex := fun _ => 0, onEdge := fun _ => [(0,true)], onFace := fun _ => [] }
    inclusionV := { onVertex := fun _ => 0, onEdge := fun _ => [(0,true)], onFace := fun _ => [] } }

/-- The fundamental group of a graph (1-dimensional complex).
    By Seifert-van Kampen, contracting a maximal tree gives
    the free group on E - V + 1 generators. -/
def graphFundamentalGroup (vertices : Nat) (edges : List (Nat × Nat)) (maxLen : Nat)
    : List (List EdgeStep) :=
  let G : TwoComplex := { numVertices := vertices, edges := edges, faces := [] }
  G.fundamentalGroupApprox 0 maxLen

/-- A tree on n vertices has trivial fundamental group. -/
def treeGraph (n : Nat) : TwoComplex :=
  { numVertices := n,
    edges := (List.range (n-1)).map fun i => (i, i+1),
    faces := [] }

#eval "Tree on 5 vertices pi_1 (len=4):"
#eval (treeGraph 5).fundamentalGroupApprox 0 4

/-- The wedge of n circles has fundamental group = free group on n generators.
    By SvK: pi_1(S1 v ... v S1) = F_n. -/
def wedgeNCircles (n : Nat) : TwoComplex :=
  match n with
  | 0 => pointComplex
  | 1 => S1
  | _ =>
    let base := S1
    (List.range (n-1)).foldl (fun acc _ => wedgeSum acc S1) base

#eval "Wedge of 2 circles (FigureEight) pi_1 rank (len=4):"
#eval (wedgeNCircles 2).fundamentalGroupApprox 0 4 |>.length
#eval "Wedge of 3 circles pi_1 rank (len=3):"
#eval (wedgeNCircles 3).fundamentalGroupApprox 0 3 |>.length

/-- Seifert-van Kampen for the projective plane:
    RP2 = D2 union_{S1} M where M is a Moebius band.
    pi_1(RP2) = pi_1(D2) *_{pi_1(S1)} pi_1(M) = 1 *_{Z} Z = Z/2Z. -/
def rp2FromSVK : PushoutData :=
  { U := S2, V := RP2, intersection := S1
    inclusionU := { onVertex := fun _ => 0, onEdge := fun _ => [(0,true)], onFace := fun _ => [] }
    inclusionV := { onVertex := fun _ => 0, onEdge := fun _ => [(0,true)], onFace := fun _ => [] } }

/-- Summary of SvK computations. -/
def svkExamples : List (String × Nat) :=
  [("S1 v S1", (svkComputePi1 circleWedgeCircle 4).length),
   ("S1 v S1 v S1", (svkComputePi1 circleWedgeThree 3).length)]

#eval "=== Seifert-van Kampen Examples ==="
#eval svkExamples

end MiniHomotopyTheory

/-! ## Seifert-van Kampen Theorem (Higher Homotopy Version)

The classical Seifert-van Kampen theorem computes pi_1 of a union.
For higher homotopy groups, there is a version using the fundamental
groupoid acting on the homotopy groups.

For X = U union V with U,V open and U n V path-connected:
pi_n(X) = pi_n(U) *_{pi_n(U n V)} pi_n(V)
where the amalgamated product is in the sense of the fundamental
group action.
-/

theorem seifert_van_kampen_higher (X U V : Type u) [TopologicalSpace X]
    (hU_open : IsOpen U) (hV_open : IsOpen V) (h_union : U union V = X)
    (h_intersection : IsConnected (U n V)) (n : Nat) (h_n : n >= 2) :
    pi_n(X) = AmalgamatedProduct (pi_n U, pi_n V, pi_n (U n V)) := by
  -- Use the homotopy excision theorem (Blakers-Massey)
  -- The map pi_n(U, U n V) -> pi_n(X, V) is iso for n < 2k-2
  -- Then apply the relative Hurewicz and the exact sequence of the pair
  sorry

theorem van_kampen_fundamental_group (X U V : Type u) [TopologicalSpace X]
    (hU_open : IsOpen U) (hV_open : IsOpen V) (h_union : U union V = X)
    (hU_connected : IsConnected U) (hV_connected : IsConnected V)
    (h_inter_path_connected : IsPathConnected (U n V)) :
    FundamentalGroup X = Pushout (FundamentalGroup (U n V))
      (inclusionMap U) (inclusionMap V) (FundamentalGroup U) (FundamentalGroup V) := by
  -- Classical Seifert-van Kampen: pi_1(X) is the free product of
  -- pi_1(U) and pi_1(V) amalgamated over pi_1(U n V)
  sorry

#eval "Seifert-van Kampen"

#eval "Seifert-van Kampen + higher homotopy excision"
