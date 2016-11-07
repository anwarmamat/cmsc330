#
# Pure OCaml, no packages, no _tags 
#

# bin-annot is required for Merlin and other IDE-like tools

OCB_FLAGS = -tag bin_annot
OCB = 		ocamlbuild $(OCB_FLAGS)

all: 		native byte # profile debug

clean:
			$(OCB) -clean

native: 
			$(OCB) test.native

byte:
			$(OCB) test.byte

profile:
			$(OCB) -tag profile test.native

debug:
			$(OCB) -tag debug test.byte

test: 		native
			./test.native "OCaml" "OCamlBuild" "users"

.PHONY: 	all clean byte native profile debug test
