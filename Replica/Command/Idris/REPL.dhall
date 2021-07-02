let Context = ./Context.dhall
let Command/show = ../show.dhall
let Prelude = ../../../Prelude.dhall
let concatSep = Prelude.Text.concatSep
let Test = ../../Test/package.dhall

let packages : List Text -> Text
  = \(dependencies : List Text) ->
    "-p" ++ concatSep " " dependencies

let toOption : Context -> List Text
  = \(ctx : Context) ->
    merge
    { Raw = \(dependencies : List Text) -> [packages dependencies]
    , File = \(ctx : {dependencies : List Text, name : Text}) -> [packages ctx.dependencies, ctx.name]
    , Package = \(name : Text) -> ["--repl ${name}"]
    } ctx

let defaultDependencies : List Text
  = ["--no-banner"]

let REPL : Context -> Test.Type
  = \(ctx : Context) -> Test ::
  { command = Command/show (./default.dhall // {parameters = defaultDependencies # toOption ctx})
  , afterTest = ["rm -rf build"]
  }

in REPL
