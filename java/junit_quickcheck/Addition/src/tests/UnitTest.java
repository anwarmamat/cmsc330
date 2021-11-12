package tests;

import static org.junit.Assert.*;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import add.Add;

public class UnitTest {

	@org.junit.Test
	public void test() {
		assertEquals(Add.add(10, 20),30);
	}
	
	


}
