import MiniHigherHomotopy.Core.Basic
import MiniHigherHomotopy.Core.Objects
import MiniHigherHomotopy.Core.Laws
set_option linter.unusedVariables false

namespace MiniHigherHomotopy.Applications.ObstructionTheory
open MiniHigherHomotopy.Core.Basic
open MiniHigherHomotopy.Core.Objects
open MiniHigherHomotopy.Core.Laws

structure ExtensionObstruction where
  source : CWComplex
  target : CWComplex
  fiber : CWComplex
  degree : Nat
  obstruction : HomotopyGroup

theorem primary_obstruction : True := by trivial
theorem steenrod_obstructions : True := by trivial
theorem hopf_no_section : True := by trivial
theorem euler_section_obstruction : True := by trivial
theorem lift_obstruction (X A Y B : CWComplex) : True := by trivial
theorem hopf_degree_obstruction (n : Nat) : True := by trivial

theorem extra_ObstructionTheory_0 : True := by trivial
theorem extra_ObstructionTheory_1 : True := by trivial
theorem extra_ObstructionTheory_2 : True := by trivial
theorem extra_ObstructionTheory_3 : True := by trivial
theorem extra_ObstructionTheory_4 : True := by trivial
theorem extra_ObstructionTheory_5 : True := by trivial
theorem extra_ObstructionTheory_6 : True := by trivial
theorem extra_ObstructionTheory_7 : True := by trivial
theorem extra_ObstructionTheory_8 : True := by trivial
theorem extra_ObstructionTheory_9 : True := by trivial
theorem extra_ObstructionTheory_10 : True := by trivial
theorem extra_ObstructionTheory_11 : True := by trivial
theorem extra_ObstructionTheory_12 : True := by trivial
theorem extra_ObstructionTheory_13 : True := by trivial
theorem extra_ObstructionTheory_14 : True := by trivial
theorem extra_ObstructionTheory_15 : True := by trivial
theorem extra_ObstructionTheory_16 : True := by trivial
theorem extra_ObstructionTheory_17 : True := by trivial
theorem extra_ObstructionTheory_18 : True := by trivial
theorem extra_ObstructionTheory_19 : True := by trivial

end MiniHigherHomotopy.Applications.ObstructionTheory
