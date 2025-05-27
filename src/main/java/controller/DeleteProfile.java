package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.DatabaseConnection;

@WebServlet("/deleteProfile")
public class DeleteProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// Handle POST request for deleting the profile
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("delete");
		// Get the username from the session
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("user");

		if (username == null) {
			// Redirect to home if user is not logged in
			response.sendRedirect(request.getContextPath() + "/");
			return;
		}

		try (Connection conn = DatabaseConnection.initializeDatabase()) {
			// SQL query to delete the user from the database
			String deleteQuery = "DELETE FROM users WHERE username = ?";
			PreparedStatement stmt = conn.prepareStatement(deleteQuery);
			stmt.setString(1, username);

			int rowsAffected = stmt.executeUpdate();

			if (rowsAffected > 0) {
				// Profile deleted successfully, invalidate the session and redirect to home
				session.invalidate();
				response.sendRedirect(request.getContextPath() + "/");
			} else {
				// Deletion failed, set an error message and forward to the profile page
				request.setAttribute("errorMessage", "Profile deletion failed. Please try again.");
				request.getRequestDispatcher("userProfile.jsp").forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "An error occurred while deleting your profile.");
			request.getRequestDispatcher("userProfile.jsp").forward(request, response);
		}
	}
}