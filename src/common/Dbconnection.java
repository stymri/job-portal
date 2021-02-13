package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Dbconnection {
	public static Connection getdbcon() throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver"); 
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/satyam","root","satyam");
		return con;
	}
	public static void deletecon(Connection con)
	{
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
