fn main(){
  let a = vec![10,20];

  let i = a.iter();

  let j:Vec<i32> = i.map(|x| x+1).collect(); //[11,21]

  let k = a.iter().fold(0,|a,x| x-a); //10

  println!("{}",k);

  for e in a.iter().filter(|&x| *x >= 10) {
    println!("{}",e);
  } //prints 10,20
}
