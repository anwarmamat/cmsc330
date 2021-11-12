package test;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import counter.Counter;
class UnitTests {
	@Test
	void test_inc1() {
		Counter c = new Counter();
		int expected = 1;
		c.increment();
		int result = c.count();
		assertEquals(expected, result);		
	}
	
	@Test
	void test_inc10() {
		Counter c = new Counter();
		int expected = 10;
		for(int i = 0; i < 10; i++) c.increment();
		int result = c.count();
		assertEquals(expected, result);		
	}
}
