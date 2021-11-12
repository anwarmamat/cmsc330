package fraction;

public class Main {

	public static void main(String[] args) {
		
		// Main m = new Main();
		//static method exists with the class
		Fraction f1 = new Fraction(3,4); //takes no arguments
		Fraction f2 = new Fraction(5,6); //takes no arguments
		Fraction f3_1 = f1.add(f2);
		System.out.println(f1  + "+"  + f2 + "=" + f3_1);
		
		/*
		 * created a fraction class
		 * private instance variables
		 * added constructors:
		 * 		 overloading:   multiple functions with same name
		 * 					    different signature
		 * 
		 * 		override: re-write a function from the parent class
		 * 				  toString: 1 / 3
		 * 
		 * 
		 * fraction add: 
		 * 			immutable:  f1.add(f2) will return a new fraction. 
		 * 						add does not mutate either f1 or f2
		 * 			Java: String, Integer, Double, Date
		 * 			Mutable fraction: we would update the num and den variables	
		 *
		 *
		 *		   String s = "hello";
		 *		   String t = s;
		 *
		 *				s    [     ]                     [hello World]
		 *							[hello]   //bad
		 *				t------->   [     ]
		 *			s = s + "World";
		 *
		 *			aliasing: t -->"hello"
		 *			
		 *	if you want to mutate the string, java has StringBuffer and StringBuilder. 
		 */
		
		Fraction f3 = new Fraction(100,400); //takes no arguments
		Object f4 = new Fraction(2,8); //takes no arguments
		
		if(f3.equals(f4)) {
			System.out.println(f3 + " == "  + f4 );
		}else {
			System.out.println(f3 + " NOT Equal "  + f4 );
		}
		
		
		MixedFraction m1 = new MixedFraction(1,3,4);
		System.out.println("m1= "+m1);
		Fraction f6 = f1.add(m1);
		System.out.println(f6);
		MixedFraction m2 = new MixedFraction(2,3,7);
		Fraction f7 = m1.add(m2);//inherited from Fraction
	}

}
