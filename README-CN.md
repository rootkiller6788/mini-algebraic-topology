# 迷你代数拓扑

一套**从零开始、零依赖的 Lean 4 实现**，涵盖大学层次的代数拓扑：基本群、同调/上同调论、同伦论、CW复形、纤维丛与谱序列。每个子包对标 MIT（及其他顶尖大学）课程，使用 Lean 4 证明助手构建代数拓扑的形式化基础。

## 子模块

| 子模块 | 主题 | 对标课程 |
|--------|------|----------|
| [mini-cohomology](mini-cohomology/) | 单纯上同调、杯积、长正合序列、Mayer-Vietoris、切除公理、层上同调、微分分次代数 | MIT 18.905, Harvard Math 231 |
| [mini-cw-complexes](mini-cw-complexes/) | CW胞腔、关联系统、骨架、欧拉示性数、胞腔同调、球面/环面/RP^n/CP^n 示例、CW谱 | MIT 18.905, UChicago Math 317 |
| [mini-fiber-bundles](mini-fiber-bundles/) | 主丛、向量丛、联络、曲率、Chern-Weil理论、分类空间、示性类、K理论 | MIT 18.906, Harvard Math 231 |
| [mini-fundamental-group](mini-fundamental-group/) | 道路、环路、同伦、π₁(S¹)≅ℤ、Van Kampen定理、覆叠空间、曲面群、扭结理论、辫群 | MIT 18.904, Harvard Math 131 |
| [mini-higher-homotopy](mini-higher-homotopy/) | 高阶同伦群 π_n、Postnikov塔、稳定同伦论、阻碍理论、分类空间、有理同伦论 | MIT 18.905, UChicago Math 317 |
| [mini-homology-theory](mini-homology-theory/) | 链复形、阿贝尔群、蛇引理、五引理、长正合序列、Mayer-Vietoris、单纯同调、导出范畴 | MIT 18.905, Cambridge Part III |
| [mini-homotopy-theory](mini-homotopy-theory/) | 同伦等价、形变收缩、余纤维化、模型范畴、有理同伦论、稳定同伦论 | MIT 18.904, MIT 18.905 |
| [mini-spectral-sequences](mini-spectral-sequences/) | 双分次页、微分、Serre谱序列、Atiyah-Hirzebruch谱序列、Adams谱序列、Hopf不变量、稳定同伦干 | MIT 18.906, Harvard Math 231 |

## 设计理念

- **零外部依赖** — 纯 Lean 4，Lake 构建，无需 Mathlib
- **模块自包含** — 每个子模块自带 `lakefile.lean`，包含 Core/、Morphisms/、Constructions/、Theorems/、Examples/、Advanced/
- **理论与实践映射** — 每个模块包含内联 `#eval` 示例与形式化定理陈述
- **课程对标** — 每个子模块跟踪 L1-L9 知识层级，对标九校课程体系（MIT、Harvard、Princeton、Stanford、Cambridge、Oxford、UChicago、Berkeley、ETH）

## 构建方式

每个子模块独立构建，使用 Lake：

```bash
cd mini-cohomology
lake build
lake env lean --run Main.lean
```

需要 **Lean 4** 和 **Lake**。

## 项目结构

```
11. mini-algebraic-topology/
├── mini-cohomology/                 # 单纯上同调、杯积、Mayer-Vietoris、层上同调
├── mini-cw-complexes/               # CW胞腔、骨架、欧拉示性数、胞腔同调、CW谱
├── mini-fiber-bundles/              # 主丛/向量丛、联络、Chern-Weil、分类空间
├── mini-fundamental-group/          # π₁、Van Kampen、覆叠空间、曲面群、扭结理论
├── mini-higher-homotopy/            # π_n、Postnikov塔、稳定同伦论、阻碍理论
├── mini-homology-theory/            # 链复形、蛇引理/五引理、长正合序列、导出范畴
├── mini-homotopy-theory/            # 同伦等价、余纤维化、模型范畴、有理同伦论
├── mini-spectral-sequences/         # Serre/Adams/Atiyah-Hirzebruch 谱序列、Hopf不变量、稳定同伦干
├── lean-toolchain
├── .gitignore
├── README.md
└── README-CN.md
```

## 许可证

MIT
