{ buildDhallGitHubPackage }:
  buildDhallGitHubPackage {
    name = "Prelude";
    githubBase = "github.com";
    owner = "dhall-lang";
    repo = "dhall-lang";
    rev = "v23.1.0";
    fetchSubmodules = false;
    sha256 = "sha256-7zIbHwpOoQURbqfSgnLg0AGTJAKLiKRyay/TIhs7fW4=";
    directory = "Prelude";
    file = "package.dhall";
    source = false;
    document = false;
    dependencies = [];
    }
