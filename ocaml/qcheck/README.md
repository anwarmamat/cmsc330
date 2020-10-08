(*install:*)

opam install qcheck

(* open QCheck in toplevel *)

#require "qcheck";;
open QCheck;;

open QCheck

let mytest = Test.make float (fun f -> floor f <= f)
(*val mytest : QCheck.Test.t = QCheck.Test.Test <abstr> *)

let _ = QCheck_runner.run_tests [mytest]


(* Generate 100 random integers *)

Gen.generate ~n:100 Gen.int;;

(* Generate 2 int lists *)

let t = Gen.generate ~n:2 (Gen.list Gen.int);;

(*or *)

let t = Gen.generate ~n:5 (Gen.list Gen.small_int);;
(* t : int list = [6; 9; 14; 6; 7] *)



(* check the length of the lists *)

List.map (fun x ->List.length x) t;;

(*
int list = [46; 32]
*)
(* generate 2 string list *)
let s = Gen.generate ~n:2 (Gen.list Gen.string);;

(*

s = [ ["a";"z"]; ["abc";"xyz"...]]
*)

let rec reverse = List.rev;;

let prop_reverse l =
    rev (rev l) = l

let test =QCheck.Test.make ~count:1000 ~name:"reverse_test" QCheck.(list small_int) (fun x-> prop_reverse x);;

(* run the test *)
QCheck.Test.check_exn test;;

(* or *)
QCheck_runner.run_tests [test];;



(* passes *)

(* buggy reverse *)

let rev l = l;;

(* fails to catch the bug *)
let prop_reverse l =
    rev (rev l) = l


(* second buggy propery *)
let prop_reverse2 l =
    let r = rev (rev l) = l in
    if List.length l > 1 then r && rev l <> l
    else r
    ;;

(* fails at [0;0] *)

(* another try *)
let prop_reverse3 l =
    let r = rev (rev l) = l in
    if List.length l > 1 then r && rev l != l
    else r
    ;;

(* fails at [0;0] *)
(* this test case does not make sense *)


(* delete test *)


let rec delete x l = match l with
   [] -> []
 | (y::ys) -> if x == y then ys
              else y::(delete x ys)

let prop_delete x l =
   not (List.mem x (delete x l))


let test =QCheck.Test.make ~count:1000 ~name:"reverse_test"
(QCheck.pair QCheck.small_int QCheck.(list small_int))
(fun( x, l)-> prop_delete x l)


QCheck_runner.run_tests [test];;
