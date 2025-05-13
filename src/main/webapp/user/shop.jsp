<%@page import="com.mysql.cj.Session"%>
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
	
	<!-- <section>
		<div class="container7">
			
			<a href="cart.jsp" > <i class="fa-solid fa-cart-shopping"></i> Cart</a>
			
		</div>
		
	</section>
	  -->
	  <%
	  		HttpSession s = request.getSession();
	  		User u  = (User)s.getAttribute("userObj");
	  %>
			 <%
		    String msg = (String) session.getAttribute("addCart");
		    String failed = (String) session.getAttribute("failed");
		
		    session.removeAttribute("addCart");
		    session.removeAttribute("failed");
		%>
		
<% if (msg != null || failed != null) { %>
    <div id="toast"></div>

    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function () {
            function showToast(content) {
                let toast = document.getElementById("toast");
                toast.classList.add("display");
                toast.innerHTML = content;

                setTimeout(() => {
                    toast.classList.remove("display");
                }, 2000);
            }

            let message = "<%= msg != null ? msg : failed %>"; // Get the dynamic message
            showToast(message);
        });
    </script>
<% } %>

	

	 
	 <section>
	 <div class="cen">
	 	<form action="searchBook.jsp" class="search-form" role="search" aria-label="Search user orders">
	     	  <input type="search" name="ch" id="order-search" placeholder="Search Books..." aria-describedby="search-desc" />
	    	  <button type="submit" aria-label="Search orders">Search</button>
	    </form>
	 </div>	
	
	 	
        <div class="container3">
	 <!-- category items -->
					
						<%@include file="categoryBar.jsp" %>

                    <!-- category items -->
            <div class="row1">
                <div class="sec-header">
                    <div class="title2">
                    <%	
                    	String name = request.getParameter("name");
                    	System.out.println("string name: "+name);
                    	if(name == null || name.isEmpty()){
                    %>
                                       
                       <h2>All Books</h2>
					<%}else{ %>
							<h2><%=name %></h2>
						<%} %>
                    </div>
                </div>
                <div class="box3">
                
                <%
                	String cat = request.getParameter("cate");
                	if(cat.equals("0")){
	                	bookDao bookdao = new bookDaoImp();
	                	List<Book> l1 = bookdao.showAllBook();
	                	for(Book b : l1){
	                		if(b.getStatus().equals("active") ){ %>
	                			
                		
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
	                		<%  	}
	                		}
                	}else{
	                		System.out.println("category is selected : "+ cat );
	                		int c = Integer.parseInt(cat);
	                		bookDao bookdao2 = new bookDaoImp();
	                    	List<Book> ls = bookdao2.showCategoryBook(c);
	                    	for(Book b : ls){
	                    		if(b.getStatus().equals("active") ){
	                		
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
										  	<% if(b.getQuantity() > 0) { %>
											    <a href="../cartServlet?bid=<%=b.getId() %>&&uid=<%=u.getUid()%>" class="large-btn">ADD TO CART  <i class="fa-solid fa-cart-shopping trans"></i></a>
											<% }else{ %> <h3 style="color: #d00c0c;font-size: 20px;margin: 10px;">Not Available</h3>
											<%} %>
                             	<br>
		                           <a href="product-details.jsp?id=<%=b.getId() %>" class="large-btn">View Details</a>
                             </div>
							</div>
						</div>
				
					</div>
                <!--     -->
                		
               <%			}
	                    }
                   } %>
                
                
            </div>
                

            </div>
            <!--  <div class="row2">
                <div class="link">
                    <a href="#" class="trans">View All Product  <i class="fa-solid fa-arrow-right trans"></i></a>
                </div>
            </div>-->

        </div>

    </section>

    <!-- book cart -->

	


	<%@include file="footer.jsp"%>
</body>
</html>