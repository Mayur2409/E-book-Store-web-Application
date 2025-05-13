package com.mkLib.dao;

import java.util.List;

import com.mkLib.Model.cart;

public interface cartDao {

	
	boolean addToCart(cart c);
	
	List<cart> getBookbyUserId(int user_id);
	
	boolean removeBook (int book_Id,int user_id);
	
	boolean removeAllBooks(int user_id);
	
}
