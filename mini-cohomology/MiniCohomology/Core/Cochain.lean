/-
# Cohomology Kernel: Cochains and Coboundary

Defines cochain groups C^k(K; G) and the coboundary operator.

Knowledge coverage: L1 (Definitions), L2 (Core Concepts), L3 (Math Structures)
-/

import MiniCohomology.Core.SimplicialComplex

namespace MiniCohomology

open AbGroup

/-! ## Cochain Representation -/

structure Cochain (K : SimplicialComplex) (k : Nat) (G : Type) [AbGroup G] where
  values : List Simplex → G

def Cochain.eval {K : SimplicialComplex} {k : Nat} {G : Type} [AbGroup G]
    (c : Cochain K k G) (s : Simplex) : G :=
  if s.dim == k then c.values [s] else zero

def zeroCochain (K : SimplicialComplex) (k : Nat) (G : Type) [AbGroup G] : Cochain K k G :=
  Cochain.mk (fun _ => zero)

def addCochain {K : SimplicialComplex} {k : Nat} {G : Type} [AbGroup G]
    (c d : Cochain K k G) : Cochain K k G :=
  Cochain.mk (fun ss => add (c.values ss) (d.values ss))

def negCochain {K : SimplicialComplex} {k : Nat} {G : Type} [AbGroup G]
    (c : Cochain K k G) : Cochain K k G :=
  Cochain.mk (fun ss => neg (c.values ss))

/-! ## Extensionality -/

@[ext]
theorem cochainExt {K : SimplicialComplex} {k : Nat} {G : Type} [AbGroup G]
    (c1 c2 : Cochain K k G) (h : c1.values = c2.values) : c1 = c2 := by
  cases c1; cases c2; simp at h; rw [h]

/-! ## Cochain Group Structure -/

instance cochainAbGroup (K : SimplicialComplex) (k : Nat) (G : Type) [AbGroup G] :
    AbGroup (Cochain K k G) where
  zero := zeroCochain K k G
  add  := addCochain
  neg  := negCochain
  add_assoc := by
    intro a b c; apply cochainExt; funext ss; simp [addCochain, add_assoc]
  add_comm := by
    intro a b; apply cochainExt; funext ss; simp [addCochain, add_comm]
  add_zero := by
    intro a; apply cochainExt; funext ss; simp [addCochain, zeroCochain, add_zero]
  add_neg_self := by
    intro a; apply cochainExt; funext ss; simp [addCochain, negCochain, zeroCochain, add_neg_self]

/-! ## Simplification Lemmas -/

@[simp]
theorem zeroCochain_val {K : SimplicialComplex} {k : Nat} {G : Type} [AbGroup G]
    (ss : List Simplex) : (zeroCochain K k G).values ss = zero := rfl

@[simp]
theorem addCochain_val {K : SimplicialComplex} {k : Nat} {G : Type} [AbGroup G]
    (c d : Cochain K k G) (ss : List Simplex) :
    (addCochain c d).values ss = add (c.values ss) (d.values ss) := rfl

@[simp]
theorem negCochain_val {K : SimplicialComplex} {k : Nat} {G : Type} [AbGroup G]
    (c : Cochain K k G) (ss : List Simplex) :
    (negCochain c).values ss = neg (c.values ss) := rfl

/-! ## Coboundary Operator -/

def coboundaryZ2 (K : SimplicialComplex) (k : Nat) (c : Cochain K k Bool) : Cochain K (k+1) Bool :=
  Cochain.mk (fun ss =>
    match ss with
    | [s] =>
      if s.dim == k+1 then
        let faces := s.faces
        faces.foldl (fun acc f => xor acc (Cochain.eval c f)) false
      else false
    | _ => false)

def coboundaryZ (K : SimplicialComplex) (k : Nat) (c : Cochain K k Int) : Cochain K (k+1) Int :=
  Cochain.mk (fun ss =>
    match ss with
    | [s] =>
      if s.dim == k+1 then
        let faces := s.boundaryFacesSigned
        faces.foldl (fun acc (sign, f) => acc + sign * (Cochain.eval c f)) 0
      else 0
    | _ => 0)

/-! ## Cocycles and Coboundaries -/

def isCocycleZ2 (K : SimplicialComplex) (k : Nat) (c : Cochain K k Bool) : Bool :=
  let dc := coboundaryZ2 K k c
  let targets := K.kSimplices (k+1)
  targets.all (fun s => Cochain.eval dc s == false)

def isCocycleZ (K : SimplicialComplex) (k : Nat) (c : Cochain K k Int) : Bool :=
  let dc := coboundaryZ K k c
  let targets := K.kSimplices (k+1)
  targets.all (fun s => Cochain.eval dc s == 0)

def isCoboundaryZ2 (K : SimplicialComplex) (k : Nat) (c : Cochain K k Bool) : Prop :=
  match k with
  | 0 => c = zeroCochain K 0 Bool
  | k'+1 => ∃ (d : Cochain K k' Bool), coboundaryZ2 K k' d = c

/-! ## Cochain Enumeration -/

def enumerateCochainsZ2 (K : SimplicialComplex) (k : Nat) : List (Cochain K k Bool) :=
  let simplices := K.kSimplices k
  let n := simplices.length
  if n > 10 then []
  else
    let maxMask := 1 <<< n
    List.range maxMask |>.map (fun mask =>
      Cochain.mk (fun ss =>
        match ss with
        | [s] =>
          match simplices.findIdx? (fun t => t.vertices == s.vertices) with
          | some i => ((mask >>> i) % 2) == 1
          | none => false
        | _ => false
      ))

def enumerateCochainsZ01 (K : SimplicialComplex) (k : Nat) : List (Cochain K k Int) :=
  let simplices := K.kSimplices k
  let n := simplices.length
  if n > 8 then []
  else
    let maxMask := 1 <<< n
    List.range maxMask |>.map (fun mask =>
      Cochain.mk (fun ss =>
        match ss with
        | [s] =>
          match simplices.findIdx? (fun t => t.vertices == s.vertices) with
          | some i => if ((mask >>> i) % 2) == 1 then 1 else 0
          | none => 0
        | _ => 0
      ))

/-! ## Cochain Maps -/

structure CochainMap (K L : SimplicialComplex) (r : Int) where
  components : (k : Nat) → Cochain K k Bool → Cochain L (k + (Int.toNat r)) Bool

end MiniCohomology
