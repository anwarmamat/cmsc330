
package test;

import static org.junit.Assert.*;

import org.junit.runner.RunWith;

import com.pholser.junit.quickcheck.From;
import com.pholser.junit.quickcheck.Property;
import com.pholser.junit.quickcheck.generator.Fields;
import com.pholser.junit.quickcheck.generator.InRange;
import com.pholser.junit.quickcheck.runner.JUnitQuickcheck;

import counter.Counter;

@RunWith(JUnitQuickcheck.class)
public class PBT {
	
    @Property (trials=5) 
    public void incrementing(@From(Fields.class) Counter c) {
    	int count = c.count();
    	assertEquals(count + 1, c.increment().count());	  
    }
  
    @Property (trials=5) 
    public void decrementing(@From(Fields.class) Counter c) {
        int count = c.count();
        assertEquals(count - 1, c.decrement().count());
    }
    /**
     * You can generate values for a type that has an accessible 
     * zero-arg constructor by using the Fields generator with @From.
     */
    @Property(trials=5)  
    public void inRange(@InRange(minInt = 0, maxInt = 100) int num, @From(Fields.class) Counter c) {
    	int old = c.count();
    	System.out.println("num:" + num + "\tCount:" + old);
    	for(int i = 0; i < num; i++) {
    		c.increment();
    	}
    	int cnt = c.count() - old;
        assertEquals(num, cnt );
    }
}
