let Prelude = ../../Prelude.dhall
let Map = Prelude.Map.Type
let Test = ./Type.dhall
let Status = ../Status/Type.dhall

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
    , stdOut = ""
    , stdErr = ""
    , files = [] : Map Text Text
    , pending = False
    }

in default
