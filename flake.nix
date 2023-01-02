{
  description = "dhall expressions for REPLica";

  inputs.flake-utils.url = github:numtide/flake-utils;

  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (system:
    let
      dhallOverlay = self: super: {
        replica-dhall = self.callPackage ./replica-dhall.nix { };
        Prelude = self.callPackage ./Prelude.nix { };
      };
      overlay = self: super: {
        dhallPackages = super.dhallPackages.override (old: {
          overrides =
            self.lib.composeExtensions (old.overrides or (_: _: {})) dhallOverlay;
        });
      };

      npkgs = import nixpkgs { inherit system; overlays = [ overlay ]; };
      inherit (npkgs)
        dhall
        dhall-docs
        nix-prefetch-git;
      inherit (npkgs.haskellPackages)
        dhall-nixpkgs;
    in rec {
      devShells.default = npkgs.mkShell {
        packages = [ dhall dhall-docs dhall-nixpkgs nix-prefetch-git ];
      };
      packages.default = npkgs.dhallPackages.replica-dhall;
      checks = {
        check = packages.default;
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
