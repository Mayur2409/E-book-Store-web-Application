<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/style.css">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
 <!--  
    <nav>
        <div class="navbar">
            <div class="icon"><p>MKLibrary</p></div>

            <ul>
                <li><a href="#home" >home</a></li>
                <li><a href="book.jsp" >Books</a></li>
                <li><a href="#login" >User</a></li>
                <li><a href="#login" >Issue/return</a></li>
                <li><a href="logoutServlet" >logout</a></li>
                 <li><a href="#profile" class="cir"><i class="fa-regular fa-user"></i><span>Mayur</span></a></li>
            </ul>

            
        </div>
    </nav>  --> 
	
	<%@include file="navbar.jsp" %>
	
	<%
		System.out.println("Normal user home page");
	%>
   
    <section>
        <div class="container bg-white">
            <div class="box">
                <a href="book.jsp" class="btn a">+ Add Books</a>
                <a href="Showbook.jsp" class="btn a">Show All Books</a>
                <a href="#" class="btn a">issue books</a>
                <a href="#" class="btn a">return books </a>
            </div>
        </div>

    </section>

    <section>
        <div class="container">
            <div class="box">
                <p class="text">Welcome to Mk Library</p>
                <p> new & used Books </p>
                <p> Lorem ipsum, dolor sit amet consectetur adipisicing elit. Obcaecati, magni? </p>
            </div>
        </div>

    </section>
    
    <%@include file="footer.jsp" %>
</body>
</html>