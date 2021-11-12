package pbt;
import com.pholser.junit.quickcheck.generator.GenerationStatus;
import com.pholser.junit.quickcheck.generator.Generator;
import com.pholser.junit.quickcheck.random.SourceOfRandomness;

import point.Point;

public class PointGen extends Generator<Point> {
	private MyRange range;
	public PointGen() {
		super(Point.class);
	}
	public Point generate(SourceOfRandomness r, GenerationStatus status) {
		int m1 = range.min();
		int m2 = range.max();
		
		//Generator<Integer> IntGen = gen().type(Integer.class);
		//System.out.println("Int:"+ IntGen.generate(r, status));
		
		return new Point(r.nextInt(m1,m2),r.nextInt(m1,m2));
	}
	
	public void configure(MyRange range) {
        this.range = range;
    }
}
