<%@page import="com.mkLib.Model.OrderBooks"%>
<%@page import="com.mkLib.Model.userAllOrders"%>
<%@page import="com.mkLib.Model.Order"%>
<%@page import="com.mkLib.Model.OrderDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.mkLib.dao.orderDaoImp"%>
<%@page import="com.mkLib.dao.orderDao"%>
<%@page import="com.mkLib.Model.Address"%>
<%@page import="com.mkLib.dao.userDaoImp"%>
<%@page import="com.mkLib.dao.userDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
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
            HttpSession s9 = request.getSession();
       		User u1 = (User)s1.getAttribute("userObj");
            
            
          
				           userDao userdao = new userDaoImp();
        					Address address = userdao.getAddress(u1.getUid());  
        					String add = address.toString();
        					String mobile_no=userdao.getMobileNo(u1.getUid());
            %>
	
	
<!-- profile -->


  <section class="profile-container" aria-label="User Profile">
    <h1 class="heading2">User Profile</h1>
    <section class="user-info" aria-labelledby="userinfo-title">
      <div><span class="label11">Username:</span><span class="data" id="username"><%=u1.getName() %></span></div>
      <div><span class="label11">Email:</span><span class="data" id="email"><%=u1.getEmail() %></span></div>
     
		<% if (mobile_no != null){ %>	
		<div><span class="label11">phone no:</span><span class="data" id="email"><%=mobile_no%></span></div>
      <%} %>
      <div><span class="label11">Address:</span><span class="data" id="address"><%=add %></span></div>
    </section>



    <section class="order-history" aria-labelledby="orders-title">
      <h2 id="orders-title">Order History</h2>
      <ul class="orders-list" id="orders-list">
      
      <%
      	int uid = u1.getUid();
      		orderDao orderdao = new orderDaoImp();
      		List<userAllOrders> orders = orderdao.getUserOrders(uid);
      		
      		for(userAllOrders o: orders){
      
      
      %>
      
        <li>
          <div class="order-header">
            <span>Order #<%=o.getOrder_id() %></span>
            <span><%=new java.text.SimpleDateFormat("dd-MM-yyyy").format(o.getOrder_date()) %></span>
          </div>
          <ul class="ordered-books">
          	 <%
          	 	List<OrderBooks> book = orderdao.getOrderBooks(o.getOrder_id());
          	 	for(OrderBooks b: book){
          	 %>
            <li class="space-f"><%=b.getOrder_item_id() %> - "<%=b.getBook_name() %>" by <%=b.getBook_author() %> <span class="Lprice col-brown">$<%=b.getPrice() %> </span></li>
           		 <%} %>
          </ul>
          <div>
          	<div class="space-f">
            <p class="TPrice">Payment Type :<%=o.getPayment_type() %> </p>
            <p class="TPrice">Total : <span class="col-brown">$<%=o.getTotal_price() %></span></p>
            </div>
            <p class="staus col-brown">Status : <%=o.getStatus() %></p>
          </div>
        </li>

        <%} %>
        

        
      </ul>
    </section>
  </section>


<!-- profile -->


	
	
	
	
	
	

	<%@include file="footer.jsp"%>
</body>
</html>