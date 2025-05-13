package com.mkLib.dao;

import java.util.List;

import com.mkLib.Model.Order;
import com.mkLib.Model.OrderBooks;
import com.mkLib.Model.OrderDetails;
import com.mkLib.Model.User;
import com.mkLib.Model.userAllOrders;

public interface orderDao {

	boolean addOrder(User user, double totalPrice,String payment_type);

	boolean addOrderItems(User user);
	
	public Order getOrderDetails(int uid);
	
	public List<OrderDetails> getAllOrder();

	boolean changStatus(int oid, String status);
	
	public List<userAllOrders> getUserOrders(int user_id);
	
	public List<OrderBooks> getOrderBooks(int order_id);
	
	public boolean reduceBookQuantity(int bookId, int qty);
	
}
