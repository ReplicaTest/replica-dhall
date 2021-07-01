{- |
   A template that require a `command`.
   The template is almost "empty", the but contains a golden value check for `stdOut`.
   -}
let Prelude = ../../Prelude.dhall
let Map = Prelude.Map.Type
let Test = ./Type.dhall
let Status = ../Status/Type.dhall
let Expectation = ../Expectation/package.dhall
let Golden = Expectation.Golden
let Ignored = Expectation.Ignored

let default
  = { description = None Text
    , require = [] : List Text
    , workingDir = None Text
    , tags = [] : List Text
    , beforeTest = [] : List Text
    , afterTest = [] : List Text
    , input = None Text
    , status = None Status
    , spaceSensitive = True
    , stdOut = Golden
    , stdErr = Ignored
    , files = [] : Map Text Expectation.Type
    , pending = False
    }

in default
