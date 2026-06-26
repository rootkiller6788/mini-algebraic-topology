import MiniSpectralSequences
namespace MiniSpectralSequences

structure SSHomomorphism where
  source : CohomSpectralSequence
  target : CohomSpectralSequence
  page_maps : (r : Int) → (p q : Int) →
    BigradedAbGroup.fiber (source.pages r) p q →
    BigradedAbGroup.fiber (target.pages r) p q
  commutes_with_d : (r p q : Int) → True

structure SSEndomorphism where
  E : CohomSpectralSequence
  endo_map : SSHomomorphism

structure SSAutomorphism where
  E : CohomSpectralSequence
  auto_map : SSHomomorphism
  invertible : Bool

structure SSRetraction where
  E : CohomSpectralSequence
  retract : CohomSpectralSequence
  retraction : SSHomomorphism
  section : SSHomomorphism
  retraction_section_id : Bool

structure SSMonomorphism where
  source : CohomSpectralSequence
  target : CohomSpectralSequence
  mono_map : SSHomomorphism
  injective_on_pages : (r p q : Int) → True

structure SSEpimorphism where
  source : CohomSpectralSequence
  target : CohomSpectralSequence
  epi_map : SSHomomorphism
  surjective_on_pages : (r p q : Int) → True

structure SSExactSequence where
  left : CohomSpectralSequence
  middle : CohomSpectralSequence
  right : CohomSpectralSequence
  left_map : SSHomomorphism
  right_map : SSHomomorphism
  exact_at_middle : (r p q : Int) → True

structure SSPullback where
  X : CohomSpectralSequence
  Y : CohomSpectralSequence
  B : CohomSpectralSequence
  f : SSHomomorphism
  g : SSHomomorphism
  pullback : CohomSpectralSequence

structure SSPushout where
  A : CohomSpectralSequence
  X : CohomSpectralSequence
  Y : CohomSpectralSequence
  f : SSHomomorphism
  g : SSHomomorphism
  pushout : CohomSpectralSequence

structure SSLimit where
  diagram : Type
  limit_ss : CohomSpectralSequence
  projections : True

structure SSColimit where
  diagram : Type
  colimit_ss : CohomSpectralSequence
  injections : True

structure FilteredColimitSS where
  sequence : Nat → CohomSpectralSequence
  maps : (n : Nat) → SSHomomorphism
  colimit : CohomSpectralSequence

end MiniSpectralSequences