.PHONY: doc check

documentation:
	dhall-docs --input .

check:
	dhall --file ./Replica/package.dhall
