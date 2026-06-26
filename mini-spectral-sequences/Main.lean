import MiniSpectralSequences

open MiniSpectralSequences

def main : IO Unit := do
  IO.println "═══════════════════════════════════════════════════════"
  IO.println "  MiniSpectralSequences v0.1.0"
  IO.println "  Spectral Sequences in Algebraic Topology"
  IO.println "═══════════════════════════════════════════════════════"
  IO.println s!"  CohomSpectralSequence: bigraded pages, d_r^2 = 0"
  IO.println s!"  Serre SS, Atiyah-Hirzebruch SS, Adams SS"
  IO.println s!"  Hopf invariant: {hopfInvariant}"
  IO.println s!"  Stable stem pi_0: {stableStems 0}"
  IO.println ""