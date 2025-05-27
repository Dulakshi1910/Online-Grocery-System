<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product List</title>

    <link rel="stylesheet" href="../css/staff/staff-airlineList.css" type="text/css">
    <script src="myScript.js"></script>
</head>
<body>

    <!-- Heading code lines -->
    <div id="heading">
        <img src="../images/cart-logo.png" width="100px" height="100px" class="logo">
        <h1 class="mainHeadline">Take it home,get it from us</h1>
        <a href="../jsp/signout">
            <img class="userLogo" width="50px" height="50px" src="../images/user-circle.png">
            <span>Logout</span>
        </a>
    </div>

    <div class="navbar">
        <h2>Staff Panel</h2>
        <a href="${pageContext.request.contextPath}/staff/staff">Dashboard</a>
        <a href="${pageContext.request.contextPath}/staff/staff-addItem">Add Items</a>
        <a href="${pageContext.request.contextPath}/staff/staff-itemsList">Manage Items</a>
    </div>

    <!-- Item List -->
    <h2 style="text-align: center;">Item List</h2>
    
    <%@ page import="java.util.List" %>
    <%@ page import="model.products" %>
    
    <% List<model.products> productList = (List<model.products>) request.getAttribute("productList"); %>

    <table style="border: 1px;">
        <thead>
            <tr>
                <th>Item Id</th>
                <th>Item Name</th>
                <th>Category</th>
                <th>Price</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% if (productList != null && !productList.isEmpty()) { %>
                <% for (model.products product : productList) {  %>
                    <tr>
                        <td><%= product.getId() %></td>
                        <td><%= product.getName() %></td>
                        <td><%= product.getCategory() %></td>
                        <td><%= product.getPrice() %></td>
                        <td>
                            <form action="${pageContext.request.contextPath}/staff/updatePrice" method="post">
                                <input type="hidden" name="id" value="<%= product.getId() %>">
                                <input type="number" name="newPrice" step="0.01" required>
                                <input type="submit" value="Update Price">
                            </form>
                        </td>
                    </tr>
                <% } %>
            <% } else { %>
                <tr>
                    <td colspan="5" style="text-align: center;">No items found</td>
                </tr>
            <% } %>
        </tbody>
    </table>

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

</body>
</html>
