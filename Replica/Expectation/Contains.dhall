let Expectation = ./Type.dhall
in \(expected : List Text) -> Expectation.Contains expected
