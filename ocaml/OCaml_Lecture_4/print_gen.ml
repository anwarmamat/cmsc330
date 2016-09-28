(*
CMSC330 Organiztions of Programming Languages
 Fall 2016
 Anwar Mamat
*)

type gen = Int of int
			|Str of string;;

let l = [Int 10; Str "alice"; Int 30; Str "bob"];;

let rec print_gen_list l = 
	match l with 
		[]->print_string ""
		|h::t->
			(match h with 
				|Int x->print_int x;print_string "\n"
				|Str s->print_string s;print_string "\n"
			);
			print_gen_list t	
;;

print_gen_list l;;


(*  We can also use map to print the list *)
let print_gen x = 
	match x with				
		|Int i->print_int i;print_string "\n"
		|Str s->print_string s;print_string "\n"
;;

List.map print_gen l;;


				
