public class Util {
    public static void reverseArray(Object[] a) {
	for (int i = 0, j=a.length-1; i<j; i++,j--) {
	    Object tmp = a[i];
	    a[i] = a[j];
	    a[j] = tmp;
	}
    }
    public static void main(String args[]) {
	Integer[] a = { 1, 2, 3, 4 };
	for (Integer x : a) {
	    System.out.println(x);
	}
	System.out.println("===");
	reverseArray(a); /* OK: Java treats Integer[] < Object[] */
	for (Integer x : a) {
	    System.out.println(x);
	}
    }
}
