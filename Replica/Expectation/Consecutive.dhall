let Expectation = ./Type.dhall
let Complex = ./Complex/package.dhall
in \(expected : List Text) ->
   Expectation.Complex (Complex::{consecutive = expected})
