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

import utils.DatabaseConnection; // Make sure you have a class to handle database connections

@WebServlet("/jsp/signin")
public class signin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("asdasd");
		HttpSession session = request.getSession(false);

		request.getRequestDispatcher("/jsp/signin.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(7845);
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println(username);
		System.out.println(password);

		// First, validate the user
		boolean isValidUser = validateUser(username, password);

		if (isValidUser) {
			// If valid, retrieve the role
			String role = getUserRole(username, password);
			System.out.println(role);

			if (role != null) {
				HttpSession session = request.getSession();
				session.setAttribute("user", username);
				session.setAttribute("role", role); // Store role in session

				// Redirect based on role
				if ("admin".equalsIgnoreCase(role)) {
					response.sendRedirect(request.getContextPath() + "/admin/admin"); // Redirect to admin URL
				} else if ("staff".equalsIgnoreCase(role)) {
					response.sendRedirect(request.getContextPath() + "/staff/staff"); // Redirect to user URL
				} else {
					response.sendRedirect(request.getContextPath() + "/index.jsp"); // Redirect to user URL
				}
			}
		} else {
			request.setAttribute("errorMessage", "Invalid username or password");
			request.getRequestDispatcher("/jsp/signin.jsp").forward(request, response);
		}
	}

	private boolean validateUser(String username, String password) {
		boolean isValid = false;

		try (Connection con = DatabaseConnection.initializeDatabase()) {
			String query = "SELECT * FROM users WHERE username = ? AND password = ?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, username);
			ps.setString(2, password); // Password is plain text (no encryption)

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				isValid = true;
			}
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

		return isValid;
	}

	private String getUserRole(String username, String password) {
		String role = null;

		try (Connection con = DatabaseConnection.initializeDatabase()) {
			// Query to get username, password, and role
			String query = "SELECT role FROM users WHERE username = ? AND password = ?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, username);
			ps.setString(2, password); // Password should be encrypted in real apps

			ResultSet rs = ps.executeQuery();

			// If a matching user is found, retrieve the role
			if (rs.next()) {
				role = rs.getString("role"); // Get the role from the database
			}
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

		return role;
	}
}
