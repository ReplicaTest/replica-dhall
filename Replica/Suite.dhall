{-|
  `Suite` create a test suite: it assigns the same Suite name to all the given tests.
  -}
let Test = ./Test/Type.dhall

let Replica = ./Type.dhall

let Prelude = ../Prelude.dhall

let map = Prelude.Map.map

let Suite
    : Text -> Replica -> Replica
    = \(suite : Text) ->
      \(tests : Replica) ->
        map Text Test Test (\(t : Test) -> t // { suite = Some suite }) tests

in  Suite
