package com.mkLib.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.mkLib.Model.Address;
import com.mkLib.Model.User;
import com.mkLib.dao.cartDao;
import com.mkLib.dao.cartDaoImp;
import com.mkLib.dao.orderDao;
import com.mkLib.dao.orderDaoImp;
import com.mkLib.dao.userDao;
import com.mkLib.dao.userDaoImp;

/**
 * Servlet implementation class orderServlet
 */
public class orderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession sessons = request.getSession();
		User user = (User)sessons.getAttribute("userObj");
		
		String name =request.getParameter("name");
		String payment_type= request.getParameter("payment_type");
		String mobileno =request.getParameter("mobileno");
		String street = request.getParameter("street");
		String landmark = request.getParameter("landmark");
		String state = request.getParameter("state");
		String city = request.getParameter("city");
		String country = request.getParameter("country");
		double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));
			
		if(!"cod".equals(payment_type) && !"online".equals(payment_type)){
			sessons.setAttribute("error", "Select the payment type");
			response.sendRedirect("user/checkout.jsp");
			return;
		}
		if( !mobileno.matches("^[6-9]\\d{9}$") ){
			sessons.setAttribute("error", "please enter correct mobile no");
			response.sendRedirect("user/checkout.jsp");
			return;
		}
		
		
		
		Address address = new Address(user.getUid(),street,landmark,state,city,country);
		System.out.println(address.toString()+"\n payment Type= "+payment_type);
		userDao userdao = new userDaoImp();
		
		if(userdao.addMobileNo(user.getUid(),mobileno)) {
			System.out.println("user mobile no is added");
		}else 
		{ 
			System.out.println("user mobile is not added");
		}
		
		cartDao cartdao = new cartDaoImp();
		
		if(userdao.addAddress(address)) {
			orderDao orderdao = new orderDaoImp();
			if(orderdao.addOrder(user,totalPrice,payment_type)) {
				if(orderdao.addOrderItems(user)) {
					
					if(cartdao.removeAllBooks(user.getUid())) {
						sessons.setAttribute("sucess","the order has been complited success fully ");
							
						
						response.sendRedirect("user/home.jsp");
					}
				}else {
					System.out.println("some error is occured in the orderServlet.java to store orderItems");
				}
			}else {
				System.out.println("some error is occured in the orderServlet.java to store order");
			}
			
		}else {
			System.out.println("some error is occured to store the address");
		}
		
		
	}
	

}
