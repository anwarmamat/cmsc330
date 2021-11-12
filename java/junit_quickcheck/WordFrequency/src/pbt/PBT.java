package pbt;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import java.util.HashMap;
import java.util.Map;
import org.junit.runner.RunWith;
import com.pholser.junit.quickcheck.From;
import com.pholser.junit.quickcheck.Property;
import com.pholser.junit.quickcheck.generator.InRange;
import com.pholser.junit.quickcheck.runner.JUnitQuickcheck;
import frequency.Frequency;


@RunWith(JUnitQuickcheck.class)
public class PBT {
	@Property (trials=500)
	public void test_single_word(@From(MyStringGenerator.class) String s, @InRange(minInt = 1, maxInt = 100) int count) throws Exception {
		Frequency<String> f = new Frequency<>();
		for(int i = 0; i < count; i ++) {
			f.insert(s);
		}
		Integer c = count;
		assertEquals(f.getCount(s), c);
	}
	
		
	@Property (trials=100)
	public void testMapofWords(@From(MyMapGen.class) Map<String,Integer> h) {
		Frequency<String> freq = new Frequency<>();
		Map<String,Integer> m = new HashMap<String,Integer> ();
		//System.out.println("Test size:" + h.size());
		for (Map.Entry<String,Integer> entry : h.entrySet()) {
	        m.put(entry.getKey(), entry.getValue());
	        //System.out.println(entry.getKey() + "-->" + entry.getValue());
	    }
		
		while(!h.isEmpty()) {
			boolean done_flag = true;
			for (Map.Entry<String,Integer> entry : h.entrySet()) {
				if(entry.getValue() > 0) {
					freq.insert(entry.getKey());
					h.put(entry.getKey(), entry.getValue()-1);
					done_flag = false;
				}
			}
			if(done_flag) break;
			
		}
		
		
		for (Map.Entry<String,Integer> entry : m.entrySet()) {
			int f = freq.getCount(entry.getKey());
			int c = entry.getValue();
			assertEquals(f,c);
	    }
	}
}