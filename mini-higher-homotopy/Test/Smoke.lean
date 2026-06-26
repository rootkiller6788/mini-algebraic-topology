/-
# Test.Smoke ¡ª Smoke tests for MiniHigherHomotopy
-/

import MiniHigherHomotopy

open MiniHigherHomotopy.Core.Basic

def main : IO Unit := do
  IO.println "Smoke test: basic imports work"
  IO.println s!"sphereDim = {sphereDim}"
  IO.println s!"stableRange = {stableRange}"
  IO.println "Smoke test passed."
