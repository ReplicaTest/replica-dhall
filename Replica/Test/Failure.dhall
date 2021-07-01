let Status = ../Status/package.dhall
in { Type = ./Type.dhall
   , default = ./default.dhall // {status = Status.Failure}
   }
