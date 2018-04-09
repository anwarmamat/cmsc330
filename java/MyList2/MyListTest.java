
public class MyListTest {

	public static void main(String[] args) {
		MyList lst = new MyList(10,null);
		lst = lst.cons(20);
		lst = lst.cons(30);
		System.out.println(lst);
		//30-->20-->10-->null

		//MyList l1 = lst.map(new AddOne());
		MyList l1 = lst.map((x)->x+1);
		System.out.println(l1);
		//MyList l2 = lst.map(new MultTwo());
		MyList l2 = lst.map((x)->x * 2);
		System.out.println(l2);




		//int s = lst.fold (new Sum(), 0);
		int s = lst.fold ((a,b)->a+b, 0);
		System.out.println("sum=" + s);

		//int p = lst.fold (new Product(), 1);
		int p = lst.fold ((x,y)->x*y, 1);
		System.out.println("product=" + p);

		System.out.println("done");
	}

}
