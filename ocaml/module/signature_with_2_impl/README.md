(*

Inerface module Add and its two different implementaions

*)



(* to compile *)

ocamlc -c add.mli

ocamlc -c addimpl1.ml

ocamlc -c addimpl2.ml

ocamlc -c main.ml

ocamlc -o main addimpl1.cmo addimpl2.cmo main.cmo

