package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.DatabaseConnection;

/**
 * Servlet implementation class addStaff
 */
@WebServlet("/admin/admin-addStaff")
public class addStaff extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// SQL query to insert a staff member into the users table
	private static final String INSERT_USERS_SQL = "INSERT INTO users (username, password, email, fullname, role) VALUES (?, ?, ?, ?, ?)";

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/admin/admin-addStaff.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Get form parameters from the request
		String staffName = request.getParameter("staff_name");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("staff_password");
		String role = request.getParameter("role");

		// Insert the staff data into the database
		try {
			// Get connection from DatabaseConnection utility class
			Connection conn = DatabaseConnection.initializeDatabase();

			// Prepare the SQL query
			PreparedStatement preparedStatement = conn.prepareStatement(INSERT_USERS_SQL);
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, password);
			preparedStatement.setString(3, email);
			preparedStatement.setString(4, staffName);
			preparedStatement.setString(5, role);

			// Execute the update
			int rowsInserted = preparedStatement.executeUpdate();

			// Print the form data to the console for testing
			System.out.println("Rows inserted: " + rowsInserted);
			System.out.println("Staff Name: " + staffName);
			System.out.println("Username: " + username);
			System.out.println("Email: " + email);
			System.out.println("Password: " + password);
			System.out.println("Role: " + role);

			// Close the resources
			preparedStatement.close();
			conn.close();

			// Set a success attribute if the staff is added
			if (rowsInserted > 0) {
				request.setAttribute("status", "success");
			} else {
				request.setAttribute("status", "fail");
			}

		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			request.setAttribute("status", "error");
		}

		// Forward back to the JSP page
		request.getRequestDispatcher("/admin/admin-addStaff.jsp").forward(request, response);
	}

}
