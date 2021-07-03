{-|
  A constructor that extends the default one by checking that
  the exit code is different than zero.
  -}
let Status = ../Status/package.dhall
in { Type = ./Type.dhall
   , default = ./default.dhall // {status = Status.Failure}
   }
