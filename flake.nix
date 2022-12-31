{
  description = "dhall expressions for REPLica";

  inputs.flake-utils.url = github:numtide/flake-utils;

  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (system:
    let
      npkgs = import nixpkgs { inherit system; };
      inherit (npkgs) dhall;
      inherit (npkgs.haskellPackages) dhall-json;
    in rec {
      devShells.default = npkgs.mkShell {
        packages = [ dhall dhall-json ];
      };
    }
  );
}
