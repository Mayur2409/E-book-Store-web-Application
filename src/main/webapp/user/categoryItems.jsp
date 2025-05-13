<%@page import="com.mkLib.Model.category"%>
<%@page import="com.mkLib.Model.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.mkLib.dao.bookDaoImp"%>
<%@page import="com.mkLib.dao.bookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	
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
	
	 <section>
        <div class="container3">
            <div class="row1">
                <div class="sec-header">
                    <!-- category items -->
						
					


                    <!-- category items -->
                                        
                    
                    <div class="title2">
                       <h2>All Books</h2>
                    </div>
                </div>
                <div class="box3">
                
                <%
                
	                HttpSession s = request.getSession();
	    	  		User u  = (User)s.getAttribute("userObj");
                
                	bookDao bookdao = new bookDaoImp();
                	List<Book> l1 = bookdao.showAllBook();
                	for(Book b : l1){
                		if(b.getStatus().equals("active")){ %>
                			
                		
                <!-- item 1 -->
                <div class="items-cart">
                <a href="product-details.jsp">
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
                                <a href="../cartServlet?bid=<%=b.getId() %>&&uid=<%=u.getUid()%>" class="large-btn">ADD TO CART  <i class="fa-solid fa-cart-shopping trans"></i></a>
                             </div>
							</div>
						</div>
					</a>
					</div>
                <!--     -->
                		<%  }
                	}
                
                %>
                
                
            </div>
                

            </div>
         
        </div>

    </section>

    <!-- book cart -->

	


	<%@include file="footer.jsp"%>
</body>
</html>