# Knowledge Graph — mini-homotopy-theory

## L1: Core Definitions
- TwoComplex (finite 2-dimensional cell complex)
- EdgeStep (oriented edge step in a path)
- EdgePath (sequence of compatible edge steps)
- CellularMap (cellular map between 2-complexes)
- reduceSpurs (spur reduction on edge-paths)
- fullReduce (full reduction: spurs + face relations)
- FundamentalGroup (type alias)
- HomotopyEquivalence (structure)

## L2: Core Concepts
- Homotopy of edge-paths (via spur and face reduction)
- Fundamental group (edge-path group modulo face relations)
- Induced maps on fundamental groups
- Basepoint change isomorphism
- Loop space and iterated loop spaces
- Path concatenation and inversion
- Cellular map composition

## L3: Math Structures
- Fundamental groupoid (vertices as objects, paths as morphisms)
- Fibration data (total space, base, fiber, projection)
- Exact sequence of a fibration
- Pushout data (for Seifert-van Kampen)
- Wedge sum and suspension operations
- TwoComplexPair (relative homotopy)
- Retract and deformation retract structures

## L4: Fundamental Theorems
- Seifert-van Kampen theorem (implemented via pushout computation)
- Hurewicz theorem (pi_1 abelianization = H_1)
- Whitehead theorem (weak equivalence = homotopy equivalence for CW complexes)
- Homotopy exact sequence of a fibration
- Euler characteristic as homotopy invariant
- Contractibility of cones

## L5: Proof Techniques
- Cellular methods (computation on 2-skeletons)
- Spectral sequence methods (Serre SS, Atiyah-Hirzebruch SS)
- Obstruction theory (primary and secondary obstructions)
- Combinatorial computation (edge-path enumeration and reduction)
- Floyd-Warshall connectivity algorithm
- Finite state space enumeration

## L6: Canonical Examples
- S1 (fundamental group = Z)
- S2 (simply connected, chi = 2)
- T2 (fundamental group = Z x Z, chi = 0)
- RP2 (fundamental group = Z/2Z, chi = 1)
- Klein bottle (fundamental group = <a,b | aba^{-1}b>)
- Figure-eight (fundamental group = F_2, free group)
- Moore spaces M(Z/n, 1) (fundamental group = Z/n)
- Dunce cap (contractible but not collapsible)
- Projective spaces (RP^n, CP^n truncated to 2-skeleton)
- Eilenberg-MacLane spaces K(G,1)
- Lens spaces L(p,1)

## L7: Applications
- Fixed point theory (Lefschetz number, Brouwer fixed point)
- Covering space theory (classification by subgroups of pi_1)
- Obstruction theory (extension and lifting problems)
- Combinatorial group theory (group presentations from 2-complexes)
- Topological data analysis foundations

## L8: Advanced Topics
- Quillen model categories (axioms, homotopy category)
- Stable homotopy theory (spectra, stable stems)
- Rational homotopy theory (Sullivan models, formality)
- Simplicial sets and simplicial homotopy theory
- Homotopy limits and colimits

## L9: Research Frontiers
- Infinity-categories and quasi-categories
- Univalent foundations (HoTT/UF connection)
- Chromatic homotopy theory
- Motivic homotopy theory
- Derived algebraic geometry
