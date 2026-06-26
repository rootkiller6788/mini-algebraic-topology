/- Minimal Set Theory for MiniFiberBundles -/
def Set (a : Type u) : Type u := a -> Prop

namespace Set

def univ {a : Type u} : Set a := fun _ => True
def empty {a : Type u} : Set a := fun _ => False
def inter {a : Type u} (s t : Set a) : Set a := fun x => s x /\ t x
def union {a : Type u} (s t : Set a) : Set a := fun x => s x \/ t x
def compl {a : Type u} (s : Set a) : Set a := fun x => Not (s x)
def Subset {a : Type u} (s t : Set a) : Prop := forall x, s x -> t x
def preimage {a b : Type u} (f : a -> b) (s : Set b) : Set a := fun x => s (f x)
def image {a b : Type u} (f : a -> b) (s : Set a) : Set b := fun y => exists x, s x /\ f x = y
def sUnion {a : Type u} (S : Set (Set a)) : Set a := fun x => exists s, S s /\ s x
def sInter {a : Type u} (S : Set (Set a)) : Set a := fun x => forall s, S s -> s x
def singleton {a : Type u} (x0 : a) : Set a := fun x => x = x0
def prod {a b : Type u} (s : Set a) (t : Set b) : Set (Prod a b) := fun p => s p.1 /\ t p.2

theorem ext {a : Type u} {s t : Set a} (h : forall x, s x <-> t x) : s = t := by
  funext x; exact propext (h x)

theorem mem_univ {a : Type u} (x : a) : univ x := trivial

theorem not_mem_empty {a : Type u} (x : a) : Not (empty x) := fun h => h

theorem empty_subset {a : Type u} (s : Set a) : Subset empty s := fun x h => False.elim h

theorem sUnion_empty {a : Type u} : sUnion (empty : Set (Set a)) = empty := by
  apply ext; intro x; simp [sUnion, empty]

theorem sInter_empty {a : Type u} : sInter (empty : Set (Set a)) = univ := by
  apply ext; intro x; simp [sInter, empty, univ]

end Set
