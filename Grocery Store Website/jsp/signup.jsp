<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/signup.css" type="text/css">
</head>
<body>

	        <div class="form-wrapper">
            <div class="container">
                <h2>Registration Form</h2>
                <form action="./php/signup_process.php" method="post">
                  <label for="full_name">Full Name:</label>
                  <input type="text" id="full_name" name="full_name" required>
                  
                  <label for="email">Email Address:</label>
                  <input type="email" id="email" name="email" required>
                  
                  <label for="username">Username:</label>
                  <input type="text" id="username" name="username" required>
                  
                  <label for="password">Password:</label>
                  <input type="password" id="password" name="password" required>
                  
                  <label for="confirm_password">Confirm Password:</label>
                  <input type="password" id="confirm_password" name="confirm_password" required>
                  
                  <!-- <button type="submit" class="submit-button" onclick="return alert("")">Submit</button> -->
                  <button type="submit" class="submit-button" onclick="alert('Sign Up succesfull')">Submit</button>
                </form>
                
                <p>If you are already registered, please <a href="login.php">login here</a>.</p>
              </div>
        </div>

</body>
</html>