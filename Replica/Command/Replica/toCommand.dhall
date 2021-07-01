let Replica = ./Type.dhall
let Command = ../Type.dhall
let toCommand
  : Replica -> Command
  = \(repl : Replica) ->
  { executable = repl.executable
  , parameters = [repl.command] # repl.parameters # repl.testFiles
  }

in toCommand
