(*
CMSC330 Organiztions of Programming Languages
 Fall 2016
 Anwar Mamat
*)

(* Polymorphic data types *)

type 'a my_list =
    Nil
  | Cons of 'a * 'a my_list;;


let rec len = function
    Nil -> 0
  | Cons (_, t) -> 1 + (len t);;

len (Cons (10, Cons (20, Cons (30, Nil))));;

let rec my_list_of_list (ls : 'a list) : 'a my_list = 
    match ls with
    [] -> Nil
  | h::t -> Cons(h, (my_list_of_list t));;

let ol = my_list_of_list [1;2;3;4];;

let rec sum l = 
	match l with 
	|Nil->0	(* we had None ->0 in class. That does not work. *)
	|Cons(y,t)->y + (sum t);;
	

