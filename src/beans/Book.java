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

public class Book 
{
	private String name;
	private int id;
	private int number;
	private String date;
	private int stock;
	


	public Book(int id, String name, int number, int stock, String date) {
		super();
		this.name = name;
		this.id = id;
		this.number = number;
		this.date = date;
		this.stock = stock;
	}
	
	public Book(int id, String name, int number, String date) {
		super();
		this.name = name;
		this.id = id;
		this.number = number;
		this.date = date;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	@Override
	public String toString() {
		return  name + "," + id + "," + number + "," + date + "," + stock;
	}

	public void Update_date(Book b) 
	{
		try
		{	
			String date = new String(b.getDate());
			String new_date = date.substring(6, 10) + '-' + date.substring(3, 5) + '-' + date.substring(0, 2);
			b.setDate(new_date);
		}catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public String old_date(Book b) 
	{
		String date = new String(b.getDate());
		try
		{
			String new_date = date.substring(8, 10) + '/' + date.substring(5, 7) + '/' + date.substring(0, 4);
			return new_date;
		}catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

	public boolean add_student_db(Book b) 
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
	
		Connection conn = null;
		try 
		{
			conn = DriverManager.getConnection(urlMysql, username, password);
		}catch (SQLException e) 
		{
			System.out.println("error Driver");
			e.printStackTrace();
		}
		
		Statement st = null;
		try 
		{
			st = conn.createStatement();
		} catch (SQLException e1)
		{
			System.out.println("statement error");
			e1.printStackTrace();
		}
		
		b.Update_date(b);
		
		String sql = "INSERT INTO `book`(`id`, `name`, `number`, `stock`, `date`) VALUES ('"
				+ b.getId() + "', '"
				+ b.getName() + "', '"
				+ b.getNumber() + "', '"
				+ b.getStock() + "', '"
				+ b.getDate() + "')";
		try
		{
			st.executeUpdate(sql);
		} catch (SQLException e) {
			System.out.println("executequerry");
			e.printStackTrace();
			return false;
		}
		
		try
		{
			conn.close();
		} catch (SQLException e) {
		}
		return true;
	}
	public void update_book_db(Book b) 
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
	
		Connection conn = null;
		try 
		{
			conn = DriverManager.getConnection(urlMysql, username, password);
		}catch (SQLException e) 
		{
			System.out.println("error Driver");
			e.printStackTrace();
		}
		
		Statement st = null;
		try 
		{
			st = conn.createStatement();
		} catch (SQLException e1)
		{
			System.out.println("statement error");
			e1.printStackTrace();
		}
		
		b.Update_date(b);
		
		String sql = "UPDATE `book` SET `id`=" + "'" + b.getId() + "',"
				+ "`name`= '"+ b.getName()
				+  "',`number`='" + b.getNumber()
				+ "', `stock`='" + b.getStock()
				+ "', `date`='" + b.getDate()
				+ "' WHERE id='" + b.getId() + "'";
		try
		{
			st.executeUpdate(sql);
		} catch (SQLException e) {
			System.out.println("executequerry");
			e.printStackTrace();
		}
		
		try
		{
			conn.close();
		} catch (SQLException e) {
		}
	}

	public static void update_stock_db(int id, int stock) 
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
	
		Connection conn = null;
		try 
		{
			conn = DriverManager.getConnection(urlMysql, username, password);
		}catch (SQLException e) 
		{
			System.out.println("error Driver");
			e.printStackTrace();
		}
		
		Statement st = null;
		try 
		{
			st = conn.createStatement();
		} catch (SQLException e1)
		{
			System.out.println("statement error");
			e1.printStackTrace();
		}
		
		String sql = "UPDATE `book` SET `stock`= `stock`+" + stock
				+ " WHERE id='" + id + "'";
		try
		{
			st.executeUpdate(sql);
		} catch (SQLException e) {
			System.out.println("executequerry");
			e.printStackTrace();
		}
		
		try
		{
			conn.close();
		} catch (SQLException e) {
		}
	}
	public static Book[] recupererTout() throws SQLException
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
		
		
		String get = "SELECT * FROM `book`";
		
		ArrayList<Book> arrayList = new ArrayList<Book>();
		Book[] em;
		
		ResultSet rs = st.executeQuery(get);
		
		while (rs.next())
		{
			Book e = new Book(rs.getInt(1), 
					rs.getString(2), rs.getInt(3),
					rs.getInt(4), rs.getDate(5).toString());
			arrayList.add(e);
		}
		em = Tools.arrayList_To_Booktab(arrayList);
		conn.close();
		return em;
	}

	public static Book[] recupererTout(int id) throws SQLException
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
		
		
		String get = "SELECT * FROM `book` WHERE id=" + id;
		
		ArrayList<Book> arrayList = new ArrayList<Book>();
		Book[] em;
		
		ResultSet rs = st.executeQuery(get);
		
		while (rs.next())
		{
			Book e = new Book(rs.getInt(1), 
					rs.getString(2), rs.getInt(3),
					rs.getInt(4), rs.getDate(5).toString());
			arrayList.add(e);
		}
		em = Tools.arrayList_To_Booktab(arrayList);
		conn.close();
		return em;
	}

	public static void delete_delete_db(int id) 
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
	
		Connection conn = null;
		try 
		{
			conn = DriverManager.getConnection(urlMysql, username, password);
		}catch (SQLException e) 
		{
			System.out.println("error Driver");
			e.printStackTrace();
		}
		
		Statement st = null;
		try 
		{
			st = conn.createStatement();
		} catch (SQLException e1)
		{
			System.out.println("statement error");
			e1.printStackTrace();
		}
			
		String sql = "DELETE FROM `book` WHERE id=" + id;
		try
		{
			st.executeUpdate(sql);
		} catch (SQLException e) {
			System.out.println("executequerry");
			e.printStackTrace();
		}
		
		try
		{
			conn.close();
		} catch (SQLException e) {
		}
	}

	public static Book get_book_id(int id) throws SQLException
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
		
		
		String insert = "SELECT * FROM `book` WHERE id =" + id;
		ResultSet rs = st.executeQuery(insert);
		if (!rs.next())
		{
			System.out.println("ID NOT FOUND");
			return null;
		}
		Book e = new Book(rs.getInt(1), 
					rs.getString(2), rs.getInt(3),
					rs.getInt(4), rs.getDate(5).toString());
		conn.close();
		return e;
	}
	
	public static void export_csv(Book b[])
	{
		File f = new File("\\Users\\youss\\eclipse-workspace\\Project_2019\\WebContent\\CSV_FILES\\Books.csv");
		
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
			while(i < b.length)
			{
				dos.writeChars(b[i].toString());
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
}
