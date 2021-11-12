package fraction;

/**
 * Fraction class implements non-negative fractions
 * @author anwar
 */
public class Fraction {
    
    protected int numerator;
    protected int denominator;
    /** Constructs a Fraction n/d. 
    *  @param n is the numerator, assumed non-negative.
    *  @param d is the denominator, assumed positive.
    */
    public Fraction(int n, int d) {
    	//if(d == 0) throw new IllegalArgumentException("Denominator cannot be zero");
        int g = gcd(d,n);
        /** reduce the fraction */
        numerator = n/g; 
        denominator = d/g;
    }
    
    /** Constructs a Fraction n/1. 
    *  @param n is the numerator, assumed non-negative.
    */
    public Fraction(int n) {
        this(n,1);
    }

    /** Constructs a Fraction 0/1. 
    */
    public Fraction() {
        numerator = 0;
        denominator = 1;
    }
    
    public String toString()   {
    	if(denominator == 1)
    		return Integer.toString(numerator);
    	else if(numerator == 0)
    		return "0";
    	else		
    		return (numerator + "/" + denominator);
    }

    /** Calculates and returns the double floating point value of a fraction.
    *  @return a double floating point value for this Fraction.
    */
    public double evaluate(){
        double n = numerator;	// convert to double
        double d = denominator;	
        return (n / d);		
    }
    
    /** Add f2 to this fraction and return the result. 
    * @param f2 is the fraction to be added.
    * @return the result of adding f2 to this Fraction.
    */
    public Fraction add (Fraction f2) {
        Fraction r = new Fraction((numerator * f2.denominator) + 
			      (f2.numerator * denominator),
			      (denominator * f2.denominator));    
        return r;
    }
    
    /** subtract f2 from this fraction and return the result. 
    * @param f2 is the fraction to be added.
    * @return the result of adding f2 to this Fraction.
    */
    public Fraction sub (Fraction f2) {
        Fraction r = new Fraction((numerator * f2.denominator) - 
			      (f2.numerator * denominator),
			      (denominator * f2.denominator));    
        return r;
    }
    
    /** multiple f2 to this fraction and return the result. 
    * @param f2 is the fraction to be added.
    * @return the result of adding f2 to this Fraction.
    */
    public Fraction mul (Fraction f2) {
        return (
                new Fraction(numerator * f2.numerator, 
                denominator * f2.denominator)
                );
    }
    
    /** divide f2 to this fraction and return the result. 
    * @param f2 is the fraction to be added.
    * @return the result of adding f2 to this Fraction.
    */
    public Fraction div (Fraction f2) {
        return (
                new Fraction(numerator * f2.denominator,
                denominator * f2.numerator)
                );
    }
    
    @Override
    public boolean equals(Object obj){
    	if(this == obj) return true;
    	Fraction f;
    	
    	if((obj instanceof Integer)) {
    		f = new Fraction ((Integer) obj);
    		if(numerator == f.numerator && denominator == f.denominator){
    			return true;
    		}
    	}else if ((obj instanceof Fraction)) {
        	f = (Fraction) obj;
        	if(numerator == f.numerator && denominator == f.denominator){
        		return true;
        	}
    	}
        return false;
    }
    
    /** Computes the greatest common divisor (gcd) of the two inputs. 
    * @param a is assumed positive
    * @param b is assumed non-negative
    * @return the gcd of a and b
    */
    static private int gcd (int a, int b) {
    		int t;
        // a must be greater than or equal to b
        if( a < b){
            t = a;
            a = b;
            b = t;
        }
        if(b == 0){
            return a;
        }else{
            return gcd(b,a%b);
        }
        
  }
    
    public static void main(String[] argv) {
	
    /* Test all three contructors and toString. */
    Fraction f0 = new Fraction();
    Fraction f1 = new Fraction(3);
    Fraction f2 = new Fraction(12, 20);

    System.out.println("\nTesting constructors (and toString):");
    System.out.println("The fraction f0 is " + f0.toString()); 
    System.out.println("The fraction f1 is " + f1); // toString is implicit
    System.out.println("The fraction f2 is " + f2);

    /* Test methods on Fraction: add and evaluate. */
    System.out.println("\nTesting add and evaluate:");
    System.out.println("The floating point value of " + f1 + " is " + 
		       f1.evaluate());
    System.out.println("The floating point value of " + f2 + " is " +
		       f2.evaluate());

     
    Fraction sumOfTwo = f1.add(f2);
    Fraction sumOfThree = f0.add(f1.add(f2));

    System.out.println("The sum of " + f1 + " and " + f2 + " is " + sumOfTwo);
    System.out.println("The sum of " + f0 + ", " + f1 + " and " + f2 + " is "
		       + sumOfThree);
    /**
     * test sub,div,mul here
     */

    /* Test gcd function (static method). */
    System.out.println("\nTesting gcd:");
    System.out.println("The gcd of 2 and 10 is: " + gcd(2, 10));
    System.out.println("The gcd of 15 and 5 is: " + gcd(15, 5));
    System.out.println("The gcd of 24 and 18 is: " + gcd(24, 18));
    System.out.println("The gcd of 10 and 10 is: " + gcd(10, 10));
    System.out.println("The gcd of 21 and 400 is: " + gcd(21, 400));
  }
    
}
