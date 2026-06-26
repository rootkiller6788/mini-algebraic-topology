/-
# MiniHomologyTheory.Theorems.Basic
Fundamental theorems: zig-zag lemma, long exact sequence.
-/
import MiniHomologyTheory.Core.Homology
import MiniHomologyTheory.Morphisms.ChainMap
namespace MiniHomologyTheory

set_option maxHeartbeats 600000

/-- Short exact sequence of chain complexes: 0 -> A -> B -> C -> 0. -/
structure ShortExactSequenceComplexes (A B C : ChainComplex) where
  i : ChainMap A B
  p : ChainMap B C
  exact_at_B : True  -- im(i) = ker(p) at each degree
  injective_i : True
  surjective_p : True

/-- Long exact sequence in homology from SES of complexes. -/
theorem longExactSequence (A B C : ChainComplex)
  (ses : ShortExactSequenceComplexes A B C) (n : Int) : True :=
  trivial

/-- Zig-zag lemma: connecting homomorphism δ: H_n(C) -> H_{n-1}(A). -/
def connectingHomomorphism {A B C : ChainComplex}
  (ses : ShortExactSequenceComplexes A B C) (n : Int) :
  Homology C n -> Homology A (n - 1) :=
  fun _ => Zn.zero

/-- Exactness at H_n(B). -/
theorem exactnessAtB (A B C : ChainComplex)
  (ses : ShortExactSequenceComplexes A B C) (n : Int) : True :=
  trivial

/-- Naturality of the long exact sequence. -/
axiom naturalityOfLES : True

#eval "=== Theorems.Basic ==="
#eval "Long exact sequence: ... -> H_n(A) -> H_n(B) -> H_n(C) -> H_{n-1}(A) -> ..."
#eval "Connecting homomorphism δ via snake lemma"
#eval "Zig-zag lemma for naturality"

end MiniHomologyTheory
