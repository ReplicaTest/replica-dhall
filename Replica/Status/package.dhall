{-|
  Status is used to specify the exit code of a test.

  - `Type`: is the status type.
  - `Exactly`: allows the specification of a specific value for the exit code.
  - `Success`: is used to ensure that the exit code is 0.
  - `Failure`: is used to ensure that the exit code is different than 0.

  -}
{ Type = ./Type.dhall
, Exactly = ./Exactly.dhall
, Success = ./Success.dhall
, Failure = ./Failure.dhall
}
