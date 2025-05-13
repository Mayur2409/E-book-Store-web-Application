<%@page import="com.mkLib.dao.userDaoImp"%>
<%@page import="com.mkLib.dao.userDao"%>
<%@page import="com.mkLib.Model.Address"%>
<%@page import="com.mkLib.Model.cart"%>
<%@page import="java.util.List"%>
<%@page import="com.mkLib.dao.cartDaoImp"%>
<%@page import="com.mkLib.dao.cartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	
	<title>Checkout</title>
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
		    String msg = (String) session.getAttribute("msg");
		    String failed = (String) session.getAttribute("error");
		    session.removeAttribute("msg");
		    session.removeAttribute("error");
		%>
		
<% if (msg != null || failed != null) { %>
    <div id="toast"></div>

    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function () {
            function showToast(content) {
                let toast = document.getElementById("toast");
                toast.classList.add("display");
                toast.classList.add("success");
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




	<!-- Cart  -->
	
	
    <section class="full">
        <div class="container6 ">

            <div class="product-list">
                <h2>Your Cart</h2>
                <div class="product">
                    <table class="tab">
                        <tr>
                            <th class="w1 font-20">Book Name</th>
                            <th class="w1 font-20">Author </th>
                            <th class="w2 font-20">price </th>
                            <th class="w3 font-20">Action</th>
                        </tr>
                        
				<%
					HttpSession s3 = request.getSession();
					User u = (User)s3.getAttribute("userObj");
					cartDao cartdao = new cartDaoImp();
					List<cart> cart = cartdao.getBookbyUserId(u.getUid());
					double TotalPrice=0.0;
					for(cart c : cart){
					TotalPrice = c.getTotal_price();
				%>
				                        
                        <tr>
                            <td class="w1"><%=c.getBook_name() %></td>
                            <td class="w1"><%= c.getBook_author() %></td>
                            <td class="w2"><span> ₹ </span><%= c.getPrice() %></td>
                            <th class="w3 font-20"><a href="../deleteCartItem?bid=<%=c.getBook_id() %>&&uid=<%=c.getUser_id() %>" class="sbtn"><i class="fa-solid fa-xmark"></i></a> </th>

                        </tr>
                        
                        
                     <%} %>   
                    </table>
                </div>
                <h3 class="price s">Total: &nbsp; <span> ₹ </span> <%=TotalPrice %></h3>
            </div>

            <div class="user-details">
                <h2>Delivery Details</h2>
                <form action="../orderServlet" method="post">
				<%
					userDao udao = new userDaoImp();
					Address add = udao.getAddress(u.getUid());
					String mobileNo = udao.getMobileNo(u.getUid());	
					//int no=Integer.parseInt(mobileNo);
					if(add == null){
				%>
                
                    <div class="input-group">
							
                        <div class="g-left">
                        	<input type="hidden" name="totalPrice" value=<%=TotalPrice %>>
                            <label for="name">Name</label>
                            <input type="text" id="name" placeholder="Enter your name" required name="name" value=<%=u.getName() %>>
                            <label for="Email">mobile number</label>
                            <input type="number" id="name" placeholder="Enter your Mobile number" required name = "mobileno">
                            
                            <label for="name">Landmark</label>
                            <input type="text" id="name" placeholder="Enter your landmark" required name ="landmark">
                            <label for="name">State</label>
                            <input type="text" id="name" placeholder="Enter your state" required name="state">
                            
                        </div>
                        <div class="g-left">

                            <label for="name">Email</label>
                            <input type="email" id="name" placeholder="Enter your Email" required name="email" value=<%=u.getEmail() %>>
                            <label for="name">Address/Street</label>
                            <input type="text" id="name" placeholder="Enter your street" required name="street">
                                
                            <label for="name">City</label>
                            <input type="text" id="name" placeholder="Enter your City" required name="city"> 
                            <label for="name">Country</label>
                            <input type="text" id="name" name="country" required placeholder="Enter your Country">
                        </div>
                    </div>
          		<%}else{%>
          		
                    
                    <div class="input-group">
							
                        <div class="g-left">
                        	<input type="hidden" name="totalPrice" value=<%=TotalPrice %>>
                            <label for="name">Name</label>
                            <input type="text" id="name" placeholder="Enter your name" required name="name" value=<%=u.getName() %>>
                            <label for="Email">mobile number</label>
                            <input type="number" id="name" placeholder="Enter your Mobile number" required name = "mobileno" value=<%=mobileNo %>>
                            
                            <label for="name">Landmark</label>
                            <input type="text" id="name" placeholder="Enter your landmark" required name ="landmark" value="<%=add.getLandmark()%>">
                            <label for="name">State</label>
                            <input type="text" id="name" placeholder="Enter your state" required name="state"  value="<%=add.getState()%>">
                            
                        </div>
                        <div class="g-left">

                            <label for="name">Email</label>
                            <input type="email" id="name" placeholder="Enter your Email" required name="email" value=<%=u.getEmail() %>>
                            <label for="name">Address/Street</label>
                            <input type="text" id="name" placeholder="Enter your street" required name="street"  value="<%=add.getStreet()%>">
                                
                            <label for="name">City</label>
                            <input type="text" id="name" placeholder="Enter your City" required name="city" value="<%=add.getCity()%>"> 
                            <label for="name">Country</label>
                            <input type="text" id="name" name="country" required placeholder="Enter your Country"  value="<%=add.getCountry()%>">
                        </div>
                    </div>
                     
                     <%} %>
	                <div>
	                    <div class="opt">
	                        <label for="payment-mode" id="name">Payment mode</label>
	                        <select  id="select" name="payment_type">
	                            <option> --- Select mode --- </option>
	                            <option value="online" for="payment_type">Online</option>
	                            <option value="cod" for="payment_type">Cash on Delivery</option>
	                        </select>
	                    </div>
	               
	                        <button type="submit" class="large-btn">Place Order</button>
	                          
	                </div>
            </form>
            </div>

        </div>
    </section>
	
	
	
	<!-- Cart  -->





	<%@include file="footer.jsp"%>
</body>
</html>