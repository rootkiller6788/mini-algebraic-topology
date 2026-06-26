import MiniSpectralSequences
namespace MiniSpectralSequences

/-- Hopf fibration SS computation: E_2^{p,q} = H^p(S^2) ⊗ H^q(S^1).
    Generators: 1∈(0,0), u∈(2,0), v∈(0,1), uv∈(2,1).
    d_2(v) = u, killing (0,1) and (2,0).
    E_3 = E_∞ has only Z at (0,0) and Z at (2,1) = H^*(S^3). -/
def hopf_computation_steps : List String := [
  "E_2^{0,0} = Z·1",
  "E_2^{0,1} = Z·v",
  "E_2^{2,0} = Z·u",
  "E_2^{2,1} = Z·uv",
  "d_2(v) = u",
  "E_3^{0,1} = ker(d_2)/im(d_2) = 0/0 = 0",
  "E_3^{2,0} = 0 (since u = d_2(v) is a boundary)",
  "E_3^{0,0} = Z, E_3^{2,1} = Z",
  "E_∞ = E_3, so H^*(S^3) has Z in degrees 0 and 3"
]

#eval "Hopf fibration SS:"
#eval hopf_computation_steps

/-- RP^2 cohomology via the Serre SS of S^0 → S^2 → RP^2.
    The Z/2 cohomology of RP^2 is Z/2 in degrees 0,1,2. -/
def RP2_cohomology : List String := [
  "H^0(RP^2; Z/2) = Z/2",
  "H^1(RP^2; Z/2) = Z/2",
  "H^2(RP^2; Z/2) = Z/2"
]

#eval "RP^2 cohomology (mod 2):"
#eval RP2_cohomology

/-- CP^2 cohomology via the Serre SS of S^1 → S^5 → CP^2.
    H^*(CP^2; Z) = Z[c]/(c^3) with |c|=2. -/
def CP2_cohomology : List String := [
  "H^0(CP^2) = Z",
  "H^2(CP^2) = Z·c",
  "H^4(CP^2) = Z·c^2",
  "H^odd(CP^2) = 0"
]

#eval "CP^2 cohomology:"
#eval CP2_cohomology

/-- ΩS^2 cohomology: The Serre SS of ΩS^2 → PS^2 → S^2 gives
    H^*(ΩS^2) ≅ Z[x] with |x|=1 (divided power algebra). -/
def OmegaS2_computation : List String := [
  "E_2^{0,q} = H^q(ΩS^2)",
  "E_2^{2,q} = Z·u ⊗ H^q(ΩS^2)",
  "d_2(x_1) = u (transgression)",
  "forcing H^*(ΩS^2) = Z[x_1, x_2, ...]/(relations)"
]

#eval "Omega S^2 computation:"
#eval OmegaS2_computation

/-- K(Z,2) cohomology: The path fibration K(Z,1) → PK(Z,2) → K(Z,2)
    with K(Z,1) ≃ S^1 gives H^*(K(Z,2)) = Z[c_1] with |c_1|=2. -/
def KZ2_computation : List String := [
  "K(Z,1) = S^1, H^*(S^1) = E(v_1) with |v_1|=1",
  "d_2(v_1) = c_1 (transgression)",
  "By induction, H^*(K(Z,2)) = Z[c_1]"
]

#eval "K(Z,2) computation:"
#eval KZ2_computation

/-- The Adams SS for the sphere at p=2: First few differentials.
    d_2(h_2) = h_0·h_1^2, d_2(h_3) = h_1·h_2. -/
def adams_differentials_p2 : List String := [
  "d_2(h_1) = 0",
  "d_2(h_2) = h_0·h_1^2 (kills h_2 in E_3)",
  "d_2(h_3) = h_1·h_2 (kills h_3 in E_3)",
  "d_3(h_0·h_3) = h_0^4 (kills h_0·h_3)",
  "d_3(h_1·h_3) = h_1·h_0^3"
]

#eval "Adams d_2 and d_3:"
#eval adams_differentials_p2

/-- K-theory of CP^n via the Atiyah-Hirzebruch SS.
    E_2^{p,q} = H^p(CP^n; KU^q(pt)).
    Since CP^n has only even cohomology, the SS collapses at E_2. -/
def K_theory_CPn : List String := [
  "E_2^{2k, 2m} = Z for 0≤k≤n, m∈Z",
  "All other E_2^{p,q} = 0",
  "SS collapses (all differentials land in 0)",
  "KU^*(CP^n) = Z[t]/(t^{n+1}) with |t|=0"
]

#eval "K-theory of CP^n via AHSS:"
#eval K_theory_CPn

/-- Stable homotopy groups of spheres (partial table at p=2). -/
def stable_stems_table : List (Nat × String) := [
  (0, "Z"),
  (1, "Z/2 (η)"),
  (2, "Z/2 (η^2)"),
  (3, "Z/24 (ν)"),
  (4, "0"),
  (5, "0"),
  (6, "Z/2 (ν^2)"),
  (7, "Z/240 (σ)"),
  (8, "Z/2 ⊕ Z/2 (ησ, ε)"),
  (9, "Z/2 ⊕ Z/2 ⊕ Z/2 (η^2σ, ηε, μ)"),
  (10, "Z/6"),
  (11, "Z/504"),
  (12, "0"),
  (13, "Z/2 ⊕ Z/2"),
  (14, "Z/2 ⊕ Z/2"),
  (15, "Z/480 ⊕ Z/2")
]

#eval "Stable homotopy groups:"
#eval stable_stems_table

/-- The Adams-Novikov SS at p=2: First few families.
    alpha_1 in stem 1, alpha_2 in stem 3, etc. -/
def anss_families : List String := [
  "alpha_1 (stem 1): η",
  "alpha_2 (stem 3): ν/2",
  "alpha_3 (stem 7): σ",
  "beta_1 (stem 10): detected by ANSS",
  "beta_2 (stem 26)",
  "beta_3 (stem 58)"
]

#eval "Adams-Novikov SS families:"
#eval anss_families

end MiniSpectralSequences