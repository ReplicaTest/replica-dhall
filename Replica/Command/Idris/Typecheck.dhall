let Test = ../../Test/package.dhall
let Expectation = ../../Expectation/package.dhall
let Command/show = ../show.dhall
let Typecheck : Text -> Test.Type
  =  \(ipkg : Text) -> Test.Success ::
  { command = Command/show (./default.dhall // {parameters = ["--typecheck ${ipkg}"]})
  , stdOut = Expectation.Ignored
  , afterTest = ["rm -rf build"]
  }

in Typecheck
