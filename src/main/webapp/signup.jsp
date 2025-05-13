<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>registration</title>
    <link rel="stylesheet" href="css/authStyle.css">
</head>
<body>
    <div class="container">
        <div class="box">
            <p class="text">Registration page</p>
            <form action="registrationServlet" method="post" >
                <input type="text" name="username" class="in-text" placeholder="Username" required><br>
                <input type="email" name = "email" class="in-text" placeholder="Email" required><br>
                <input type="password" name = "password" class="in-text" placeholder="Password" required><br>
                <!-- <p>Profile Photo </p><input type="file" name="image" >   -->
                
                <button type="submit" class="btn">Sing Up </button>
                
                <%
               		String error = request.getParameter("error");
                	if(error != null && error.equals("1")){
                
                %>
                	<p style="color:red;">Invalid username and password ! </p>
                <%} %>
                <p class = "center">Already register! <a href="login.jsp">login</a></p>
            </form>
        </div>
    </div>
</body>
</html>