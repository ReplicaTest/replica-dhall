.PHONY: doc check

documentation:
	dhall-docs --input Replica

check:
	dhall --file ./Replica/package.dhall
