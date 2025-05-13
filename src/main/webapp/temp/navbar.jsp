<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/style.css">
    
</head>
<body>
    
    <%
    	HttpSession s1 = request.getSession();
    	s1.getAttribute("username");
    	if(s1 !=null && s1.getAttribute("username") != null){
    		
    		String username = (String)s1.getAttribute("username");
    		
    	
    %>
    <nav>
        <div class="navbar">
            <div class="icon"><p>MKLibrary</p></div>

            <ul>
                <li><a href="home.jsp" >home</a></li>
                <li><a href="book.jsp" >Books</a></li>
                <li><a href="#login" >User</a></li>
                <li><a href="#login" >Issue/return</a></li>
                <li><a href="logoutServlet" >logout</a></li>
                 <li><a href="#profile" class="cir"><i class="fa-regular fa-user"></i><span><%= username %></span></a></li>
            </ul>

            
        </div>
    </nav>
    <%
    	}else{
    		response.sendRedirect("login.jsp");
    	}
    
    %>

</body>
</html>