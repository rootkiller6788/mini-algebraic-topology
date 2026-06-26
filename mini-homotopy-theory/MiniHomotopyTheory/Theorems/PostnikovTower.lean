/-
# MiniHomotopyTheory: Postnikov Tower

Any space X can be approximated by a tower of spaces X_n where
pi_k(X_n) = pi_k(X) for k <= n and pi_k(X_n) = 0 for k > n.
-/

import MiniHomotopyTheory.Core.Basic
import MiniHomotopyTheory.Groups.HigherHomotopyGroups

namespace MiniHomotopyTheory

/-! ## Postnikov Tower

A Postnikov tower for X is a sequence:
... -> X_n -> X_{n-1} -> ... -> X_0
where:
- X_n -> X_{n-1} is a fibration with fiber K(pi_n(X), n)
- pi_k(X_n) = pi_k(X) for k <= n, and 0 for k > n
- There are maps f_n : X -> X_n inducing isomorphisms on pi_k for k <= n
-/

structure PostnikovTower (X : Type u) [TopologicalSpace X] where
  stage : Nat -> Type u
  fibration : forall n : Nat, ContinuousMap (stage (n+1)) (stage n)
  isFibration : forall n, IsSerreFibration (fibration n)
  fiber : forall n, HomotopyFiber (fibration n) = EilenbergMacLane (HomotopyGroup X (n+1)) (n+1)
  connectivityUpTo : forall n k, k <= n -> HomotopyGroup (stage n) k = HomotopyGroup X k
  connectivityAbove : forall n k, k > n -> HomotopyGroup (stage n) k = 0

theorem postnikov_tower_exists (X : Type u) [CWComplex X] :
    exists (P : PostnikovTower X), True := by
  -- Construct X_n by attaching cells to X to kill pi_k for k > n
  -- Then X_n -> X_{n-1} is given by the universal property
  sorry

/-! ## k-invariants

The fibration X_n -> X_{n-1} with fiber K(pi_n(X), n) is classified
by a map k_n : X_{n-1} -> K(pi_n(X), n+1), called the n-th k-invariant.
-/

def kInvariant {X : Type u} (P : PostnikovTower X) (n : Nat) :
    ContinuousMap (P.stage n) (EilenbergMacLane (HomotopyGroup X (n+1)) (n+2)) :=
  ...

theorem postnikov_classified_by_kinvariants {X : Type u} [CWComplex X] (P : PostnikovTower X) :
    IsDeterminedBy (all_invariants P) := by
  sorry

#eval "-- Postnikov Tower --"
#check postnikov_tower_exists
#check kInvariant

end MiniHomotopyTheory

#eval "Postnikov tower + k-invariants"
