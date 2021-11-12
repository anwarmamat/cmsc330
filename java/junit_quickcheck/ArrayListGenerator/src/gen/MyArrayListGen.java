package gen;

import java.util.ArrayList;
import java.util.HashMap;

import com.pholser.junit.quickcheck.generator.GenerationStatus;
import com.pholser.junit.quickcheck.generator.Generator;
import com.pholser.junit.quickcheck.generator.java.util.ArrayListGenerator;
import com.pholser.junit.quickcheck.random.SourceOfRandomness;


public class MyArrayListGen extends Generator<ArrayList<String>> {

	public MyArrayListGen(Class<ArrayList<String>> type) {
		super(type);
	}

	@Override
	public ArrayList<String> generate(SourceOfRandomness arg0, GenerationStatus arg1) {
		ArrayList<String> ar = new ArrayList<>();	
		MyStringGenerator g = new MyStringGenerator();
		String s = g.generate(arg0, arg1);
		ar.add(s);
		return ar;
	}
}
