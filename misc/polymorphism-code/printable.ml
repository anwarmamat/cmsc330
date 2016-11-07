type t =
    Int of int
  | String of string
  | Float of float

let string_of_t t =
  match t with
      Int i -> string_of_int i
    | String s -> s
    | Float f -> string_of_float f
;;

let stringify l =
  List.map (fun x -> string_of_t x) l
;;

stringify [Int 1; Int 2; Int 3];;
stringify [String "this"; String "is"; String "polymorphic?"];;
    
