/
-/
import MiniHomologyTheory
set_option maxHeartbeats 600000

#eval "=== Homology Computation Algorithms ==="
#eval "Smith Normal Form for integer matrices"
#eval "Kernel: ker(M) via SNF"
#eval "Image: im(M) = column space"
#eval "Quotient: Z^m / im(M) via invariant factors"
#eval "Betti: rank(H_k) = dim(C_k) - rank(d_k) - rank(d_{k+1})"
#eval "Torsion: invariant factors > 1"

#eval "=== Example: Z -2-> Z ==="
#eval "d1=[2]: ker={0}, im=2Z"
#eval "H1=0, H0=Z2"

#eval "=== Example: Circle S^1 ==="
#eval "C1=Z, C0=Z, d1=0"
#eval "ker=Z, im=0 => H1=Z, H0=Z"

#eval "=== Example: Z^2 -[1 0;0 2]-> Z^2 ==="
#eval "ker = 0 (columns independent)"
#eval "im = Z + 2Z over Z"
#eval "H = Z^2 / im = Z_2"

#eval "=== Example: 3-term complex ==="
#eval "Z -0-> Z -2-> Z"
#eval "d2=0, d1(x)=2x"
#eval "ker(d2)=Z, im(d2)=0"
#eval "ker(d1)={0}, im(d1)=2Z"
#eval "H2=Z, H1=0, H0=Z2"

#eval "=== Computational Methods ==="
#eval "1. Smith Normal Form (diagonalization)"
#eval "2. Hermite Normal Form (row echelon)"
#eval "3. GCD-based elimination"
#eval "4. Saturation (computing ker/im quotients)"

#eval "=== Software Tools ==="
#eval "SageMath: chain_complex.homology()"
#eval "GAP/HAP: homology of simplicial complexes"
#eval "CHomP: computational homology software"
#eval "Perseus: persistent homology"

#eval "=== Applications ==="
#eval "Data analysis: persistent homology"
#eval "Topological data analysis (TDA)"
#eval "Sensor networks: coverage verification"
#eval "Materials science: void detection"

end MiniHomologyTheory
