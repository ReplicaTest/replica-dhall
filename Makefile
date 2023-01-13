.PHONY: doc check
PRELUDE_VERSION = v22.0.0

documentation:
	dhall-docs --input .

check:
	dhall --file ./Replica/package.dhall


Prelude.nix:
	dhall-to-nixpkgs github https://github.com/dhall-lang/dhall-lang.git \
    --name Prelude \
    --directory Prelude \
    --rev ${PRELUDE_VERSION} \
    > Prelude.nix
