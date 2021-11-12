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
		
	@Property (trials = 10)
	public void StringTest(@NullAllowed(probability = 0.5f) String s) {
		if(s==null) {
			System.out.println("null");
			return;
		}else {
			System.out.println(s);
		}
    }
	
	
}


