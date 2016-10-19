(*----------------------------------------------------------
 
  arith : user-defined variant datatype for arithmetic expressions
 
*)
 
type arith =
     Num of int
   | Sum of arith * arith
   | Mult of arith * arith
 
(*----------------------------------------------------------
  function a_to_str : arith -> string
 
        converts arithmetic expression into a string 
*)
 
let rec a_to_str a = match a with
    Num n -> string_of_int n            (* from Pervasives *)
  | Sum (a1,a2) -> "(" ^ (a_to_str a1) ^ " + " ^ (a_to_str a2) ^ ")"
  | Mult (a1,a2) -> "(" ^ (a_to_str a1) ^ " * " ^ (a_to_str a2) ^ ")"
;;
 
(*----------------------------------------------------------
  function value : arith -> int
 
        finds value of arithmetic expression 
        always returns (Num n)
*)
 
let rec value a = match a with 
    Num n -> n
  | Sum (a1,a2) -> ( match (value a1, value a2) with
                        (n1,n2) -> (n1+n2) 
                   )
  | Mult (a1,a2) -> ( match (value a1, value a2) with
                        (n1,n2) -> (n1*n2) 
                   )
;;

(************************************************************************)
 
(* Scanner *)
 
exception IllegalExpression of string

type token =
   Tok_Num of char
 | Tok_Sum
 | Tok_Mult
 | Tok_LParen
 | Tok_RParen
 | Tok_END
 
#load "str.cma"

let re_num = Str.regexp "[0-9]" 	(* single digit number *)
let re_add = Str.regexp "+"
let re_mult = Str.regexp "*"
let re_lparen = Str.regexp "("
let re_rparen = Str.regexp ")"
 
(*----------------------------------------------------------
  function tokenize : string -> token list
 
        converts string into a list of tokens (i.e., terminals)
 
*)
 
let tokenize str =
 let rec tok pos s =
   if pos >= String.length s then
     [Tok_END]
   else 
     if (Str.string_match re_num s pos) then
       let token = Str.matched_string s in
         (Tok_Num token.[0])::(tok (pos+1) s)
     else if (Str.string_match re_add s pos) then
       Tok_Sum::(tok (pos+1) s)
     else if (Str.string_match re_mult s pos) then
       Tok_Mult::(tok (pos+1) s)
     else if (Str.string_match re_lparen s pos) then
       Tok_LParen::(tok (pos+1) s)
     else if (Str.string_match re_rparen s pos) then
       Tok_RParen::(tok (pos+1) s)
     else
       raise (IllegalExpression "tokenize")
 in
 tok 0 str
 
(*----------------------------------------------------------
  function tok_to_str : token -> string
 
        converts token into a string 
*)
 
let tok_to_str t = ( match t with
          Tok_Num v -> (Char.escaped v)
        | Tok_Sum -> "+"
        | Tok_Mult ->  "*"
        | Tok_LParen -> "("
        | Tok_RParen -> ")"
        | Tok_END -> "END"
    )

(************************************************************************)

(* Parser *)

(*----------------------------------------------------------

  function lookahead : token list -> token
	Returns the head of token list 

  function match_tok : token -> token list -> token list
	Matches the first argument with the head of the token list;
	  if they match, returns the tail of the token list
	  otherwise throws an exception
*)

let lookahead tok_list = match tok_list with
        [] -> raise (IllegalExpression "lookahead")
        | (h::t) -> h

let match_tok tok tok_list =
  match tok_list with
    | (h::t) when tok = h -> t
    | _ -> raise (IllegalExpression "match_tok")
	  
(*----------------------------------------------------------

  recursive descent parser

	Returns tuple of ast & token list for remainder of string

  Arithmetic expression grammar:

  [Basic grammar]
  E -> A Tok_Sum E | A
  A -> B Tok_Mult A | B
  B -> Tok_Num | Tok_LParen E Tok_RParen 

  FIRST(E) = { Tok_Num, Tok_LParen } 
  FIRST(A) = { Tok_Num, Tok_LParen } 
  FIRST(B) = { Tok_Num, Tok_LParen } 

  These FIRST sets are ambiguous, so the form of our parser
  effectively performs left factoring on the fly.

  Each function parse_E, parse_A, and parse_S basically has takes the
  list of tokens and returns an AST (a value of type arith) and the
  remaining tokens.
*)

let rec parse_E l = 
        let (a1,l1) = parse_A l in
        let t = lookahead l1 in
        match t with 
                Tok_Sum -> ( 		(* E -> A Tok_Sum E *)
		let n = match_tok Tok_Sum l1 in
                let (a2,l2) = (parse_E n) in
                (Sum (a1,a2),l2) 
                )
                | _ -> (a1,l1) 		(* E -> A *)
 
and parse_A l =
        let (a1,l1) = parse_B l in
        let t = lookahead l1 in
        match t with
	        Tok_Mult -> ( 		(* A -> B Tok_Mult A *)
		let n = match_tok Tok_Mult l1 in
                let (a2,l2) = (parse_A n) in
                (Mult (a1,a2),l2) 
                )
                | _ -> (a1,l1)		(* A -> B *)

and parse_B l =
        let t = lookahead l in
	match t with
          Tok_Num c -> (* B -> Tok_Num *)
	      let n = match_tok (Tok_Num c) l in
	      (Num (int_of_string (Char.escaped c)), n) 
				  
        | Tok_LParen -> ( (* B -> Tok_LParen E Tok_RParen *)
	      let n = match_tok (Tok_LParen) l in
              let (a2,l2) = (parse_E n) in 
              let n2 = match_tok (Tok_RParen) l2 in 
	      (a2,n2)
	      )

        | _ -> raise (IllegalExpression "parse_B")


(*
  [Grammar rewritten to avoid conflicting FIRST sets]
  E -> A X 
  X -> Tok_Sum E | epsilon
  A -> B Y
  Y -> Tok_Mult A | epsilon
  B -> Tok_Num | Tok_LParen E Tok_RParen 

  FIRST(E) = { Tok_Num }
  FIRST(X) = { Tok_Sum, epsilon }
  FIRST(A) = { Tok_Num, Tok_LParen }
  FIRST(Y) = { Tok_Mult, epsilon }
  FIRST(B) = { Tok_Num, Tok_LParen }

  Can you rewrite the above parser using this grammar? 
*)
	  
(*----------------------------------------------------------

  function eval_str : given string, parse string, build AST,
			evaluate value of AST

*)

let eval_str str =
	let tok_list = tokenize str in

	print_string "Input token list = " ;
	List.iter (fun x -> print_string (" " ^ (tok_to_str x))) tok_list ;
	print_endline "";

	let (a,t) = (parse_E tok_list) in 

	if t <> [Tok_END] then raise (IllegalExpression "parse_E") ;
	
	print_string "AST produced = " ;
	print_endline (a_to_str a) ;

	let (v) = (value a) in

	print_string "Value of AST = " ;
	print_int v ;
	print_endline "";

	v
;;

eval_str "1+2+3+4+5+6" ;;
eval_str "1*2*3*4*5*6" ;;
eval_str "1+2+3*4*5+6" ;;
eval_str "1+(2+3)*4*5+6" ;;

(* parse errors below here: *)

eval_str "1+12" ;;
eval_str "1++2" ;;

