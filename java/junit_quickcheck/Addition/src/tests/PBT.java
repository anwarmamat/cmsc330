package tests;

import static org.junit.Assert.assertEquals;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import org.junit.runner.RunWith;

import com.pholser.junit.quickcheck.Property;
import com.pholser.junit.quickcheck.generator.InRange;
import com.pholser.junit.quickcheck.runner.JUnitQuickcheck;

import add.Add;

@RunWith(JUnitQuickcheck.class)
public class PBT {
	@Property (trials = 5)
	public void test(int a, int b) throws Exception {
		System.out.println(a +"\t" + b);
	        assertEquals(Add.add(a, b), a+b);
	}
	
	@Property (trials=500)
	public void test2(@InRange(minInt = 0, maxInt = 1000) int a, @InRange(minInt = 0, maxInt = 1000) int b) throws Exception {
		System.out.println("a:" + a + "\tb:"+b+"\tsum:" + Add.add(a, b));
	        assertEquals(Add.add(a, b), a+b);
	}
	
	/**
	@Property (trials = 5)
	public void testList(List<String> l1) {
		List<String> l2 = l1.stream().collect(Collectors.toList());
		Collections.reverse(l2);
		Collections.reverse(l2);
	    assertEquals(l1, l2);
	}
	*/
}

