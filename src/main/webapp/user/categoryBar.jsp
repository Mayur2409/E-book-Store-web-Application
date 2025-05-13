<%@page import="com.mkLib.Model.category"%>
<%@page import="com.mkLib.dao.bookDaoImp"%>
<%@page import="java.util.List"%>
<%@page import="com.mkLib.dao.bookDao"%>
<div class="row0">
	<div class="links">
		<ul>
			<li><a href="shop.jsp?cate=0">All Books</a></li>

			<%
				bookDao bookdao1 = new bookDaoImp();
				List<category> l2 = bookdao1.showAllCategory();
	
				for (category c : l2) {
			%>
			<li><a href="shop.jsp?cate=<%=c.getId()%>&name=<%=c.getCategory_name()%>"><%=c.getCategory_name()%></a></li>

			<%} %>
		</ul>
	</div>
</div>