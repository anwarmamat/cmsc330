(***** Scanner *****)

type token =
  Tok_Num of char
| Tok_Sum
| Tok_Mul
| Tok_END

(* OCaml regexps *)

#load "str.cma"

let re_num = Str.regexp "[0-9]" 	(* single digit number *)
let re_add = Str.regexp "+"
let re_mul = Str.regexp "*"

exception IllegalExpression of string

(*
  tokenize : string -> token list
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
     else if (Str.string_match re_mul s pos) then
       Tok_Mul::(tok (pos+1) s)
     else
       raise (IllegalExpression "tokenize")
 in
 tok 0 str

(*
  tok_to_str : token -> string
  converts token into a string
*)
let tok_to_str t =
  match t with
      Tok_Num v -> (Char.escaped v)
    | Tok_Sum -> "+"
    | Tok_Mul -> "*"
    | Tok_END -> "END"

