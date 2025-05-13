<%@page import="com.mkLib.Model.category"%>
<%@page import="java.util.List"%>
<%@page import="com.mkLib.Model.Book"%>
<%@page import="com.mkLib.dao.bookDao"%>
<%@page import="com.mkLib.dao.bookDaoImp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit book</title>
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
		
			<h1>Edit Book</h1>
			<%
				
				String error = request.getParameter("error");
				if(error != null && error.equals("1")){
				error = "some error are occured.";
			%>
				<P style="color: red;"><%=error%></P>
			<%} %>
			
			<%
				
			int id = Integer.parseInt(request.getParameter("id"));
			bookDao bookdao = new bookDaoImp();
			Book b = bookdao.getBookDelails(id); 
			
			%>
			<form action="../editBook" method="post" id="addBookForm">
			
				<input type="hidden" value="<%= b.getId() %>" name="bid"> 
				<div class="form-group">
					<label for="title">Book Title:</label> <input type="text"
						id="title" name="btitle" required value="<%=b.getTitle()%>">
				</div>
				<div class="form-group">
					<label for="author">Author:</label> <input type="text" id="author"
						name="bauthor" required value="<%=b.getAuthor()%>">
				</div>
				
				<div class="form-group">
					<label for="author">Publisher:</label> <input type="text" id="author"
						name="bpublisher" required value="<%=b.getPublisher()%>">
				</div>
				
				<div class="form-group">
					<label for="author">Language:</label> <input type="text" id="author"
						name="blanguage" required value="<%=b.getLanguage()%>">
				</div>
				
				<div class="form-group">
					<label for="genre">Price:</label> <input type="number" id="genre"
						name="bprice" required value="<%=b.getPrice()%>">
				</div>
				
				<div class="form-group">
					<label for="genre">No. of pages :</label> <input type="number" id="genre"
						name="bpages" required value="<%=b.getPages()%>">
				</div>
				
				<div class="form-group">
					<label for="year">Quantity</label> <input type="number"
						id="quantity" name="bquantity" required value="<%=b.getQuantity()%>">
				</div>

				<div class="form-group">
				
					<label for="year">Category</label> 
					<select name="bcategory">
						
						<option value="<%= b.getCategoryId() %>"><%=b.getCategoryName()%></option>
					<%
						bookDao bookDao = new bookDaoImp();
						List<category> ls = bookdao.showAllCategory();
						
							for(category c : ls){
								if(c.getId() != b.getCategoryId()){
					%>
						
						<option value="<%= c.getId() %>"><%= c.getCategory_name()%></option>					
					
					<%				}
								} %>
					</select>
				</div>


				<div class="form-group">
					<label for="isbn">Status:</label>
					<!-- <input type="text" id="isbn" name="status" required> -->
					<select name="bstatus" id="">
						<%
							if(b.getStatus().equals("active")){
						%>
						<option value="active">Active</option>
						<option value="Inactive">Inactive</option>
						<%}else{ %>
						<option value="Inactive">Inactive</option>
						<option value="active">Active</option>
						<%} %>
					</select>
				</div>
				
				<button type="submit">Edit Book</button>

				
							

			</form>
		</div>
	</section>

	<%@include file="footer.jsp"%>

</body>
</html>
