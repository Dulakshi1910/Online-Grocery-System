<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/signup.css" type="text/css">
</head>
<body>

	        <div class="form-wrapper">
            <div class="container">
                <h2>Registration Form</h2>
                <form action="${pageContext.request.contextPath}/jsp/signup" method="post" onsubmit="return validateEmail()">
                  <label for="full_name">Full Name:</label>
                  <input type="text" id="fullname" name="fullname" required>
                  
                  <label for="email">Email Address:</label>
                  <input type="email" id="email" name="email" required>
                  
                  <label for="username">Username:</label>
                  <input type="text" id="username" name="username" required>
                  
                  <label for="password">Password:</label>
                  <input type="password" id="password" name="password" required>
                  
                  <label for="confirm_password">Confirm Password:</label>
                  <input type="password" id="confirm_password" name="confirm_password" required>
                  
                  <!-- <button type="submit" class="submit-button" onclick="return alert("")">Submit</button> -->
                  <button type="submit" class="submit-button">Submit</button>
                </form>
                
                <p>If you are already registered, please <a href="signin.jsp">login here</a>.</p>
              </div>
        </div>
        
        
        
        <script>
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
		    
		 // Function to validate password match
		    function validatePassword() {
		        var password = document.getElementById("password").value;
		        var confirmPassword = document.getElementById("confirm_password").value;

		        if (password !== confirmPassword) {
		            alert("Passwords do not match.");
		            return false;
		        }
		        return true;
		    }
		</script>
		        

</body>
</html>