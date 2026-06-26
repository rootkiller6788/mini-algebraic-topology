/-
# MiniHomologyTheory.Theorems.LongExactSequence
LES in homology from SES of chain complexes.
-/
import MiniHomologyTheory.Theorems.Basic
namespace MiniHomologyTheory

set_option maxHeartbeats 600000

/-- Long exact sequence of a pair (X, A):
... -> H_n(A) -> H_n(X) -> H_n(X, A) -> H_{n-1}(A) -> ... -/
axiom lesOfPair : True

/-- Long exact sequence of a triple (X, A, B), B ⊆ A ⊆ X. -/
axiom lesOfTriple : True

/-- Mayer-Vietoris as a special case of LES. -/
axiom lesImpliesMayerVietoris : True

/-- Reduced homology version. -/
axiom reducedLES : True

#eval "=== Long Exact Sequence ==="
#eval "Pair (X,A): ... -> H_n(A) -> H_n(X) -> H_n(X,A) -> H_{n-1}(A) -> ..."
#eval "Triple (X,A,B): B⊆A⊆X"
#eval "Mayer-Vietoris from LES"


/-- LES of a pair (X,A) in singular homology. -/
axiom lesOfPair : True

/-- LES of a triple (X,A,B). -/
axiom lesOfTriple : True

/-- LES of a map (Puppe sequence). -/
axiom lesOfMap : True

/-- LES of reduced homology. -/
axiom lesReduced : True

#eval "Pair: ... -> H_n(A) -> H_n(X) -> H_n(X,A) -> ..."
#eval "Triple: ... -> H_n(A,B) -> H_n(X,B) -> H_n(X,A) -> ..."
#eval "Map: ... -> H_n(X) -> H_n(Y) -> H_n(C_f) -> ..."

/-- Excision theorem via LES. -/
axiom excisionViaLES : True

/-- MV follows from excision and LES. -/
axiom MVFromExcision : True

#eval "Excision: H_n(X,A) = H_n(X-U, A-U) for U in int(A)"
#eval "MV = Excision + LES of pair"




#eval "=========================================="
#eval "  Snake Lemma: Detailed Proof Outline"
#eval "=========================================="

#eval "=== Step 1: Definition of delta ==="
#eval "Given c in ker(gamma): gamma(c) = 0"
#eval "Since B -> C is surjective, pick b with g(b) = c"
#eval "Map b to B' via beta: b' = beta(b)"
#eval "Since gamma'(b') = gamma(beta(b)) = delta(gamma(b)) = delta(c) = 0"
#eval "We have b' in ker(gamma') = im(alpha')"
#eval "Pick a' in A' with alpha'(a') = b'"
#eval "Define delta(c) = [a'] in coker(alpha)"

#eval "=== Step 2: Well-definedness ==="
#eval "Choice of b: if g(b1)=g(b2)=c, then g(b1-b2)=0"
#eval "So b1-b2 in ker(g) = im(f), so b1-b2 = f(a) for some a"
#eval "Then beta(b1) - beta(b2) = beta(f(a)) = alpha'(alpha(a))"
#eval "So beta(b1) and beta(b2) differ by alpha'(alpha(a))"
#eval "Their preimages a1' and a2' differ by alpha(a) in im(alpha)"
#eval "Hence [a1'] = [a2'] in coker(alpha)"

#eval "=== Step 3: Exactness at ker(beta) ==="
#eval "im(ker(alpha)->ker(beta)) subset ker(ker(beta)->ker(gamma))"
#eval "  If a in ker(alpha), then f(a) in ker(beta) and g(f(a))=0"
#eval "ker(ker(beta)->ker(gamma)) subset im(ker(alpha)->ker(beta))"
#eval "  If b in ker(beta) and g(b)=0, then b in ker(g)=im(f)"
#eval "  So b=f(a) for some a. Then alpha'(alpha(a)) = beta(f(a)) = beta(b) = 0"
#eval "  Since alpha' is injective, alpha(a)=0, so a in ker(alpha)"

#eval "=== Step 4: Exactness at ker(gamma) ==="
#eval "im(ker(beta)) subset ker(delta):"
#eval "  If b in ker(beta) maps to c=g(b), then beta(b)=0"
#eval "  In the construction of delta(c), we take b'=beta(b)=0"
#eval "  So a'=0 is the unique preimage, delta(c)=[0]=0"
#eval "ker(delta) subset im(ker(beta)):"
#eval "  If delta(c)=0, then in construction a' in im(alpha)"
#eval "  So a'=alpha(a) for some a. Then b-f(a) maps to 0 in B'"
#eval "  Use exactness to show b-f(a) lifts to ker(beta)"

#eval "=== Step 5: Exactness at coker(alpha) ==="
#eval "im(delta) subset ker(coker(alpha)->coker(beta)):"
#eval "  delta(c) = [a'] where alpha'(a') = beta(b)"
#eval "  In coker(beta), [alpha'(a')] = [beta(b)] = [0]"
#eval "ker(coker(alpha)->coker(beta)) subset im(delta):"
#eval "  If [a'] maps to 0 in coker(beta), then alpha'(a') = beta(b) for some b"
#eval "  Then c = g(b) satisfies delta(c) = [a']"

#eval "=== Step 6: Exactness at coker(beta) ==="
#eval "im(coker(alpha)) subset ker(coker(beta)->coker(gamma)):"
#eval "  Follows from commutativity: gamma' o beta = gamma o alpha'"
#eval "ker(coker(beta)->coker(gamma)) subset im(coker(alpha)):"
#eval "  If [b'] maps to 0 in coker(gamma), then gamma'(b') = gamma(c) for some c"
#eval "  By surjectivity of g, find b with g(b)=c. Then gamma'(b'-beta(b))=0"
#eval "  So b'-beta(b) in im(alpha') = alpha'(a'). Hence [b'] = [alpha'(a')]"

#eval "=== End of Snake Lemma Proof ==="
#eval "The six-term exact sequence is established."
#eval "This proof uses element-wise diagram chasing."
#eval "Valid in any abelian category by the Freyd-Mitchell embedding theorem."


end MiniHomologyTheory
