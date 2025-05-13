package com.mkLib.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.mkLib.dao.userDao;
import com.mkLib.dao.userDaoImp;


public class registrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private static userDao userDao = new userDaoImp(); 
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		
		
		if(userDao.adduser(username,email,password)) {
			response.sendRedirect("login.jsp?registration=success");
		}else {
			response.sendRedirect("signup.jsp?error=1");
		}
		
		
//		System.out.println("username: "+username+"\nemail: "+email+"\npassword: "+password);
	}

}
