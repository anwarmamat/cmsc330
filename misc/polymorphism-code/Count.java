import java.util.Collection;
import java.util.Iterator;
import java.util.ArrayList;

public class Count {
    public static int count(Collection<?> c) {
	int j = 0;
	// Uses a wildcard
	for (Iterator<?> i = c.iterator(); i.hasNext(); ) {
	    Object e = i.next(); j++;
	    //c.add(e); // will fail to compile
	}
	return j;
    }
    public static void main(String args[]) {
	ArrayList<Integer> x = new ArrayList<Integer>();
	Collection<Integer> y = x;
	count(y);
    }
}
