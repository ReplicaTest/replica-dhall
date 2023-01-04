let Prelude = ../../Prelude.dhall

let Command = ./Type.dhall

in  \(cmd : Command) ->
      Prelude.Text.concatSep " " ([ cmd.executable ] # cmd.parameters)
