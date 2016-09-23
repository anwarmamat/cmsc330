let rec range_each (i,j) f =
  if i > j then ()
  else 
    let _ = f i in (* throws away result *)
    range_each (i+1,j) f
;;

let puts x = print_int x; print_string "\n"
;;

(* (1..10).each { |x| puts x } *)

range_each (1,10) (fun x -> 
  puts x)
;;
