public class Counter {
    private int c = 0;
    private int d = 1;
    public int get() {
	int x = c;
	c = c + 1;
	return x;
    }
    public int getagain() {
	int x = d;
	d = d + 1;
	return x;
    }

    public static void main(String args[]) {
	Counter c = new Counter();
	System.out.println(c.get());
	System.out.println(c.get());
	System.out.println(c.get());
	Counter c2 = new Counter();
	System.out.println(c2.get());
	System.out.println(c2.get());
	System.out.println(c2.get());
    }
}