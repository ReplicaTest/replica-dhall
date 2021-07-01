{-|
  A `Test` is a record that gather all the information needed to run it on `replica`,
  the purpose of the different fields are the following:

  - `description`: for documentation purpose, its where you can describe what you are testing and
    how.
  - `require`: a list of test names that must succeed before we can launch this one,
    if one of these tests  failed, this test is skipped.
  - `workingDir`: the directory where the test will be launched.
  - `tags`: a list of tags for the tests, can be used by replica to filter tests.
  - `beforeTest`: a list of commands to run before the test.
  - `afterTest`: a list of commands to run after the test.
  - `command`: the tested command.
  - `input`: the content of the standard input sent to the command.
  - `status`: the expected exit code of the command
  - `spaceSensitive`: whether the expectations should be test sensitive or not.
  - `stdOut`: set the expectations for the standard output.
  - `stdErr`: set the expectations for the standard error.
  - `files`: a list of files to monitor and the corresponding expectations.
  - `pending`: `True` if the test should be ignored at the moment.

  -}
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
