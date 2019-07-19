package beans;

import java.util.ArrayList;

public class Tools {

	public static Student[] arrayList_To_Studenttab(ArrayList<Student> arlst) {
		
		int len;
		int i;
		
		i = 0;
		len = arlst.size();
		Student[] em = new Student[len];
		while (i < len)
		{
			em[i] = arlst.get(i);
			i++;
		}
		return em;
	}

	public static Book[] arrayList_To_Booktab(ArrayList<Book> arlst) {
		
		int len;
		int i;
		
		i = 0;
		len = arlst.size();
		Book[] em = new Book[len];
		while (i < len)
		{
			em[i] = arlst.get(i);
			i++;
		}
		return em;
	}
	
	public static Borrowed[] arrayList_To_Borrowedtab(ArrayList<Borrowed> arlst) {
		
		int len;
		int i;
		
		i = 0;
		len = arlst.size();
		Borrowed[] em = new Borrowed[len];
		while (i < len)
		{
			em[i] = arlst.get(i);
			i++;
		}
		return em;
	}
}
