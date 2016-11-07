public class B extends A {
    void newMethod() { return; }
    public static void main(String args[]) {
	B[] bs = new B[3];
	A[] as = bs; // OK since B[] < A[]
	as[0] = new A();
	bs[0].newMethod(); // runtime failure!
    }
}
