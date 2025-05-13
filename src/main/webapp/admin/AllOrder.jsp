<%@page import="com.mkLib.Model.OrderDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.mkLib.dao.orderDaoImp"%>
<%@page import="com.mkLib.dao.orderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

</head>
<body>

	<%@include file="navbar.jsp"%>
	
	<div id="toast"></div>
<%  
	HttpSession s12= request.getSession();
	String msg = (String)s12.getAttribute("msg");
	String error = (String)s12.getAttribute("error");
    session.removeAttribute("msg");
    session.removeAttribute("error");
    %>
	<% if (msg != null || error != null) { %>
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

            let message = "<%= msg != null ? msg : error %>"; // Get the dynamic message
            showToast(message);
        });
    </script>
<% } %>


	
	<section class="center">

		<h3>All Books</h3>
		<table id="booksTable">
			<thead>
			
				<tr>
					<th>Order ID</th>
					<th>User Id</th>
					<!--  <th>Email</th>-->
					<th>Order Date</th>
					<th>Address</th>
					<th>Book name</th>
					<th>Author name</th>
					<th>Price</th>
					<th>Payment type</th>
					<th>Status</th>
					<th>Save</th>
				</tr>
			</thead>
			<tbody>
			
			
			
			
			<%
				orderDao orderdo = new orderDaoImp();
				List<OrderDetails> orders=orderdo.getAllOrder();
				
				for(OrderDetails dtl: orders){
					if(dtl.getStatus() != "pendding"){
						
					
			%>
			
				<tr>
					<td><%= dtl.getOrderId() %></td>
					<td><%= dtl.getName() %></td>
					<td><%= dtl.getOrderDate() %></td>
					<td><%= dtl.getAddress() %></td>
					<td><%= dtl.getBookName() %></td>
					<td><%= dtl.getAuthorName()%></td>
					<td><%= dtl.getPrice()%></td>
					<td><%= dtl.getPaymentType()%></td>
					<form action="../newStatus" method="post">
							<input type="hidden" name="order_id" value="<%=dtl.getOrderId() %>">
						<td><input type="text" name="staus" value="<%= dtl.getStatus()%>" class="rBord"></td>
						
						<td><button type="submit" class="Sbtn"><i class="fa-solid fa-floppy-disk"></i></button></td>
					</form>
				</tr>
				
				<%	}
					}
					%>

			</tbody>
		</table>
	</section>


	<%@include file="footer.jsp" %>
</body>
</html>
