package com.mkLib.DB;

public class Query {
	public static String insert = "insert into user(username,email,password) values (?,?,?)";
	public static String select = "select username from user where username=? AND password=?";
	public static String addBook = "insert into book(book_name,author,price,category_id,status,photo,quantity,pages,publisher,language)values(?,?,?,?,?,?,?,?,?,?)";
	public static String addAddress = "insert into address(user_id,street,landmark,city,state,country) values(?,?,?,?,?,?)";
}
