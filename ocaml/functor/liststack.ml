
(* Stack Implemented as List *)

open Stack;;

module type Stringable =                                                
  sig                                                             
    type t                                                        
    val to_str: t->string                                                       
  end

module IntItem : (Stringable with type t = int) =
  struct
    type t = int
    let to_str = string_of_int
  end

module FloatItem : (Stringable with type t = float) =
  struct
    type t = float
    let to_str = string_of_float
  end

type point ={x:int;y:int};;

module PointItem : (Stringable with type t = point) =
  struct
    type t = point
           let to_str x ="(1,1)"
  end
;;

module ListStack(Elt:Stringable) : (Stack with type item = Elt.t)  = struct
  type item = Elt.t
  type t = item list

  let empty = []
  let is_empty s = s = []
  let push x s = x :: s
  let peek = function 
    | []   -> failwith "Empty"
    | x::_ -> x
  let pop = function 
    | []    -> failwith "Empty"
    | _::xs -> xs

  let to_string x = "[" ^ List.fold_left (fun x y-> x ^ (Elt.to_str y) ^ ",") "" x ^ "]"
                                        
end
;;
