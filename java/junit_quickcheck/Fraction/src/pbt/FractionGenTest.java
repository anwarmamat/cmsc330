package pbt;

import static org.junit.Assert.assertEquals;

import org.junit.runner.RunWith;

import com.pholser.junit.quickcheck.From;
import com.pholser.junit.quickcheck.Property;
import com.pholser.junit.quickcheck.generator.InRange;
import com.pholser.junit.quickcheck.runner.JUnitQuickcheck;

import fraction.Fraction;

@RunWith(JUnitQuickcheck.class)
public class FractionGenTest {
	@Property (trials=500)
	public void testsub(@InRange(minInt = 1, maxInt = 10000) int a, @InRange(minInt = 1, maxInt = 10000) int b) throws Exception {
		Fraction f1 = new Fraction(a,b);
		Fraction f2 = new Fraction(a, b *2);
	    assertEquals(f1.sub(f2), f2);
	}
	
	@Property (trials=500)
	public void testadd(@InRange(minInt = 0, maxInt = 1000) int a, @InRange(minInt = 1, maxInt = 1000) int b) throws Exception {
		Fraction f1 = new Fraction(a,b);
	    assertEquals(f1.add(f1), new Fraction(a*2,b));
	}
	
	@Property (trials=500)
	public void testmul(@InRange(minInt = 1, maxInt = 1000) int a, @InRange(minInt = 1, maxInt = 1000) int b) throws Exception {
		Fraction f1 = new Fraction(a,b);
		Fraction f2 = new Fraction(b,a);
	    assertEquals(f1.mul(f2), 1);
	}
	
	@Property (trials=500)
	public void testdiv(@InRange(minInt = 1, maxInt = 1000) int a, @InRange(minInt = 1, maxInt = 1000) int b) throws Exception {
		Fraction f1 = new Fraction(a,b);
	    assertEquals(f1.div(f1), 1);
	}

	@Property (trials=500)
	public void testAddMul(@From(FractionGen.class) Fraction f) {
		assertEquals(f.add(f), f.mul(new Fraction(2)));
	}
	
}
