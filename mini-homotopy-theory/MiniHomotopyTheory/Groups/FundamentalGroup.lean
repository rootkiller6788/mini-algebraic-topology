/-
# The Fundamental Group (L2-L3)
-/

import MiniHomotopyTheory.Core.Basic

namespace MiniHomotopyTheory

def FundamentalGroup (X : TwoComplex) (x0 : Nat) : Type :=
  List (List EdgeStep)

def fundamentalGroupElements (X : TwoComplex) (x0 : Nat) (maxLen : Nat)
    : FundamentalGroup X x0 :=
  X.fundamentalGroupApprox x0 maxLen

def pi1S1 : FundamentalGroup S1 0 := fundamentalGroupElements S1 0 6
def pi1T2 : FundamentalGroup T2 0 := fundamentalGroupElements T2 0 5
def pi1RP2 : FundamentalGroup RP2 0 := fundamentalGroupElements RP2 0 6
def pi1S2 : FundamentalGroup S2 0 := fundamentalGroupElements S2 0 4
def pi1FigureEight : FundamentalGroup FigureEight 0 := fundamentalGroupElements FigureEight 0 5

def inducedMapOnPi1 {X Y : TwoComplex} (f : CellularMap X Y) (x0 : Nat)
    (loop : List EdgeStep) : List EdgeStep :=
  let mapped := bindList loop fun (ei, fwd) =>
    let path := f.onEdge ei
    if fwd then path else reverseEdgePath path
  TwoComplex.fullReduce Y mapped

#eval "pi_1(S1) elements (up to len 6):"
#eval pi1S1.length
#eval "pi_1(T2) elements (up to len 5):"
#eval pi1T2.length
#eval "pi_1(RP2) elements (up to len 6):"
#eval pi1RP2.length
#eval "pi_1(S2) elements:"
#eval pi1S2
#eval "pi_1(FigureEight) elements (up to len 5):"
#eval pi1FigureEight.length

/-! ## Fundamental Group of Additional Spaces -/

def pi1Klein : FundamentalGroup KleinBottle 0 :=
  fundamentalGroupElements KleinBottle 0 5

def pi1MooreZ2 : FundamentalGroup (mooreSpaceZmod 2) 0 :=
  fundamentalGroupElements (mooreSpaceZmod 2) 0 8

def pi1MooreZ3 : FundamentalGroup (mooreSpaceZmod 3) 0 :=
  fundamentalGroupElements (mooreSpaceZmod 3) 0 8

def pi1MooreZ5 : FundamentalGroup (mooreSpaceZmod 5) 0 :=
  fundamentalGroupElements (mooreSpaceZmod 5) 0 8

/-- The fundamental group of a wedge sum is the free product.
    pi_1(X v Y) = pi_1(X) * pi_1(Y) for nice spaces. -/
def pi1Wedge (X Y : TwoComplex) (maxLen : Nat) : List (List EdgeStep) :=
  (wedgeSum X Y).fundamentalGroupApprox 0 maxLen

/-- The fundamental group of the suspension is trivial for connected X.
    pi_1(SX) = 1 for X path-connected. -/
def pi1Suspension (X : TwoComplex) (maxLen : Nat) : List (List EdgeStep) :=
  (suspension X).fundamentalGroupApprox 0 maxLen

/-! ## Group Operation Verification -/

/-- Verify associativity for concrete S1 loops. -/
def checkAssocS1 : Bool :=
  let a := [(0,true)]
  let b := [(0,true),(0,true)]
  let c := [(0,false)]
  let left := TwoComplex.fullReduce S1 (TwoComplex.fullReduce S1 (a ++ b) ++ c)
  let right := TwoComplex.fullReduce S1 (a ++ TwoComplex.fullReduce S1 (b ++ c))
  left == right

/-- Verify identity for S1 loop. -/
def checkIdentityS1 : Bool :=
  let a := [(0,true)]
  let left := TwoComplex.fullReduce S1 (a ++ [])
  let right := TwoComplex.fullReduce S1 a
  left == right

/-- Verify inverse for S1 loop. -/
def checkInverseS1 : Bool :=
  let a := [(0,true)]
  let result := TwoComplex.fullReduce S1 (a ++ reverseEdgePath a)
  result == []

/-- Verify associativity for T2 loops. -/
def checkAssocT2 : Bool :=
  let a := [(0,true)]
  let b := [(1,true)]
  let c := [(0,false)]
  let left := TwoComplex.fullReduce T2 (TwoComplex.fullReduce T2 (a ++ b) ++ c)
  let right := TwoComplex.fullReduce T2 (a ++ TwoComplex.fullReduce T2 (b ++ c))
  left == right

/-- Verify abelian property for T2 (since pi_1(T2) = Z x Z is abelian). -/
def checkAbelianT2 : Bool :=
  let a := [(0,true)]
  let b := [(1,true)]
  let ab := TwoComplex.fullReduce T2 (a ++ b)
  let ba := TwoComplex.fullReduce T2 (b ++ a)
  ab == ba

/-- Verify that in RP2, a*a = 1 (the generator has order 2). -/
def checkRP2Order2 : Bool :=
  let a := [(0,true)]
  let a2 := TwoComplex.fullReduce RP2 (a ++ a)
  a2 == []

/-! ## Induced Map Computations -/

/-- Identity map induces identity on pi_1. -/
def checkIdentityInduced : Bool :=
  let a := [(0,true)]
  let idMap := CellularMap.id S1
  inducedMapOnPi1 idMap 0 a == a

/-- Constant map induces trivial map on pi_1. -/
def checkConstInduced : Bool :=
  let a := [(0,true)]
  let constMap : CellularMap S1 S1 :=
    { onVertex := fun _ => 0, onEdge := fun _ => [], onFace := fun _ => [] }
  let result := inducedMapOnPi1 constMap 0 a
  TwoComplex.fullReduce S1 result == []

/-- The inclusion S1 -> T2 as the first factor induces injection. -/
def inclusionS1toT2 : CellularMap S1 T2 :=
  { onVertex := fun _ => 0
    onEdge := fun _ => [(0,true)]
    onFace := fun _ => [] }

def checkInclusionInduced : Bool :=
  let a := [(0,true)]
  let result := inducedMapOnPi1 inclusionS1toT2 0 a
  result == [(0,true)]

/-- The projection T2 -> S1 onto the first factor. -/
def projectionT2toS1 : CellularMap T2 S1 :=
  { onVertex := fun _ => 0
    onEdge := fun ei => if ei == 0 then [(0,true)] else []
    onFace := fun _ => [[(0,true),(0,false)]] }

def checkProjectionInduced : Bool :=
  let a := [(0,true)]
  let b := [(1,true)]
  let resultA := inducedMapOnPi1 projectionT2toS1 0 a
  let resultB := inducedMapOnPi1 projectionT2toS1 0 b
  resultA == [(0,true)] && TwoComplex.fullReduce S1 resultB == []

/-! ## #eval: Fundamental Group Verification -/

#eval "=== pi_1 verifications ==="
#eval "S1 associativity:"
#eval checkAssocS1
#eval "S1 identity:"
#eval checkIdentityS1
#eval "S1 inverse:"
#eval checkInverseS1
#eval "T2 associativity:"
#eval checkAssocT2
#eval "T2 abelian:"
#eval checkAbelianT2
#eval "RP2 order 2:"
#eval checkRP2Order2

#eval "=== Induced map checks ==="
#eval "Identity induces identity:"
#eval checkIdentityInduced
#eval "Constant induces trivial:"
#eval checkConstInduced
#eval "Inclusion S1->T2:"
#eval checkInclusionInduced
#eval "Projection T2->S1:"
#eval checkProjectionInduced

#eval "=== Additional pi_1 sizes ==="
#eval "Klein bottle pi_1 (len=5):"
#eval pi1Klein.length
#eval "M(Z/2) pi_1 (len=8):"
#eval pi1MooreZ2.length
#eval "M(Z/3) pi_1 (len=8):"
#eval pi1MooreZ3.length
#eval "M(Z/5) pi_1 (len=8):"
#eval pi1MooreZ5.length

#eval "=== Suspension pi_1 (should be trivial) ==="
#eval "pi_1(SS1) (len=4):"
#eval pi1Suspension S1 4
#eval "pi_1(ST2) (len=4):"
#eval pi1Suspension T2 4

end MiniHomotopyTheory
