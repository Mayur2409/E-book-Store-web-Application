<%@page import="com.mkLib.Model.User"%>
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
	<title>Shop</title>
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
		
		
		 %>
    			
		
        <!-- item 1 -->
        <div class="row1">
                
                <div class="box3">
                
                <%
        		String ch = request.getParameter("ch");
        		bookDao bookdao = new bookDaoImp();
        		List<Book> l1 = bookdao.getBookBySearch(ch);
        		for(Book b : l1){
            		 %> 
	                			
                		
		                <!-- item 1 -->
		                <div class="items-cart">
		              
								<div class="col1">
									<div class="product-img">
										<img src="../book/<%= b.getPhotoName() %>" alt="">
									</div>
									<div class="product-desc">
										<p><%= b.getTitle() %></p>
										<span>By <%= b.getAuthor() %> </span>
										<div class="product-price">
											<p>Items: <%= b.getQuantity() %></p>
											<p id="ru"> <span> ₹ </span><%= b.getPrice() %></p>
										</div>
		
									  <div class="cart">
										   <% if(b.getQuantity() >0) { %>
			                                <a href="../cartServlet?bid=<%=b.getId() %>&&uid=<%=u.getUid()%>" class="large-btn">ADD TO CART  <i class="fa-solid fa-cart-shopping trans"></i></a>
			                             	 <%} else{ %> <h3 style="color: #d00c0c;font-size: 20px;margin: 10px;">Not Available</h3>
											<%} %>
		                             	 <br>
		                             	  <a href="product-details.jsp?id=<%=b.getId()%>" class="large-btn">View Details</a>
		                             </div>
									</div>
								</div>
						
						</div>
	                <!--     -->
	                		<%  
	                		}
                	
                		%>	
                		
                
              
                
                
            </div>
                

            </div>
	<%@include file="footer.jsp"%>
</body>
</html>