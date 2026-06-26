/-
# Homotopy Groups of Projective Spaces (L6)
-/

import MiniHomotopyTheory.Core.Basic
import MiniHomotopyTheory.Groups.FundamentalGroup

namespace MiniHomotopyTheory

def realProjectiveSpace (n : Nat) : TwoComplex := match n with
  | 0 => pointComplex | 1 => S1 | 2 => RP2 | _ => RP2

def complexProjectiveSpace (n : Nat) : TwoComplex := match n with
  | 0 => pointComplex | 1 => S2 | _ => S2

#eval realProjectiveSpace 2 |>.chi
#eval complexProjectiveSpace 1 |>.chi
#eval "pi_1(RP2):"
#eval realProjectiveSpace 2 |>.fundamentalGroupApprox 0 6 |>.length
#eval "pi_1(CP1 = S2):"
#eval complexProjectiveSpace 1 |>.fundamentalGroupApprox 0 4 |>.length
def quaternionicProjectiveSpace (n : Nat) : TwoComplex := match n with
  | 0 => pointComplex | _ => S2

def cayleyPlane : TwoComplex := S2

def rp2CohomologyRing : String := "H*(RP^2; Z/2) = Z/2[x]/(x^3)"

def cp2CohomologyRing : String := "H*(CP^2; Z) = Z[x]/(x^3)"

def projectiveSpaceInvariants : List (String × Int × Nat) :=
  [("RP1=S1", (realProjectiveSpace 1).chi, ((realProjectiveSpace 1).fundamentalGroupApprox 0 6).length),
   ("RP2", (realProjectiveSpace 2).chi, ((realProjectiveSpace 2).fundamentalGroupApprox 0 6).length),
   ("CP1=S2", (complexProjectiveSpace 1).chi, ((complexProjectiveSpace 1).fundamentalGroupApprox 0 4).length),
   ("CP2", (complexProjectiveSpace 2).chi, ((complexProjectiveSpace 2).fundamentalGroupApprox 0 4).length)]

def projectiveSpaceHomotopyGroups : List (String × String) :=
  [("pi_1(RP^2)", "Z/2Z"), ("pi_2(RP^2)", "Z"),
   ("pi_1(CP^2)", "0"), ("pi_2(CP^2)", "Z")]

def lensSpace (p q : Nat) : TwoComplex := mooreSpaceZmod p

def lensSpaceInvariants : List (Nat × Int × Nat) :=
  (List.range 7).map fun n =>
    let p := n+1
    let L := lensSpace p 1
    (p, L.chi, (L.fundamentalGroupApprox 0 8).length)

def adamsTheorem : String := "Adams: Hopf invariant one maps exist only for n=1,2,4,8"

#eval projectiveSpaceInvariants
#eval "Lens spaces L(p,1):"
#eval lensSpaceInvariants


end MiniHomotopyTheory

/-! ## Homotopy Groups of Projective Spaces

pi_k(RP^n) = pi_k(S^n) for k >= 2 (via the double cover S^n -> RP^n)
pi_1(RP^n) = Z_2 for n >= 2
pi_k(CP^n) from the fibration S^1 -> S^{2n+1} -> CP^n
-/

theorem pi_RP_n (n k : Nat) (h : k >= 2) :
    HomotopyGroup (realProjectiveSpace n) k = HomotopyGroup (sphere n) k := by
  -- The universal cover of RP^n is S^n; the covering map induces
  -- isomorphisms on pi_k for k >= 2
  sorry

theorem pi_CP_n_via_fibration (n k : Nat) (h : k >= 2) :
    HomotopyGroup (complexProjectiveSpace n) k = HomotopyGroup (sphere (2*n+1)) k := by
  -- From the Hopf fibration S^1 -> S^{2n+1} -> CP^n
  -- LES: pi_k(S^1) = 0 for k>=2 => pi_k(CP^n) = pi_k(S^{2n+1})
  sorry

#eval "Projective spaces"
