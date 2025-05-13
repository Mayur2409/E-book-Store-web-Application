package com.mkLib.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.mkLib.Model.User;
import com.mkLib.dao.userDao;
import com.mkLib.dao.userDaoImp;


public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static userDao userDao = new userDaoImp();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username=request.getParameter("username");
		String password= request.getParameter("password");
		HttpSession session = request.getSession();
		User user = null;
		
		System.out.println("Login :- "+session.getAttribute("admin"));	
		
		if(username.equals("admin@gmail.com") && password.equals("admin@123")) {
//			System.out.println("not find the admin dashboard");
			
			user=new User();
			user.setName("admin");
			session.setAttribute("userObj", user);
			response.sendRedirect("admin/home.jsp");
			
		}else if(userDao.isValid(username,password)) {
			
			user= userDao.getUser(username,password);
			
			session.setAttribute("userObj", user);
			
			System.out.print("Login successfully...");
			
			response.sendRedirect("user/home.jsp");
			
		}else {
			response.sendRedirect("login.jsp?error=1");
			System.out.println("Error is back");
		}
		
	}

}
