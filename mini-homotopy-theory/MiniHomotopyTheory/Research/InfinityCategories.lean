import MiniHomotopyTheory.Core.Basic

/-
# Infinity-Categories and Higher Homotopy (L9)
-/

namespace MiniHomotopyTheory

def infinityCategory : Type 1 := Type
def quasicategory : Type 1 := Type

def homotopyHypothesis : String :=
  "The homotopy hypothesis: infinity-groupoids are equivalent to topological spaces"

def univalentFoundationsConnection : String :=
  "In HoTT/UF, types are infinity-groupoids and equivalences are homotopy equivalences"

#eval homotopyHypothesis
#eval univalentFoundationsConnection


end MiniHomotopyTheory

/-! ## Quasi-Categories

A quasi-category (infinite category) is a simplicial set satisfying
the inner horn filling condition. They model (infinity,1)-categories.
-/

structure QuasiCategory (C : SimplicialSet) where
  innerHornFilling : forall (n : Nat) (0 < k < n),
    HasKanExtension C (innerHorn n k) (simplex n)

theorem fundamental_infty_groupoid (X : Type u) [TopologicalSpace X] :
    QuasiCategory (singularComplex X) := by
  -- The singular simplicial set Sing(X) is a quasi-category
  -- Inner horns correspond to composition of paths and homotopies
  sorry

#eval "Infinity categories"

#eval "Infinity categories + quasi-categories"
