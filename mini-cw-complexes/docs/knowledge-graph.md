# Knowledge Graph: CW Complexes

## L1: Core Definitions
- CWCell: dimension + unique id
- CWCell.vertex / CWCell.ncell: constructors
- IncidenceSystem: CWCell -> CWCell -> Int
- CWComplex: cells, incidence, d^2=0, hasVertex
- CWComplex.dim, cellsInDim, numCellsInDim, totalCells, skeleton
- CWComplex.eulerChar: chi = sum (-1)^n c_n
- 17+ concrete examples defined

## L2: Core Concepts
- Boundary operator: d_n maps n-cells to (n-1)-cells
- d^2 = 0 (fundamental identity)
- Dimension lemmas: boundary decreases dimension by 1
- 0-cells have empty boundary
- Skeleton filtration: X^(0) subset X^(1) subset ... subset X

## L3: Math Structures
- CWSubcomplex (subset closed under boundary)
- CWPair (X, A) for relative homology
- Skeleton subcomplexes
- Regular CW complexes (coefficients in {-1,0,1})

## L4: Fundamental Theorems
- boundarySquareZero (d^2=0)
- Euler-Poincare formula: chi = sum (-1)^n beta_n
- Euler characteristic is homotopy invariant
- chi(product) = chi(X) * chi(Y)
- chi(wedge) = chi(X) + chi(Y) - 1

## L5: Proof Techniques (7+ methods)
1. native_decide: finite combinatorial verification
2. omega: Presburger arithmetic
3. Structural induction on List/Nat
4. Case analysis (by_cases)
5. Simplification (simp)
6. Equational reasoning (calc)
7. Decision procedures (dec_trivial)

## L6: Canonical Examples (17+)
S^0..S^10, RP^2, CP^2, T^2, S1vS1, wedge of spheres,
product of spheres, graphs, Moore spaces, discrete spaces,
bouquet of circles, point, S^2xS^2, T^3, S^2xS^3, S^3xS^3, S^6xS^6

## L7: Applications
1. Topological Data Analysis (persistent homology)
2. Robotics (configuration spaces)
3. Computer Graphics (mesh processing)
4. Sensor Networks (coverage detection)
5. Protein Structure Analysis
6. Materials Science (pore networks)
7. Neuroscience (neural manifolds)
8. Social Choice Theory

## L8: Advanced Topics
1. CW Spectra (stable homotopy)
2. Model Categories (Quillen)
3. Rational Homotopy Theory (Sullivan)
4. Equivariant CW Complexes
5. Spectral Sequences (Serre, AHSS, Adams, Chromatic, May)
6. Handle Decompositions
7. Intersection Homology
8. Stratified Morse Theory

## L9: Research Frontiers
1. Homotopy Type Theory
2. Condensed Mathematics
3. Derived Algebraic Geometry
4. Chromatic Homotopy Theory
5. Factorization Homology
6. Topological Quantum Field Theory
7. Gromov-Witten Theory
8. Khovanov Homology
9. Heegaard Floer Homology
10. Symplectic Topology
