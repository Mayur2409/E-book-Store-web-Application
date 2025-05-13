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
			<h1>Add a New Book</h1>
			<%
					String sucess = request.getParameter("book");
					if(sucess != null && sucess.equals("sucess")){
						sucess = "Book is added Successfully.";
					%>
					
						<P style="color: green;"><%=sucess%></P>
				<%}%>
			<form action="../addBook" method="post" id="addBookForm"
				enctype="multipart/form-data">
				<div class="form-group">
					<label for="title">Book Title:</label> <input type="text"
						id="title" name="title" required>
				</div>
				<div class="form-group">
					<label for="author">Author:</label> <input type="text" id="author"
						name="author" required>
				</div>
				
				<div class="form-group">
					<label for="author">Publisher:</label> <input type="text" id="author"
						name="publisher" required>
				</div>
				
				<div class="form-group">
					<label for="author">Language:</label> <input type="text" id="author"
						name="language" required>
				</div>
				
				<div class="form-group">
					<label for="genre">Price:</label> <input type="number" id="genre"
						name="price" required>
				</div>
				
				<div class="form-group">
					<label for="genre">No. of pages :</label> <input type="number" id="genre"
						name="pages" required>
				</div>
				
				<div class="form-group">
					<label for="year">Quantity</label> <input type="number"
						id="quantity" name="quantity" required>
				</div>
				<div class="form-group">
				
					<label for="year">Category</label> 
					<select name="category">
						<option value="">-- Select --</option>
					<%
						bookDao bookdao = new bookDaoImp();
						List<category> ls = bookdao.showAllCategory();
						
							for(category c : ls){
					%>
						
						
						<option value="<%= c.getId() %>"><%= c.getCategory_name()%></option>					
					
					<%} %>
					</select>
				</div>
				<div class="form-group">
					<label for="isbn">Status:</label>
					<!-- <input type="text" id="isbn" name="status" required> -->
					<select name="status" id="">
						<option value="">-- Select --</option>
						<option value="active">Active</option>
						<option value="Inactive">Inactive</option>
					</select>
				</div>
				<div class="form-group">
					<label for="pages">Book Image: </label> <input type="file"
						name="book_img" required>
				</div>
				<button type="submit">Add Book</button>

				<%
					String error = request.getParameter("error");
	
					if (error != null && error.equals(null)) {
				%>
				<P style="color: red;"><%=error%></P>
				<%}%>
							

			</form>
		</div>
	</section>

	<%@include file="footer.jsp"%>

</body>
</html>
