let Prelude = ../../Prelude.dhall

let Map = Prelude.Map.Type
let Expectation = ../Expectation/Type.dhall
let Status = ../Status/Type.dhall

in { description : Optional Text
   , require : List Text
   , workingDir : Optional Text
   , tags : List Text
   , beforeTest : List Text
   , afterTest : List Text
   , command : Text
   , input : Optional Text
   , status : Optional Status
   , spaceSensitive : Bool
   , stdOut : Expectation
   , stdErr : Expectation
   , files : Map Text (Expectation)
   , pending : Bool
   }
