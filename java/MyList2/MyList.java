public class MyList {

  private class ConsNode {
    int head; MyList tail;
    ConsNode (int h, MyList l) { head = h; tail = l; }
  }
      
  private ConsNode contents;

  public MyList () {
    contents = null;
  }

  public MyList (int h, MyList l) {
    contents = new ConsNode (h, l);
  }

  public MyList cons (int h) {
    return (new MyList (h, this));
  }
    
  public int hd () {
    return contents.head;
  }
    
  public MyList tl () {
    return contents.tail;
  }

  public boolean isNull () {
    return (contents == null);
  }

  public MyList map (Function<Integer,Integer> f) {
    if (this.isNull()) return this;
    else return (this.tl()).map(f).cons (f.eval (this.hd()));
  }


  public int fold (Function<Integer,Function<Integer,Integer>> f, int a) {
    if (this.isNull()) return a;
    else return (this.tl()).fold(f, f.eval(a).eval(this.hd()));
  }

  

  public String toString () {
    if (this.isNull()) return "[]";
    else {
	String tlStr = this.tl().toString();
	return this.hd()+"::"+tlStr;
    }
  }
    public static void main(String args[]) {
	MyList l = new MyList().cons(1).cons(2).cons(3); // makes list [3;2;1] == 3::2::1::[]
	System.out.println(l);
	MyList m = l.map(new AddOne()); // makes list [4;3;2] == 4::3::2::[]
	System.out.println(m);
	
	Function<Integer,Integer> f = (x) -> x + 2;
	
	
	MyList n = l.map(f); // Java 8 syntax!
	System.out.println(n);
	
	
	
	Function<Integer, Function<Integer,Integer> > add =  (x)->(y) -> x+y;
	
	int sum = l.fold(add,0); // Java 8 syntax!
	System.out.println("sum=" + sum);
	
	
	
	Function<Integer, Function<Integer,Integer> > mul =  (x)->(y) -> x*y;
	
	int p = l.fold(mul,1); // Java 8 syntax!
	System.out.println("Prod=" + p);
	
	
    }
}
