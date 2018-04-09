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
  
  @Override
  public String toString(){
	  String str="";
	  MyList t = this;
	  while(t != null){
		  str += t.hd();
		  str += "->";
		  t = t.tl();
	  }
	  return str;
  }
  
  public MyList map (IntFunction f) {
	    if  (this.isNull() ) 
	    	return this;
	    else if(this.tl() == null)
	    	return new MyList((f.eval (this.hd())), this.tl());
	    else 
	    	return (this.tl()).map(f).cons (f.eval (this.hd()));
	  }   
	  
	  
	  
  public int fold (IntBinFunction f, int a) {
	    if (this.isNull()) 
	    	return a;
	    else if(this.tl() == null)
	    	return f.eval(a, this.hd());
	    else 
	    	return (this.tl()).fold(f, f.eval(a, this.hd()));
	  } 

}
