<%@page import="com.mkLib.dao.bookDaoImp"%>
<%@page import="com.mkLib.dao.bookDao"%>
<%@page import="com.mkLib.Model.category"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="../css/ADDBookStyle.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body> 

	<%@include file="navbar.jsp"%>

	<section>
	
		<div class="BookContainer">
			<h1>Add New Category</h1>
			
			<form action="../addCategory" method="post" id="addBookForm">
			
				<div class="form-group">
					<label for="author">Category Name:</label> <input type="text" id="author"
						name="category" required>
				</div>
				
				<button type="submit">Add Category</button>
			</form>
		</div>
	</section>

	<%@include file="footer.jsp"%>

</body>
</html>
