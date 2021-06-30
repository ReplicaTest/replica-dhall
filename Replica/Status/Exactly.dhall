let Status = ./Type.dhall
in \(exitCode : Natural) -> Status.Exactly exitCode
