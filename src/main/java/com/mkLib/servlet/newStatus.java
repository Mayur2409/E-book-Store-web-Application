package com.mkLib.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.mkLib.dao.orderDao;
import com.mkLib.dao.orderDaoImp;
import com.mysql.cj.Session;

/**
 * Servlet implementation class newStatus
 */
public class newStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String status = request.getParameter("staus");
		int oid = Integer.parseInt(request.getParameter("order_id"));
		
		System.out.println("New Status .java to change the status : "+status+" order id: "+oid);
		orderDao orderdao = new orderDaoImp();
		HttpSession s1 = request.getSession();
		if(orderdao.changStatus(oid,status)) {
			System.out.println("The order staus is changed;");
			s1.setAttribute("msg","Order Status is changed");	
			response.sendRedirect("admin/AllOrder.jsp");
		}else {

			s1.setAttribute("error","Order Status is changed");
			System.out.println("Some errors are occured.to change the order status. ");
			response.sendRedirect("admin/AllOrder.jsp");
		}
	}

}
