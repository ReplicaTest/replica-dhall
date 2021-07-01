{-|

  - `Type`: definition of a test.
  - `default`: a default template that just check a golden value for stdOut
     (needs a `command` to obtain a `Test`)
  - `Success`: Same as `default`, expect exit code of the command to be 0.
  - `Failure`: Same as `default`, expect exit code of the command to be different than 0.

  -}
{ Type = ./Type.dhall
, default = ./default.dhall
, Success = ./Success.dhall
, Failure = ./Failure.dhall
}
