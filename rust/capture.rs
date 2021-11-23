fn main() {
    let x = 4;
    let equal_to_x = |z| z == x;
    let y = 4;
    assert!(equal_to_x(y));
    println!("{}",x);

    
    let x = String::from("hi");
    let add_x = |z| x+z; //captures x; is FnOnce
    //println!("x = {}",x); //fails
    let s = add_x(" there");//consumes closure
    println!("{}",s);
    //let t = add_x(" joe");//fails, add_x consumed
    
}
