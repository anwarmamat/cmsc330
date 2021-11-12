package pbt;

import java.util.LinkedList;

import org.junit.runner.RunWith;

import com.pholser.junit.quickcheck.From;
import com.pholser.junit.quickcheck.Property;
import com.pholser.junit.quickcheck.generator.java.util.LinkedListGenerator;
import com.pholser.junit.quickcheck.runner.JUnitQuickcheck;
import point.Point;


@RunWith(JUnitQuickcheck.class)
public class PointGenTest {
	@Property (trials=5)
	public void test1(@From(PointGen.class)  @MyRange(max = 200, min = 10) Point p) {
		System.out.println(p);
	}
	
}
