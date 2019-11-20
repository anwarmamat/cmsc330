

(* A stream is an infinite list. Sometimes these are also called sequences, delayed lists, or lazy lists. *)
 type stream = Nil | Cons of int * stream lazy_t;;

let rec ones = Cons(1, lazy ones);;

let rec from  n  =  Cons(n, lazy (from (n+1)));;
 let nats = from 0;;

let hd (s : stream) : int =
  match s with
    Nil -> failwith "hd"
  | Cons (x, _) -> x

let tl (s : stream) :  stream =
  match s with
    Nil -> failwith "tl"
  | Cons (_, g) -> Lazy.force g (* get the tail by evaluating the thunk *)



let rec take (s : stream) (n : int) : int list =
  if n <= 0 then [] else
  match s with
    Nil -> []
  | _ -> hd s :: take (tl s) (n - 1)

let t = take nats 10;;


let rec map (f : int -> int) (s : stream) :  stream =
  match s with Nil -> Nil
  | _ -> Cons (f (hd s), lazy (map f (tl s)))

let rec filter (f : int -> bool) (s : stream) : stream =
  match s with Nil -> Nil
  | Cons (x, g) ->
      if f x then Cons (x, lazy (filter f (Lazy.force g)))
      else filter f (Lazy.force g)

let rec map2 (f: int -> int -> int)
             (s : stream) (t : stream) : stream =
  match (s, t) with
    (Nil, Nil) -> Nil
  | (Cons (x, g), Cons (y, h)) ->
       Cons (f x y, lazy (map2 f (Lazy.force g) (Lazy.force h)))
  | _ -> failwith "map2"


let square n = n * n;;
take (map square nats) 20;;

let even = fun n -> n mod 2 = 0;;

take (filter even nats) 20;;



let fib1 : stream =
  let rec fibgen (a : int) (b : int) : stream =
    Cons(a, lazy (fibgen b (a + b)))
  in fibgen 1 1
;;

take fib1 10;;

  let rec fib2 : stream =
   let add = map2 (+) in
  Cons (1, lazy (Cons (1, lazy (add fib2 (tl fib2)))))
  ;;
  
take fib2 10;;


  (* delete multiples of p from a stream *)
  let sift (p : int) : stream -> stream =
    filter (fun n -> n mod p <> 0)
;;

 take (sift 2 nats) 10;;


 (* sieve of Eratosthenes *)
let rec sieve (s : stream) : stream =
  match s with Nil -> Nil
  | Cons (p, g) -> Cons (p, lazy (sieve (sift p (Lazy.force g ))))

(* primes *)
let primes = sieve (from 2)
;;
take primes 20;;


