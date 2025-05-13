  
   <%@page import="com.mkLib.Model.User"%>
<%
    	HttpSession s1 = request.getSession();
   		User user = (User)s1.getAttribute("userObj");
    	if( user != null && !("admin").equals(user.getName())){
    		
    	
    %>
  
  
    <!-- Navbar -->
    <nav class="nav">
        <div class="navbar">

            <div class="logo">
                <div class="icon">
                    <p>MKLibrary</p>
                </div>
            </div>
            <div class="menus">

                <ul>
                    <li><a href="home.jsp" >Home</a></li>
                    <li><a href="shop.jsp?cate=0" >Shop</a></li>
                    <li><a href="#login" >About</a></li>
                    <li><a href="../logoutServlet"><i class="fa-solid fa-arrow-right-from-bracket"></i> logout</a></li>
                    <li><a href="profile.jsp" class="cir"><i class="fa-regular fa-user"></i><span> <%=user.getName() %></span></a></li>
                    <li><a href="checkout.jsp" class="btn"><i class="fa-solid fa-cart-shopping"></i> Cart</a></li>
                </ul>
                
            </div>
        </div>
    </nav>

    <!-- Navbar -->
    
    <%
    	}else{
    		response.sendRedirect("../login.jsp");
    	}
    
    %>