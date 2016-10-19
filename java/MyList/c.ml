type cobj =
    { set_x: int -> unit;
      get_x: unit -> int }

let make_c () =
    let x = ref 0 in
    { set_x = (function y -> x := y);
      get_x = (function () -> !x) }

let c = make_c ();;
c.set_x(3);;
let y = c.get_x();;
Printf.printf "%d\n" y;;
