package com.mkLib.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import com.mkLib.Model.Address;
import com.mkLib.Model.Order;
import com.mkLib.Model.OrderBooks;
import com.mkLib.Model.OrderDetails;
import com.mkLib.Model.User;
import com.mkLib.Model.cart;
import com.mkLib.Model.userAllOrders;
import com.mkLib.Util.DBUtils;

public class orderDaoImp implements orderDao {

	@Override
	public boolean addOrder(User user,double totalPrice,String payment_type) {
		
		int uid = user.getUid();
		
		userDao userdao = new userDaoImp();
		Address address = userdao.getAddress(uid);
		
		
		String query = "insert into `Order`(user_id, total_price,address,payment_type) values(?,?,?,?)";
		
		try(Connection conn = DBUtils.getConnection();
				PreparedStatement pst = conn.prepareStatement(query)){
			
			pst.setInt(1, uid);
			pst.setDouble(2, totalPrice);
			pst.setInt(3, address.getAddress_id());
			pst.setString(4, payment_type);
			
			int row= pst.executeUpdate();
			
			return row>0;
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println();
		}
		
		return false;
	}

	@Override
	public boolean addOrderItems(User user) {
		
		String query ="insert into order_items(order_id,book_id,price) values(?,?,?)";
		int uid = user.getUid();
		cartDao cartdao = new cartDaoImp();
		Order order=getOrderDetails(uid);
		
		int orderId= order.getOrder_id();
		List<cart> ls = cartdao.getBookbyUserId(uid);
		
		try(Connection conn = DBUtils.getConnection();
				PreparedStatement pst = conn.prepareStatement(query)){
			
			for(cart book:ls) {
				pst.setInt(1,orderId);
				pst.setInt(2,book.getBook_id());
				pst.setDouble(3,book.getPrice());
				pst.addBatch();
			}
			
			int[] row = pst.executeBatch();
			for(cart book:ls) {
				if(reduceBookQuantity(book.getBook_id(), 1)) {
					System.out.println("Book is reduce in the table");
				}
			}
			
			for (int i = 0; i < row.length; i++) {
			    if (row[i] != 1) {
			        System.err.println("Batch insert failed at index " + i + ": " + row[i]);
			        return false;
			    }
			}
			return true;
			
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		
	}

	public Order getOrderDetails(int uid) {
		// TODO Auto-generated method stub
		
		String query="select * from `Order` where user_id =?";
		Order order = null;
		
		try(Connection conn = DBUtils.getConnection();
				PreparedStatement pst = conn.prepareStatement(query)){
			
			pst.setInt(1, uid);
			
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				order = new Order();
				order.setOrder_id(rs.getInt("order_id"));
				order.setUser_id(rs.getInt("user_id"));
				order.setTotal_price(rs.getDouble("total_price"));
				order.setStatus(rs.getString("status"));
				order.setAddress(rs.getInt("address"));
				
			}
			return order;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
	}

	@Override
	public List<OrderDetails> getAllOrder() {
		
		List<OrderDetails> orders = new ArrayList<>() ;
	
		String query = "SELECT o.order_id, u.username AS name, o.order_time AS order_date, " +
                "CONCAT(a.street, ', ', a.city, ', ', COALESCE(a.state, ''), ' ', ', ', a.country) AS address, " +
                "b.book_name, b.author AS author_name, oi.price, o.payment_type, o.status " +
                "FROM `order` o " +
                "JOIN user u ON o.user_id = u.user_id " +
                "LEFT JOIN address a ON o.address = a.address_id " +
                "JOIN order_items oi ON o.order_id = oi.order_id " +
                "JOIN book b ON oi.book_id = b.book_id " +
                "ORDER BY o.order_id DESC, b.book_name";
		
		
		try(Connection conn = DBUtils.getConnection();
				PreparedStatement pst = conn.prepareStatement(query)) {
			
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				orders.add(new OrderDetails(rs.getInt("order_id"),
	                    rs.getString("name"),
	                    rs.getString("order_date"),
	                    rs.getString("address") != null ? rs.getString("address") : "No address provided",
	                    rs.getString("book_name"),
	                    rs.getString("author_name"),
	                    rs.getDouble("price"),
	                    rs.getString("payment_type") != null ? rs.getString("payment_type") : "Unknown",
	                    rs.getString("status")
						));
				System.out.println("Data is in the OrderDetails ");
			}
			
			return orders;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public boolean changStatus(int oid, String status) {
			
		String qurey = "update `Order`set status=? where order_id=?";
		try(Connection conn = DBUtils.getConnection();
				PreparedStatement pst = conn.prepareStatement(qurey)){
			
			pst.setString(1, status);
			pst.setInt(2, oid);
			
			int row =pst.executeUpdate();
			
			return row>0;
			
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	
	}

	@Override
	public List<userAllOrders> getUserOrders(int user_id) {

		String query ="select * from `order` where user_id =? "
				+ "order by "
				+ "order_id DESC ";
	    List<userAllOrders> userOrder = new ArrayList<>();

	    try (Connection conn = DBUtils.getConnection();
	         PreparedStatement pst = conn.prepareStatement(query)) {

	        pst.setInt(1, user_id);
	        ResultSet rs = pst.executeQuery();

	        while (rs.next()) {
	            userAllOrders orders = new userAllOrders();
	            orders.setOrder_id(rs.getInt("order_id"));
	            orders.setOrder_date(rs.getTimestamp("order_time")); 
	            orders.setTotal_price(rs.getDouble("total_price")); 
	            orders.setPayment_type(rs.getString("payment_type"));
	            orders.setStatus(rs.getString("status"));

	            userOrder.add(orders);
	        }

	    } catch (Exception e) {
	    	System.out.println("Some error is ocuuerd to show the user order details");
	        e.printStackTrace();
	    }

	    return userOrder;
	}


	@Override
	public List<OrderBooks> getOrderBooks(int order_id) {
		// TODO Auto-generated method stub
		String query = "SELECT "
		        + " o.order_id, "
		        + " oi.order_item_id, "
		        + " b.book_name, "
		        + " b.author AS author_name, "
		        + " b.price "
		        + "FROM `Order` o "
		        + "JOIN user u ON o.user_id = u.user_id "
		        + "JOIN order_items oi ON o.order_id = oi.order_id "
		        + "JOIN book b ON oi.book_id = b.book_id "
		        + "WHERE oi.order_id = ?";

		
		
		List<OrderBooks> orderBook = new ArrayList<>();
		OrderBooks book = null;
		try(Connection conn= DBUtils.getConnection();
				PreparedStatement pst = conn.prepareStatement(query)){
		
			pst.setInt(1, order_id);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				book=new OrderBooks();
				book.setOrder_id(rs.getInt("order_id"));
				book.setOrder_item_id(rs.getInt("order_item_id"));
				book.setBook_name(rs.getString("book_name"));
				book.setBook_author(rs.getString("author_name"));
				book.setPrice(rs.getDouble("price"));
				
				orderBook.add(book);
				
			}
			return orderBook;
		}catch(Exception e) {
			e.printStackTrace();
		
		}
		
		
		return null;
	}

	@Override
	public boolean reduceBookQuantity(int bookId, int qty) {
		
		    String query = "UPDATE book SET quantity = quantity - ? WHERE book_id = ? AND quantity >= ?";
		    try (Connection conn = DBUtils.getConnection();
		         PreparedStatement pst = conn.prepareStatement(query)) {
		         
		        pst.setInt(1, qty);
		        pst.setInt(2, bookId);
		        pst.setInt(3, qty);

		        int updated = pst.executeUpdate();
		        return updated > 0;

		    } catch (Exception e) {
		        e.printStackTrace();
		        return false;
		    }
		

	}

	
}
