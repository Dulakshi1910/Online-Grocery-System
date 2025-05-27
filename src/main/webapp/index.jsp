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

    <link rel="stylesheet" type="text/css" href="css/style.css">

</head>
<body>
    <% 
    session = request.getSession();
    String username = (String) session.getAttribute("user");
    %>
    <header class="header">

        <a href="#" class="logo"> <i class="fas fa-shopping-cart"></i> EveryDay Mart </a>

        <nav class="navbar">
            <a href="#home">home</a>
            <a href="#product">product</a>
            <a href="${pageContext.request.contextPath}/category">Category</a>
            <a href="#about">about</a>
            <a href="#review">review</a>
            <a href="#blog">blog</a>
            <a href="#contact">contact</a>
            <a href="${pageContext.request.contextPath}/userProfile">User Profile</a>

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

    <!-- home -->

    <section class="home" id="home">

        <div class="content">
            <h3>buy best <span> organic product </span> online </h3>
            <a href="#" class="btn"> get yours now </a>
        </div>

    </section>

    <!-- end -->

    <!-- banner -->

    <section class="banner-container">

        <div class="banner">
            <img src="images/banner1.png" alt="">
            <div class="content">
                <span>limited sales</span>
                <h3>Vegetables</h3>
                <a href="#" class="btn">shop now</a>
            </div>
        </div>

        <div class="banner">
            <img src="images/banner2.png" alt="">
            <div class="content">
                <span>limited sales</span>
                <h3>fruits</h3>
                <a href="#" class="btn">shop now</a>
            </div>
        </div>

        <div class="banner">
            <img src="images/banner3.png" alt="">
            <div class="content">
                <span>limited sales</span>
                <h3>assorted</h3>
                <a href="#" class="btn">shop now</a>
            </div>
        </div>

    </section>


    <!-- end -->

    <!-- product -->

    <section class="product" id="product">

        <h1 class="heading"> our <span>products</span></h1>

        <div class="box-container">

            <div class="box">
                <div class="image">
                    <img src="images/product-1.jpg" alt="">
                </div>
                <div class="content">
                    <h3>Bread</h3>
                    <div class="price">$14.99</div>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                    <i class="fas fa-shopping-cart"></i>
                    <i class="fas fa-heart"></i>
                    <i class="fas fa-eye"></i>
                </div>
            </div>

            <div class="box">
                <div class="image">
                    <img src="images/product-2.jpg" alt="">
                </div>
                <div class="content">
                    <h3>Ensal Spice</h3>
                    <div class="price">$14.99</div>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                    <i class="fas fa-shopping-cart"></i>
                    <i class="fas fa-heart"></i>
                    <i class="fas fa-eye"></i>
                </div>
            </div>

            <div class="box">
                <div class="image">
                    <img src="images/product-3.jpg" alt="">
                </div>
                <div class="content">
                    <h3>Coffee</h3>
                    <div class="price">$14.99</div>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                    <i class="fas fa-shopping-cart"></i>
                    <i class="fas fa-heart"></i>
                    <i class="fas fa-eye"></i>
                </div>
            </div>

            <div class="box">
                <div class="image">
                    <img src="images/product-4.jpg" alt="">
                </div>
                <div class="content">
                    <h3>Watermelon</h3>
                    <div class="price">$14.99</div>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                    <i class="fas fa-shopping-cart"></i>
                    <i class="fas fa-heart"></i>
                    <i class="fas fa-eye"></i>
                </div>
            </div>

            <div class="box">
                <div class="image">
                    <img src="images/product-5.jpg" alt="">
                </div>
                <div class="content">
                    <h3>Ketchup</h3>
                    <div class="price">$14.99</div>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                    <i class="fas fa-shopping-cart"></i>
                    <i class="fas fa-heart"></i>
                    <i class="fas fa-eye"></i>
                </div>
            </div>

            <div class="box">
                <div class="image">
                    <img src="images/product-6.jpg" alt="">
                </div>
                <div class="content">
                    <h3>Mint Leaves</h3>
                    <div class="price">$14.99</div>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                    <i class="fas fa-shopping-cart"></i>
                    <i class="fas fa-heart"></i>
                    <i class="fas fa-eye"></i>
                </div>
            </div>

        </div>

    </section>

    <!-- end -->

    <!-- about -->

    <section class="about" id="about">

        <h1 class="heading"> <span>about </span> us </h1>

        <div class="row">

            <div class="content">
                <h3>we make organic food in market</h3>
                <div class="divider"></div>
                <p>At Every Day Mart, we are dedicated to bringing fresh, high-quality groceries right to your doorstep. Our goal is to make your shopping experience easy, fast, and reliable, offering a wide selection of products at great prices. With Every Day Mart, enjoy the convenience of grocery shopping from the comfort of your home.</p>
                <a href="#" class="btn">read more</a>
            </div>

            <div class="image">
                <img src="images/about1.png" alt="">
            </div>

            <div class="image">
                <img src="images/about2.png" alt="">
            </div>

        </div>

    </section>


    <!-- end -->

    <!-- review -->

    <section class="review" id="review">

        <h1 class="heading"> client's <span>review</span> </h1>

        <div class="swiper review-slider">

            <div class="swiper-wrapper">

                <div class="swiper-slide slide">

                    <p>Every Day Mart has completely changed how I shop for groceries. The website is super easy to navigate, and their customer support is really helpful. I have never had an issue with my orders. Definitely my go to grocery store now.</p>
                    <i class="fas fa-quote-right"></i>
                    <div class="user">
                        <img src="images/review-1.png" alt="">
                        <div class="user-info">
                            <h3>john dev</h3>
                            <div class="stars">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="swiper-slide slide">

                    <p>Great service, The groceries are always fresh, and I appreciate the wide range of organic options. I have saved so much time shopping online with Every Day Mart. The only thing I would like is faster delivery during peak hours, but overall it is excellent.</p>
                    <i class="fas fa-quote-right"></i>
                    <div class="user">
                        <img src="images/review-2.png" alt="">
                        <div class="user-info">
                            <h3>Sharha Michel</h3>
                            <div class="stars">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="swiper-slide slide">

                    <p>I absolutely love shopping with Every Day Mart. Their selection is fantastic, and the delivery is always on time. It is so convenient to get everything I need without leaving the house. Highly recommend.</p>
                    <i class="fas fa-quote-right"></i>
                    <div class="user">
                        <img src="images/review-3.png" alt="">
                        <div class="user-info">
                            <h3>When Shin</h3>
                            <div class="stars">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="swiper-slide slide">

                    <p>Every Day Mart has completely changed how I shop for groceries. The website is super easy to navigate, and their customer support is really helpful. I have never had an issue with my orders. Definitely my go to grocery store now.</p>
                    <i class="fas fa-quote-right"></i>
                    <div class="user">
                        <img src="images/review-4.png" alt="">
                        <div class="user-info">
                            <h3>Emili Wilson</h3>
                            <div class="stars">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="swiper-slide slide">

                    <p>Great service, The groceries are always fresh, and I appreciate the wide range of organic options. I have saved so much time shopping online with Every Day Mart. The only thing I would like is faster delivery during peak hours, but overall it is excellent.</p>
                    <i class="fas fa-quote-right"></i>
                    <div class="user">
                        <img src="images/review-5.png" alt="">
                        <div class="user-info">
                            <h3>Jeson Whick</h3>
                            <div class="stars">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="swiper-slide slide">

                    <p>I absolutely love shopping with Every Day Mart. Their selection is fantastic, and the delivery is always on time. It is so convenient to get everything I need without leaving the house. Highly recommend.</p>
                    <i class="fas fa-quote-right"></i>
                    <div class="user">
                        <img src="images/review-6.png" alt="">
                        <div class="user-info">
                            <h3>Yuvi Nhora</h3>
                            <div class="stars">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </div>

    </section>

    <!-- end -->

    <!-- blog -->

    <section class="blog" id="blog">

        <h1 class="heading"> our <span> blog</span> </h1>

        <div class="box-container">

            <div class="box">
                <div class="image">
                    <img src="images/blog1.png" alt="">
                </div>
                <div class="content">
                    <div class="icons">
                        <a href="#"> <i class="fas fa-user"></i> by Isuka </a>
                    </div>
                    <h3>10 Healthy Foods You Should Add to Your Cart</h3>
                    <p>Eating healthy does not have to be complicated! We have put together a list of 10 nutrient-packed foods that are easy to incorporate into your daily meals. From fresh produce to whole grains, discover the ingredients that will boost your health and well-being</p>
                    <a href="#" class="btn"> read more </a>
                </div>
            </div>

            <div class="box">
                <div class="image">
                    <img src="images/blog2.png" alt="">
                </div>
                <div class="content">
                    <div class="icons">
                        <a href="#"> <i class="fas fa-user"></i> by Nethmi </a>
                    </div>
                    <h3>Quick and Easy Weeknight Dinner Recipes</h3>
                    <p>Struggling to find time to cook during the week? We have got you covered with quick, delicious dinner recipes that can be prepared in under 30 minutes. Using ingredients readily available at Every Day Mart, these meals will save you time without compromising on taste</p>
                    <a href="#" class="btn"> read more </a>
                </div>
            </div>

            <div class="box">
                <div class="image">
                    <img src="images/blog3.png" alt="">
                </div>
                <div class="content">
                    <div class="icons">
                        <a href="#"> <i class="fas fa-user"></i> by Dulakashi </a>
                    </div>
                    <h3>The Benefits of Organic Foods: Are They Worth It?</h3>
                    <p>Organic foods are becoming increasingly popular, but are they really better for you? In this blog, we explore the benefits of going organic, from reduced pesticide exposure to supporting sustainable farming practices. Find out if organic is the right choice for your family.</p>
                    <a href="#" class="btn"> read more </a>
                </div>
            </div>

        </div>

    </section>

    <!-- end -->

    <!-- contact -->

    <section class="contact" id="contact">

        <h1 class="heading"> contact <span> now </span> </h1>

        <div class="row">

            <div class="image">
                <img src="images/contact.png" alt="">
            </div>

            <form action="">

                <div class="inputBox">
                    <input type="text" placeholder="first name">
                    <input type="text" placeholder="last name">
                </div>

                <div class="inputBox">
                    <input type="email" placeholder="email address">
                    <input type="number" placeholder="phone">
                </div>

                <textarea placeholder="message" id="" cols="30" rows="10"></textarea>
                <input type="submit" value="order now" class="btn">
            </form>

        </div>

    </section>

    <!-- end -->

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