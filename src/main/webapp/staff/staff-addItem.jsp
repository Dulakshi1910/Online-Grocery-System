<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Grocery Item</title>

    <link rel="stylesheet" href="../css/staff/staff-addFlight.css" type="text/css">

    <script src="myScript.js"></script>
</head>
<body>

    <!-- Heading -->
    <div id="heading">
        <img src="../images/cart-logo.png" width="100px" height="100px" class="logo">
        <h1 class="mainHeadline">Take it home, get it from us</h1>
        <a href="../jsp/signout">
            <img class="userLogo" width="50px" height="50px" src="../images/user-circle.png">
            <span>Logout</span>
        </a>
    </div>

    <!-- Navbar -->
    <div class="navbar">
        <h2>Staff Panel</h2>
        <a href="${pageContext.request.contextPath}/staff/staff">Dashboard</a>
        <a href="${pageContext.request.contextPath}/staff/staff-addItem">Add Items</a>
        <a href="${pageContext.request.contextPath}/staff/staff-itemsList">Manage Items</a>
    </div>

    <!-- Form container -->
    <div class="form-container">
        <!-- Form for adding grocery items -->
        <!-- Update the form action to point to the staffAddItem servlet -->
        <form method="post" action="${pageContext.request.contextPath}/staff/staff-addItem">
            <h2 class="form-title">ADD GROCERY ITEM</h2>

            <label for="itemName">Item Name</label>
            <input type="text" id="itemName" name="itemName" placeholder="Enter item name" required> <br><br>

            <label for="category">Category</label>
            <select id="category" name="category" required>
                <option value="Fruits">Fruits</option>
                <option value="Vegetables">Vegetables</option>
                <option value="Dairy">Dairy</option>
                <option value="Bakery">Bakery</option>
                <option value="Meat">Meat</option>
                <option value="Beverages">Beverages</option>
                <option value="Snacks">Snacks</option>
            </select> <br><br>

            <label for="price">Price</label>
             <input type="number" step="0.01" id="price" name="price" placeholder="Enter price" min="0" oninput="validatePriceInput(event)" required> <br><br>

            <label for="description">Description</label>
            <input type="text" id="description" name="description" placeholder="Enter description"> <br><br>

            <button type="submit" class="proceed-button">Add Item</button>
        </form>
    </div>

    <!-- Footer -->
    <div class="footer">
        <img src="../images/cart-logo.png" alt="Cart Logo" width="100px" height="100px" class="logo">
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
            <input type="search" name="email" placeholder="Email address">
            <img src="../images/icon-email.png" alt="email" width="30px" height="30px">
            <p>Terms of use. Privacy Policy. Cookies</p>
        </div>
    </div>
    
    
    <script>
	    // Check if there is a status from the server (passed as a request attribute)
	    window.onload = function() {
	        // Get the status from the request attribute
	        const status = "<%= request.getAttribute("status") %>";
	
	        if (status === "success") {
	            // Display alert for successful staff addition
	            alert("Item added successfully!");
	            // Redirect to the same page after the alert
	            window.location.href = "${pageContext.request.contextPath}/staff/staff-addItem";
	        } else if (status === "fail") {
	            alert("Failed to add the Item. Please try again.");
	        } else if (status === "error") {
	            alert("An error occurred while adding the Item.");
	        }
	    };
	    
	    
	 // JavaScript validation for price input to allow only numbers and decimal
        function validatePriceInput(event) {
            const value = event.target.value;
            // Check if the value contains any invalid characters (non-digits or multiple decimals)
            if (/[^0-9.]/.test(value) || (value.match(/\./g) || []).length > 1) {
                alert("Only numbers and a single decimal point are allowed for the price.");
                event.target.value = value.slice(0, -1);  // Remove the last invalid character
            }
        }

        // Additional form validation to ensure price is greater than 0
        function validateForm() {
            const price = document.getElementById("price").value;
            if (price <= 0) {
                alert("Price must be greater than 0.");
                return false;
            }
            return true;
        }
	    
	    
	</script>

</body>
</html>
