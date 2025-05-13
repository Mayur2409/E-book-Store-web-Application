<%@page import="com.mkLib.Model.Book"%>
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

	<section class="center">
			<%
					String sucess = request.getParameter("book");
					if(sucess != null && sucess.equals("sucess")){
						sucess="Category is edited successfully";
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
				
		<h3>All Categories</h3>
		
		
		<table id="booksTable">
			<thead>
				<tr>
					<th>Category ID</th>
					<th>Category name</th>
					<th>Action</th>
				</tr>
			</thead>

			<%
				bookDao bookdao = new bookDaoImp();
				List<category> ls = bookdao.showAllCategory();
				
				for(category c : ls){
			%>

			<tbody>
				 <tr>
					<td ><%=c.getId()%></td>
					<td><%=c.getCategory_name() %></td>
		
					<td style="padding:15px 5px;">
						<a href="EditCategory.jsp?id=<%=c.getId() %>&category=<%=c.getCategory_name() %>" class="mini-btn a"><i class="fa-solid fa-pen-to-square"></i> Edit</a> <a
						href="../deleteCategory?id=<%=c.getId() %>" class="mini-btn a"><i class="fa-solid fa-trash-can"></i> Delete</a></td>
				  </tr> 
			</tbody>

			<%
				}
			%>
		</table>
		<div style="text-align: right; margin: 0px 5px 15px 0px;"> 
			<a href="AddCategory.jsp" class="mini-btn" style="text-decoration: none;"><i class="fa-solid fa-plus"></i>Add Category</a>
		</div>
	</section>


	<%@include file="footer.jsp"%>

</body>
</html>
