<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>

    <link rel="stylesheet" href="../css/admin/admin.css" type="text/css">

    <script src="myScript.js"></script>

</head>
<body>

    <!-- Heading -->
    <div id="heading">
        <img src="../images/cart-logo.png" width="100px" height="100px" class="logo">

        <h1 class="mainHeadline">Take it home,get it from us</h1>
        
        <a href="../jsp/signout">
            <img class="userLogo" width="50px" height="50px" src="../images/user-circle.png">
            <span>Logout</span>
        </a>

    </div>

    <!-- Navbar -->
    <div class="navbar">
        <h2>Admin Panel</h2>
        <a href="${pageContext.request.contextPath}/admin/admin">Dashboard</a>
        <a href="${pageContext.request.contextPath}/admin/admin-addStaff">Add Staff</a>
        <a href="${pageContext.request.contextPath}/admin/admin-itemsList">Manage Items</a>
    </div>

    <!-- Admin container -->
    <div class="admin-container">
        <!-- Boxes -->
        <div class="box" style="background-color: rgb(39, 108, 181);">
          <h2>Total Orders</h2>
          <p>12</p>
        </div>
        <div class="box" style="background-color: rgb(37, 228, 97);">
          <h2>Amount</h2>
          <p>$25,000</p>
        </div>
        <div class="box" style="background-color: rgb(255, 115, 64);">
          <h2>Items</h2>
          <p>Item XYZ123</p>
        </div>
        <div class="box" style="background-color: rgb(77, 157, 255);">
          <h2>Local Time</h2>
          <p id="departure-time"></p>
        </div>
    </div>

    <!-- Items Ordering Info -->
    <%@ page import="java.util.List" %>
	<%@ page import="model.order" %>
	
	<%
	    List<order> orders = (List<order>) request.getAttribute("orders");
	%>
	
	<h2 style="text-align: center;">Items Ordering Info</h2>
	<table style="border: 1px;">
	    <thead>
	        <tr>
	            <th>Order ID</th>
	            <th>Username</th>
	            <th>Ordered Items</th>
	            <th>Total Amount</th>
	            <th>Action</th>
	        </tr>
	    </thead>
	    <tbody>
	        <% if (orders != null && !orders.isEmpty()) { %>
	            <% for (order order : orders) { %>
	                <tr>
	                    <td><%= order.getId() %></td>
	                    <td><%= order.getUsername() %></td>
	                    <td><%= order.getProductNames() %></td>
	                    <td>$<%= String.format("%.2f", order.getTotalPrice()) %></td>
	                    <td>
                        	<a href="${pageContext.request.contextPath}/adminDeleteOrder?id=<%= order.getId() %>" onclick="return confirmDelete();">Delete</a>
                    	</td>
	                </tr>
	            <% } %>
	        <% } else { %>
	            <tr><td colspan="5">No orders found.</td></tr>
	        <% } %>
	    </tbody>
	</table>

   
    <!-- Footer -->
    <div class="footer">
        <img src="../images/cart-logo.png" alt="Airline Logo" width="100px" height="100px" class="logo">
        <div class="content-wrapper">
            <h1 class="bottomHeadline">Follow Us On</h1>
            <div class="socialMedia-icon-container">
                <img src="../images/icon-facebook.png" alt="Facebook" width="30px" height="30px">
                <img src="../images/icon-twitter.png" alt="Twitter" width="30px" height="30px">
                <img src="../images/icon-instagram.png" alt="Instagram" width="30px" height="30px">
                <img src="../images/icon-linkedin.png" alt="LinkedIn" width="30px" height="30px">
            </div>
        </div>
        <div class="email-container">
            <p>Subscribe for our latest offers...</p>
            <input type="search" name="a" placeholder="Email address">
            <img src="../images/icon-email.png" alt="email" width="30px" height="30px">
            <p>Terms of use. Privacy Policy. Cookies</p>
        </div>
    </div>

    <!-- JavaScript for updating real-time departure -->
    <script>
        // Function to update departure time
        function updateDepartureTime() {
            var now = new Date();
            var departureTimeElement = document.getElementById("departure-time");
            departureTimeElement.textContent = now.toLocaleString();
        }

        // Update departure time initially
        updateDepartureTime();

        // Update departure time every second
        setInterval(updateDepartureTime, 1000);

        function confirmDelete() {
            return confirm("Are you sure you want to delete this Order?");
        }
    </script>

</body>
</html>
