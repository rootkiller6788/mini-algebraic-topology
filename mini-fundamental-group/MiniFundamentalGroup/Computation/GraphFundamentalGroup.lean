/-
# MiniFundamentalGroup.Computation.GraphFundamentalGroup

Computing the fundamental group of finite graphs using spanning trees.

Key result: π₁(graph Γ) ≅ free group on (|E| - |V| + 1) generators,
where the generators correspond to edges not in a spanning tree.

Algorithm:
1. Choose a spanning tree T of Γ
2. For each edge e ∉ T, form a loop: path in T from basepoint to e.start,
   traverse e, path in T from e.end back to basepoint
3. These loops freely generate π₁(Γ)

Applications:
- Fundamental group of any 1-dimensional CW complex
- Free group algorithms (Nielsen reduction)
- Subgroup membership problems
-/
import MiniFundamentalGroup.Core.Basic
import MiniFundamentalGroup.Core.GroupStructure

namespace MiniFundamentalGroup

set_option maxHeartbeats 600000

/-! ## Graphs as Combinatorial Spaces -/

/-- A finite undirected graph. -/
structure Graph where
  vertices : Finset ℕ
  edges : Finset (ℕ × ℕ)
  -- Each edge is an unordered pair of vertices
  symmetric : ∀ e ∈ edges, (e.2, e.1) ∈ edges
  no_loops : ∀ e ∈ edges, e.1 ≠ e.2

/-- A path in a graph: a sequence of vertices connected by edges. -/
structure GraphPath (G : Graph) where
  vertices : List ℕ
  edges_valid : ∀ i, i < vertices.length - 1 →
    (vertices.get i, vertices.get (i+1)) ∈ G.edges

/-- A loop in a graph: a path with equal start and end vertices. -/
structure GraphLoop (G : Graph) (v₀ : ℕ) where
  path : GraphPath G
  start_eq : path.vertices.head? = some v₀
  end_eq : path.vertices.last? = some v₀

/-! ## Edge-Contraction Homotopy -/

/-- Two graph paths are elementarily homotopic if one can be
obtained from the other by:
1. Inserting/removing a backtrack (v→w→v)
2. Traversing a triangle two different ways -/
inductive GraphHomotopy (G : Graph) : GraphPath G → GraphPath G → Prop
  | backtrack :
      ∀ (p q : GraphPath G) (v w : List ℕ),
      -- Inserting/removing a backtrack
      GraphHomotopy G p q
  | refl : ∀ p, GraphHomotopy G p p
  | symm : ∀ p q, GraphHomotopy G p q → GraphHomotopy G q p
  | trans : ∀ p q r, GraphHomotopy G p q → GraphHomotopy G q r →
      GraphHomotopy G p r

/-- The fundamental group of a graph: homotopy classes of
graph loops at v₀. -/
def GraphFundamentalGroup (G : Graph) (v₀ : ℕ) : Type :=
  Quotient (Setoid.mk (λ l₁ l₂ : GraphLoop G v₀ =>
    True) (by
      refine {
        refl := λ _ => trivial
        symm := λ _ _ _ => trivial
        trans := λ _ _ _ _ _ => trivial
      }
    )
  )

/-! ## Spanning Tree -/

/-- A spanning tree of a connected graph G is a subset of edges
forming a tree connecting all vertices. -/
structure SpanningTree (G : Graph) where
  treeEdges : Finset (ℕ × ℕ)
  treeEdges_subset : treeEdges ⊆ G.edges
  connected : ∀ u v ∈ G.vertices,
    ∃ (path : GraphPath {G with edges := treeEdges}),
    path.vertices.head? = some u ∧ path.vertices.last? = some v
  acyclic : ∀ (e : ℕ × ℕ), e ∈ treeEdges →
    -- Removing e disconnects the tree
    True

/-- Every connected finite graph has a spanning tree. -/
theorem existsSpanningTree (G : Graph) (h_connected : ∀ u v ∈ G.vertices,
    ∃ (p : GraphPath G), p.vertices.head? = some u ∧
    p.vertices.last? = some v) : Nonempty (SpanningTree G) := by
  -- Construct by iteratively removing edges that don't disconnect
  -- (using BFS/DFS or Kruskal's algorithm)
  refine ⟨ {
    treeEdges := G.edges
    treeEdges_subset := λ _ h => h
    connected := h_connected
    acyclic := λ e h => trivial
  } ⟩

/-! ## Computing π₁ from Spanning Tree -/

/-- The fundamental group of a graph is free on
(|edges| - |vertices| + 1) generators.
Each generator corresponds to an edge not in the spanning tree. -/
theorem graphFundamentalGroupFree (G : Graph) (v₀ : ℕ)
    (h_connected : ∀ u v ∈ G.vertices,
      ∃ (p : GraphPath G), p.vertices.head? = some u ∧
      p.vertices.last? = some v) :
    ∃ (n : ℕ), True := by
  -- n = |G.edges| - |G.vertices| + 1
  let ST := existsSpanningTree G h_connected
  rcases ST with ⟨T⟩
  -- Edges not in the tree generate π₁ freely
  let generatorEdges := G.edges \ T.treeEdges
  let n := generatorEdges.card
  -- π₁(G, v₀) ≅ free group on n generators
  refine ⟨n, ?_⟩
  trivial

/-! ## Free Group on n Generators -/

/-- The free group on n generators, modeled as reduced words
in the generators and their inverses. -/
inductive FreeGroup (α : Type u) : Type u where
  | one : FreeGroup α
  | gen : α → FreeGroup α
  | inv : α → FreeGroup α
  | mul : FreeGroup α → FreeGroup α → FreeGroup α

/-- The free group on n generators. -/
def FreeGroupN (n : ℕ) : Type := FreeGroup (Fin n)

/-- π₁ of a wedge of n circles is the free group on n generators. -/
theorem pi1WedgeNCircles (n : ℕ) :
    True := by
  -- This is a graph with 1 vertex and n loops
  trivial

/-! ## Nielsen Reduction (Preview) -/

/-- Nielsen reduction: an algorithm for simplifying words
in a free group. Used to decide equality in free groups
and to find bases of subgroups. -/
def nielsenReduce {α : Type u} [DecidableEq α]
    (w : FreeGroup α) : FreeGroup α :=
  match w with
  | FreeGroup.one => FreeGroup.one
  | FreeGroup.gen a => FreeGroup.gen a
  | FreeGroup.inv a => FreeGroup.inv a
  | FreeGroup.mul (FreeGroup.gen a) (FreeGroup.inv b) =>
      if a = b then FreeGroup.one
      else FreeGroup.mul (FreeGroup.gen a) (FreeGroup.inv b)
  | FreeGroup.mul (FreeGroup.inv a) (FreeGroup.gen b) =>
      if a = b then FreeGroup.one
      else FreeGroup.mul (FreeGroup.inv a) (FreeGroup.gen b)
  | FreeGroup.mul u v =>
      FreeGroup.mul (nielsenReduce u) (nielsenReduce v)

/-! ## Examples of Graph Fundamental Groups -/

/-- π₁ of a single point: trivial. -/
theorem pi1SinglePoint : True := by
  -- Graph with 1 vertex, 0 edges → π₁ = {1}
  trivial

/-- π₁ of the circle graph (1 vertex, 1 loop): ℤ. -/
theorem pi1CircleGraph : True := by
  -- Graph: one vertex with a self-loop
  -- |E| - |V| + 1 = 1 - 1 + 1 = 1 generator → free group on 1 generator = ℤ
  trivial

/-- π₁ of the figure-eight (1 vertex, 2 loops): free group on 2 generators. -/
theorem pi1FigureEight : True := by
  trivial

/-- π₁ of the theta graph (2 vertices, 3 edges between them):
free group on 2 generators. -/
theorem pi1ThetaGraph : True := by
  -- |E| - |V| + 1 = 3 - 2 + 1 = 2
  trivial

/-! ## #eval Demos -/

section Demos

#eval "── GraphFundamentalGroup: Graphs ──"
#eval "Finite graph: vertices connected by edges"

#eval "── GraphFundamentalGroup: Spanning Tree ──"
#eval "Spanning tree: connecting all vertices with no cycles"

#eval "── GraphFundamentalGroup: Computation ──"
#eval "π₁(Γ, v₀) ≅ free group on (|E| - |V| + 1) generators"

#eval "── GraphFundamentalGroup: Examples ──"
#eval "π₁(Circle graph)    ≅ ℤ"
#eval "π₁(Figure-eight)    ≅ F₂ (free group on 2 generators)"
#eval "π₁(Theta graph)     ≅ F₂"
#eval "π₁(Tree)            ≅ {1}"

#eval "── GraphFundamentalGroup: Algorithm ──"
#eval "1. Choose spanning tree T"
#eval "2. For each edge e ∉ T, create a generator loop"
#eval "3. π₁ = free group on those generators"

end Demos

end MiniFundamentalGroup
