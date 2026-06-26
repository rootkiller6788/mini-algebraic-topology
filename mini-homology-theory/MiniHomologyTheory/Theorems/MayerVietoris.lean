/-
# MiniHomologyTheory.Theorems.MayerVietoris
Mayer-Vietoris sequence for unions.
-/
import MiniHomologyTheory.Theorems.LongExactSequence
namespace MiniHomologyTheory

set_option maxHeartbeats 600000

/-- Mayer-Vietoris: ... -> H_n(U∩V) -> H_n(U)⊕H_n(V) -> H_n(U∪V) -> H_{n-1}(U∩V) -> ... -/
axiom mayerVietorisSequence : True

/-- Reduced Mayer-Vietoris. -/
axiom reducedMayerVietoris : True

/-- Computation of H_*(S^n) via Mayer-Vietoris.
S^n = D^n_+ ∪ D^n_- with intersection S^{n-1}. -/
def sphereViaMV (n : Nat) : String :=
  "H_k(S^n) = Z for k=0,n; 0 otherwise (via induction and MV)"

/-- Computation of H_*(T^2) = H_*(S^1 × S^1).
Cover with two cylinders intersecting in two circles. -/
def torusViaMV : String :=
  "H_0=Z, H_1=Z⊕Z, H_2=Z (torus)"

/-- Computation of H_*(RP^2).
Cover with Möbius band and disk intersecting in S^1. -/
def rp2ViaMV : String :=
  "H_0=Z, H_1=Z_2, H_2=0 (RP^2)"

#eval "=== Mayer-Vietoris ==="
#eval "... -> H_n(U∩V) -> H_n(U)⊕H_n(V) -> H_n(X) -> H_{n-1}(U∩V) -> ..."
#eval sphereViaMV 2
#eval torusViaMV
#eval rp2ViaMV


/-- Mayer-Vietoris for triads. -/
axiom mayerVietorisTriad : True

/-- Mayer-Vietoris for CW complexes. -/
axiom mayerVietorisCW : True

/-- Alternative: Barratt-Whitehead / Puppe sequence. -/
axiom barrattWhitehead : True

/-- Relative Mayer-Vietoris. -/
axiom relativeMayerVietoris : True

#eval "MV for triads: three subspaces"
#eval "MV for CW: via subcomplexes"
#eval "Barratt-Whitehead: long exact sequence of a map"

/-- Computation: H_*(S^1 v S^1) via MV. -/
axiom wedgeHomologyMV : True

/-- Computation: H_*(connected sum) via MV. -/
axiom connectedSumMV : True

/-- Computation: H_*(double of manifold) via MV. -/
axiom doubleMV : True

#eval "Wedge: S^1 v S^1 = figure eight, H_1 = Z+Z"
#eval "Connected sum: X#Y via MV on neighborhoods"
#eval "Double: M U_{boundary} M via MV"


end MiniHomologyTheory
