/-
# Homotopy Theory: Core Definitions (L1)

Defines the fundamental objects of combinatorial homotopy theory using
finite 2-complexes. This model bridges homotopy theory with
combinatorial group theory. The fundamental group is the edge-path
group modulo relations imposed by 2-cells.

Reference: STANFORD MATH 210, MIT 18.905, CAMBRIDGE Part III
-/

namespace MiniHomotopyTheory

/-! ## Helper Functions -/

/-- Safe list element access returning Option. -/
def getElemOp [Inhabited alpha] (xs : List alpha) (i : Nat) : Option alpha :=
  match xs with
  | [] => none
  | x :: rest => if i == 0 then some x else getElemOp rest (i - 1)

/-- Deduplicate a list using fold. -/
def dedupList [BEq alpha] (xs : List alpha) : List alpha :=
  xs.foldl (fun acc x => if acc.contains x then acc else acc ++ [x]) []

/-- Monadic bind (concatMap) for lists. -/
def bindList (xs : List alpha) (f : alpha -> List beta) : List beta :=
  let rec go (xs : List alpha) : List beta :=
    match xs with
    | [] => []
    | x :: rest => f x ++ go rest
  go xs

/-! ## Edge-Path Representation -/

abbrev EdgeStep : Type := Nat × Bool

/-- Reduce an edge-path by removing spurs (consecutive ei.true ei.false pairs). -/
def reduceSpurs (steps : List EdgeStep) : List EdgeStep :=
  let rec go (steps : List EdgeStep) : List EdgeStep :=
    match steps with
    | (ei1, b1) :: (ei2, b2) :: rest =>
      if ei1 == ei2 && b1 != b2 then go rest
      else (ei1, b1) :: go ((ei2, b2) :: rest)
    | _ => steps
  termination_by steps.length
  go steps

/-- Reverse an edge-path. -/
def reverseEdgePath (steps : List EdgeStep) : List EdgeStep :=
  steps.reverse.map fun (ei, fwd) => (ei, !fwd)/-! ## Homotopy Lifting Property (HLP)

A map p : E -> B has the HLP with respect to X if for every homotopy
H : X x I -> B and lift h_0 : X -> E with p o h_0 = H(-,0), there
exists a lift H_tilde : X x I -> E with p o H_tilde = H.

A Serre fibration has HLP for all CW complexes X.
-/

def HasHLP (p : ContinuousMap E B) (X : Type u) [TopologicalSpace X] : Prop :=
  forall (H : Homotopy X B) (h_0 : ContinuousMap X E), p comp h_0 = H.atTime 0 ->
    exists (H_tilde : Homotopy X E), p comp H_tilde = H /\ H_tilde.atTime 0 = h_0

def IsSerreFibration (p : ContinuousMap E B) : Prop :=
  forall (X : Type u) [CWComplex X], HasHLP p X

/-! ## Homotopy Extension Property (HEP)

A pair (X,A) has HEP if every homotopy on A extends to X:
for f : X -> Y and H : A x I -> Y with f|A = H(-,0), there
exists H_tilde : X x I -> Y extending H.
-/

def HasHEP (X : Type u) [TopologicalSpace X] (A : Set X) : Prop :=
  forall (Y : Type u) [TopologicalSpace Y] (f : ContinuousMap X Y)
    (H : Homotopy (Subtype A) Y), f.restrictTo A = H.atTime 0 ->
    exists (H_tilde : Homotopy X Y), H_tilde.restrictTo A = H /\ H_tilde.atTime 0 = f

def IsCofibration (A : Set X) : Prop := HasHEP X A

#eval "HLP + HEP + cofibration"
