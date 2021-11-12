package tests;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

import fraction.Fraction;

class UnitTests {

	@Test
	void testAdd() {
		Fraction f1 = new Fraction(1,4); //takes no arguments
		Fraction f2 = new Fraction(1,4); //takes no arguments
		Fraction f3 = f1.add(f2);
		Fraction f4= new Fraction(1,2);
		assertEquals(f3.toString(),f4.toString());
	}

}
