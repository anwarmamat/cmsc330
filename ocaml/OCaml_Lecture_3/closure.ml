(* what's the type of this function? *)
let add_n n =
  let f x = 
    print_string "this is my message\n";
    x+n in
  f 

(* What does this do? What's its type? *)
let add5 x = add_n 5 x

(* value? *)
let x = add5 6;;

print_string "outer call: ";
print_int x;;
print_string "\n";;

