package com.mkLib.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.mkLib.Model.Book;
import com.mkLib.dao.bookDao;
import com.mkLib.dao.bookDaoImp;

/**
 * Servlet implementation class editBook
 */
public class editBook extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("bid"));
		String title = request.getParameter("btitle");
		String author = request.getParameter("bauthor");
		int category = Integer.parseInt(request.getParameter("bcategory"));
		double price = Double.parseDouble(request.getParameter("bprice"));
		int quantity = Integer.parseInt(request.getParameter("bquantity"));
		String status = request.getParameter("bstatus");
		int pages = Integer.parseInt(request.getParameter("bpages"));
		String publisher = request.getParameter("bpublisher");
		String language = request.getParameter("blanguage");
		System.out.println("status: "+status);
		Book b = new Book();
		b.setTitle(title);
		b.setAuthor(author);
		b.setCategoryId(category);
		b.setPrice(price);
		b.setQuantity(quantity);
		b.setStatus(status);
		b.setId(id);
		b.setPages(pages);
		b.setPublisher(publisher);
		b.setLanguage(language);
		
		System.out.println("editbook.java: " + b.toString());
		bookDao bookdao = new bookDaoImp();
		if (bookdao.UpdateEditBookDtl(b)) {
			System.out.println("book is edited succesfully");
			response.sendRedirect("admin/Allbooks.jsp?book=sucess");
		}else {
			response.sendRedirect("admin/EditBookDtl.jsp?error=1");
		}

	}

}
