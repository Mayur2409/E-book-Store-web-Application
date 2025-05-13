package com.mkLib.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.mkLib.dao.cartDao;
import com.mkLib.dao.cartDaoImp;


public class deleteCartItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Delete cart item Servlet");
		cartDao cartdao = new cartDaoImp();
		int book_id = Integer.parseInt(request.getParameter("bid"));
		int user_id= Integer.parseInt(request.getParameter("uid"));
		HttpSession s4 = request.getSession();
		if(cartdao.removeBook(book_id,user_id)) {
			
			s4.setAttribute("msg", "book is removed successfully.");
			response.sendRedirect("user/checkout.jsp");
		}else {
			s4.setAttribute("error", "some error is occured.");
			response.sendRedirect("user/checkout.jsp");
		}
				
		
	}

	

}
