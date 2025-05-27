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

import model.order;
import utils.DatabaseConnection;

@WebServlet("/staff/staff")
public class staff extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<order> orders = new ArrayList<>();
		System.out.println("STAFF PANEL");
		try (Connection conn = DatabaseConnection.initializeDatabase()) {
			String query = "SELECT id, username, productNames, totalPrice FROM orders";
			PreparedStatement stmt = conn.prepareStatement(query);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				order order = new order();
				order.setId(rs.getInt("id"));
				order.setUsername(rs.getString("username"));
				order.setProductNames(rs.getString("productNames"));
				order.setTotalPrice(rs.getDouble("totalPrice"));
				orders.add(order);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		request.setAttribute("orders", orders);
		request.getRequestDispatcher("/staff/staff.jsp").forward(request, response);
	}
}
