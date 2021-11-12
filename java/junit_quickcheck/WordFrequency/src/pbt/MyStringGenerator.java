package pbt;

import com.pholser.junit.quickcheck.generator.GenerationStatus;
import com.pholser.junit.quickcheck.generator.Generator;
import com.pholser.junit.quickcheck.random.SourceOfRandomness;

public class MyStringGenerator extends Generator<String> {
    public MyStringGenerator() {
		super(String.class);
		
	}
   
	private static final String LOWERCASE_CHARS = "abcdefghijklmnopqrstuvwxyz";
    private static final String UPPERCASE_CHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    private static final String NUMBERS = "0123456789";
    private static final String SPECIAL_CHARS = ".-\\;:_@[]^/|}{";
    private static final String ALL_MY_CHARS = LOWERCASE_CHARS
            + UPPERCASE_CHARS + NUMBERS;
    public static final int CAPACITY = 20;

    @Override
    public String generate(SourceOfRandomness random, GenerationStatus status) {
        StringBuilder sb = new StringBuilder(CAPACITY);
        int len = (int)(1+Math.random() * CAPACITY);
        for (int i = 0; i < len; i++) {
            int randomIndex = random.nextInt(ALL_MY_CHARS.length());
            sb.append(ALL_MY_CHARS.charAt(randomIndex));
        }
        return sb.toString();
    }

	
}