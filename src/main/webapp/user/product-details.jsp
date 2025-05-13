<%@page import="com.mkLib.Model.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.mkLib.dao.bookDaoImp"%>
<%@page import="com.mkLib.dao.bookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Product-details</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../userCss/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

</head>
<body>

<%@include file="navbar.jsp"%>

<% 
	HttpSession s = request.getSession();
	User u  = (User)s.getAttribute("userObj");
	int catId= Integer.parseInt(request.getParameter("id"));
	System.out.println("cateIg "+catId);
	bookDao bookdao = new bookDaoImp();
	Book b = new Book();
	b = bookdao.getBookDelails(catId);
	b.toString();
%>

 <div class="prodBox">
    <div class="product-container">
        <div class="product-image">
            <img src="../book/<%=b.getPhotoName()%>" >
        </div>
        <div class="product-details">
            <h2><%= b.getTitle() %></h2>

            <p class="description">
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi voluptatum ipsa obcaecati pariatur sit tempore explicabo in odio, doloribus ea. Dolores repellat non laudantium vel eos maxime magnam, rem amet!
            </p>
        

            <table class="tab">
                <tr>

                    <th>Author</th>
                    <td><%=b.getAuthor() %></td>
                </tr>
                <tr>
                    <th>publisher</th>
                    <td><%=b.getPublisher() %></td>
                </tr>
                <tr>
                    <th>Language</th>
                    <td><%=b.getLanguage() %></td>
                </tr>
                <tr>
                    <th>Page</th>
                    <td><%=b.getPages() %> pg.</td>
                </tr>
            </table>

            <p class="price"><span> ₹ </span><%=b.getPrice() %></p>
           
            <div class="links">
                <a href="../cartServlet?bid=<%=b.getId() %>&&uid=<%=u.getUid()%>" class="add-to-cart large-btn">Add to Cart</a>
            </div>
        </div>
    </div>
</div>

<hr>
<%@include file="footer.jsp"%>

</body>
</html>