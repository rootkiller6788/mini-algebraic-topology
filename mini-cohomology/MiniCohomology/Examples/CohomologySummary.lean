/-
# Cohomology Kernel: Cohomology Theory Summary

Summary of key results and formulas in cohomology theory.
Reference sheet for the cohomology of common spaces.

Knowledge coverage: L6 (Canonical Examples), L7 (Applications)
-/

import MiniCohomology.Core.CohomologyGroup
import MiniCohomology.Constructions.CupProduct
import MiniCohomology.Applications.CohomologyApplications

namespace MiniCohomology

/-! ## Summary: Cohomology of Common Spaces (Z2 coefficients) -/

/-- Point: H^0 = Z2. -/
def summaryPointBetti : List Nat := [1]

/-- S^n (n>=1): H^0 = Z2, H^n = Z2. -/
def summarySphereBetti (n : Nat) : List Nat :=
  if n == 0 then [2] else 1 :: List.replicate (n-1) 0 ++ [1]

/-- T^n: beta_k = C(n,k). -/
def summaryTorusBetti (n : Nat) : List Nat :=
  match n with
  | 0 => [1]
  | 1 => [1, 1]
  | 2 => [1, 2, 1]
  | 3 => [1, 3, 3, 1]
  | _ => []

/-- RP^n: all Betti numbers = 1. -/
def summaryRPnBetti (n : Nat) : List Nat := List.replicate (n+1) 1

/-- CP^n: 1 in even degrees up to 2n. -/
def summaryCPnBetti (n : Nat) : List Nat :=
  match n with
  | 0 => [1]
  | 1 => [1, 0, 1]
  | 2 => [1, 0, 1, 0, 1]
  | _ => []

/-- Orientable surface Sigma_g: H^0=1, H^1=2g, H^2=1. -/
def summarySurfaceBetti (g : Nat) : List Nat := [1, 2*g, 1]

/-- Non-orientable surface N_g: H^0=1, H^1=g, H^2=1 (g even) or 0 (g odd). -/
def summaryNonorientBetti (g : Nat) : List Nat :=
  [1, g, if g % 2 == 0 then 1 else 0]

/-! ## Key Formulas Summary -/

/-- Kunneth formula: H^n(X×Y) = sum_{p+q=n} H^p(X)⊗H^q(Y). -/
def summaryKunneth (bX bY : List Nat) (n : Nat) : Nat :=
  let listGetAt (xs : List Nat) (i : Nat) : Nat :=
    match xs with
    | [] => 0
    | x :: rest => if i == 0 then x else listGetAt rest (i-1)
  List.foldl (fun sum p =>
    let q := n - p
    sum + listGetAt bX p * listGetAt bY q
  ) 0 (List.range (n+1))

/-- Euler characteristic: chi = sum (-1)^k beta_k. -/
def summaryEulerChar (betti : List Nat) : Int :=
  let rec go (bs : List Nat) (sign : Int) (acc : Int) : Int :=
    match bs with
    | [] => acc
    | b :: rest => go rest (-sign) (acc + sign * (Int.ofNat b))
  go betti 1 0

/-- Poincare polynomial: P_X(t) = sum beta_k t^k. -/
def summaryPoincarePoly (betti : List Nat) : String :=
  let terms := List.map (fun (k, b) => s!"{b}t^{k}") (List.zip (List.range betti.length) betti)
  String.intercalate " + " terms

/-! ## Quick Reference Table -/

def cohomologyReferenceTable : List (String × List Nat × String) :=
  [ ("Point", [1], "Z2"),
    ("S^1", [1, 1], "Z2[x]/(x^2), |x|=1"),
    ("S^2", [1, 0, 1], "Z2[x]/(x^2), |x|=2"),
    ("S^3", [1, 0, 0, 1], "Z2[x]/(x^2), |x|=3"),
    ("T^2", [1, 2, 1], "Lambda_Z2[a,b]"),
    ("RP^2", [1, 1, 1], "Z2[x]/(x^3), |x|=1"),
    ("RP^3", [1, 1, 1, 1], "Z2[x]/(x^4), |x|=1"),
    ("CP^2", [1, 0, 1, 0, 1], "Z2[x]/(x^3), |x|=2"),
    ("Klein", [1, 2, 1], "Z2[a,b]/(a^2+b^2)"),
    ("Sigma_2", [1, 4, 1], "Lambda_Z2[a1,b1,a2,b2]"),
    ("N_2", [1, 2, 1], "Z2[a,b]/(a^2,b^2)")
  ]

end MiniCohomology
