package pbt;

import java.util.ArrayList;
import java.util.List;

import org.junit.runner.RunWith;

import com.pholser.junit.quickcheck.From;
import com.pholser.junit.quickcheck.Property;
import com.pholser.junit.quickcheck.generator.InRange;
import com.pholser.junit.quickcheck.runner.JUnitQuickcheck;
import com.pholser.junit.quickcheck.generator.java.util.ArrayListGenerator;

import gen.MyArrayListGen;
import gen.MyArrayListGenPair;

@RunWith(JUnitQuickcheck.class)
public class ArrayListTest {
	@Property (trials=5)
	public void testArrayList1(@From(MyArrayListGen.class)  ArrayList<String> p) {
		System.out.println("ArrayList<String>:\t"+p);
	}

	@Property (trials=5)
	public void testArrayList2(@From(ArrayListGenerator.class)  ArrayList<String> p) {
		System.out.println("ArrayList<String>:\t"+p);
	}
	
	@Property (trials=5)
	public void testArrayListPair(@From(MyArrayListGenPair.class)  ArrayList<?> p) {
		System.out.println("ArrayList<Pair<String, Integer> >:\t"+p);
	}
	
	@Property (trials=5)
	 public void test_int_list(List<@InRange(min = "0", max = "99") Integer> digits) {
		 System.out.println(digits);
	 }
	
	@Property (trials=5)
	 public void test_string_list(List< String> str) {
		 System.out.println(str);
	 }
}
