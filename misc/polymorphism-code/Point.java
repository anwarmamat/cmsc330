public class Point {
    int x = 0, y = 0;
    // *overloads* equals() method, does not override it
    public boolean equals(Point p) {
	return (p.x == x) && (p.y == y);
    }
    public static void main(String args[]) {
	Point p1 = new Point();
	Point p2 = new Point();
	Object o = p1;
	System.out.println(o.equals(p2)); // prints false
	System.out.println(p1.equals(p2)); // prints true
    }
}
