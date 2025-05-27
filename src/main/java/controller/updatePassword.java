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
import javax.servlet.http.HttpSession;

import utils.DatabaseConnection;

@WebServlet("/updatePassword")
public class updatePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Get the session and retrieve the username
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("user"); // Retrieve username from session

		if (username == null) {
			// If the session has expired or the user is not logged in, redirect to login
			// page
			response.sendRedirect("login.jsp");
			return;
		}

		String oldPassword = request.getParameter("old_password");
		String newPassword = request.getParameter("new_password");
		String confirmPassword = request.getParameter("confNew_password");

		Connection conn = null;
		PreparedStatement stmt = null;

		try {
			// Check if old password is correct
			conn = DatabaseConnection.initializeDatabase();
			String query = "SELECT password FROM users WHERE username = ?";
			stmt = conn.prepareStatement(query);
			stmt.setString(1, username);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				String currentPassword = rs.getString("password");

				// Validate old password
				if (currentPassword.equals(oldPassword)) {

					// Check if new password matches confirm password
					if (newPassword.equals(confirmPassword)) {
						// Update the password in the database
						String updateQuery = "UPDATE users SET password = ? WHERE username = ?";
						stmt = conn.prepareStatement(updateQuery);
						stmt.setString(1, newPassword);
						stmt.setString(2, username);

						int rowsUpdated = stmt.executeUpdate();

						if (rowsUpdated > 0) {
							// Password updated successfully
							response.sendRedirect("userProfile"); // Redirect to user profile page
						} else {
							request.setAttribute("message", "Password update failed.");
							request.getRequestDispatcher("userProfile.jsp").forward(request, response);
						}
					} else {
						request.setAttribute("message", "New password and confirm password do not match.");
						request.getRequestDispatcher("userProfile.jsp").forward(request, response);
					}
				} else {
					request.setAttribute("message", "Old password is incorrect.");
					request.getRequestDispatcher("userProfile.jsp").forward(request, response);
				}
			} else {
				request.setAttribute("message", "User not found.");
				request.getRequestDispatcher("userProfile.jsp").forward(request, response);
			}
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
