fn main(){
    let s = String::from("hello");
    {
        let concat =  |x: u32| {let _t = &s; x * 2};
        concat(10);
    }
    println!("{}",s);


/*
move closures give a closure its own stack frame. 
Without move, a closure may be tied to the stack 
frame that created it, while a move closure is 
self-contained. This means that you cannot generally 
return a non-move closure from a function.
*/
    
    /*
    {
        let concat =  |x: u32| {let _t = s; x * 2};
        concat(10);
    }
    println!("{}",s);//error. moved
     */

    {
        let concat =  move |x: u32| {let _t = &s; x * 2};
        concat(10);
    }
    //println!("{}",s);//error moved. 
    
}
