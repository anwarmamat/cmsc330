module type Printable =
  sig
    type t
    val to_str: t-> string
  end

module Int: Printable with type t = int =
  struct
    type t = int
    let to_str = string_of_int
  end

module Float: Printable with type t = float =
  struct
    type t = float
    let to_str = string_of_float
  end

(* Int2 module does not use the Printable signature *)
module Int2  = 
  struct
    type t = int
    let to_str = string_of_int
  end

module Float2 = 
  struct
    type t = float
    let to_str = string_of_float
  end

  
module Printer(E:Printable) =
  struct
    let print x = Printf.printf "%s\n" (E.to_str x)
  end

module IntPrinter = Printer(Int);;

module FloatPrinter = Printer(Float);;

module Int2Printer = Printer(Int2);;
module Float2Printer = Printer(Float2);;

let main () =
  IntPrinter.print 10;
  FloatPrinter.print 1.5;
  Int2Printer.print 88;
  Float2Printer.print 2.5
  
let () = main ()
    

