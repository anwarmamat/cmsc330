public class C extends A {
    // The following method *overloads* the name method()
    //   It does *not* override the method from A
    //   because it's argument type is different
    Integer method(Object x) { return new Integer(1); }
    // The following method *overrides* the method from
    //   A because it has the same argument type and its
    //   return type (Integer) is a subtype of the
    //   method in A (i.e., Object).
    Integer method(String x) { return new Integer(1); }
    public static void main(String args[]) {
	A x = new C();
	Object y = x.method("hello"); // calls second method, printing 1
	System.out.println(y);
    }
}
