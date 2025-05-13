package com.mkLib.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mkLib.Model.cart;
import com.mkLib.Util.DBUtils;

public class cartDaoImp implements cartDao {

	@Override
	public boolean addToCart(cart c) {
	
		String Query = "insert into cart(user_id,book_id,book_name,book_author,price)values(?,?,?,?,?)";
		
		try(Connection conn = DBUtils.getConnection();
				PreparedStatement pst = conn.prepareStatement(Query);) {
			
			pst.setInt(1, c.getUser_id());
			pst.setInt(2, c.getBook_id());
			pst.setString(3, c.getBook_name());
			pst.setString(4, c.getBook_author());
			pst.setDouble(5, c.getPrice());

			int row = pst.executeUpdate();
			if(row>0) {
				System.out.println("cart is added one book");
				return true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("Some error is ouccred at the adding the cart items.");
			return false;
		}
		
		return false;
	}

	@Override
	public List<cart> getBookbyUserId(int user_id) {
		List<cart> ls = new ArrayList<>();
			
		cart c = null;
		double totalPrice=0.00;
		
		String Query = "select * from cart where user_id=?";
		
		try(Connection conn = DBUtils.getConnection();
				PreparedStatement pst = conn.prepareStatement(Query);){
			
			pst.setInt(1, user_id);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				
				c = new cart();
				c.setCart_id(rs.getInt(1));
				c.setUser_id(rs.getInt(2));
				c.setBook_id(rs.getInt(3));
				c.setBook_name(rs.getString(4));
				c.setBook_author(rs.getString(5));
				c.setPrice(rs.getDouble(6));
				c.setTime(rs.getString(7));
				
				totalPrice += rs.getDouble("price");
				c.setTotal_price(totalPrice);
				 
				ls.add(c);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return ls;
	}

	@Override
	public boolean removeBook(int book_Id, int user_id) {
		String Query = "delete from cart where book_id=? and user_id =?";

		
		try(Connection conn = DBUtils.getConnection();
				PreparedStatement pst = conn.prepareStatement(Query);){
			
			pst.setInt(1, book_Id);
			pst.setInt(2, user_id);
			
			int row = pst.executeUpdate();
			if(row>0) {
				System.out.println("book Is delete from cart");
				return true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("book is not deleted form the cart errors////");
		}
		
		
		return false;
		
	}

	@Override
	public boolean removeAllBooks(int user_id) {
		String Query = "delete from cart where user_id =?";

		
		try(Connection conn = DBUtils.getConnection();
				PreparedStatement pst = conn.prepareStatement(Query);){
			
			
			pst.setInt(1, user_id);
			
			int row = pst.executeUpdate();
			if(row>0) {
				System.out.println("book Is delete from cart");
				return true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("book is not deleted form the cart errors////");
		}
		
		
		return false;
	}

	

}
