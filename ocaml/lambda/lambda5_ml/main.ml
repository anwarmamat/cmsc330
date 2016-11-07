(*

  untyped lambda calculus interpreter
  
  CMSC330 Fall 2016
  Anwar Mamat

 *)

#use "exp.ml";;
#use "lexer.ml";;
#use "parser.ml"
#use "lambda_eval.ml";;    

(*

To compile and generate an executable:

1) replace the above "#use file.ml" with following:
open Exp;;
open Parser;;
open Lexer ;;
open Lambda_eval;;

2) Use the following command to compile:

ocamlc -c lexer.ml
ocamlc -c lambda_eval.ml
ocamlc -c main.ml
ocamlc -o main exp.cmo parser.cmo lexer.cmo lambda_eval.cmo main.cmo
*)

let lex x = 
	let y = x ^ "\n" in 
		Lexing.from_string y
;;


let parse x  = main token (lex  x);;


let rec to_int e = match e with
    App(x,y)-> 1 + (to_int x) + (to_int y)
   |Lam(a,b)->to_int b
   |_->0
              
;;             


let r = parse  "Lx.x y";;
print_string "string: Lx.x y";;
print_string "\nLambda Expression: ";;
print_string (lambda_exp_2_str r);;
print_string "\nparsed string: ";;
print_lambda r;;
print_string "\n";;


  
let my_zero = parse "Lf.Lx.x";;
let my_one = parse "Lf. Lx. f x";;
let my_two = parse "Lf. Lx. f (f x)";;
let my_three = parse "Lf. Lx. f (f (f x))";;
let my_succ = parse "Ln. Lf. Lx. f (n f x)";;
let my_plus = parse "Lm. Ln. Lf. Lx. m f (n f x)";;
let my_mult = parse "Lm. Ln. Lf. m (n f)";;

(* m = 2 + 3 *)
let m =  (App(App(my_plus,my_two),my_three));;

(* n = 2 * succ(n) = 2 * 6 = 12 *)
let n = App(App(my_mult, my_two), App(my_succ,m))

let m = reduce20 m;;
print_string "2+3=";;
print_int (to_int m);;
print_string "\n";;

 

print_string "2 = ";;
  print_lambda my_two;;
print_string "=";;
  print_string (lambda_exp_2_str my_two);;
print_string "\n";;
let n = reduce20(reduce20(reduce20 n));;
print_string "\n";;
print_string "2*6=";;
print_lambda n;;
print_string "  =  ";;
print_int(to_int n);;
print_string "\n";;
