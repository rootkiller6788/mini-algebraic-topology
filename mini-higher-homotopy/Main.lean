/-
# Main ¡ª MiniHigherHomotopy

Entry point that prints package information.
-/

import MiniHigherHomotopy

open MiniHigherHomotopy

def main : IO Unit := do
  IO.println "¨T¨T mini-higher-homotopy ¨T¨T"
  IO.println "Higher Homotopy Theory for the Mini Math Kernel project."
  IO.println ""
  IO.println "Modules:"
  IO.println "  Core:      Basic, Objects, Laws"
  IO.println "  Morphisms: Hom, Iso, Equivalence"
  IO.println "  Constructions: Products, Quotients, Subobjects, Universal"
  IO.println "  Properties: Invariants, Preservation, ClassificationData"
  IO.println "  Theorems:   Basic, Classification, Main, UniversalProperties"
  IO.println "  Examples:   Standard, Counterexamples"
  IO.println "  Bridges:    ToAlgebra, ToComputation, ToGeometry, ToTopology"
  IO.println "  Advanced:   PostnikovTowers, StableHomotopy"
  IO.println "  Applications: ObstructionTheory, ClassifyingSpaces"
  IO.println ""
  IO.println s!"Sphere dimension: {Core.Basic.sphereDim}"
  IO.println s!"Stable range: {Core.Basic.stableRange}"
  IO.println ""
  IO.println "¨T¨T End of mini-higher-homotopy info ¨T¨T"
