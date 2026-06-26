# Course Tree — mini-homotopy-theory

## Prerequisites
```
Set Theory
  └── Point-Set Topology
        └── Fundamental Group (pi_1)
              └── Homotopy Theory ← THIS MODULE
                    ├── Homology Theory
                    ├── Cohomology
                    └── Spectral Sequences
```

## Internal Dependency Graph
```
Basic.lean (L1: TwoComplex, EdgePath, CellularMap)
  ├── HomotopyEquivalence.lean (L2: homotopy equivalence)
  ├── Paths.lean (L2: path spaces, loop spaces)
  ├── Contractible.lean (L2: contractible spaces)
  ├── Retraction.lean (L3: retracts, deformation retracts)
  ├── FundamentalGroup.lean (L2-L3: pi_1)
  │   ├── HigherHomotopyGroups.lean (L2-L3: pi_n)
  │   ├── RelativeGroups.lean (L3: pi_n(X,A))
  │   └── ExactSequence.lean (L4: fibration exact sequence)
  ├── Operations/
  │   ├── Composition.lean (L3: path composition)
  │   ├── InducedMaps.lean (L2: induced homomorphisms)
  │   └── Basepoint.lean (L2: basepoint change)
  ├── Theorems/
  │   ├── SeifertVanKampen.lean (L4: SvK)
  │   ├── Hurewicz.lean (L4: Hurewicz)
  │   ├── Whitehead.lean (L4: Whitehead)
  │   └── FibrationSequence.lean (L4: exact sequence)
  ├── Structures/
  │   ├── Fibration.lean (L3: fibrations)
  │   ├── Cofibration.lean (L3: cofibrations)
  │   └── HomotopyLimits.lean (L8: homotopy (co)limits)
  ├── Methods/
  │   ├── Cellular.lean (L5: cellular methods)
  │   ├── Spectral.lean (L5: spectral sequences)
  │   └── Obstruction.lean (L5: obstruction theory)
  ├── Examples/ (L6)
  │   ├── Spheres.lean
  │   ├── ProjectiveSpaces.lean
  │   ├── EilenbergMacLane.lean
  │   └── HopfFibration.lean
  ├── Applications/ (L7)
  │   ├── FixedPointTheory.lean
  │   ├── CoveringSpaces.lean
  │   └── ObstructionTheory.lean
  ├── Advanced/ (L8)
  │   ├── ModelCategories.lean
  │   ├── StableHomotopy.lean
  │   └── RationalHomotopy.lean
  └── Research/ (L9)
      └── InfinityCategories.lean
```

## Knowledge Flow
- L1 (Basic) → L2 (Concepts) → L3 (Structures) → L4 (Theorems)
- L1 → L5 (Methods) → L6 (Examples) → L7 (Applications)
- L4 → L8 (Advanced) → L9 (Research)
