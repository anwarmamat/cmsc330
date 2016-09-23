# Exercise 1
# Regular Expressions
# Create a regex which matches simplified US telephone numbers and
# uses back references i.e. ()'s to separate the numbers into their 3 parts

r = //

"808-355-5585" =~ r
puts $1
puts $2
puts $3

# Create a regex that matches strings with exactly two vowels in them

r = //

"dog" =~ r
"doggo" =~ r
"I match!" =~
"I do not" =~ r

# Create a regex for binary strings i.e. 0's and 1's which start and end
# with opposite values, and which contain the substring "010"

r = //
"00101" =~ r
"10011110110100" =~ r

# The following edge case need not be matched, but I'll present it as
# a challenge.

"0101" =~ r



(* 
 Exercise 2
 OCaml
 Successfully grokking OCaml requires stretching the ways we
 normally think about programming, coming from a procedural
 OO background. Let's start by familiarizing ourselves with
 some of the basic building blocks of OCaml code.
*)

let average a b =
   let sum = a +. b in
   sum /. 2.0

(* 
   let average a b =

   This line defines a global expression "average" which
   takes 2 arguments, a and b.

   let sum = a +. b in

   This line declares a local variable and its evaluation
   in the body of average. Note the subtle difference in
   syntax. Though this line also starts with let, it uses
   the keyword "in", which is a clue that lets you know
   that sum is locally scoped. let ... = is a clue
   that an expression is globally scoped.

   sum /. 2.0

   This line divides the floating point number sum by 2
   and also implicitly "returns" the value as the
   result of calling the function.

   Try loading this file into OCaml and running the average
   function now.
*)






(* 
   (* Psst! Ocaml allows nested comments too! *)

   Write an expression called sqrt which evaluates the
   square root of some number a.
*)






(*
   Let's look at another function Factorial,  which gives
   us a chance to look at how OCaml does repetition and
   branches. 
*)

let rec factorial a =
   if a = 0 then 1
   else a * factorial (a - 1)

(*
   let rec factorial a =

   This line defines a recursive global expression,
   meaning inside the body of the expression, it can
   refer to itself.

   if a = 0 then 1

   This is the base case for our recursion. Then 1 means
   we "return" 1

   else a * factorial (a - 1)

   All OCaml if expressions require an else branch.
   Thankfully, ours is useful here! We return ‘a’ times
   the recursively arrived at value for the rest of
   the factorial function.
*)


(* 
   Write a function Fibonacci that evaluates the nth
   term in the fibonacci sequence, following the
   structure above
*)