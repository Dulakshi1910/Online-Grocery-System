package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.products;
import utils.DatabaseConnection;

@WebServlet("/placeOrder")
public class placeOrder extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        String user = (String) session.getAttribute("user");
        ArrayList<products> cart = (ArrayList<products>) session.getAttribute("cart");
        
        if (user == null || cart == null || cart.isEmpty()) {
            response.sendRedirect("index.jsp");
            return;
        }
        
        double totalPrice = 0.0;
        StringBuilder productNames = new StringBuilder();
        
        // Calculate total and collect product names
        for (products p : cart) {
            totalPrice += p.getPrice();
            productNames.append(p.getName()).append(", ");
        }
        
        // Remove last comma and space
        if (productNames.length() > 0) {
            productNames.setLength(productNames.length() - 2);
        }
        
        // Save order to the database
        try {
            // Database connection
        	Connection conn = DatabaseConnection.initializeDatabase();

            // Insert query
            String sql = "INSERT INTO orders (username, productNames, totalPrice) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, user);
            stmt.setString(2, productNames.toString());
            stmt.setDouble(3, totalPrice);

            // Execute the query
            stmt.executeUpdate();

            // Close resources
            stmt.close();
            conn.close();
            
            // Clear the cart after placing the order
            session.removeAttribute("cart");
            
            // Redirect to order confirmation page
            response.sendRedirect("index.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Order failed, please try again.");
        }
    }
}
