
package fraction;

/**
 * This class implements mixed fraction 
 * @author anwar
 */
public class MixedFraction extends Fraction
{
    /** Constructs a Fraction m n/d.
    *  @param m is the integer part.
    *  @param n is the numerator, assumed non-negative.
    *  @param d is the denominator, assumed positive.
    */
    public MixedFraction(int m, int n, int d)
    {
        super(m*d+n,d);
    }
    
    /** Constructs a Fraction m n/d.
    *  @param f is a fraction
    */
    public MixedFraction(Fraction f)
    {
        super(f.numerator, f.denominator);
    }
    
    public String toString()   {
        int m = numerator  /  denominator;
        int n = numerator  %  denominator;
        return (m + " " + n + "/" + denominator);
    }
    
    
}
