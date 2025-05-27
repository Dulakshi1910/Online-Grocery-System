package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.products;
import utils.DatabaseConnection;

@WebServlet("/admin/admin-itemsList")
public class adminItemList extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<products> productList = new ArrayList<>();

		try (Connection connection = DatabaseConnection.initializeDatabase();
				PreparedStatement preparedStatement = connection
						.prepareStatement("SELECT id, category, name, description, price FROM products");
				ResultSet resultSet = preparedStatement.executeQuery()) {

			while (resultSet.next()) {
				products product = new products();
				product.setId(resultSet.getInt("id"));
				product.setCategory(resultSet.getString("category"));
				product.setName(resultSet.getString("name"));
				product.setDescription(resultSet.getString("description"));
				product.setPrice(resultSet.getDouble("price"));
				productList.add(product);
			}

			// Set the product list as a request attribute
			request.setAttribute("productList", productList);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// Forward to the JSP page
		request.getRequestDispatcher("/admin/admin-itemsList.jsp").forward(request, response);
	}
}
