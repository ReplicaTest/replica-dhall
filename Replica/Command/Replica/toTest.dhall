let Test = ../../Test/package.dhall
let Command/show = ../show.dhall
let toCommand = ./toCommand.dhall
let Replica = ./Type.dhall

in \(repl : Replica) -> Test ::
   { command = Command/show (toCommand repl)
   }
