let Replica = https://raw.githubusercontent.com/ReplicaTest/replica-dhall/main/package.dhall
let Prelude = Replica.Prelude
let Test = Replica.Test
let Expectation = Replica.Expectation
let Status = Replica.Status

let tests : Replica.Type
  = toMap
  { hello_world = Test::{command = "echo \"Hello, World!\""}
  , hello_world_exact = Replica.Test ::
      { command = "echo \"Hello, World!\""
      , stdOut = Expectation.Exact "Hello, World!\n"
      }
  , hello_world_status = Test ::
      { command = "echo \"Hello, World!\""
      , status = Some Status.Success
      }
  , hello_world_status_alternative = Test.Success ::
      { command = "echo \"Hello, World!\""
      }
  , hello_stdErr = Test ::
      { command = "echo \"Hello, World!\" >&1"
      , stdOut = Expectation.Ignored
      , stdErr = Expectation.Golden
      }
  }

in tests
