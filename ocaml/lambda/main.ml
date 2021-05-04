(*

  untyped lambda calculus interpreter
  
  CMSC330 Fall 2016
  Anwar Mamat

 *)

#use "exp.ml";;
#use "lexer.ml";;
#use "parser.ml";;
#use "lambda_eval.ml";;    

let clear () = Sys.command "clear";;
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



  
let myzero = parse "Lf.Lx.x";;
let myone = parse "Lf. Lx. f x";;
let mytwo = parse "Lf. Lx. f (f x)";;
let mythree = parse "Lf. Lx. f (f (f x))";;
let mysucc = parse "Ln. Lf. Lx. f (n f x)";;
let myplus = parse "Lm. Ln. Lf. Lx. m f (n f x)";;
let mymult = parse "Lm. Ln. Lf. m (n f)";;


let mytrue  = parse "Lx. Ly. x";;
let myfalse = parse "Lx.Ly. y";;
let myif = parse "La. Lb. Lc. a b c";;
let mynot  = parse "Lb. Lx. Ly.  b y x"
let myand = parse "La. Lb. Lx. Ly. b (a x y) y";;
let myor = parse "La. Lb. Lx. Ly.  b x (a x y)";;
let iszero  =parse "Ln. n (Lx. (Lx.Ly. y)) (Lx. Ly. x)"
let mypred = parse "Ln. Lf. Lx. n (Lg.  Lh.  h (g f)) (Lu.x) (Lu. u)";;
let myminus = parse "Lm. Ln. (n Ln. Lf. Lx. n (Lg.  Lh.  h (g f)) (Lu.x) (Lu. u)) m";;
let mydiv = parse " (Ln.((Lf.(Lx.x x) (Lx.f (x x))) (Lc.Ln.Lm.Lf.Lx.(Ld.(Ln.n (Lx.(La.Lb.b)) (La.Lb.a)) d ((Lf.Lx.x) f x) (f (c d m f x))) ((Lm.Ln.n (Ln.Lf.Lx.n (Lg.Lh.h (g f)) (Lu.x) (Lu.u)) m) n m))) ((Ln.Lf.Lx. f (n f x)) n))";;

(* Example 0 *)
let r = parse  "Lx.x y";;
print_string "string: Lx.x y";;
print_string "\nLambda Expression: ";;
print_string (lambda_exp_2_str r);;
print_string "\nparsed string: ";;
print_lambda r;;
print_string "\n";;

(* Example 1 *)

(* and true true  *)
let e = App(App(myand, mytrue),mytrue);;

(* e2 = if e then 1 else 2 
   myif e 1 2 
*)
let e2 = App(App(App(myif, e), myone),mytwo);;
let e2 = reduce_multi e2;;
let () = print_lambda e2;;
let () = Printf.printf "\nif true then 1 else 2 = %d\n" (to_int e2);;

(*Example 2 *)

(* and true false  *)
let e = App(App(myand, mytrue),myfalse);;
  
(* 
   let e = false
e2 = if e then 1  else 2 
   myif e 1 2 
*)
let e2 = App(App(App(myif, e), myone),mytwo);;
let e2 = reduce_multi e2;;
let () = print_lambda e2;;
let () = Printf.printf "\nif false then 1 else 2 = %d\n" (to_int e2)

(* Example 3: Addition
  a = 3 + 2

 *)
let e1 = App(App(myplus, mythree), mytwo);;
let e2 = reduce_multi e1;;
let () = Printf.printf "\n 3 + 2 = %d\n" (to_int e2)      

(* Example 4  Multiplication 
   let e1 = 3 + 2
   let e2 = 3 + 1
   let e3 = e1 * e2
*)
let e1 = App(App(myplus, mythree), mytwo);;
let e2 = App(mysucc, mythree);;
let e3 = App(App(mymult, e1),e2)
let e4 = reduce_multi e3
let () = Printf.printf "\n 5 * 4 = %d\n" (to_int e4)      
(* let e5 = (e3+e2) * e4  
             (5 + 4 ) * 20
 *)
let e5 = App(App(mymult,(App(App(myplus,e1),e2))),e4);;
                                                    
let e6 = reduce_multi e5;;       
let () = Printf.printf "\n (5 + 4) * 20 = %d\n" (to_int e6)      

(*
   Y = \f.(\x. f (x x)) (\x. f (x x))
  fact = \f.\n. if n = 0 then 1 else n * (f (n -1))

 *)


       
(* Example 4 
   fact(3)

*)
       

let yfix = parse "Lf.(Lx. f (x x)) (Lx. f (x x))"

let if2 (a,b,c) = App(App(App(myif,a),b),c);;
let fact1 = 
   Lam ("f",
   Lam ("n",
    	(if2 
    	(
    	  (App (iszero, Var "n")),     (* condition *)
     	  (myone),						(* if branch *)
     	  (App (App (mymult, Var "n"), (App (Var "f", App (mypred, Var "n"))))) (* else *)
     	 )
        )
      
      ))
;;      

(* calculate factorial of 3  *)
let e  =App(App(yfix, fact1), mythree);;

(* print the factorial 3 as int *)
let x = to_int (reduce_multi e)   (*  6 *);;
print_string "\nfact(3) = ";;
print_int x;;
print_string "\n";;
 

(*
(* calculate factorial of 5  *)
let e  = App(App(yfix, fact1), App(App(myplus,mythree),mytwo));;

(* print the factorial 3 as int *)
let x = to_int (reduce_multi e)   (*  6 *)
;;
print_string "fact(5) = ";;
print_int x;;
print_string "\n";;
 *)

(*
(* m = 2 + 3 *)
let m =  (App(App(myplus,mytwo),mythree));;
print_string "2+3=";;
print_int(to_int (reduce_multi m));;
print_string "\n";;
 *)
(*
(* n = 2 * succ(n) = 2 * 6 = 12 *)
let n = App(App(mymult, mytwo), App(mysucc,m));;
let s = reduce_multi n;;
print_string "2*6=";;
print_lambda s;;
print_string " = " ;;
print_int (to_int s);;
print_string "\n\n";;
 *)

(*
(*   succ(4) / 2  *)
let e = App(App(mydiv,App(mysucc,mythree)),mytwo);;
print_string "Division example:\n";;
(*  - : int = 2  *)
print_string "succ(3)/2=";;
print_lambda (reduce_multi e);;
print_string " = " ;;
print_int (to_int (reduce_multi e));;
print_string "\n";;
 *)

(*
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
*)
