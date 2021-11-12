package gen;

import static org.junit.Assert.assertEquals;

import java.util.ArrayList;

import org.junit.runner.RunWith;

import com.pholser.junit.quickcheck.From;
import com.pholser.junit.quickcheck.Property;
import com.pholser.junit.quickcheck.generator.Ctor;
import com.pholser.junit.quickcheck.generator.InRange;
import com.pholser.junit.quickcheck.generator.java.util.ArrayListGenerator;
import com.pholser.junit.quickcheck.runner.JUnitQuickcheck;


@RunWith(JUnitQuickcheck.class)
public class QuickCheckTest {
		
	
	
	@Property (trials=5)
	public void testArrayList1( @From(ArrayListGenerator.class) ArrayList<Integer> f) {
		System.out.println("Int List:"+f);

	}
	
	@Property (trials=100)
	public void testIntegral(@From(NonNegativeInteger.class)  Integer f) {
		System.out.println("Integer:\t"+f);

	}
}


