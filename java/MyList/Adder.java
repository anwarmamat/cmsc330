public class Adder implements Function<Integer,Function<Integer,Integer>> {
    private static class AdderClosure implements Function<Integer,Integer> {
	private final Integer a;
	public AdderClosure(Integer a) {
	    this.a = a;
	}
	public Integer eval(Integer b) {
	    return a + b;
	}
    }
    public Function<Integer,Integer> eval(Integer x) {
	return new AdderClosure(x);
    }
}
