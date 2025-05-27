<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel - Add Staff</title>

    <link rel="stylesheet" href="../css/admin/admin-addStaff.css" type="text/css">

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

    <!-- Add Staff Form -->
    <h2>Add Staff</h2>
    <div class="form-wrapper">
        <form action="${pageContext.request.contextPath}/admin/admin-addStaff" method="post" onsubmit="return validateEmail()">
            <label for="staff_name">Staff Name:</label><br>
            <input type="text" id="staff_name" name="staff_name" required><br><br>

            <label for="user_name">User Name:</label><br>
            <input type="text" id="username" name="username" required><br><br>

            <label for="email">Email:</label><br>
            <input type="email" id="email" name="email" required><br><br>

            <label for="staff_password">Staff Password:</label><br>
            <input type="password" id="staff_password" name="staff_password" required><br><br>

            <label for="role">Role:</label><br>
            <select id="role" name="role" required>
                <option value="">Select Role</option>
                <option value="STAFF">Staff</option>
                <option value="HELPDESK">Help Desk</option>
            </select><br><br>

            <input type="submit" value="Submit">
        </form>
    </div>

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
    
    
    
	   <script>
	    // Check if there is a status from the server (passed as a request attribute)
	    window.onload = function() {
	        // Get the status from the request attribute
	        const status = "<%= request.getAttribute("status") %>";
	
	        if (status === "success") {
	            // Display alert for successful staff addition
	            alert("Staff member added successfully!");
	            // Redirect to the same page after the alert
	            window.location.href = "${pageContext.request.contextPath}/admin/admin-addStaff";
	        } else if (status === "fail") {
	            alert("Failed to add the staff member. Please try again.");
	        } else if (status === "error") {
	            alert("An error occurred while adding the staff member.");
	        }
	    };
	    
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
    

</body>
</html>
