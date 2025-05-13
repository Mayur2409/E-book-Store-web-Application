package com.mkLib.Model;

public class Order_items {

	private int order_items_id;
	private int order_id;
	private int book_id;
	private int price;
	public int getOrder_items_id() {
		return order_items_id;
	}
	public void setOrder_items_id(int order_items_id) {
		this.order_items_id = order_items_id;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "Order_items [order_items_id=" + order_items_id + ", order_id=" + order_id + ", book_id=" + book_id
				+ ", price=" + price + "]";
	}
	
	
	
}
