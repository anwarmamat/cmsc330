ocamlc -c exp1.ml
ocamlc -c test.ml
ocamlc -o test exp1.cmo test.cmo
