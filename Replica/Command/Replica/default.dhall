{ executable = "${env:REPLICA_DIR as Text}/replica" ? "replica"
, command = "run"
, parameters = [] : List Text
, testFiles = [] : List Text
} : ./Type.dhall
