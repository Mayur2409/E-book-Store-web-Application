package com.mkLib.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

import com.mkLib.Model.Book;
import com.mkLib.dao.bookDao;
import com.mkLib.dao.bookDaoImp;

/**
 * Servlet implementation class addBook
 */

@MultipartConfig
public class addBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static bookDao bookdao = new bookDaoImp();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String title=request.getParameter("title");
		String author=request.getParameter("author");
		double price = Double.parseDouble(request.getParameter("price"));
//		double price = 120;
		int category = Integer.parseInt(request.getParameter("category"));
		String status = request.getParameter("status");
		Part part  = request.getPart("book_img");
		String fileName = part.getSubmittedFileName();
		int quantity =Integer.parseInt(request.getParameter("quantity"));
		int pages = Integer.parseInt(request.getParameter("pages"));
		String publisher = request.getParameter("publisher");
		String language = request.getParameter("language");
		
		Book book = new Book(title,author,price,category,fileName,status,quantity,pages,publisher, language);
		book.toString();
		System.out.println(book);
			
		
		if(bookdao.addBook(book)){
		
			String path = getServletContext().getRealPath("")+"book";
//			System.out.println("path is : "+ path);
			
			File file = new File(path);
			
			part.write(path+File.separator+fileName);

			
			System.out.println("book is added succesfully in addbook.java");
			
			response.sendRedirect("admin/AddBooks.jsp?book=sucess");
		
		}else {
			System.out.println("Some errors are occures so book is not added in addbook.java");
			response.sendRedirect("admin/AddBook.jsp?error='book is not added.'");
		}
		
		
		
		
	}

}
