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


    <link rel="stylesheet" href="css/userProfile.css" type="text/css">

</head>
<body>
    <header class="header">

        <a href="#" class="logo"> <i class="fas fa-shopping-cart"></i> EveryDay Mart </a>

        <nav class="navbar">
            <a href="<%= request.getContextPath() %>">home</a>
            <a href="${pageContext.request.contextPath}/userProfile">User Profile</a>
            <a href="${pageContext.request.contextPath}/userOrders">User Orders</a>

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
    
    
        <!-- User Details -->
        <h2 class="userHeading">User Details</h2>
        <div class="form-wrapper">
            <div class="user-details-box">
            <form method="post" action="${pageContext.request.contextPath}/updateProfile" onsubmit="return validateEmail()">
                <h1>Hello, <%= request.getAttribute("fullName") %></h1>
                <label for="full_name">Full Name:</label><br>
                <input type="text" id="fullname" name="fullname" value="<%= request.getAttribute("fullName") %>"><br>
                <label for="username">Username:</label><br>
                <input type="text" id="username" name="username" value="<%= request.getAttribute("username") %>" readonly><br>
                <label for="email">Email:</label><br>
                <input type="email" id="email" name="email" value="<%= request.getAttribute("email") %>"><br>
                <div id="btn-wrap">
                    <input type="submit" value="UPDATE">
                    <button type="button" onclick="deleteAccount()" id="delete-btn">DELETE PROFILE</button>
                </div>
            </form>
            </div>
            <!-- Password Box -->
			<div class="user-password-box">
			    <form action="${pageContext.request.contextPath}/updatePassword" method="post" onsubmit="return validatePassword()">
			        <input type="hidden" id="username" name="username" value="<%= request.getAttribute("username") %>" />
			        
			        <label for="old_password">Old Password:</label>
			        <input type="password" id="old_password" name="old_password" required>
			
			        <label for="new_password">New Password:</label>
			        <input type="password" id="new_password" name="new_password" required>
			
			        <label for="confNew_password">Re-Enter Password:</label>
			        <input type="password" id="confNew_password" name="confNew_password" required>
			
			        <input type="submit" value="Change Password">
			    </form>
			</div>
        </div>
       

        

		<script>
			// Check if a message is available from the server
		    <% if (request.getAttribute("message") != null) { %>
		        alert("<%= request.getAttribute("message") %>");
		    <% } %>
	    
		    function deleteAccount() {
		        if (confirm('Are you sure you want to delete your profile? This action cannot be undone.')) {
		            // Create a form dynamically and submit it
		            var form = document.createElement('form');
		            form.method = 'POST';
		            form.action = '<%= request.getContextPath() %>/deleteProfile';
		
		            // Add the form to the body and submit it
		            document.body.appendChild(form);
		            form.submit();
		        }
		    }
		    
		    function validatePassword() {
		        var oldPassword = document.getElementById("old_password").value;
		        var newPassword = document.getElementById("new_password").value;
		        var confirmPassword = document.getElementById("confNew_password").value;

		        if (newPassword !== confirmPassword) {
		            alert("New password and confirm password do not match.");
		            return false;
		        }
		        
		        // Add more validation if needed (e.g., password length, complexity)
		        return true;
		    }
		    
		    function validateEmail() {
		        var email = document.getElementById("email").value;
		        // Regular expression for validating an email
		        var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

		        if (!emailPattern.test(email)) {
		            alert("Please enter a valid email address.");
		            return false;
		        }
		        return true;
		    }
		</script>

    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <script src="js/script.js"></script>
</body>
</html>