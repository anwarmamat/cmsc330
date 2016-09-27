(*
   Higher Order Programming
      Given definitions for map and fold, work through some of these tricky puzzles
*)

let rec map f l =
   match l with
   | []   -> []
   | h::t -> (f h)::(map f t);;

let rec fold f acc l =
   match l with
   | []   -> acc
   | h::t -> fold f (f acc h) t;;

(* Observe how map uses double to double everything in the list.
   Re-wrte the call to map to use an anonymous function instead *)

let double x = 2 * x;;

map double [1;2;3];;

map (fun x -> x * 2) [1;2;3];;

(* Write a function evens which takes a list and uses map to create
   a list of booleans, where each even number corresponds to a True
   value in the new list, and each odd number corresponds to False *)
(* ie. [1;2;3;4] => [False;True;False;True] *)

let evens l = map (fun x -> if x mod 2 = 0 then true else false) [1;2;3;4];;

(* Write a function summation which uses fold to compute the sum
   of a list *)

(* Write a function sum_cube_odd that computes the sum of the cubes
   of all the odd numbers between 0 and n inclusive. *)
(* i.e. [1;2;3;5] 4 => 28 *)

let sum_cube_odd l n = fold (fun acc x -> if (x mod 2 = 1) & (x < n) then acc + int_of_float (float_of_int x ** 3.0) else acc + 0) 0 l;;

(* Write a function evens2 which only selects even numbers from a list *)
(* i.e. [1;2;3;4] => [2;4]*)

let evens2 l = fold (fun acc x -> if x mod 2 = 0 then x::acc else acc) [] l;;

(* Write a function which uses fold with an empty list as an accumulator
   to write your own definition of map *)

let map2 f l = fold (fun acc x -> (f x)::acc) [] l;;

(* Write a function mean_of_lists which takes a list of int lists
   and uses map and fold to:
   * Sum up each sub-list
   * Sum the sums of each sub list
   * Divide the sums of the sub lists by the number of sub-lists *)
(* Hint: Consider the structure of the computation at each step of the process
      That is to say, if you need a list for a given step, use map
      If you need a singleton value, use fold. *)

let x = [[1;2;3];[2;9;12];[14;-2;0]];;

let mean_of_lists l =
   let length l = fold (fun acc h -> acc + 1) 0 l in
   let len = length l in
   let list_of_sums = map (fold (fun acc x -> acc + x) 0) l in
   let sum_of_sums = fold (fun acc x -> acc + x) 0 list_of_sums in
   sum_of_sums / len;;
