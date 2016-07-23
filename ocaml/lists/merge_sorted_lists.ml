(*

Write a general function merge which takes as argument a comparison 
function and two lists sorted in this order and returns the list 
merged in the same order. 

The comparison function will be of type 'a -> 'a -> bool. 

Anwar Mamat
*)

(* student record *)
type student = {id:int;name:string}

(* comparison functions *)
let f_id  a b = a.id < b.id

let f_name  a b = a.name < b.name

(*

	merge two sorted lists into one list
*)

let rec merge f a b = 
	match (a,b) with
		|([],x)->x
		|(x,[])->x
		|(h1::t1,h2::t2)-> if (f h1 h2) then h1::(merge f t1 b)
							else  h2::(merge f a t2)
;;

(*

	display the student list
*)

let rec prt_student_list lst = 
	match lst with
		[]->()
		|h::t->print_int h.id; print_string " "; print_string h.name; print_string "\n";prt_student_list t

(* student list 1 *)
let s1 = [{id=100;name="alice"};{id=110;name="bob"};{id=120;name="cat"}]

(* student list 2 *)
let s2 = [{id=98;name="ethan"};{id=105;name="frank"};{id=112;name="george"}]

let s3 = merge f_id s1 s2;; (* merge them by id order *)
let s4 = merge f_name s1 s2;; (* merge then by name order *)

prt_student_list s3	  (* print the sorted list *)




