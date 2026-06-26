# Mini Algebraic Topology

A collection of **from-scratch, zero-dependency Lean 4 implementations** of university-level algebraic topology: fundamental groups, homology/cohomology theories, homotopy theory, CW complexes, fiber bundles, and spectral sequences. Each sub-package maps to MIT (and other top-tier university) courses, building the foundations of algebraic topology using the Lean 4 proof assistant.

## Sub-Modules

| Sub-Module | Topics | Key Courses |
|------------|--------|-------------|
| [mini-cohomology](mini-cohomology/) | Simplicial cohomology, cup products, long exact sequences, Mayer-Vietoris, excision, sheaf cohomology, differential graded algebras | MIT 18.905, Harvard Math 231 |
| [mini-cw-complexes](mini-cw-complexes/) | CW cells, incidence systems, skeleta, Euler characteristic, cellular homology, sphere/torus/RP^n/CP^n examples, CW spectra | MIT 18.905, UChicago Math 317 |
| [mini-fiber-bundles](mini-fiber-bundles/) | Principal bundles, vector bundles, connections, curvature, Chern-Weil theory, classifying spaces, characteristic classes, K-theory | MIT 18.906, Harvard Math 231 |
| [mini-fundamental-group](mini-fundamental-group/) | Paths, loops, homotopy, π₁(S¹)≅ℤ, Van Kampen theorem, covering spaces, surfaces, free groups, knot theory, braid groups | MIT 18.904, Harvard Math 131 |
| [mini-higher-homotopy](mini-higher-homotopy/) | Higher homotopy groups π_n, Postnikov towers, stable homotopy, obstruction theory, classifying spaces, rational homotopy | MIT 18.905, UChicago Math 317 |
| [mini-homology-theory](mini-homology-theory/) | Chain complexes, abelian groups, Snake Lemma, Five Lemma, long exact sequences, Mayer-Vietoris, simplicial homology, derived categories | MIT 18.905, Cambridge Part III |
| [mini-homotopy-theory](mini-homotopy-theory/) | Homotopy equivalences, deformation retracts, cofibrations, model categories, rational homotopy, stable homotopy theory | MIT 18.904, MIT 18.905 |
| [mini-spectral-sequences](mini-spectral-sequences/) | Bigraded pages, differentials, Serre SS, Atiyah-Hirzebruch SS, Adams SS, Hopf invariant, stable stems, chromatic deep dive | MIT 18.906, Harvard Math 231 |

## Design Philosophy

- **Zero external dependencies** — Pure Lean 4, built with Lake, no Mathlib required
- **Self-contained sub-modules** — Each has its own `lakefile.lean` with Core/, Morphisms/, Constructions/, Theorems/, Examples/, Advanced/
- **Theory-to-code mapping** — Every module includes inline `#eval` examples and formally stated theorems
- **Course alignment** — Each sub-module tracks L1-L9 knowledge levels mapping to nine-school curricula (MIT, Harvard, Princeton, Stanford, Cambridge, Oxford, UChicago, Berkeley, ETH)

## Building

Each sub-module is standalone. Build with Lake:

```bash
cd mini-cohomology
lake build
lake env lean --run Main.lean
```

Requires **Lean 4** and **Lake**.

## Project Structure

```
11. mini-algebraic-topology/
├── mini-cohomology/                 # Simplicial cohomology, cup products, Mayer-Vietoris, sheaf cohomology
├── mini-cw-complexes/               # CW cells, skeleta, Euler characteristic, cellular homology, CW spectra
├── mini-fiber-bundles/              # Principal/vector bundles, connections, Chern-Weil, classifying spaces
├── mini-fundamental-group/          # π₁, Van Kampen, covering spaces, surface groups, knot theory
├── mini-higher-homotopy/            # π_n, Postnikov towers, stable homotopy, obstruction theory
├── mini-homology-theory/            # Chain complexes, Snake/Five lemmas, long exact sequences, derived categories
├── mini-homotopy-theory/            # Homotopy equivalences, cofibrations, model categories, rational homotopy
├── mini-spectral-sequences/         # Serre/Adams/Atiyah-Hirzebruch SS, Hopf invariant, stable stems
├── lean-toolchain
├── .gitignore
├── README.md
└── README-CN.md
```

## License

MIT
