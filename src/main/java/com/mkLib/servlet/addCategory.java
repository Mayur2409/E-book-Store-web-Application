package com.mkLib.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;

import com.mkLib.Model.category;
import com.mkLib.dao.categoryDao;
import com.mkLib.dao.categoryDaoImp;

/**
 * Servlet implementation class addCategory
 */
public class addCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String category=request.getParameter("category");
		
		categoryDao catdao = new categoryDaoImp();
		
		if(catdao.addCategory(category)){
			
			
			System.out.println("book is added succesfully in addbook.java");
			
			response.sendRedirect("admin/AllCategory.jsp");
		
		}else {
			System.out.println("Some errors are occures so Category is not added in addbook.java");
			response.sendRedirect("admin/AllCategory.jsp?error='Category is not added.'");
		
		}
		
	}

}
