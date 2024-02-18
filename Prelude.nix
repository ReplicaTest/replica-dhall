{ buildDhallGitHubPackage }:
  buildDhallGitHubPackage {
    name = "Prelude";
    githubBase = "github.com";
    owner = "dhall-lang";
    repo = "dhall-lang";
    rev = "v23.0.0";
    fetchSubmodules = false;
    sha256 = "sha256-AEY5Bifh59XUNkiWiN4D2p5esW6Nko+p0ytX6Jf2swE=";
    directory = "Prelude";
    file = "package.dhall";
    source = false;
    document = false;
    dependencies = [];
    }
