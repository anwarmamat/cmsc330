// fn
fn apply_to_3<F>(f: F ) -> i32 where F: Fn(i32) -> i32 {
    f(3)
}

//FnOnce
fn apply_to_3_once<F>(f: F ) -> i32
where F: FnOnce(i32) -> i32 {
    f(3)
}

fn main() {
    let s = String::from("hello");
    let double = |x| { let _t = &s; 2 * x };
    
    println!("3 doubled: {}", apply_to_3(double));
    //can invoke the closure again
    println!("3 doubled: {}", apply_to_3(double));
    println!("{}",s);
    
    /*
    FnOnce can only be called once. s does not have to be borrowed.
	t takes the ownership of s.
    */
    let s2 = String::from("hello");
    let double = |x| { let _t = s2; 2 * x };
    
    println!("3 doubled: {}", apply_to_3_once(double));
    
    /*
    closure cannot be invoked more than once because it 
    moves the variable `s` out of its environment
    */
    //println!("3 doubled: {}", apply_to_3_once(double)); 
    
    // s2 is moved
    //println!("{}",s2);
    
}
