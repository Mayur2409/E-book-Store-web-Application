<%@page import="com.mkLib.Model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/ADashboardStyle.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>

	 <%
	 HttpSession s1 = request.getSession();
		User user = (User)s1.getAttribute("userObj");
		if(user !=null && "admin".equals(user.getName())){
		
%>
	<nav>
		<div class="navbar">
			<div class="icon">
				<p>MKLibrary</p>
			</div>

			<ul>
				<li><a href="home.jsp"><i class="fa-solid fa-house-user"></i>
						Home</a></li>
				<!-- <li><a href="#signup" >Books</a></li> -->
				<!-- <li><a href="#signup" >Books</a></li> -->
				<!-- <li><a href="#login" >User</a></li> 
				<li><a href="#login"><i class="fa-solid fa-retweet"></i>
						Issue/return</a></li>-->
				<li><a href="../logoutServlet"><i
						class="fa-solid fa-arrow-right-from-bracket"></i> logout</a></li>
				<li><a href="#profile" class="cir"><i
						class="fa-regular fa-user"></i><span><%= user.getName() %></span></a></li>
			</ul>


		</div>
	</nav>

	<% }else{
    		response.sendRedirect("../login.jsp?error=2");
    	}%>
	

</body>
</html>