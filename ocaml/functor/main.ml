open Liststack;;


(* create a stack that holds integers *)
module IntStack = ListStack(IntItem);;

Printf.printf "IntStack:"
   
let t = IntStack.empty
;;
let t2 = IntStack.push 10 t
;;
let t3 = IntStack.push 20 t2
;;
let t4 = IntStack.push 30 t3
;;

Printf.printf "stack: %s\n" (IntStack.to_string t4)
;;


(* create a stack that holds floats *)
Printf.printf "FloatStack:"
module FloatStack = ListStack(FloatItem);;   
let t = FloatStack.empty
;;
let t2 = FloatStack.push 10.5 t
;;
let t3 = FloatStack.push 20.0 t2
;;
let t4 = FloatStack.push 30.0 t3
;;

Printf.printf "stack: %s\n" (FloatStack.to_string t4);;


(* create a stack that holds points *)

module PointStack = ListStack(PointItem);;
let b = PointStack.empty;;

let b = PointStack.push ({x=1;y=2}) b;;
let b = PointStack.push ({x=10;y=20}) b;;
let b = PointStack.push ({x=100;y=200}) b;;
Printf.printf "Point Stack:%s\n" (PointStack.to_string b)


 
