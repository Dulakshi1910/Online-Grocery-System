<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/login.css" type="text/css">
</head>
<body>

	<div class="form-wrapper">
    <div class="container">
        <h2>User Login</h2>
        <form action="signin" method="post">
          <div>
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
          </div>
          <div>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
          </div>
          <div>
            <button type="submit">Login</button>
          </div>
        </form>
        <p>Not a member? <a href="signup">Sign Up</a></p>
      </div>
    </div>


</body>
</html>