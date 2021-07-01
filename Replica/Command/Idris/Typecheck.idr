let Test = ../../Test/package.dhall
let Command/show = ../show.dhall
in \(ipkg : Text) -> Test.Success ::
  { command = Command/show (./default.dhall // {parameters = ["--typecheck ${ipkg}"]}) }
