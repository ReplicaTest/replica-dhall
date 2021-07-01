let Status = ./Type.dhall
in \(exitCode : Natural) -> Some (Status.Exactly exitCode)
