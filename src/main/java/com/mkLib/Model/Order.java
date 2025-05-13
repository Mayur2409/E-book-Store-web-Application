package com.mkLib.Model;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;

public class Order {
	private int order_id;
	private int user_id;
	private int address;
	private double total_price;
	private Timestamp order_Time;
	
	private String status;
	private String payment_type;
	
	
	
	
	@Override
	public String toString() {
		return "Order [order_id=" + order_id + ", user_id=" + user_id + ", address=" + address + ", total_price="
				+ total_price + ", order_Time=" + order_Time + ", status=" + status + ", payment_type=" + payment_type
				+ "]";
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getAddress() {
		return address;
	}
	public void setAddress(int address) {
		this.address = address;
	}
	public double getTotal_price() {
		return total_price;
	}
	public void setTotal_price(double total_price) {
		this.total_price = total_price;
	}
	public Timestamp getOrder_Time() {
		
		return order_Time;
	}
	public void setOrder_Time(Timestamp timestamp) {
		LocalDate dateOnly = timestamp.toLocalDateTime().toLocalDate();
	    LocalDateTime startOfDay = dateOnly.atStartOfDay();
	    this.order_Time = Timestamp.valueOf(startOfDay);
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	public String getPayment_type() {
		return payment_type;
	}
	public void setPayment_type(String payment_type) {
		this.payment_type = payment_type;
	}
	
	




}
