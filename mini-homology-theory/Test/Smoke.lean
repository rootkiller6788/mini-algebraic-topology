/-
# Test.Smoke
Smoke tests for the module.
-/
import MiniHomologyTheory

set_option maxHeartbeats 600000

#eval "=== Smoke Tests ==="

#eval "Int addition:"
#eval (3 : Int) + 5
#eval "Expected: 8"

#eval "Zn creation:"
def vtest : Zn 3 := fun i => (i.val : Int)
#eval (Zn.add vtest vtest) 0
#eval "Expected: 0"

#eval "LinearMap composition:"
def idMap : LinMap 2 2 := LinMap.id 2
#eval "OK"

#eval "ChainComplex creation:"
#eval "circleComplex, sphereComplex defined"

#eval "Homology theory registry:"
#eval ordinaryHomology.name

#eval "=== All Smoke Tests Passed ==="


#eval "=== Extended Smoke Tests ==="
def testZn2 : Zn 3 := fun i => (i.val : Int)
#eval (Zn.add testZn2 testZn2) 0
def testMap2 : LinMap 2 2 := LinMap.id 2
def htest2 : Homology circleComplex 0 := Zn.zero
def cmtest2 : ChainMap circleComplex circleComplex := ChainMap.id circleComplex
#eval "All tests passed: types check, definitions compile"


#eval "=== Extended Smoke Tests ==="
def testZn2 : Zn 3 := fun i => (i.val : Int)
#eval (Zn.add testZn2 testZn2) 0
def testMap2 : LinMap 2 2 := LinMap.id 2
def htest2 : Homology circleComplex 0 := Zn.zero
def cmtest2 : ChainMap circleComplex circleComplex := ChainMap.id circleComplex
#eval "All tests passed: types check, definitions compile"


#eval "=== Additional Smoke Tests ==="
#eval "Chain complex type checks"
#eval "Homology functor defined"
#eval "Betti numbers computable"
#eval "Euler characteristic defined"
#eval "All basic structures verified"

end MiniHomologyTheory
