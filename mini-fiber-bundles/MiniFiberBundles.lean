/-
# MiniFiberBundles — Fiber Bundle Theory in Algebraic Topology

This module provides a comprehensive formalization of fiber bundle theory:
- Topological foundations
- Fiber bundles, vector bundles, principal bundles
- Characteristic classes (Stiefel-Whitney, Chern, Euler, Pontryagin)
- Connections and curvature (Ehresmann, Chern-Weil)
- Concrete finite examples with #eval verification
- Applications to gauge theory, K-theory, obstruction theory

## Sub-packages
- `Topology` — Topological spaces, continuity, homeomorphisms, homotopy
- `BundleCore` — Fiber bundles, local trivializations, bundle maps, sections
- `VectorBundle` — Vector bundles, operations, frame bundles, Grassmannians
- `PrincipalBundle` — Principal G-bundles, associated bundles, classifying spaces
- `CharClass` — Stiefel-Whitney, Chern, Euler, Pontryagin classes
- `Connection` — Ehresmann connections, curvature, parallel transport, holonomy
- `Examples` — Finite/discrete bundle models with #eval verification
- `Applications` — Gauge theory, K-theory, obstruction theory, index theory
-/

import MiniFiberBundles.Prelude
import MiniFiberBundles.Core
