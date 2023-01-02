{ buildDhallDirectoryPackage, Prelude }:
  buildDhallDirectoryPackage {
    name = ".";
    src = ./.;
    file = "package.dhall";
    source = false;
    document = false;
    dependencies = [ Prelude ];
    }
