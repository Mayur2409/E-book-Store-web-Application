package com.mkLib.dao;

public interface categoryDao {

	 boolean addCategory(String category);

	boolean editCategory(int id, String category);
	
	boolean deleteCategory(int id);
}
