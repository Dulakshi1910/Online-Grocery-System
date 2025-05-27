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

@WebServlet("/staff/staff-addItem")
public class staffAddItem extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // SQL query to insert data into the products table
    private static final String query = "INSERT INTO products (category, name, description, price) VALUES (?, ?, ?, ?)";
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/staff/staff-addItem.jsp").forward(request, response);
	}
    

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form parameters
        String itemName = request.getParameter("itemName");
        String category = request.getParameter("category");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));

        // Database connection
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // Initialize the database connection
            connection = DatabaseConnection.initializeDatabase();

            preparedStatement = connection.prepareStatement(query);

            // Set the values to the prepared statement
            preparedStatement.setString(1, category);
            preparedStatement.setString(2, itemName);
            preparedStatement.setString(3, description);
            preparedStatement.setDouble(4, price);

            // Execute the query
            int rowAffected = preparedStatement.executeUpdate();

            preparedStatement.close();
            connection.close();

			// Set a success attribute if the staff is added
			if (rowAffected > 0) {
				request.setAttribute("status", "success");
			} else {
				request.setAttribute("status", "fail");
			}

		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			request.setAttribute("status", "error");
		}

		// Forward back to the JSP page
		request.getRequestDispatcher("/staff/staff-addItem.jsp").forward(request, response);  
        }
    }
    

