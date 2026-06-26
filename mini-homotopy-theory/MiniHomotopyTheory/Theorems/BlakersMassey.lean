/-
# MiniHomotopyTheory: Blakers-Massey Theorem

The Blakers-Massey theorem is the fundamental excision theorem for
homotopy groups, generalizing the homology excision theorem.
-/

import MiniHomotopyTheory.Core.Basic
import MiniHomotopyTheory.Groups.HigherHomotopyGroups
import MiniHomotopyTheory.Groups.RelativeGroups

namespace MiniHomotopyTheory

/-! ## Blakers-Massey Theorem

Let X = A union B be a union of open subspaces with A,B connected
and C = A n B simply connected. Then the inclusion map
(A,C) -> (X,B) induces isomorphisms on pi_n for n < k+l-2 and
a surjection for n = k+l-2, where k,l are the connectivity of
(A,C) and (B,C) respectively.
-/

theorem blakers_massey (X A B : Type u) [TopologicalSpace X] (h_openA : IsOpen A) (h_openB : IsOpen B)
    (h_union : A union B = X) (C : Set X) (hC : C = A n B)
    (hC_connected : IsConnected C) (hC_simply_connected : FundamentalGroup C = 0)
    (k l n : Nat) (h_n_lt : n < k + l - 2) :
    IsIsomorphism (inclusionMap (A, C) (X, B)) (relativeHomotopyGroup A C n) (relativeHomotopyGroup X B n) := by
  -- Use the triad homotopy groups pi_n(X; A, B) and the exact sequence
  -- of a triad. The crucial step: pi_n of a triad vanishes in the stable range.
  sorry

/-! ## Freudenthal Suspension as a Corollary

Blakers-Massey implies Freudenthal: for a (k-1)-connected space X,
the suspension map pi_n(X) -> pi_{n+1}(Sigma X) is iso for n < 2k-2.
-/

theorem freudenthal_from_blakers_massey (X : Type u) [CWComplex X] (k n : Nat)
    (h_connected : forall i < k, HomotopyGroup X i = 0) (h_range : n < 2*k - 2) :
    IsIsomorphism (suspensionHomomorphism X n) (HomotopyGroup X n) (HomotopyGroup (Suspension X) (n+1)) := by
  -- Apply Blakers-Massey to the triad (Sigma X; CX_+, CX_-) where
  -- CX_+ and CX_- are the upper and lower cones
  -- C = CX_+ n CX_- = X; connectivity of (CX_+, X) = k, same for (CX_-, X)
  -- Then pi_n(CX_+, X) -> pi_n(Sigma X, CX_-) is iso for n < 2k-2
  sorry

#eval "-- Blakers-Massey Theorem --"
#check blakers_massey
#check freudenthal_from_blakers_massey

end MiniHomotopyTheory

#eval "Blakers-Massey excision theorem"
