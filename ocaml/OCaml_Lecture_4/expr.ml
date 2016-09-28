(*
CMSC330 Organiztions of Programming Languages
 Fall 2016
 Anwar Mamat
*)

let rec power x y=
	if(y <= 1 ) then x else x * power x (y-1)
	;;
type expr = 
	Num of int
	| Add of expr * expr
	| Sub of expr * expr
	| Mul of expr * expr
	|Div of expr * expr
	|Power of expr * expr
;;

let rec evaluate e =
	match e with
		Num x -> x
		| Add (e ,e') -> evaluate e + evaluate e'
		| Sub (e, e') -> evaluate e - evaluate e'
		|Mul (e ,e') -> evaluate e * evaluate e'
		|Div (e ,e') -> evaluate e / evaluate e'
		|Power (e ,e') -> power (evaluate e) (evaluate e')
;;

evaluate (Add (Num 5,  Power(Mul (Num 4, Num 3), Num 2)))
5+(4*3)^2
;;