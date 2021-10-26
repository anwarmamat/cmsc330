(* 

Recursive Descent Parser for

  S -> AB
  A-> 0A | Epsilon
  B-> 1B | Epsilon
*)

exception ParseError of string

(* string -> char list *)
let explode s =
  let rec exp i lst =
    if i < 0 then lst
    else exp (i - 1) (s.[i] :: lst) in
  exp (String.length s - 1) []

(* string -> char list *)
let tokenize s = explode s

let lookahead tokens =
  match tokens with
    [] -> raise (ParseError "no tokens")
  | h::_ -> h

let match_tok a tokens =
  match tokens with
  | h::t when a = h -> t
  | _ -> raise (ParseError "bad match")


type ast = S of char
         | A of char
         | B of char
         | Epsilon

let rec parse_S tokens =
  let t = lookahead tokens in
  match t with
    '0' ->let _=  Printf.printf "S->AB\n" in
          let t1 = parse_A tokens in 
          parse_B t1
   |'1' -> let _=  Printf.printf "S->B\n" in
           parse_B tokens
   |_->tokens
     
and parse_A tokens =
  let t = lookahead tokens in
  match t with
    '0' ->
     let tokens =
       let _=  Printf.printf "A->0A\n" in
       match_tok '0' tokens in
    let tokens = parse_A tokens in
    tokens
   |_-> let _=  Printf.printf "A->e\n" in
        tokens

and parse_B tokens =
  let t = lookahead tokens in
  match t with
    '1' ->
     let tokens =
       let _= Printf.printf "B->0B\n" in
       match_tok '1' tokens in
     let tokens = parse_B tokens in 
    tokens
   |_-> let _=  Printf.printf "B->e\n" in
        tokens
let p s =
  let s = s ^ "_" in 
  let tokens = tokenize s in 
  let t = (parse_S tokens) in
  if t = ['_'] then
    Printf.printf "Success\n"
  else raise (ParseError "parse error")


let _= p "" (* success *)
(*
let _= p "1111111" (* success *)

let _= p "00000" (* success *)

let _= p "011110" (* ParseErrror *)
 *)
