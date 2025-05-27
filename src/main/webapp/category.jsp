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

    <link rel="stylesheet" href="css/style.css">

</head>
<body>

	    <% 
    session = request.getSession();
    String username = (String) session.getAttribute("user");
    %>
    
    <header class="header">

        <a href="#" class="logo"> <i class="fas fa-shopping-cart"></i> EveryDay Mart </a>

        <nav class="navbar">
            <a href="<%= request.getContextPath() %>">home</a>
        </nav>

        <div class="icons">
            <div id="cart-btn" class="fas fa-shopping-basket"></div>
            <div id="login-btn" class="fas fa-user"></div>
            <div id="menu-btn" class="fas fa-bars"></div>
        </div>

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

    <!-- end -->


<%@ page import="java.util.List" %>
<%@ page import="model.products" %>

<section class="category-table">
    <h2>Our Categories</h2>
    
    <table>
        <thead>
            <tr>
                <th>Category</th>
                <th>Item</th>
                <th>Description</th>
                <th>Price</th>
                <th>Order</th>
            </tr>
        </thead>
        <tbody>
            <% 
                List<products> productList = (List<products>) request.getAttribute("productList");
                for (products product : productList) { 
            %>
                <tr>
                    <td><%= product.getCategory() %></td>
                    <td><%= product.getName() %></td>
                    <td><%= product.getDescription() %></td>
                    <td>$<%= product.getPrice() %></td>
                    <td>
					    <form action="cart" method="post">
					        <input type="hidden" name="productId" value="<%= product.getId() %>" />
					        <input type="hidden" name="productName" value="<%= product.getName() %>" />
					        <input type="hidden" name="productPrice" value="<%= product.getPrice() %>" />
					        <button type="submit" class="btn">Order</button>
					    </form>
					</td>

                </tr>
            <% } %>
        </tbody>
    </table>
</section>


<!-- end category table -->






    <!-- footer -->

    <section class="footer">

        <div class="box-container">

            <div class="box">
                <h3>find us here</h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. In accusamus praesentium.</p>
                <div class="share">
                    <a href="#" class="fab fa-facebook-f"></a>
                    <a href="#" class="fab fa-twitter"></a>
                    <a href="#" class="fab fa-instagram"></a>
                    <a href="#" class="fab fa-linkedin"></a>
                </div>
            </div>

            <div class="box">
                <h3>contact us</h3>
                <p>+52 2 1478 7412</p>
                <a href="#" class="link">everydaymart@gmail.com</a>
            </div>

            <div class="box">
                <h3>localization</h3>
                <p>230 points of pines dr <br>
                colorado springs <br>
                United States.
                </p>
            </div>

        </div>

        <div class="credit">created by <span> SLIIT Student </span> all rights reserved!</div>

    </section>


    











    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <script src="js/script.js"></script>
</body>
</html>