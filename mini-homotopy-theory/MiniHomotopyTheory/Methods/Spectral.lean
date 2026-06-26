/-
# Spectral Sequence Methods (L5)
-/

import MiniHomotopyTheory.Core.Basic

namespace MiniHomotopyTheory


def serreSpectralSequence (total base fiber : TwoComplex) (r : Nat) : List (List Nat) := [[0]]
def computeE2Page (total base fiber : TwoComplex) : List (List Nat) := [[base.fundamentalGroupApprox 0 4 |>.length]]
#eval computeE2Page S2 S2 S1

end MiniHomotopyTheory

/-! ## Serre Spectral Sequence

For a Serre fibration F -> E -> B with B simply connected, there is
a spectral sequence with E^2_{p,q} = H_p(B; H_q(F)) converging to
H_{p+q}(E). This is the primary computational tool.
-/

def SerreSpectralSequence (F E B : Type u) (p : ContinuousMap E B) [IsSerreFibration p]
    (r : Nat) : BigradedModule := ...

theorem serre_spectral_sequence_convergence (F E B : Type u) (p : ContinuousMap E B) [IsSerreFibration p]
    [SimplyConnected B] : ConvergesTo (SerreSpectralSequence F E B p) (Homology E) := by
  sorry

#eval "Serre spectral sequence"

#eval "Spectral sequence methods"
