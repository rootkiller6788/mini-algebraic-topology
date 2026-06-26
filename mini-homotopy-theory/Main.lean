/-
# Main — MiniHomotopyTheory

Entry point that prints package information and runs examples.
-/

import MiniHomotopyTheory

open MiniHomotopyTheory

def main : IO Unit := do
  IO.println "== mini-homotopy-theory =="
  IO.println s!"S1 Euler characteristic: {S1.chi}"
  IO.println s!"T2 connected: {T2.isConnected}"
  IO.println s!"S2 simply connected (maxLen=4): {S2.isSimplyConnected 4}"
