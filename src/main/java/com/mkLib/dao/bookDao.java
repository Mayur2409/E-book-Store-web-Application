package com.mkLib.dao;

import java.util.List;

import com.mkLib.Model.Book;
import com.mkLib.Model.category;

public interface bookDao {

	boolean addBook(Book book);
	
	List <category> showAllCategory();
	
	List<Book> showAllBook();
	
	Book getBookDelails(int id);

	boolean UpdateEditBookDtl(Book b);

	boolean deleteBook(int id);
	
	List<Book> getNewBook();
	
	List<Book> showCategoryBook(int categoryId);
	
	List<Book> getBookBySearch(String ch);
	

}
