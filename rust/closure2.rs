
fn app_int<T>(f:T,x:i32) -> i32
    where T:Fn(i32) -> i32
{
  f(x)
}
fn main() {
  println!("{}",app_int(|x| x*2, 10));
}
