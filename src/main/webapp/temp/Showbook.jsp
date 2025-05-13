<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bookStyle.css">

</head>
<body>
	
	<%@include file="navbar.jsp" %>
 <main>
  <h3>All Books</h3>
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
            </tbody>
        </table>
    </main>
    <footer>
        <%@include file="footer.jsp" %>
    </footer>
</body>

</html>
 