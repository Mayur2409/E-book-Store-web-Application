<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login </title>
    <link rel="stylesheet" href="css/authStyle.css">
</head>
<body>
    <div class="container">
        <div class="box">
            <p class="text">Login page</p>
            <form action="loginServlet" method="post" enctype="">
                <input type="text" name="username" class="in-text" placeholder="Username" required ><br>
                <input type="password" name = "password" class="in-text" placeholder="Password" required><br>
                
                <button type="submit" class="btn">Login </button>
                
                <%
                	String error=request.getParameter("error");
                	System.out.println("error: "+ error);
                	if(error != null && error.equals("1")){
                		
                %>
                <p style="color:red;margin-top:5px;">Username and Password is invalid</p>
                <%} else if(error != null && error.equals("2")){%>
                	<p style="color:red;margin-top:5px;">You are logout from admin module.</p>
                
                <%} %>
                <p class = "center">New Here ! <a href="signup.jsp">Signup</a></p>
            </form>
        </div>
    </div>
</body>
</html>
