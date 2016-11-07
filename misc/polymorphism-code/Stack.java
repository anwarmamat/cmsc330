class Stack<T> {
  class Entry {
    T elt; Entry next;
    Entry(T i, Entry n) { elt = i; next = n; }
  }
  Entry theStack;
  void push(T i) {
    theStack = new Entry(i, theStack);
  }
 T pop() throws Exception {
    if (theStack == null)
      throw new Exception();
    else {
      T i = theStack.elt;
      theStack = theStack.next;
      return i;
    }
 }
    public static void main(String args[]) throws Exception {
	Stack<String> is = new Stack<String>();
	String i;
	is.push("hello");
	is.push("there");
	i = is.pop();
	Stack<Integer> iis = new Stack<Integer>();
	iis.push(1);
	iis.push(2);
    }
}
