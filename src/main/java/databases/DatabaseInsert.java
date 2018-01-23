package databases;

import java.sql.DriverManager;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class DatabaseInsert {

	private static Object request;
	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		createTable();

	}
	
	public static void post() throws Exception {
		
	}
	public static void createTable() throws Exception{
		try {
			Connection con = getConnection();
			PreparedStatement create = (PreparedStatement) con.prepareStatement("CREATE TABLE IF NOT EXISTS timesheet(EmployeeNumber int NOT NULL, Name varchar(255), Surname varchar(255), Email varchar(255) NOT NULL, Description varchar(255), "
					+ "ClientName varchar(255), StartDate varchar(15), TotalHours int NOT NULL, PRIMARY KEY(EmployeeNumber))");
			create.executeUpdate();
		}catch(Exception e) {System.out.println(e);}
		finally {
			System.out.println("Table has been created");
			};
	}
	public static Connection getConnection() throws Exception{
		
		try {
			String driver = "com.mysql.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/reverside";
			String username= "root";
			String password = "";
			Class.forName(driver);
			
			Connection conn = (Connection) DriverManager.getConnection(url,username,password);
			System.out.println("Connected");
			return conn;
			
		}catch (Exception e) {System.out.println(e);}
		
		return null;
		
	}

}
