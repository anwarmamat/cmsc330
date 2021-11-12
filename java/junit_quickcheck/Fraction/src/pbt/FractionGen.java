package pbt;


import com.pholser.junit.quickcheck.generator.GenerationStatus;
import com.pholser.junit.quickcheck.generator.Generator;
import com.pholser.junit.quickcheck.random.SourceOfRandomness;

import fraction.Fraction;

public class FractionGen extends Generator<Fraction>  {
		
	public FractionGen() {
		super(Fraction.class);
	}

	@Override
	public Fraction generate(SourceOfRandomness r, GenerationStatus arg1) {
		return new Fraction(r.nextInt(1,10000), r.nextInt(1, 10000));
	}
}