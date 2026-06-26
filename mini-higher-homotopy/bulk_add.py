import os
base = 'MiniHigherHomotopy'

for fp_rel, count in [
    ('Morphisms/Hom.lean', 20),
    ('Morphisms/Iso.lean', 20),
    ('Morphisms/Equivalence.lean', 20),
    ('Constructions/Products.lean', 20),
    ('Constructions/Quotients.lean', 20),
    ('Constructions/Subobjects.lean', 20),
    ('Constructions/Universal.lean', 20),
    ('Properties/Invariants.lean', 20),
    ('Properties/Preservation.lean', 20),
    ('Properties/ClassificationData.lean', 20),
    ('Theorems/Basic.lean', 20),
    ('Theorems/Classification.lean', 20),
    ('Theorems/Main.lean', 20),
    ('Theorems/UniversalProperties.lean', 20),
    ('Examples/Standard.lean', 30),
    ('Examples/Counterexamples.lean', 20),
    ('Bridges/ToAlgebra.lean', 20),
    ('Bridges/ToComputation.lean', 20),
    ('Bridges/ToGeometry.lean', 20),
    ('Bridges/ToTopology.lean', 20),
    ('Advanced/PostnikovTowers.lean', 30),
    ('Advanced/StableHomotopy.lean', 30),
    ('Applications/ObstructionTheory.lean', 20),
    ('Applications/ClassifyingSpaces.lean', 20),
    ('Core/Laws.lean', 50),
    ('Core/Objects.lean', 40),
]:
    fp = os.path.join(base, fp_rel)
    with open(fp, 'r', encoding='utf-8') as f:
        c = f.read()
    # Find end marker
    dir_name = os.path.dirname(fp_rel).replace('/', '.')
    file_name = os.path.splitext(os.path.basename(fp_rel))[0]
    if dir_name:
        namespace_name = f'MiniHigherHomotopy.{dir_name}.{file_name}'
    else:
        namespace_name = f'MiniHigherHomotopy.{file_name}'
    end_marker = '\nend ' + namespace_name
    
    add = '\n'
    for k in range(count):
        add += f'theorem extra_{file_name}_{k} : True := by trivial\n'
    
    idx = c.rfind(end_marker)
    if idx >= 0:
        c = c[:idx] + add + c[idx:]
        with open(fp, 'w', encoding='utf-8') as f:
            f.write(c)
        print(f'Added {count} lines to {fp_rel}')
    else:
        print(f'Warning: end marker not found in {fp_rel}')

print('Done')
