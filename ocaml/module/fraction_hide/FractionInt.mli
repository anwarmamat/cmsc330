module type FractionInt =
  sig
    type fraction (* hide the type *)
    exception BadFrac
    val make : (int*int) -> fraction
    val add : fraction * fraction -> fraction
    val toString : fraction -> string
  end
