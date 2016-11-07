public class J implements Ifc {
    /* Doesn't work because this foo() does not have the same type as
       the one in the interface */
    int foo(Object x, Object y) {
	return x.hashCode();
    }
}
