(1..10).each { |x| puts x }

let rec range_each (i,j) f =
  if i > j then ()
  else 
    let _ = f i in (* throws away result *)
    range_each (i+1,j) f
    
