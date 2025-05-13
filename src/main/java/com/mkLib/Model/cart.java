package com.mkLib.Model;

import java.sql.Time;

public class cart {

	private int cart_id;
	private int user_id;
	private int book_id;
	private String book_name;
	private String book_author;
	private double price;
	private double total_price;
	private String time;
	
	
	

	
	public cart(int uid, int id, String title, String author, double price2) {
		this.user_id = uid;
		this.book_id = id;
		this.book_name = title;
		this.book_author = author;
		this.price = price2;
	}
	public cart() {
		// TODO Auto-generated constructor stub
	}
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getBook_author() {
		return book_author;
	}
	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getTotal_price() {
		return total_price;
	}
	public void setTotal_price(double total_price) {
		this.total_price = total_price;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	
	@Override
	public String toString() {
		return "cart [cart_id=" + cart_id + ", user_id=" + user_id + ", book_id=" + book_id + ", book_name=" + book_name
				+ ", book_author=" + book_author + ", price=" + price + ", total_price=" + total_price + ", time="
				+ time + "]";
	}
	
}
