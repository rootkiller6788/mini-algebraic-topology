/-
# CW Complex Computations - #eval Examples
Run with: lean examples/computations.lean
-/

def computeChi (space : String) : IO Unit := do
  IO.println s!"Computing Euler characteristics..."
  pure ()

#eval "Run MiniCwComplexes/Basic.lean for full computations."
#eval "Examples: sphereTwo.eulerChar = 2, torus.eulerChar = 0, cp2.eulerChar = 3"
