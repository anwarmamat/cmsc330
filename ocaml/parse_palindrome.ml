(* 
Parser for palindromes that have x in the center

Recursive Descent Parser for
  S -> aSa | bSb|x
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


let rec parse_S tokens =
  let t = lookahead tokens in
  match t with
     'a' ->let _=  Printf.printf "S->aSa\n" in
          let tokens = match_tok 'a' tokens in 
          let tokens = parse_S tokens in 
          let tokens = match_tok 'a' tokens in
          tokens
    |'b' ->let _=  Printf.printf "S->bSb\n" in
          let tokens = match_tok 'b' tokens in 
          let tokens = parse_S tokens in 
          let tokens = match_tok 'b' tokens in
          tokens
    |'x'-> match_tok 'x' tokens
         
    |_->failwith "wrong token. parse error"
      
let p s =
  let tokens = tokenize s in 
  let t = (parse_S tokens) in
  if t = [] then
    Printf.printf "Success\n"
  else raise (ParseError "parse error 2")


let _= p "bbaaxaabb" (* success *)
