module type Stack = sig
  (* The type of a stack whose elements are type 'a *)
  type item
  type t

  (* The empty stack *)
  val empty : t

  (* Whether the stack is empty*)
  val is_empty : t -> bool

  (* [push x s] is the stack [s] with [x] pushed on the top *)
  val push : item ->t ->t 

  (* [peek s] is the top element of [s]. 
     Raises Failure if [s] is empty. *)
  val peek : t -> item

  (* [pop s] pops and discards the top element of [s]. 
     Raises Failure if [s] is empty. *)
  val pop : t -> t

  val to_string : t -> string
end
