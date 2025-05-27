package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.products;

@WebServlet("/category")
public class category extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Database connection settings
        String jdbcURL = "jdbc:mysql://localhost:3306/oopwebapp?useSSL=false";
        String dbUser = "root";
        String dbPassword = "root";

        ArrayList<products> productList = new ArrayList<>();

        try {
            // Load the MySQL driver
            Class.forName("com.mysql.jdbc.Driver");

            // Establish a connection
            Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // Prepare SQL query
            String sql = "SELECT * FROM products";
            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();

            // Extract data from result set
            while (resultSet.next()) {
                products product = new products();
                product.setId(resultSet.getInt("id"));
                product.setName(resultSet.getString("name"));
                product.setDescription(resultSet.getString("description"));
                product.setPrice(resultSet.getDouble("price"));
                product.setCategory(resultSet.getString("category"));
                
                productList.add(product);
            }

            resultSet.close();
            statement.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        // Set product list as an attribute
        request.setAttribute("productList", productList);

        // Forward to category.jsp
        request.getRequestDispatcher("category.jsp").forward(request, response);
    }
}
