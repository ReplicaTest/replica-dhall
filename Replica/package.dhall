{-|
  `Replica` entrypoint:

  - `Type`: the type of a test suite.
  - `Test`: the description of an individual test
  - `Expectation`: the description of the value that is expected for a resources
     monitored by a test.
  - `Status`: the type to describe the exit code of a tested command.
  - `Command`: a set of helpers to write tests for some command line tools.

  -}
{ Type = ./Type.dhall
, Test = ./Test/package.dhall
, Expectation = ./Expectation/package.dhall
, Status = ./Status/package.dhall
, Command = ./Command/package.dhall
}
