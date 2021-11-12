package gen;

import java.util.ArrayList;

import com.pholser.junit.quickcheck.Pair;
import com.pholser.junit.quickcheck.generator.GenerationStatus;
import com.pholser.junit.quickcheck.generator.Generator;

import com.pholser.junit.quickcheck.random.SourceOfRandomness;


public class MyArrayListGenPair extends Generator<ArrayList<Pair<String,Integer>>> {

	public MyArrayListGenPair(Class<ArrayList<Pair<String, Integer>>> type) {
		super(type);
	}

	@Override
	public ArrayList<Pair<String, Integer>> generate(SourceOfRandomness arg0, GenerationStatus arg1) {
		ArrayList<Pair <String, Integer>> ar = new ArrayList<>();	
		MyStringGenerator g = new MyStringGenerator();
		String s = g.generate(arg0, arg1);
		int count = arg0.nextInt(100);
		Pair <String, Integer> pair = new Pair <> (s, count);
		ar.add(pair);
		return ar;
	}
}
