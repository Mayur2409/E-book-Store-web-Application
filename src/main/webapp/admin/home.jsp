<%@page import="com.mkLib.Model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/ADashboardStyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    
 



 <%@include file="navbar.jsp" %>
 
       
    <section>
        <div class="container bg-white">
            <div class="box">
                <a href="AllCategory.jsp" class="btn a"><i class="fa-solid fa-plus size"></i> <br>Add Category</a>
                <a href="AddBooks.jsp" class="btn a"><i class="fa-solid fa-plus size"></i> <br>Add Books</a>
                <a href="Allbooks.jsp" class="btn a"><i class="fa-solid fa-book-open size"></i><br> All books </a>
                <a href="AllOrder.jsp" class="btn a"> <i class="fa-solid fa-box-open size"></i><br>Orders</a>
                <a href="../logoutServlet" class="btn a"> <i class="fa-solid fa-arrow-right-from-bracket size"></i> <br>Logout</a>
            </div>
        </div>

    </section>

    <%@include file="footer.jsp" %>
  
    
</body>
</html>
