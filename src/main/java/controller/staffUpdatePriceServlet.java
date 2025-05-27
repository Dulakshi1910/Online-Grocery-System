package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.DatabaseConnection;

@WebServlet("/staff/updatePrice")
public class staffUpdatePriceServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        double newPrice = Double.parseDouble(request.getParameter("newPrice"));

        try (Connection connection = DatabaseConnection.initializeDatabase();
             PreparedStatement preparedStatement = connection.prepareStatement("UPDATE products SET price = ? WHERE id = ?")) {

            preparedStatement.setDouble(1, newPrice);
            preparedStatement.setInt(2, id);
            preparedStatement.executeUpdate();

            // Redirect back to the items list page
            response.sendRedirect(request.getContextPath() + "/staff/staff-itemsList");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
