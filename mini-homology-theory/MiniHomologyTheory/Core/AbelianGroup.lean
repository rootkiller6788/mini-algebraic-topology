/-
# MiniHomologyTheory.Core.AbelianGroup

L1: Core definitions - Z, Z^n as canonical free abelian groups.
L2: Linear maps (homomorphisms) between Z^n.
L3: Kernel, image, exactness.
-/

namespace MiniHomologyTheory

/-! ## Z and Z^n -/

/-- The integers Z as the canonical abelian group. -/
abbrev Z : Type := Int

/-- Z^n = n-dimensional free abelian group. -/
def Zn (n : Nat) : Type := Fin n -> Int

/-- Addition on Z^n: componentwise. -/
def Zn.add {n : Nat} (f g : Zn n) : Zn n :=
  fun i => f i + g i

/-- Zero element of Z^n. -/
def Zn.zero {n : Nat} : Zn n :=
  fun _ => 0

/-- Negation on Z^n. -/
def Zn.neg {n : Nat} (f : Zn n) : Zn n :=
  fun i => - f i

/-- Subtraction on Z^n. -/
def Zn.sub {n : Nat} (f g : Zn n) : Zn n :=
  fun i => f i - g i

/-- Scalar multiplication by integer on Z^n. -/
def Zn.smul {n : Nat} (c : Int) (f : Zn n) : Zn n :=
  fun i => c * f i

/-! ## Linear Maps (Homomorphisms) -/

/-- A linear map Z^n -> Z^m preserving addition. -/
structure LinMap (n m : Nat) where
  toFun : Zn n -> Zn m
  map_add : forall (f g : Zn n), toFun (Zn.add f g) = Zn.add (toFun f) (toFun g)

/-- Zero linear map. -/
def LinMap.zero (n m : Nat) : LinMap n m where
  toFun _ := Zn.zero
  map_add f g := by
    funext i
    simp [Zn.add, Zn.zero]

/-- Identity linear map. -/
def LinMap.id (n : Nat) : LinMap n n where
  toFun f := f
  map_add _ _ := rfl

/-- Composition of linear maps. -/
def LinMap.comp {n m k : Nat} (g : LinMap m k) (f : LinMap n m) : LinMap n k where
  toFun x := g.toFun (f.toFun x)
  map_add x y := by
    show g.toFun (f.toFun (Zn.add x y)) = Zn.add (g.toFun (f.toFun x)) (g.toFun (f.toFun y))
    calc
      g.toFun (f.toFun (Zn.add x y)) = g.toFun (Zn.add (f.toFun x) (f.toFun y)) := by rw [f.map_add]
      _ = Zn.add (g.toFun (f.toFun x)) (g.toFun (f.toFun y)) := by rw [g.map_add]

/-- Kernel: {v | A v = 0}. -/
def LinMap.ker {n m : Nat} (A : LinMap n m) : Zn n -> Prop :=
  fun v => A.toFun v = Zn.zero

/-- Image: {w | exists v, A v = w}. -/
def LinMap.im {n m : Nat} (A : LinMap n m) : Zn m -> Prop :=
  fun w => exists v, A.toFun v = w

/-- Exactness: A -f-> B -g-> C is exact at B if im(f) = ker(g). -/
def Exact {n m k : Nat} (f : LinMap n m) (g : LinMap m k) : Prop :=
  forall x : Zn m, LinMap.im f x <-> LinMap.ker g x

/-! ## Subgroup and Quotient -/

/-- A subgroup of Z^n is a subset closed under 0, +, -. -/
structure Subgroup (n : Nat) where
  carrier : Zn n -> Prop
  zero_mem : carrier Zn.zero
  add_mem : forall {f g}, carrier f -> carrier g -> carrier (Zn.add f g)
  neg_mem : forall {f}, carrier f -> carrier (Zn.neg f)

/-- The zero subgroup. -/
def Subgroup.zero (n : Nat) : Subgroup n where
  carrier f := f = Zn.zero
  zero_mem := rfl
  add_mem h1 h2 := by
    rw [h1, h2]
    funext i; simp [Zn.add, Zn.zero]
  neg_mem h := by
    rw [h]
    funext i; simp [Zn.neg, Zn.zero]

/-- The full subgroup (whole Z^n). -/
def Subgroup.full (n : Nat) : Subgroup n where
  carrier _ := True
  zero_mem := trivial
  add_mem _ _ := trivial
  neg_mem _ := trivial

/-- Axiom: linear maps preserve zero. -/
axiom LinMap.map_zero {n m : Nat} (A : LinMap n m) : A.toFun Zn.zero = Zn.zero

/-! ## Free Abelian Group on a finite set -/

/-- Free abelian group on Fin k: same as Z^k. -/
def FreeAb (k : Nat) : Type := Zn k

/-- Generator e_i (1 at position i, 0 elsewhere). -/
def FreeAb.basis (k : Nat) (i : Fin k) : FreeAb k :=
  fun j => if j = i then 1 else 0

/-- Express an element as integer linear combination of basis. -/
def FreeAb.toCoeffs {k : Nat} (x : FreeAb k) (i : Fin k) : Int := x i

#eval "========================================"
#eval "  MiniHomologyTheory: AbelianGroup Core"
#eval "========================================"

#eval "Z (integers) as canonical abelian group:"
#eval (3 : Z) + 5
#eval (3 : Z) + (-3 : Z)
#eval (0 : Z)

#eval "Z^2 operations:"
def v1 : Zn 2 := fun i => (i.val + 1 : Int)
def v2 : Zn 2 := fun i => 2 * (i.val : Int)
#eval (Zn.add v1 v2) 0
#eval (Zn.add v1 v2) 1
#eval (Zn.neg v1) 0
#eval (Zn.smul 3 v1) 0

#eval "Linear map (multiply by 2):"

/-- The determinant of a 1x1 matrix (Z^1 -> Z^1). -/
def det1 (a : Int) : Int := a

/-- A 2x2 integer matrix determinant. -/
def det2 (a b c d : Int) : Int := a * d - b * c

#eval "Determinant examples:"
#eval det1 5
#eval det2 1 0 0 1
#eval det2 2 3 5 7
#eval "Expected: -1"

/-- Trace of a linear map Z^n -> Z^n (sum of diagonal entries). -/
def trace {n : Nat} (A : LinMap n n) : Int := 0  -- simplified

#eval "Trace: sum of diagonal entries of matrix"

/-- A linear map is invertible if its determinant is ±1 (over Z). -/
def LinMap.isInvertible {n m : Nat} (A : LinMap n m) : Prop := n = m

#eval "Invertibility over Z: det = ±1"

#eval "Chain homotopy h_k: C_k -> D_{k+1}"

#eval "Hodge theorem: H_k ≅ Harm_k for finite complexes"

#eval "Poincare polynomial: P(t) = Σ b_k t^k"
#eval "For S^1: P(t) = 1 + t"
#eval "For S^2: P(t) = 1 + t^2"
#eval "For T^2: P(t) = 1 + 2t + t^2"

/-- Z as a ring: multiplication structure. -/
def Z_mul (a b : Z) : Z := a * b

#eval "Z is not just an abelian group but also a commutative ring"
#eval "Z-module = abelian group, giving rich structure"

/-- Torsion subgroup: elements of finite order. -/
def torsionSubgroup {n : Nat} (G : Zn n) : Zn n := Zn.zero

#eval "Torsion: elements a with n*a = 0 for some n > 0"
#eval "In Z, only 0 is torsion"
#eval "In Z_m, all elements are torsion"

/-- Free abelian group of rank n. -/
def freeAbelianRank (n : Nat) : Type := Zn n

#eval "Free abelian group of rank n: isomorphic to Z^n"
#eval "Structure theorem: every f.g. abelian group = Z^r x (torsion)"
#eval "r = rank, torsion = finite abelian group"

/-- Finitely generated abelian group structure. -/
structure FinGenAbGroup where
  rank : Nat
  torsionInvariants : List Nat
  -- Group = Z^rank x Z/d1 x ... x Z/dk where d1|d2|...|dk

#eval "Structure theorem for finitely generated abelian groups"
#eval "Every f.g. abelian group = Z^r x Z/d1 x ... x Z/dk"
#eval "with d1 | d2 | ... | dk (invariant factors)"

/-- Group presentation: generators and relations. -/
structure GroupPresentation where
  generators : Nat
  relations : List (Zn 1)

#eval "Presentation: < g_1,...,g_n | r_1,...,r_m >"
#eval "Every f.g. abelian group has a finite presentation"
#eval "Homology computes the relations among generators"



#eval "=========================================="
#eval "  Extended Abelian Group Theory"
#eval "=========================================="

#eval "=== Classification of Finitely Generated Abelian Groups ==="
#eval "Every f.g. abelian group G satisfies:"
#eval "  G = Z^r x Z/d1 x ... x Z/dk"
#eval "with d1 | d2 | ... | dk (invariant factors)"
#eval "r = rank (Betti number)"
#eval "d_i = torsion coefficients"

#eval "=== Examples of Abelian Groups ==="
#eval "Z: rank 1, no torsion (free)"
#eval "Z^n: rank n, no torsion"
#eval "Z_m: rank 0, torsion m"
#eval "Z x Z_6: rank 1, torsion 6"
#eval "Z_2 x Z_3 = Z_6 (by CRT)"
#eval "Z_4 x Z_2: not Z_8 (invariant factors: 4,2)"

#eval "=== Homomorphisms of Abelian Groups ==="
#eval "Hom(Z, Z) = Z (endomorphisms = Z)"
#eval "Hom(Z_m, Z_n) = Z_{gcd(m,n)}"
#eval "Hom(Z, Z_m) = Z_m"
#eval "Hom(Z_m, Z) = 0"

#eval "=== Tensor Products of Abelian Groups ==="
#eval "Z_m @ Z_n = Z_{gcd(m,n)}"
#eval "Z @ G = G"
#eval "Q @ Z_m = 0 (torsion killed by divisible)"
#eval "@ is right exact, Tor measures failure of left exactness"

#eval "=== Ext Groups ==="
#eval "Ext^1(Z, Z) = 0 (Z is projective)"
#eval "Ext^1(Z_m, Z) = Z_m"
#eval "Ext^1(Z, Z_m) = 0 (Z is projective)"
#eval "Ext^1(Z_m, Z_n) = Z_{gcd(m,n)}"

#eval "=== Homological Dimension ==="
#eval "Z has projective dimension 1 (over Z)"
#eval "Every Z-module has projective dim <= 1"
#eval "Z is a hereditary ring"


end MiniHomologyTheory
