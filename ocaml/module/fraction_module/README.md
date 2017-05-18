(*  Fraction module  *)

(* To Compile *)

ocamlc -c fraction_module_sig.ml

ocamlc -c main.ml

ocamlc -o main fraction_module_sig.cmo main.cmo