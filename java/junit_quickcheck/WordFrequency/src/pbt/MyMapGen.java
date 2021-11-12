package pbt;

import java.util.HashMap;
import java.util.Map;


import com.pholser.junit.quickcheck.generator.GenerationStatus;
import com.pholser.junit.quickcheck.generator.Generator;
import com.pholser.junit.quickcheck.generator.java.util.ArrayListGenerator;
import com.pholser.junit.quickcheck.random.SourceOfRandomness;

public class MyMapGen extends Generator<Map<String,Integer>> {
	public MyMapGen(Class<Map<String, Integer>> type) {
		super(type);
	}

	@Override
	public Map<String, Integer> generate(SourceOfRandomness random, GenerationStatus status) {
		Map <String, Integer> h = new HashMap<>();	
		MyStringGenerator g = new MyStringGenerator();
		for(int i = 0; i < random.nextInt(1,3000);i++ ) {
			String s = g.generate(random, status);	
			int count = random.nextInt(20);
			h.put(s, count);
		}
		
		return h;
	}
}
