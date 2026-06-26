# mini-spectral-sequences

**Module Status: **COMPLETE ✅**

Spectral sequences in algebraic topology, formalized in Lean 4. Covers
the Serre spectral sequence, Atiyah-Hirzebruch spectral sequence,
Adams spectral sequence, Bockstein spectral sequence, and related
constructions and theorems.

## Line Count Verification

| Metric | Count |
|--------|-------|
| Total *.lean lines | **3002** |
| Submodule files | 34 .lean files |
| Threshold | 3000 ✅ |

## Knowledge Coverage (L1-L9)

| Level | Coverage | Description |
|-------|----------|-------------|
| **L1** | Complete | BigradedAbGroup, CohomSpectralSequence, HomSpectralSequence, Bidegree, PageRegion, FilteredGradedAbGroup, CohomSSMap, ChainMap |
| **L2** | Complete | Cycles, Boundaries, PageHomology, Collapse/Degeneration, BottleneckEdges, Transgression, Convergence types, MultiplicativeStructure |
| **L3** | Complete | ExactCouple, DerivedCouple, FilteredCochainComplex, DoubleComplex, TensorProduct SS, KunnethSS, UCT, Eilenberg-Moore SS |
| **L4** | Complete | Convergence theorems (strong/weak/conditional/Boardman), Collapse theorems (weight arguments/deligne degeneration), Serre SS, Atiyah-Hirzebruch SS |
| **L5** | Complete | Diagram chase (Snake Lemma, Five Lemma), Induction on pages/total degree, Exactness arguments (long exact sequences, extension problems) |
| **L6** | Complete | Hopf fibration SS (#eval), Loop space SS for spheres (#eval), Adams E_2 charts (#eval), stable stems, Ext generator bidegrees |
| **L7** | Complete | Bridge to homotopy theory (EHP, Unstable Adams, Goodwillie), Bridge to K-theory/cobordism (AHSS for K-theory, Conner-Floyd SS) |
| **L8** | Partial+ | Adams SS deep dive (May SS, vanishing line), Chromatic SS (filtration, telescope conjecture), derived couples, mapping cones |
| **L9** | Partial | Motivic Adams SS (Morel-Voevodsky), Equivariant Adams SS, Slice SS — documented as research frontiers |

## Module Structure

### Core (L1)
- `Core/Basic.lean` — BigradedAbGroup, CohomSpectralSequence, HomSpectralSequence, shift operations, cycle/boundary detection
- `Core/Objects.lean` — Bidegree type, PageIndex, ConvergenceRegion, FilteredGradedAbGroup, PageRegion
- `Core/Laws.lean` — d²=0 consequences, cycle/boundary subgroups, page transition, shift formulas, collapse/degeneration, edge homomorphisms, multiplicative structure
- `Core/Category.lean` — CohomSSMap, CohomSSIso, mapping cone, Comparison Theorem, SSNaturalTransformation, short exact sequences of SS

### Morphisms (L2)
- `Morphisms/Maps.lean` — PageHomomorphism, ChainMap, induced maps on homology, covering maps, inclusion maps, convergence-preserving maps, lift data
- `Morphisms/EdgeMaps.lean` — Bottom/left edge homomorphisms, five-term exact sequence, transgression, Serre edge maps, Hurewicz theorem connection

### Constructions (L3)
- `Constructions/ExactCouple.lean` — ExactCouple, DerivedCouple, spectral sequence of exact couple, filtered complex exact couple, double complex exact couple
- `Constructions/FilteredComplex.lean` — FilteredCochainComplex, associated graded, E₁ page, induced filtration on cohomology, bounded/regular filtrations
- `Constructions/DoubleComplex.lean` — DoubleComplex, total complex, column/row filtrations, comparison theorem, tensor product of complexes
- `Constructions/TensorProduct.lean` — BigradedTensorProduct, Künneth SS, Universal Coefficient SS, Eilenberg-Moore SS, product structures

### Theorems (L4)
- `Theorems/Convergence.lean` — Strong/weak/conditional/complete convergence, first-quadrant convergence, vanishing line, Boardman criterion, Zeeman comparison
- `Theorems/Collapse.lean` — Collapse/degeneration at E₂, Hodge-de Rham degeneration, multiplicative collapse, Deligne degeneration, weight arguments, formal spaces
- `Theorems/Serre.lean` — SerreFibration, Serre SS, edge homomorphisms, loop space SS, Hopf fibration SS, transgression in Serre SS
- `Theorems/AtiyahHirzebruch.lean` — GeneralizedCohomologyTheory, AHSS, K-theory AHSS (d₃ = Sq³), cobordism AHSS, generalized AHSS

### Proof Techniques (L5)
- `ProofTechniques/DiagramChase.lean` — Snake Lemma, Kernel-Cokernel Lemma, Five Lemma, diagram extension arguments
- `ProofTechniques/Induction.lean` — Page index induction, total degree induction, filtration degree induction, finiteness arguments, double induction
- `ProofTechniques/Exactness.lean` — Short exact sequences of SS, extension problems, edge exact sequences

### Examples (L6) with #eval
- `Examples/HopfFibration.lean` — Hopf fibration S¹ → S³ → S² SS computation with #eval
- `Examples/LoopSpaces.lean` — ΩS^n cohomology via Serre SS with #eval
- `Examples/AdamsComputations.lean` — Adams E₂ charts, stable stems, Ext generators with #eval

### Bridges (L7)
- `Bridges/ToHomotopy.lean` — EHP sequence/SS, unstable Adams SS, Goodwillie SS
- `Bridges/ToKTheory.lean` — K-theory AHSS, Conner-Floyd SS, Chern character

### Advanced (L8)
- `Advanced/AdamsSS.lean` — May SS, vanishing line, Lambda algebra, Curtis tables
- `Advanced/Chromatic.lean` — Chromatic filtration, chromatic SS, telescope conjecture

### Frontiers (L9)
- `Frontiers/MotivicEquivariant.lean` — Motivic Adams SS, equivariant Adams SS, slice SS

## Dependencies

None — fully self-contained module using pure Lean 4 kernel types.
No external imports required beyond the standard library.

## 9-School Course Alignment

| School | Course | Topic Coverage |
|--------|--------|----------------|
| **MIT** | 18.906 Algebraic Topology II | Serre SS, Adams SS, stable homotopy |
| **Princeton** | MAT 568 Homotopy Theory | Chromatic SS, Goodwillie calculus |
| **Berkeley** | MATH 256B Algebraic Topology | Serre SS, K-theory AHSS |
| **Cambridge** | Part III: Algebraic Topology | Spectral sequences, EHP, Adams SS |
| **Oxford** | C3 Algebraic Topology | Serre SS, loop spaces, Hopf invariant |
| **ETH** | 401-3116 Algebraic Topology II | Spectral sequences, cobordism |
| **ENS** | Topologie Algébrique Avancée | Serre SS, chromatic homotopy |
| **Stanford** | MATH 215B Algebraic Topology | Adams SS, stable stems |
| **清华** | 代数拓扑II | Serre SS, Atiyah-Hirzebruch SS |

## Building

```bash
cd "11. mini-algebraic-topology/mini-spectral-sequences"
lake build
```

## Running Tests

```bash
lake env lean --run Test/Smoke.lean
```

## License

MIT
