# Course Alignment — mini-homotopy-theory

| University | Course | Topics Covered |
|-----------|--------|----------------|
| **MIT** | 18.905 Algebraic Topology I | Fundamental group, covering spaces, Seifert-van Kampen |
| **Stanford** | MATH 210 Algebraic Topology | Homotopy groups, CW complexes, Hurewicz theorem |
| **Princeton** | MAT 560 Topology | Fibrations, spectral sequences, obstruction theory |
| **Berkeley** | MATH 202A Topology | Fundamental groupoid, homotopy equivalence |
| **Cambridge** | Part III Algebraic Topology | Model categories, stable homotopy, rational homotopy |
| **Oxford** | C3 Algebraic Topology | Category-theoretic homotopy theory, simplicial methods |
| **ETH** | 401-3132 Algebraic Topology | Cohomology, Eilenberg-MacLane spaces, Postnikov towers |
| **ENS** | Topologie Algébrique | Bourbaki approach: CW complexes, fibrations, exact sequences |
| **清华** | 抽象代数拓扑 | Fundamental groups, covering spaces, homology theory |

## Chapter Mapping

### Chapter 1: Homotopy and the Fundamental Group (MIT 18.905 Ch.1)
- Basic.lean: TwoComplex, edge-paths, homotopy
- FundamentalGroup.lean: pi_1 definition and computation
- Paths.lean: path spaces, loop spaces

### Chapter 2: Covering Spaces (Hatcher Ch.1)
- CoveringSpaces.lean: classification, deck transformations
- Paths.lean: path lifting

### Chapter 3: Seifert-van Kampen Theorem (Hatcher Ch.1)
- SeifertVanKampen.lean: pushout computation

### Chapter 4: Homology and the Hurewicz Theorem (Hatcher Ch.2)
- Hurewicz.lean: abelianization, H_1

### Chapter 5: Higher Homotopy Groups (Hatcher Ch.4)
- HigherHomotopyGroups.lean: pi_n for n>=2

### Chapter 6: Fibrations and Exact Sequences (Spanier Ch.7)
- Fibration.lean: HLP, Serre fibrations
- ExactSequence.lean: homotopy exact sequence

### Chapter 7: Spectral Sequences (McCleary)
- Spectral.lean: Serre SS, Atiyah-Hirzebruch SS

### Chapter 8: Obstruction Theory (Whitehead)
- ObstructionTheory.lean: primary and secondary obstructions

### Chapter 9: Advanced Topics (Various)
- ModelCategories.lean: Quillen model categories
- StableHomotopy.lean: spectra, stable stems
- RationalHomotopy.lean: Sullivan models, formality

### Chapter 10: Research Frontiers
- InfinityCategories.lean: quasi-categories, HoTT connection
