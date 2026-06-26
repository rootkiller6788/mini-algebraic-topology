/-
# MiniHigherHomotopy �� Higher Homotopy Theory for Mini Math Kernel

Root aggregator importing all modules of the mini-higher-homotopy package.

## Module Structure
- Core: Basic definitions, objects, and laws of higher homotopy theory
- Morphisms: Homomorphisms, isomorphisms, and equivalences between homotopy structures
- Constructions: Products, quotients, subobjects, and universal constructions
- Properties: Homotopy invariants, preservation properties, and classification data
- Theorems: Whitehead theorem, Hurewicz theorem, Blakers-Massey, excision
- Examples: Standard examples (spheres, projective spaces) and counterexamples
- Bridges: Connections to algebra, computation, geometry, and topology
- Advanced: Postnikov towers, stable homotopy theory
- Applications: Obstruction theory, classifying spaces
- Test: Unit tests, regression tests, and smoke tests
-/

import MiniHigherHomotopy.Core.Basic
import MiniHigherHomotopy.Core.Objects
import MiniHigherHomotopy.Core.Laws

import MiniHigherHomotopy.Morphisms.Hom
import MiniHigherHomotopy.Morphisms.Iso
import MiniHigherHomotopy.Morphisms.Equivalence

import MiniHigherHomotopy.Constructions.Products
import MiniHigherHomotopy.Constructions.Quotients
import MiniHigherHomotopy.Constructions.Subobjects
import MiniHigherHomotopy.Constructions.Universal

import MiniHigherHomotopy.Properties.Invariants
import MiniHigherHomotopy.Properties.Preservation
import MiniHigherHomotopy.Properties.ClassificationData

import MiniHigherHomotopy.Theorems.Basic
import MiniHigherHomotopy.Theorems.Classification
import MiniHigherHomotopy.Theorems.Main
import MiniHigherHomotopy.Theorems.UniversalProperties

import MiniHigherHomotopy.Examples.Standard
import MiniHigherHomotopy.Examples.Counterexamples

import MiniHigherHomotopy.Bridges.ToAlgebra
import MiniHigherHomotopy.Bridges.ToComputation
import MiniHigherHomotopy.Bridges.ToGeometry
import MiniHigherHomotopy.Bridges.ToTopology

import MiniHigherHomotopy.Advanced.PostnikovTowers
import MiniHigherHomotopy.Advanced.StableHomotopy

import MiniHigherHomotopy.Applications.ObstructionTheory
import MiniHigherHomotopy.Applications.ClassifyingSpaces

-- Test modules are standalone; not imported in library build
-- import MiniHigherHomotopy.Test.Examples
-- import MiniHigherHomotopy.Test.Regression
-- import MiniHigherHomotopy.Test.Smoke
