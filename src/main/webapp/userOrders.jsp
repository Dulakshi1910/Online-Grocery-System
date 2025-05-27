<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Complete Responsive Grocery Store Website</title>

    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

    <!-- font awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">


    <link rel="stylesheet" href="css/userOrders.css" type="text/css">

</head>
<body>
    <header class="header">

        <a href="#" class="logo"> <i class="fas fa-shopping-cart"></i> EveryDay Mart </a>

        <nav class="navbar">
            <a href="<%= request.getContextPath() %>">home</a>
            <a href="${pageContext.request.contextPath}/userProfile">User Profile</a>

        </nav>

        <div class="icons">
            <div id="cart-btn" class="fas fa-shopping-basket"></div>
            <div id="login-btn" class="fas fa-user"></div>
            <div id="menu-btn" class="fas fa-bars"></div>
        </div>
        
        
        
        		    <%
		    String username = (String) session.getAttribute("user");
		    if (username == null) {
		        response.sendRedirect("index.jsp");
		        return;
		    }
			%>
                <!-- shopping cart -->
        
		
		<%@ page import="java.util.List" %>
		<%@ page import="model.products" %>

		<%
	    List<products> cart = (List<products>) session.getAttribute("cart");
	    double total = 0.0;
		%>
	
		<div class="shopping-cart">
	    <h2>Your Shopping Cart</h2>
	    
	    <% if (cart != null && !cart.isEmpty()) { %>
	    
	        <% for (products product : cart) { 
	            total += product.getPrice(); 
	        %>
	        
	        <div class="box">
	            <i class="fas fa-times"></i> <!-- You may want to add logic for removing items here -->
	                <div class="content">
	                <h3><%= product.getName() %></h3>
	                <span class="price">$<%= product.getPrice() %></span>
	            </div>
	        </div>
	        
	        <% } %>
	
	        <h3 class="total"> total: <span>$<%= String.format("%.2f", total) %></span></h3>
	        <a href="checkout.jsp" class="btn" id="checkout-btn">Checkout</a>
	
	    <% } else { %>
	        <p>Your cart is empty.</p>
	    <% } %>
		</div>
		


        <!-- end -->

        <!-- login -->

        <form action="" class="login-form">
            
	         <% if (username == null) { %>
		    <a href="jsp/signin.jsp" class="btn"> Login </a>
		    <a href="jsp/signup.jsp" class="btn"> Signup </a>
			<% } else { %>
			    <a href="<%= request.getContextPath() %>/jsp/signout" class="btn"> Logout </a>
			<% } %>

        </form>

		

    </header>

   

    <br><br><br><br><br><br><br><br><br><br>

    

    <!-- user booked tickets -->
    <h2 style="text-align: center;">User Booked Tickets</h2>

    <!-- Items Ordering Info -->
    <%@ page import="java.util.List" %>
	<%@ page import="model.order" %>
	
	<%
	    List<order> orders = (List<order>) request.getAttribute("orders");
	%>
	
	
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
                        	<a href="${pageContext.request.contextPath}/userDeleteOrder?id=<%= order.getId() %>" onclick="return confirmDelete();">Delete</a>
                    	</td>
	                </tr>
	            <% } %>
	        <% } else { %>
	            <tr><td colspan="5">No orders found.</td></tr>
	        <% } %>
	    </tbody>
	</table>

        

		

    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <script src="js/script.js"></script>
</body>
</html>