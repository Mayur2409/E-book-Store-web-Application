package com.mkLib.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.mkLib.Model.Book;
import com.mkLib.Model.User;
import com.mkLib.Model.cart;
import com.mkLib.dao.bookDao;
import com.mkLib.dao.bookDaoImp;
import com.mkLib.dao.cartDao;
import com.mkLib.dao.cartDaoImp;



public class cartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int uid = Integer.parseInt(request.getParameter("uid"));
		int bid = Integer.parseInt(request.getParameter("bid"));
		
		HttpSession s = request.getSession();		
		User u = (User)s.getAttribute("userObj");
		
		bookDao bdao = new bookDaoImp();		
		Book b = bdao.getBookDelails(bid);
		
		cart c = new cart(u.getUid(),b.getId(),b.getTitle(),b.getAuthor(),b.getPrice());
		
		
		cartDao cartdao = new cartDaoImp();

		
		if(cartdao.addToCart(c)) {
			s.setAttribute("addCart", "Book is added Successfully.");
			 
			response.sendRedirect("user/shop.jsp?cate=0");
		}else {
			s.setAttribute("failed", "Something went wrong."); 
			 
			response.sendRedirect("user/shop.jsp?cate=0");
		}
		
	}


}
