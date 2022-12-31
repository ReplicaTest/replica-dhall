{
  description = "dhall expressions for REPLica";

  inputs.flake-utils.url = github:numtide/flake-utils;

  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (system:
    let
      npkgs = import nixpkgs { inherit system; };
      inherit (npkgs) dhall;
      inherit (npkgs) dhall-docs;
    in rec {
      devShells.default = npkgs.mkShell {
        packages = [ dhall dhall-docs ];
      };
      checks = {
        check = npkgs.runCommand "typecheck" {
          buildInputs = with npkgs; [ dhall ];
        } ''
          mkdir $out
          cd ${./.}
          DHALL_PRELUDE="$PWD/submodules/dhall-lang/Prelude/package.dhall" \
          XDG_CACHE_HOME=`mktemp -d` \
          make check
          '';
        doc = npkgs.runCommand "build-doc" {
          buildInputs = with npkgs; [ dhall-docs ];
        } ''
          XDG_DATA_HOME=`mktemp -d` dhall-docs --input ${./Replica}
          cp -RL docs $out
          '';
      };
    }
  );
}
