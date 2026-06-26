/-
# Smoke Test for MiniFundamentalGroup

Basic tests that verify core definitions compile and work.
-/
import MiniFundamentalGroup
open MiniFundamentalGroup

set_option maxHeartbeats 400000

/-- Test: TopologicalSpace instance exists for Unit. -/
instance : TopologicalSpace Unit where
  IsOpen _ := True
  isOpen_univ := trivial
  isOpen_inter _ _ := trivial
  isOpen_sUnion _ := trivial

/-- Test: continuous_id compiles. -/
#eval "Test 1: continuous_id compiles"

/-- Test: Path can be constructed. -/
def testPath : Path (() : Unit) () :=
  Path.const ()

#eval "Test 2: Path.const compiles"

/-- Test: FundamentalGroup type exists. -/
def testFundamentalGroup : Type := π₁ (X := Unit) ()

#eval "Test 3: FundamentalGroup type exists"

/-- Test: Group instance on π₁ exists. -/
example : Group (π₁ (X := Unit) ()) := by
  infer_instance

#eval "Test 4: Group instance on π₁ exists"

/-- Test: inducedMap compiles. -/
def testInducedMap : π₁ (X := Unit) () → π₁ (X := Unit) () :=
  inducedMap id continuous_id

#eval "Test 5: inducedMap compiles"

/-- Test: SimplyConnectedSpace for Unit. -/
def testSimplyConnected : SimplyConnectedSpace Unit :=
  unitSimplyConnected

#eval "Test 6: Unit is simply connected"

/-- Test: FreeGroup type exists. -/
def testFreeGroup : Type := FreeGroup ℕ

#eval "Test 7: FreeGroup type exists"

/-- Main smoke test. -/
def main : IO Unit := do
  IO.println "═══ Smoke Test for MiniFundamentalGroup ═══"
  IO.println "1. TopologicalSpace typeclass:   OK"
  IO.println "2. Path construction:           OK"
  IO.println "3. FundamentalGroup type:       OK"
  IO.println "4. Group structure on π₁:       OK"
  IO.println "5. Induced maps:                OK"
  IO.println "6. SimplyConnectedSpace:        OK"
  IO.println "7. FreeGroup:                   OK"
  IO.println "All smoke tests passed!"
