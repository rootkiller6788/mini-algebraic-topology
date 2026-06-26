/-
# MiniCohomology — Cohomology Theory for Mini Math Kernel

Root aggregator importing all modules of the mini-cohomology package.
Covers simplicial cohomology, cup products, exact sequences,
characteristic classes, and advanced topics in cohomology theory.

Knowledge coverage: L1-L6 Complete, L7-L9 Partial+
-/

import MiniCohomology.Core.AbelianGroup
import MiniCohomology.Core.Simplex
import MiniCohomology.Core.SimplicialComplex
import MiniCohomology.Core.Cochain
import MiniCohomology.Core.CohomologyGroup

import MiniCohomology.Morphisms.SimplicialMaps

import MiniCohomology.Constructions.CupProduct
import MiniCohomology.Constructions.RelativeCohomology
import MiniCohomology.Constructions.LongExactSequence
import MiniCohomology.Constructions.DifferentialGradedAlgebra

import MiniCohomology.Theorems.MayerVietoris
import MiniCohomology.Theorems.Excision

import MiniCohomology.Examples.BasicComputations
import MiniCohomology.Examples.KnownCohomology
import MiniCohomology.Examples.SpectralSequenceIntro
import MiniCohomology.Examples.ComputationalCohomology
import MiniCohomology.Examples.TopologicalInvariants
import MiniCohomology.Examples.CohomologySummary

import MiniCohomology.Applications.CohomologyApplications

import MiniCohomology.Properties.CohomologyProperties
import MiniCohomology.Properties.HomotopyInvarianceProperties

import MiniCohomology.Advanced.SheafCohomology
import MiniCohomology.Advanced.HigherStructures
