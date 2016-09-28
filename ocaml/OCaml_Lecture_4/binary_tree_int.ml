(*
CMSC330 Organiztions of Programming Languages
 Fall 2016
 Anwar Mamat
*)

type int_tree =
    IntLeaf 
  | IntNode of int * int_tree * int_tree
;;

let empty_int_tree = IntLeaf
;;
let rec int_insert x t =
  match t with
      IntLeaf -> IntNode(x,IntLeaf,IntLeaf)
    | IntNode (y,l,r) when x > y -> IntNode (y,l,int_insert x r)
    | IntNode (y,l,r) when x = y -> t
    | IntNode (y,l,r) -> IntNode(y,int_insert x l,r)

;;
let rec int_mem x t =
  match t with
      IntLeaf -> false
    | IntNode (y,l,r) when x > y -> int_mem x r
    | IntNode (y,l,r) when x = y -> true
    | IntNode (y,l,r) -> int_mem x l
;;

let rec sum_of_tree t=
	match t with 
 		IntLeaf->0
 		|IntNode (y,l,r)-> y + sum_of_tree l + sum_of_tree r
 ;;
 

let rec height t=
	match t with 
 		IntLeaf->0
 		|IntNode (y,l,r)-> 1 + (max (height l)  (height r))
 ;;
 

 
 let t = empty_int_tree;;
 let t = int_insert 10 t;;
 let t = int_insert 8 t;;
 let t = int_insert 20 t;;
 let t = int_insert 30 t;;
 let t = int_insert 40 t;;
 let t = int_insert 4 t;;
 let t = int_insert 2 t;;
 let t = int_insert 45 t;;
  let t = int_insert 50 t;;
 let n = sum_of_tree t;;
 print_int n;;
 print_newline();;
 
 
 let h = height t;;
 print_int h;;
 print_newline();;
 