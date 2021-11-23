fn main(){
  let a = [0, 1, 2, 3, 4, 5];
  let mut iter2 = a.iter().map(|x| 2 * x);
  iter2.next();
  let t2 = iter2.next();
  println!("{:?}", t2)
}
