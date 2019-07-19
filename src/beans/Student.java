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


public class Student {

	private String name;
	private String first_name;
	private String cin;
	private String level;
	private String birthday;
	private String email;
	private int wallet;
	
	public Student() {
		super();
	}

	public Student(String name, String first_name, String cin, String level, String birthday, String email) {
		super();
		this.name = name;
		this.first_name = first_name;
		this.cin = cin;
		this.level = level;
		this.birthday = birthday;
		this.email = email;
	}

	public String getName() {
		return name;
	}
	
	public int getWallet() {
		return wallet;
	}

	public void setWallet(int wallet) {
		this.wallet = wallet;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getCin() {
		return cin;
	}

	public void setCin(String cin) {
		this.cin = cin;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return name + "," + first_name + "," + cin + "," + level + "," + birthday + "," + email + "," + wallet;
	}

	public void Update_date(Student s) 
	{
		try
		{	
			String date = new String(s.getBirthday());
			String new_date = date.substring(6, 10) + '-' + date.substring(3, 5) + '-' + date.substring(0, 2);
			s.setBirthday(new_date);
		}catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public String old_date(Student s) 
	{
		String date = new String(s.getBirthday());
		try
		{
			String new_date = date.substring(6, 10) + '-' + date.substring(3, 5) + '-' + date.substring(0, 2);
			return new_date;
		}catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	
	public boolean add_student_db(Student s) 
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
		
		s.Update_date(s);
		
		String sql = "INSERT INTO `student`(`name`, `first_name`, `cin`, `level`, `birthday`, `email`) VALUES ('"
				+ s.getName() + "', '"
				+ s.getFirst_name() + "', '"
				+ s.getCin() + "', '"
				+ s.getLevel() + "', '"
				+ s.birthday + "', '"
				+ s.getEmail() + "')";
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
	
	public void update_student_db(Student s) 
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
		
		s.Update_date(s);
		
		String sql = "UPDATE `student` SET `name`=" + "'" + s.getName() + "',"
				+ "`first_name`= '"+ s.getFirst_name()
				+  "',`cin`='" + s.getCin()
				+ "', `level`='" + s.getLevel()
				+ "', `birthday`='" + s.birthday
				+ "', `email`='" + s.getEmail()
				+ "' WHERE cin='" + s.getCin() + "'";
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
	
	public static Student[] recupererTout() throws SQLException
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
		
		
		String get = "SELECT * FROM `student`";
		
		ArrayList<Student> arrayList = new ArrayList<Student>();
		Student[] em;
		
		ResultSet rs = st.executeQuery(get);
		
		while (rs.next())
		{
			Student e = new Student(rs.getString(1), 
					rs.getString(2), rs.getString(3),
					rs.getString(4), rs.getDate(5).toString(), rs.getString(6));
			e.setWallet(rs.getInt(7));
			arrayList.add(e);
		}
		em = Tools.arrayList_To_Studenttab(arrayList);
		conn.close();
		return em;
	}
	
	public static Student[] recupererTout(String cin) throws SQLException
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
		
		
		String get = "SELECT * FROM `student` WHERE cin='" + cin + "'";
		
		ArrayList<Student> arrayList = new ArrayList<Student>();
		Student[] em;
		
		ResultSet rs = st.executeQuery(get);
		
		while (rs.next())
		{
			Student e = new Student(rs.getString(1), 
					rs.getString(2), rs.getString(3),
					rs.getString(4), rs.getDate(5).toString(), rs.getString(6));
			e.setWallet(rs.getInt(7));
			arrayList.add(e);
		}
		em = Tools.arrayList_To_Studenttab(arrayList);
		conn.close();
		return em;
	}
	
	public static void delete_student_db(String cin) 
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
			
		String sql = "DELETE FROM `student` WHERE cin='" + cin +"'";
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
	
	public static Student get_student_id(String cin) throws SQLException
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
		
		
		String insert = "SELECT * FROM `student` WHERE cin = '" + cin + "'";
		ResultSet rs = st.executeQuery(insert);
		if (!rs.next())
		{
			System.out.println("ID NOT FOUND");
			return null;
		}
		Student e = new Student(rs.getString(1), 
					rs.getString(2), rs.getString(3),
					rs.getString(4), rs.getDate(5).toString(), rs.getString(6));
		e.setWallet(rs.getInt(7));
		conn.close();
		return e;
	}
	
	public static void export_csv(Student s[])
	{
		File f = new File("\\Users\\youss\\eclipse-workspace\\Project_2019\\WebContent\\CSV_FILES\\Students.csv");
		
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
	public static void main(String[] args) 
	{
//	
//		String name = "hola hola";
//		String firstname = "firstname";
//		String cin = "i85000";
//		String level = "level";
//		String birthday = "21/04/1996";
//		String email = "email";
//		Student s = new Student(name, firstname, cin, level, birthday, email);
//		
//		s.add_student_db(s);
		
		Student s[] = null;
		
		try {
			s = Student.recupererTout();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int i =0;
		while(i < s.length)
		{
			System.out.println(s[i].toString());
			
			i++;
		}
		Student.export_csv(s);
		
		
		
	}
	
}
