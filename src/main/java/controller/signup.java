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

@WebServlet("/jsp/signup")
public class signup extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getRequestDispatcher("/jsp/signup.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Get form data
		String fullname = request.getParameter("fullname");
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirm_password");

		// Server-side validation
		if (!password.equals(confirmPassword)) {
			request.setAttribute("errorMessage", "Passwords do not match.");
			request.getRequestDispatcher("/jsp/signup.jsp").forward(request, response);
			return;
		}

		// Save user to the database
		try (Connection con = DatabaseConnection.initializeDatabase()) {
			String query = "INSERT INTO users (username, password, email, fullname,role) VALUES (?, ?, ?, ?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, username);
			ps.setString(2, password); // Storing plain password (no encryption)
			ps.setString(3, email);
			ps.setString(4, fullname);
			ps.setString(5, "USER");

			ps.executeUpdate();
			System.out.println("User saved successfully.");

			// Redirect to the main page or login page after successful registration
			response.sendRedirect(request.getContextPath() + "/");
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "Something went wrong during registration.");
			request.getRequestDispatcher("/jsp/signup.jsp").forward(request, response);
		}
	}
}
