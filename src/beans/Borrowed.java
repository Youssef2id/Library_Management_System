package beans;

import java.io.DataOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Borrowed {
	
	String cin_id;
	int id;
	String cin;
	String date;
	
	public Borrowed(String cin_id, int id, String cin) {
		super();
		this.cin_id = cin_id;
		this.id = id;
		this.cin = cin;
	}
	
	public Borrowed(String cin_id, int id, String cin , String date) {
		super();
		this.cin_id = cin_id;
		this.id = id;
		this.cin = cin;
		this.date = date;
	}

	@Override
	public String toString() {
		return cin_id + "," + id + "," + cin + "," + date;
	}

	public String getCin_id() {
		return cin_id;
	}

	public void setCin_id(String cin_id) {
		this.cin_id = cin_id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCin() {
		return cin;
	}

	public void setCin(String cin) {
		this.cin = cin;
	}

	public static int get_wallet(String cin)
	{
		Student s = null;
		
		try {
			s = Student.get_student_id(cin);
		} catch (SQLException e) {
			return -1;
		}
		int wallet = 0;
		try {
			wallet = s.getWallet();
		} catch (NullPointerException e) {
			return -1;
		}
		return wallet;
	}
	
	public static String cin_id(Student s, Book b) {
		String cin_id;
		
		cin_id = s.getCin() + "_" + b.getId();
		return cin_id;
	}
	
	public static String borrow(Student s, Book b) throws SQLException
	{
		// See if The wallet is empty
		if (Borrowed.get_wallet(s.getCin()) == 0)
			return "Empty Wallet";
		// See if the stock is empty
		if (b.getStock() == 0)
			return "Book Out Of Stock";

		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (InstantiationException | IllegalAccessException | ClassNotFoundException e2) {
			e2.printStackTrace();
		}
		
		String urlMysql = "jdbc:mysql://localhost:3306/project_db?autoReconnect=true&useSSL=false";
		String username = "yidabdes";
		String password = "OO5ApPYgyAHvxZmR";
	
		
		Connection conn = DriverManager.getConnection(urlMysql, username, password);
		
		Statement st = (Statement) conn.createStatement();
		
		
		String sql = "INSERT INTO `borrowed`(`cin_id`, `id`, `cin`) VALUES ('"
				+ Borrowed.cin_id(s, b) + "','" + b.getId() + "','" + s.getCin() + "')";
		try
		{
			st.executeUpdate(sql);
		} catch (com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException e) {
			return "The Student Already Has a Copy Of This Book";
		}
		// Update the student wallet
		sql = "UPDATE `student` SET `wallet`=`wallet` - 1  WHERE `cin`='" + s.getCin() + "'";
		st.executeUpdate(sql);
		// Update the book Stock
		sql = "UPDATE `book` SET `stock`=`stock` - 1  WHERE `id`=" + b.getId();
		st.executeUpdate(sql);
		return "Book Borrowed Successfully";
	}
	
	public static Book[] borrowed_books(Student s) throws SQLException
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (InstantiationException | IllegalAccessException | ClassNotFoundException e2) {
			e2.printStackTrace();
		}
		
		String urlMysql = "jdbc:mysql://localhost:3306/project_db?autoReconnect=true&useSSL=false";
		String username = "yidabdes";
		String password = "OO5ApPYgyAHvxZmR";
	
		
		Connection conn = DriverManager.getConnection(urlMysql, username, password);
		
		Statement st = (Statement) conn.createStatement();
		
		
		ArrayList<Book> arrayList = new ArrayList<Book>();
		Book[] em;
	
		String sql = "SELECT * FROM `borrowed` WHERE `cin`='"+ s.getCin() + "'";
		ResultSet rs = null;
		try
		{
			rs = st.executeQuery(sql);
		} catch (com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException e) {
		}
		
		while (rs.next())
		{
			Book e = Book.get_book_id(rs.getInt(2));
			arrayList.add(e);
		}
		em = Tools.arrayList_To_Booktab(arrayList);
		conn.close();
		return em;
	}
	
	public static String returned(Student s, Book b) throws SQLException
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (InstantiationException | IllegalAccessException | ClassNotFoundException e2) {
			e2.printStackTrace();
		}
		
		String urlMysql = "jdbc:mysql://localhost:3306/project_db?autoReconnect=true&useSSL=false";
		String username = "yidabdes";
		String password = "OO5ApPYgyAHvxZmR";
	
		
		Connection conn = DriverManager.getConnection(urlMysql, username, password);
		
		Statement st = (Statement) conn.createStatement();
		
		String cin_id = Borrowed.cin_id(s, b);
		
		String sql = "DELETE FROM `borrowed` WHERE `cin_id`='" + cin_id + "'";
		st.executeUpdate(sql);
		// Update the student wallet
		sql = "UPDATE `student` SET `wallet`=`wallet` + 1  WHERE `cin`='" + s.getCin() + "'";
		st.executeUpdate(sql);
		// Update the book Stock
		sql = "UPDATE `book` SET `stock`=`stock` + 1  WHERE `id`=" + b.getId();
		st.executeUpdate(sql);
		return "Book Returned Successfully";
	}
	
	public static Borrowed[] recupererTout() throws SQLException
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (InstantiationException | IllegalAccessException | ClassNotFoundException e2) {
			e2.printStackTrace();
		}
		
		String urlMysql = "jdbc:mysql://localhost:3306/project_db?autoReconnect=true&useSSL=false";
		String username = "yidabdes";
		String password = "OO5ApPYgyAHvxZmR";
	
		
		Connection conn = DriverManager.getConnection(urlMysql, username, password);
		
		Statement st = (Statement) conn.createStatement();
		
		
		String get = "SELECT * FROM `borrowed`";
		
		ArrayList<Borrowed> arrayList = new ArrayList<Borrowed>();
		Borrowed[] em;
		
		ResultSet rs = st.executeQuery(get);
		
		while (rs.next())
		{
			Borrowed e = new Borrowed(rs.getString(1), rs.getInt(2), rs.getString(3), rs.getString(4));
			arrayList.add(e);
		}
		em = Tools.arrayList_To_Borrowedtab(arrayList);
		conn.close();
		return em;
	}
	
	public static void export_csv(Borrowed s[])
	{
		File f = new File("\\Users\\youss\\eclipse-workspace\\Project_2019\\WebContent\\CSV_FILES\\Borrowed.csv");
		
		FileOutputStream fos = null;
		try {
			fos = new FileOutputStream(f);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		DataOutputStream dos = new DataOutputStream(fos);
		
		try {
			int i =0;
			while(i < s.length)
			{
				dos.writeChars(s[i].toString());
				dos.writeChar(10);
				i++;
			}
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			dos.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			fos.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static void main(String[] args) {
		
		Book b[] = null;
		Student s = null;
		try {
			s = Student.get_student_id("7852");
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			b = Borrowed.borrowed_books(s);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
		int i = 0;
		while (i < b.length)
		{
			System.out.println(b[i].toString());
			try {
				Borrowed.returned(s, b[i]);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			i++;
		}
	}
}
