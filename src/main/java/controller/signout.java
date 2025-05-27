package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/jsp/signout")
public class signout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("test login debug point"); // Debugging statement

		// Invalidate the session if it exists
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}

		// Redirect to index.jsp (adjust the path as necessary)
		response.sendRedirect(request.getContextPath() + "/");
	}
}
