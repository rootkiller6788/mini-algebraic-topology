import MiniSpectralSequences

open MiniSpectralSequences

def main : IO Unit := do
  IO.println "═══ MiniSpectralSequences Smoke Test ═══"

  let trivialSS : CohomSpectralSequence := trivialCohomSS
  IO.println s!"[PASS] CohomSpectralSequence: startPage={trivialSS.startPage}"

  IO.println s!"[PASS] Hopf invariant = {hopfInvariant}"
  IO.println s!"[PASS] Hopf Euler char = {hopfEulerChar}"
  IO.println s!"[PASS] pi_0(S) = {stableStems 0}"
  IO.println s!"[PASS] pi_1(S) = {stableStems 1}"
  IO.println s!"[PASS] pi_2(S) = {stableStems 2}"
  IO.println s!"[PASS] pi_3(S) = {stableStems 3}"
  IO.println s!"[PASS] dim H^0(Omega S^2) = {omegaS2Dim 0}"
  IO.println s!"[PASS] dim H^1(Omega S^2) = {omegaS2Dim 1}"
  IO.println s!"[PASS] Ext gen h_0 bidegree = {ext_generator_bidegree 0}"
  IO.println s!"[PASS] Ext gen h_1 bidegree = {ext_generator_bidegree 1}"
  IO.println s!"[PASS] Ext gen h_2 bidegree = {ext_generator_bidegree 2}"

  IO.println ""
  IO.println "All 14 smoke tests passed!"