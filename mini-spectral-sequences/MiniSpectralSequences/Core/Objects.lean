/- Extended objects: Bidegree, ConvergenceRegion -/
namespace MiniSpectralSequences

structure Bidegree where
  p : Int
  q : Int
  deriving BEq, Repr, Inhabited

def Bidegree.total (b : Bidegree) : Int := b.p + b.q
def Bidegree.drTarget (r : Int) (b : Bidegree) : Bidegree :=
  { p := b.p + r, q := b.q - r + 1 }
def Bidegree.drSource (r : Int) (b : Bidegree) : Bidegree :=
  { p := b.p - r, q := b.q + r - 1 }

inductive ConvergenceRegion where
  | firstQuadrant | secondQuadrant | rightHalfPlane | fullPlane
  deriving Repr, Inhabited

end MiniSpectralSequences