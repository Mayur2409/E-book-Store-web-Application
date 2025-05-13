package com.mkLib.Model;

public class OrderDetails {

	private int orderId;
    private String name;
    private String orderDate;
    private String address;
    private String bookName;
    
    
    public OrderDetails(int orderId, String name, String orderDate, String address, String bookName, String authorName,
			double price, String paymentType, String status) {
		super();
		this.orderId = orderId;
		this.name = name;
		this.orderDate = orderDate;
		this.address = address;
		this.bookName = bookName;
		this.authorName = authorName;
		this.price = price;
		this.paymentType = paymentType;
		this.status = status;
	}
    
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOrderDate() {
		String fullDateTime = orderDate;
		String dateOnly = fullDateTime.split(" ")[0];
	
		return dateOnly;
	}
	public void setOrderDate(String orderDate) {
		String fullDateTime = orderDate;
		String dateOnly = fullDateTime.split(" ")[0];
		this.orderDate = dateOnly;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getAuthorName() {
		return authorName;
	}
	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	private String authorName;
    private double price;
    private String paymentType;
    private String status;
	
	
}
