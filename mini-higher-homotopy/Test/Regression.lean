/-
# Test.Regression ¡ª Regression tests for MiniHigherHomotopy
-/

import MiniHigherHomotopy

open MiniHigherHomotopy.Core.Basic

def testRegressions : IO Unit := do
  let results := [
    (eulerChar (sphereCW 0), 1),
    (eulerChar (sphereCW 1), 0),
    (eulerChar (sphereCW 2), 2),
    (stableHomotopyGroup 0, 1),
    (stableHomotopyGroup 1, 2),
    (stableHomotopyGroup 3, 24)
  ]
  for (actual, expected) in results do
    if actual = expected then
      IO.println s!"PASS: {actual} = {expected}"
    else
      IO.println s!"FAIL: {actual} ¡Ù {expected}"
  IO.println "Regression tests complete."

def main : IO Unit := testRegressions
