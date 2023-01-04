{-|

  `Replica.Type` is the type of a test suite in `Replica`.
  It is an alias for `Map Text Test`.

  The keys are the test identifiers, and the value the test content.

  -}
let Prelude = ../Prelude.dhall

let Test = ./Test/Type.dhall

in  Prelude.Map.Type Text Test
