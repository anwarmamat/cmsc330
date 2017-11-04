(*
  A simple interpreter for arithmetic expressions
  with a scanner and parser
*)

(**** AST ****)

type exp =
     Num of int
  | Sum of exp * exp
  | Mul of exp * exp

let rec a_to_str a =
  match a with
    Num n -> string_of_int n            (* from Pervasives *)
  | Sum (a1,a2) -> "(" ^ (a_to_str a1) ^ " + " ^ (a_to_str a2) ^ ")"
  | Mul (a1,a2) -> "(" ^ (a_to_str a1) ^ " * " ^ (a_to_str a2) ^ ")"
;;

(***** Scanner *****)

#use "tokenizer.ml"

(***** Parser *****)

let tok_list = ref []

exception ParseError of string

let lookahead () =
  match !tok_list with
    [] -> raise (ParseError "no tokens")
  | (h::t) -> h

let match_tok a =
  match !tok_list with
  (* checks lookahead; advances on match *)
  | (h::t) when a = h -> tok_list := t
  | _ -> raise (ParseError "bad match")

(*----------------------------------------------------------

   [Basic grammar]
   E-> T + E | T
   T-> P * T | P
   P -> 1|2|3|4|5|6|7|8|9|0

  
   E -> T Tok_Sum E | T
   T -> P * T | P
   P -> Tok_Num

  FIRST(E) = { Tok_Num }
  FIRST(T) = { Tok_Num }
  FIRST(P) = { Tok_Num }

*)

let rec parse_E () =
  let a1 = parse_T () in
  let t = lookahead () in
  match t with
    Tok_Sum ->
    match_tok Tok_Sum;
    let a2 = parse_E () in
    Sum(a1,a2)
  | _ -> a1 		(* E -> T *)

and parse_T () =
  let a1 = parse_P () in
  let t = lookahead () in
  match t with
    Tok_Mul ->
    match_tok Tok_Mul;
    let a2 = parse_T () in
    Mul(a1,a2)
  | _ -> a1 		(* E -> T *)

and parse_P () =
  let t = lookahead () in
  match t with
    Tok_Num c ->
    let _= match_tok (Tok_Num c) in
    Num (int_of_string (Char.escaped c))
  | _ -> raise (ParseError "parse_A")


let parse str =
  tok_list := (tokenize str);
  let exp = parse_E () in
  if !tok_list <> [Tok_END] then
    raise (ParseError "parse_E")
  else
    exp
  
(***** Interpreter ****)

let rec eval a =
  match a with
    Num n -> n
  | Sum (a1,a2) -> (eval a1) + (eval a2)
  | Mul (a1,a2) -> (eval a1) * (eval a2)
;;


let eval_str str =
  print_string str; print_string "\n";
  let e = parse str in
  print_string "AST produced = " ;
  print_endline (a_to_str e) ;
  let v = eval e in
  print_string "Value of AST = " ;
  print_int v ;
  print_endline "";
  v
;;
  
  eval_str "1+2*3+4+5"
;;
  
