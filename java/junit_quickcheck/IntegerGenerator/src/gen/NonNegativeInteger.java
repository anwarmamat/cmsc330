package gen;

import java.util.Arrays;

import com.pholser.junit.quickcheck.generator.GenerationStatus;
import com.pholser.junit.quickcheck.generator.Generator;
import com.pholser.junit.quickcheck.random.SourceOfRandomness;


public class NonNegativeInteger extends Generator<Integer> {
    private Integer nonNegative;

    public NonNegativeInteger() {
    	super(Integer.class);
    }
    
      
    @Override 
    public Integer generate(SourceOfRandomness random, GenerationStatus status) {
        int value = random.nextInt();
        //return nonNegative != null ? abs(value) : value;
        return abs(value);
    }

    public void configure(Integer nonNegative) {
        this.nonNegative = nonNegative;
    }

    // Ever-so-slightly favors +(MIN_VALUE + 1).
    // Math.abs(MIN_VALUE) is negative.
    private static int abs(int i) {
        return i == Integer.MIN_VALUE
            ? Math.abs(i + 1)
            : Math.abs(i);
    }

}