package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.products;

@WebServlet("/cart")
public class cart extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the product ID from the request
        int productId = Integer.parseInt(request.getParameter("productId"));
        String productName = request.getParameter("productName");
        double productPrice = Double.parseDouble(request.getParameter("productPrice"));

        // Create a new Product object (assuming you have a constructor)
        products product = new products();
        product.setId(productId);
        product.setName(productName);
        product.setPrice(productPrice);

        // Get the session and add the product to the cart
        HttpSession session = request.getSession();
        List<products> cart = (List<products>) session.getAttribute("cart");

        // If cart is null, initialize it
        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }

        // Add the product to the cart
        cart.add(product);

        // Optionally, redirect to the cart page or send a success message
        response.sendRedirect("category"); // Redirect back to category page
    }
}
