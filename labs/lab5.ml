(* Here is the signature for a BST Module*)
module type BST = sig
   (* An abstract type, defining a bst
      Abstract types are usable outside of the module,
      but the concrete implementation is hidden. *)
   type 'a bst

   (* Returns an empty bst *)
   val empty_bst : 'a bst

   (* Returns true if the tree is empty *)
   val is_empty : 'a bst -> bool

   (* Inserts a value into a bst *)
   val insert : 'a bst -> 'a -> 'a bst

   (* Returns true if for a given tree and value,
      the value is present in the tree *)
   val is_member : 'a bst -> 'a -> bool
end

(* Here is a partially completed implementation for the module *)
module BSTImpl = struct
   (* A concrete type for a bst. Either an empty tree Nil,
      or a Node consisting of a value and 2 child trees. *)
   type 'a bst = Nil | Node of 'a * 'a bst * 'a bst

   (* A function to return an empty tree. This is useful
      because the bst type is abstract, and we need some
      sort of way to "initialize" a tree. *)
   let empty_bst = Nil

   (* Returns false if the function recurses down to
      an empty tree, or true if it finds the value a
      on some node along the path from root to leaf. *)
   let rec is_member bst a = match bst with
   | Nil -> false
   | Node (v, l, r) -> if a = v then true
                       else if a < v then is_member l a
                       else is_member r a

   (* You should fill in the function to return true
      if a tree is empty, and false if it is not.
      Use pattern matching on bst to break it down into
      the two cases: Nil and Node. *)
   let is_empty bst = ()

   (* You should fill in the function to return a new
      copy of the bst with a new node with value a added. *)
   let rec insert bst a = ()
end

(* This binds the module BST to the implementation BSTImpl
   and gives it a "friendly name" Bst.*)
module Bst : BST = BSTImpl

(* To use this module, fire up ocaml, and then type the line:
   #use "lab5.ml";;

   To start making a bst, use:
   let t = Bst.empty_bst;;

   t is now bound to an abstract bst (You cannot see its type)

   To insert values into the bst:
   let t2 = Bst.insert t 2;;

   Note the this returns a copy of the tree, so we must store it
   into t2. t will not be modified by insert, because we are
   creating BST to be a purely functional data structure.
 
   To test your insert function, use the provided is_member:
   Bst.is_member t2 2;;

   If all goes well, congrats! You've created your first purely
   functional data structure!
*)
