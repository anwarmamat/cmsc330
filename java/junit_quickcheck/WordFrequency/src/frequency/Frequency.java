/*
* This class counts the word frequency
 */
package frequency;

import java.util.HashMap;
import java.util.Map;

public class Frequency<E extends Comparable<E>>{
	private Map<E, Integer> map = new HashMap<>();
	private int N;
	public void insert(E item) {
		if(map.containsKey(item)){
			map.put(item, map.get(item)+1);
		}else {
			map.put(item, 1);
		}
		N++;
	}
	
	public int size() {
		return N;
	}
	public Integer getCount(E s) {
		if(map.containsKey(s)) {
				return map.get(s);
		}else {
				return 0;
		}
	}
}
    
