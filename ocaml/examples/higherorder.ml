Using fold and/or map, write a function multi_map of type ('a -> 'a) -> ('a * int) list -> 'a list. This new higher order function applies the input function to each element pf th einput list however many times are specificed by the second element of the tuple. Output order must be the same as the input order. If a negative int is encountered, do not apply the function to that element. Helper functions are allowed.

Example input: 
multi_map (fun x -> x * x) [(5,1); (7,-1); (2,3); (10,2)] ==> [5, 7, 256, 10000]

let rec map f l = 
  match l with 
|[]->[]
|h::t -> let r = f h in r::map f t
;;

Solution:

let rec multi_map f l = 
  let rec apply e n = if n <= 0 then e
                      else apply (f e) (n-1) in
                      match l with
                      |[] -> []
                      |(e,n)::t -> (apply e n)::(multi_map f t)

;;


Using fold and/or map, write a function relative of type int list -> int list. This function decreases each element in the input list by the list's smallest integer.

Example: 
relative [100;80;90]==>[20; 0; 10]

Solution: 
let relative l = 
  match l with 
  |[] -> []
  |h::t -> let s = fold min h t in map (fun h -> h -s) l
  ;;

                    
Using fold and/or map, write a function max_repeat of type 'a list->int. This function finds the maximum numbrt of times an element of the input lit is repeated in a row. If the list is empty, the result should be 0.
Hint: The prevaisive max might make your implementation easier. 

example:

max_repeat [1;2;2;2;0;3;3;3;3] ==> 4

Solution:

let max_repeat x = 
  match x with 
  |[] -> 0
  |h::t -> let aux (c,n,m) h = 
              if c = h then (c, n+1, m) 
              else (h,1,max m n) in
  let (_,n m) = fold aux (h,1,1) t in
max n m
;;

