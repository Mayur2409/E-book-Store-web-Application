package com.mkLib.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.mkLib.dao.categoryDao;
import com.mkLib.dao.categoryDaoImp;


public class editCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int id = Integer.parseInt(request.getParameter("id"));
		String category = request.getParameter("category");
		
		categoryDao catedao = new categoryDaoImp();
		if(catedao.editCategory(id, category)) {
			response.sendRedirect("admin/AllCategory.jsp?book=sucess");
		}else {
			response.sendRedirect("admin/AllCategory.jsp?error='Category is not added.'");
		}
	
	}

}
