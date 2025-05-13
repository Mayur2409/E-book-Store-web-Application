package com.mkLib.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.mkLib.dao.bookDao;
import com.mkLib.dao.bookDaoImp;
import com.mkLib.dao.categoryDao;
import com.mkLib.dao.categoryDaoImp;

/**
 * Servlet implementation class deleteCategory
 */
public class deleteCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		categoryDao catedao = new categoryDaoImp();
		if(catedao.deleteCategory(id)) {
			System.out.println("book is deleted succesfully");
			response.sendRedirect("admin/AllCategory.jsp?delete=1");
		}else {
			response.sendRedirect("admin/AllCategory.jsp?error=1");
		}
		
		
	}

}
