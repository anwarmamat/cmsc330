open Fraction_module_sig
       

let f1 = Fraction.make_frac(2,8);;
let f2 = Fraction.make_frac(25,100);;
print_endline (Fraction.toString (Fraction.add (f1,f2)));;


