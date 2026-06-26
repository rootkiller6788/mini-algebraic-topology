/-
# MiniFundamentalGroup

Fundamental group theory package covering:
- Core: Topological spaces, paths, homotopy, π₁ definition, group structure,
  functoriality, basepoint dependence, change of basepoint
- Constructions: Product spaces, wedge sums, covering spaces, lifting properties
- Theorems: π₁(S¹) ≅ ℤ, Van Kampen, Brouwer fixed point, fundamental theorem
  of algebra via winding number
- Computation: Winding numbers, graph fundamental groups, surface groups,
  presentations from 2-skeleta
- Examples: Spheres S^n, Tori T^n, projective spaces, Klein bottle,
  surfaces of genus g, Eilenberg-MacLane spaces
- Applications: Knot theory (Wirtinger presentations), configuration spaces
  (braid groups), robotics motion planning
- Advanced: Higher homotopy groups π_n, Whitehead theorem, long exact
  sequence of a fibration
- Bridges: To group theory (free groups, presentations), to geometry
  (uniformization, Riemann surfaces), to physics (anyons), to computation
  (discrete fundamental group algorithms)
-/

import MiniFundamentalGroup.Core.Basic
import MiniFundamentalGroup.Core.GroupStructure
import MiniFundamentalGroup.Core.Functoriality
import MiniFundamentalGroup.Constructions.Products
import MiniFundamentalGroup.Constructions.CoveringSpaces
import MiniFundamentalGroup.Theorems.CircleGroup
import MiniFundamentalGroup.Theorems.VanKampen
import MiniFundamentalGroup.Theorems.BrouwerFixedPoint
import MiniFundamentalGroup.Computation.WindingNumber
import MiniFundamentalGroup.Computation.GraphFundamentalGroup
import MiniFundamentalGroup.Examples.Spheres
import MiniFundamentalGroup.Examples.Surfaces
import MiniFundamentalGroup.Applications.KnotTheory
import MiniFundamentalGroup.Applications.ConfigurationSpaces
import MiniFundamentalGroup.Advanced.HigherHomotopy
import MiniFundamentalGroup.Bridges.ToAlgebra
import MiniFundamentalGroup.Bridges.ToGeometry
