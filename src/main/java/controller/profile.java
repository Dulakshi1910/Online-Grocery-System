package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.DatabaseConnection;

@WebServlet("/userProfile")
public class profile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Assume user is logged in, get the username from the session
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("user");
		System.out.println(username);

		if (username == null) {
			// Redirect to home if user is not found in session
			response.sendRedirect(request.getContextPath() + "/"); // Modify "/home" if your home URL is different
			return;
		}

		if (username != null) {
			try (Connection conn = DatabaseConnection.initializeDatabase()) {
				String query = "SELECT fullname, username, email FROM users WHERE username = ?";
				PreparedStatement stmt = conn.prepareStatement(query);
				stmt.setString(1, username);

				ResultSet rs = stmt.executeQuery();
				if (rs.next()) {
					// Get the user details from the ResultSet
					String fullName = rs.getString("fullname");
					String userEmail = rs.getString("email");

					// Set the attributes to be passed to the JSP
					request.setAttribute("fullName", fullName);
					request.setAttribute("username", username);
					request.setAttribute("email", userEmail);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// Forward the request to the userProfile.jsp page
		request.getRequestDispatcher("userProfile.jsp").forward(request, response);
	}
}
