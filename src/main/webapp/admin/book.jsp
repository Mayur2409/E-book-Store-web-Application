<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bookStyle.css">

</head>
<body>
	
	<%@include file="navbar.jsp" %>
 <main>
        <h2>Manage Books</h2>
        <form action="addBook" id="addBookForm" method="post">
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" required>
            <label for="author">Author:</label>
            <input type="text" id="author" name="author" required>
            <label for="category">Category:</label>
            <input type="text" id="category" name="category" required>
            <label for="quantity">Quantity:</label>
            <input type="number" id="quantity" name="quantity" required>
            <button type="submit">Add Book</button>
            
            <%
            	String msg = request.getParameter("msg");
            	String error = request.getParameter("error");
            	if(msg != null){ %>
            		
            		<p style="color:green;"><%=msg %></p>
            		<script type="text/javascript">
            			var message = "<%=msg%>";
            			alert(message);
            		</script>
            	<%}else if(error != null && error.equals("1")){%>
            			<p style="color:red;"> book is not added. </p>
            		<%} %>
            	
        </form>
        
        <div class="center">
        	<a href="Showbook.jsp" class="btn a">Show Books</a>
        </div>
                <!--  <h3>All Books</h3>
        <table id="booksTable">
            <thead>
                <tr>
                    <th>Book ID</th>
                    <th>Title</th>
                    <th>Author</th>
                    <th>Category</th>
                    <th>Quantity</th>
                </tr>
            </thead>
            <tbody>
                <!-- Dynamically populated -->
            <!--</tbody>
        </table>-->
    </main>
</body>

</html>
