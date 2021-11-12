

package counter;

public final class Counter {
    private int count;
   
    public Counter() {
    	count = 0;
    }

    public Counter increment() {
    		++count;
    		//++last_count;
    		//if(last_count != 25) 
    		//count.count = last_count;
        return this;
    }

    public Counter decrement() {
        --count;
        return this;
    }

    public int count() {
        return count;
    }
    
}
