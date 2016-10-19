public class App implements Function<Pair<Function<Integer,Integer>,Integer>,Integer> {
    public Integer eval(Pair<Function<Integer,Integer>,Integer> p) {
	return p.fst.eval(p.snd);
    }
}
