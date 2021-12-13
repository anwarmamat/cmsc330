fn main(){
    let a = vec![10,20,30]; 
    let i = a.iter();
    let j:Vec<i32> = i.map(|x| x+1).collect(); //[11,21,31]
    let k = j.iter().fold(0,|a,x| x-a); //21= 31-(21-(11-0))
    println!("k={}",k);

    for e in a.iter(){        
        print!("{},",e);
    } 
    println!();
    for e in a.iter().filter(|&&x| x == 10) {        
        println!("{},",e);
    } //prints 10
    println!();
}
