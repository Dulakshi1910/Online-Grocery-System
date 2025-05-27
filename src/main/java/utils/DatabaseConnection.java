package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

	private static final String URL = "jdbc:mysql://localhost:3306/oopwebapp?useSSL=false&allowPublicKeyRetrieval=true"; // Change
																															// to
																															// your
																															// DB
																															// URL
	private static final String USER = "root"; // Change to your DB username
	private static final String PASSWORD = "root"; // Change to your DB password

	public static Connection initializeDatabase() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection(URL, USER, PASSWORD);
	}

}
