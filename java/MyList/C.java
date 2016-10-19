class C {
    int x = 0;
    void set_x(int y) { x = y; }
    int get_x() { return x; }

    public static void main(String args[]) {
	C c = new C();
	c.set_x(3);
	int y = c.get_x();
	System.out.println(y);
    }
}