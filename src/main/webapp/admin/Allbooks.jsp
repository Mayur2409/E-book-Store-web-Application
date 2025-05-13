<%@page import="com.mkLib.Model.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.mkLib.dao.bookDaoImp"%>
<%@page import="com.mkLib.dao.bookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@include file="navbar.jsp"%>

	<section class="center">
			<%
					String sucess = request.getParameter("book");
					if(sucess != null && sucess.equals("sucess")){
						sucess="book is edited successfully";
					%>
						<script type="text/javascript">
							let msg = "<%= sucess %>";
							alert(msg);
						</script>
						<!--  <P style="color: green;"><%=sucess%></P>-->
						
				<%}%>
				
			<%
					String delete = request.getParameter("delete");
				if(delete != null && delete.equals("1")){
						delete="book is deleted successfully";
					%>
					<script type="text/javascript">
							let msg = "<%= delete %>";
							alert(msg);
						</script>
						 <!-- <P style="color: green;"><%=delete%></P>-->
						
				<%}%>
		<h3>All Books</h3>
		<table id="booksTable">
			<thead>
				<tr>
					<th>Book ID</th>
					<th>Book Image</th>
					<th>Title</th>
					<th>Author</th>
					<th>Price</th>
					<th>Category</th>
					<th>Status</th>
					<th>Quantity</th>
					<th>Action</th>
				</tr>
			</thead>

			<%
				bookDao bookdao = new bookDaoImp();
				List<Book> list = bookdao.showAllBook();
	
				for (Book b : list) {
			%>

			<tbody>
				 <tr>
					<td><%=b.getId()%></td>
					<td><img src="../book/<%=b.getPhotoName()%>"
						style="width: 70px; height: 100px;"></td>
					<td><%=b.getTitle()%></td>
					<td><%=b.getAuthor() %></td>
					<td><%=b.getPrice() %></td>
					<td><%=b.getCategoryName()%></td>
					<td><%=b.getStatus()%></td>
					<td><%=b.getQuantity()%></td>
	
					<td><a href="EditBookDtl.jsp?id=<%=b.getId() %>" class="mini-btn a"><i class="fa-solid fa-pen-to-square"></i> Edit</a> <a
						href="../deleteBook?id=<%=b.getId() %>" class="mini-btn a"><i class="fa-solid fa-trash-can"></i> Delete</a></td>
				  </tr>
			</tbody>

			<%
				}
			%>
		</table>
	</section>

	<%@include file="footer.jsp"%>

</body>
</html>
