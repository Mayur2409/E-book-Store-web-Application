<%@page import="com.mkLib.Model.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.mkLib.dao.bookDaoImp"%>
<%@page import="com.mkLib.dao.bookDao"%>
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

	<!-- other home page designs -->

	<!--slider  -->
	<section>
		<div class="banner">
			<div class="container bg-img">

				<div class="con-left">
					<div class="title">
						<h2>Life of the Wild</h2>

						<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit.
							Amet saepe neque, debitis quidem fugiat sit blanditiis nesciunt
							nostrum possimus quod non illo incidunt labore? Rem voluptatibus
							hic eius sint obcaecati.</p>

						<a href="#read" class="btn">read more <i
							class="fa-solid fa-arrow-right trans"></i></a>
					</div>
				</div>
				<div class="con-right">
					<div class="img">
						<img src="../img/main-banner1.jpg" alt="">
					</div>
				</div>
			</div>

		</div>

	</section>


	<!--slider  -->


	<!--  -->

	<section>

		<div class="container2">
			<div class="box2">
				<img src="../img/client-image1.png" alt=""> 
				<img src="../img/client-image2.png" alt=""> 
				<img src="../img/client-image3.png" alt=""> 
				<img src="../img/client-image4.png" alt=""> 
				<img src="../img/client-image5.png" alt="">
			</div>
		</div>

	</section>



	<!--  -->

	<!-- book cart -->

	<section>
		<div class="container3">
			<div class="row1">
				<div class="sec-header">
					<div class="title1">
						<p>Some quality items</p>
					</div>
					<div class="title2">
						<h2>Featured Books</h2>
					</div>
				</div>
				<div class="box3">
				
				<%
					bookDao bookdao = new bookDaoImp();
				 	List<Book> bookDtl = bookdao.getNewBook();
				 					
					for(Book b: bookDtl){
				%>	
					
					
					<!-- item 1 -->
				
					<div class="items-cart">
						<div class="col1">
							<div class="product-img">
								<img src="../book/<%= b.getPhotoName() %>" alt="">
							</div>
							<div class="product-desc">
								<p><%= b.getTitle() %></p>
								<span><%= b.getAuthor() %> </span>
								<div class="product-price">
									<p id="ru"> <span> ₹ </span><%= b.getPrice() %></p></div>

							</div>
						</div>
					</div>
					<!--  -->
					
					<%} %>

				</div>


			</div>
			<div class="row2">
				<div class="link">
					<a href="shop.jsp?cate=0&name=null" class="trans">View All Product <i
						class="fa-solid fa-arrow-right trans"></i></a>
				</div>
			</div>

		</div>

	</section>

	<!-- book cart -->


	<!-- other homepage designs -->








	<%@include file="footer.jsp"%>
</body>
</html>