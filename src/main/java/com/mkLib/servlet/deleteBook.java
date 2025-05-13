package com.mkLib.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.mkLib.dao.bookDao;
import com.mkLib.dao.bookDaoImp;

/**
 * Servlet implementation class deleteBook
 */
public class deleteBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		bookDao bookdao = new bookDaoImp();
		if(bookdao.deleteBook(id)) {
			System.out.println("book is deleted succesfully");
			response.sendRedirect("admin/Allbooks.jsp?delete=1");
		}else {
			response.sendRedirect("admin/EditBookDtl.jsp?error=1");
		}
		
		
	}

}
