
untyped lambda calculus interpreter

lexer.ml and parser are automatically generated using ocamllex and menhir.

Files:

exp.ml: types and tokens

lexer.ml: lambda calculus tokenizer

parser.ml: lambda calculus parser

lambda_eval.ml: lambda calculus interprter

main.ml: test examples

Usage:

ocaml main.ml


or

in OCaml toplevel

#use "main.ml"


# let t = parse "(Lx. Ly. x y) w";;
val t : exp = App (Lam ("x", Lam ("y", App (Var "x", Var "y"))), Var "w")

# print_lambda t;;
(\x. \y. x y) w- : unit = ()

# print_lambda (reduce t);;
\y. w y- : unit = ()
