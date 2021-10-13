{-|
  `Suite` create a test suite: it assigns the same Suite name to all the given tests.
  -}
let Test = ./Test/Type.dhall
let Prelude = ../Prelude.dhall
let map = Prelude.List.map
let Suite
    : Text -> List Test -> List Test
    = \(suite : Text) ->
      \(tests : List Test) ->
      map Test Test (\(t : Test) -> t // {suite = Some suite}) tests

in Suite
