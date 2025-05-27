package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.DatabaseConnection;

@WebServlet("/updateProfile")
public class updateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String fullName = request.getParameter("fullname");
		String username = request.getParameter("username");
		String email = request.getParameter("email");

		Connection conn = null;
		PreparedStatement stmt = null;

		try {
			// Initialize database connection
			conn = DatabaseConnection.initializeDatabase();

			// Update query
			String updateQuery = "UPDATE users SET fullname = ?, email = ? WHERE username = ?";
			stmt = conn.prepareStatement(updateQuery);
			stmt.setString(1, fullName);
			stmt.setString(2, email);
			stmt.setString(3, username);

			// Execute the update
			int rowsUpdated = stmt.executeUpdate();

			if (rowsUpdated > 0) {
				// Fetch the updated details after successful update
				String fetchQuery = "SELECT fullname, username, email FROM users WHERE username = ?";
				stmt = conn.prepareStatement(fetchQuery);
				stmt.setString(1, username);

				ResultSet rs = stmt.executeQuery();
				if (rs.next()) {
					// Set updated attributes in the request object
					request.setAttribute("fullName", rs.getString("fullname"));
					request.setAttribute("username", rs.getString("username"));
					request.setAttribute("email", rs.getString("email"));

					//request.setAttribute("message", "Profile updated successfully!");
					// After successfully updating profile
					request.setAttribute("message", "Profile updated successfully.");
					System.out.println("Profile updated successfully");
					request.getRequestDispatcher("/userProfile.jsp").forward(request, response);

				}
			} else {
				//request.setAttribute("message", "Profile update failed.");
				// After successfully updating profile
				request.setAttribute("message", "Profile update failed.");
				request.getRequestDispatcher("/userProfile.jsp").forward(request, response);

			}

			// Forward to the user profile page with updated details
			//request.getRequestDispatcher("/userProfile.jsp").forward(request, response);

		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			request.setAttribute("message", "Database error: " + e.getMessage());
			request.getRequestDispatcher("userProfile.jsp").forward(request, response);
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
