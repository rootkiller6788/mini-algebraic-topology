/-
# Test.Examples ¡ª Example tests for MiniHigherHomotopy
-/

import MiniHigherHomotopy

open MiniHigherHomotopy.Core.Basic

#eval sphereDim

def testEuler (n : ?) : IO Unit := do
  IO.println s!"¦Ö(S^{n}) = {eulerChar (sphereCW n)}"

def main : IO Unit := do
  IO.println "Running MiniHigherHomotopy tests..."
  testEuler 0
  testEuler 1
  testEuler 2
  IO.println "Tests complete."
