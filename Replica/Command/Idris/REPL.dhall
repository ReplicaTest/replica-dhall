let Context = ./Context.dhall

let Command/show = ../show.dhall

let Prelude = ../../../Prelude.dhall

let Test = ../../Test/package.dhall

let fold = Prelude.List.fold

let packages
    : List Text -> Text
    = \(dependencies : List Text) ->
        fold
          Text
          dependencies
          Text
          (\(x : Text) -> \(xs : Text) -> "-p " ++ x ++ " " ++ xs)
          ""

let toOption
    : Context -> List Text
    = \(ctx : Context) ->
        merge
          { Raw = \(dependencies : List Text) -> [ packages dependencies ]
          , File =
              \(ctx : { dependencies : List Text, name : Text }) ->
                [ packages ctx.dependencies, ctx.name ]
          , Package = \(name : Text) -> [ "--repl ${name}" ]
          }
          ctx

let defaultDependencies
    : List Text
    = [ "--no-banner" ]

let REPL
    : Context -> Test.Type
    = \(ctx : Context) ->
        Test::{
        , command =
            Command/show
              (     ./default.dhall
                //  { parameters = defaultDependencies # toOption ctx }
              )
        , afterTest =
            merge
              { Raw = \(dependencies : List Text) -> [] : List Text
              , File =
                  \(ctx : { dependencies : List Text, name : Text }) ->
                    [ "rm -rf build" ]
              , Package = \(name : Text) -> [ "rm -rf build" ]
              }
              ctx
        }

in  REPL
