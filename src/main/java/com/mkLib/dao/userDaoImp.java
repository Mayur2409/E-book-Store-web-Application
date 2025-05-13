package com.mkLib.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mkLib.DB.Query;
import com.mkLib.Model.Address;
import com.mkLib.Model.User;
import com.mkLib.Util.DBUtils;

public class userDaoImp implements userDao {
	
	@Override
	public boolean adduser(String username, String email, String password) {
		// TODO Auto-generated method stub
		String query = Query.insert;
		
		try(Connection conn = DBUtils.getConnection();
				PreparedStatement pst = conn.prepareStatement(query);) {
			
			pst.setString(1,username);
			pst.setString(2, email);
			pst.setString(3, password);
			
			int row = pst.executeUpdate();
			System.out.println("Data is inserted successfully.");
			return row>0;
			
		}catch(Exception e) {
			e.printStackTrace();
		}		
		return false;
		
	}

	@Override
	public boolean isValid(String username, String password) {
		 String query=Query.select;
		 
		 try(Connection conn = DBUtils.getConnection();
				 PreparedStatement pst = conn.prepareStatement(query)){
			 
			 pst.setString(1, username);
			 pst.setString(2, password);
			 System.out.println("username: "+username+"\tpassword: "+password);
			 ResultSet rs=pst.executeQuery();
			 return rs.next();
			 
		 } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

	}

	@Override
	public User getUser(String username, String password) {
		
		String Query = "select * from user where username = ? and password = ?";
		User u  = null;
		
		try(Connection conn = DBUtils.getConnection();
				PreparedStatement pst = conn.prepareStatement(Query)){
			
			pst.setString(1, username);
			pst.setString(2, password);
			
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				u = new User();
				u.setUid(rs.getInt("user_id"));
				u.setName(rs.getString(2));
				u.setEmail(rs.getString(3));
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return u;
	}

	@Override
	public boolean addAddress(Address add) {
		String query=Query.addAddress;
		
		try(Connection conn = DBUtils.getConnection();
				PreparedStatement pst = conn.prepareStatement(query)){
			
			pst.setInt(1,add.getUser_id() );
			pst.setString(2,add.getStreet() );
			pst.setString(3,add.getLandmark() );
			pst.setString(4,add.getCity() );
			pst.setString(5,add.getState());
			pst.setString(6,add.getCountry());
			
			int row = pst.executeUpdate();
			System.out.println("Address is added successfully");
			return row>0;
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}

	@Override
	public Address getAddress(int uid) {
		Address address = null;
		
		String query ="select * from address where user_id =?";
		
		try (Connection conn = DBUtils.getConnection();
				PreparedStatement pst = conn.prepareStatement(query)){
			
			pst.setInt(1, uid);
			
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				address = new Address();
				address.setAddress_id(rs.getInt("address_id"));
				address.setUser_id(rs.getInt("user_id"));
				address.setStreet(rs.getString("street"));
				address.setLandmark(rs.getString("landmark"));
				address.setCity(rs.getString("city"));
				address.setState(rs.getString("state"));
				address.setCountry(rs.getString("country"));
			}
			
			return address;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("error : to get the data from address table");
		}
		
		
		return null;
	}

	@Override
	public boolean addMobileNo(int uid, String no) {
		// TODO Auto-generated method stub
		String query = "UPDATE user SET mobile_no = ? WHERE user_id = ?";
		try (Connection conn = DBUtils.getConnection();
				PreparedStatement pst = conn.prepareStatement(query)){
			
			pst.setString(1, no);
			pst.setInt(2, uid);
			
			int row = pst.executeUpdate();
			
			return row>0;
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("error : to add the mobile no.");
			return false;
		}
				
	}

	@Override
	public String getMobileNo(int uid) {
		String query = "select mobile_no from user where user_id=?";
		try (Connection conn = DBUtils.getConnection();
				PreparedStatement pst = conn.prepareStatement(query)){
			
			pst.setInt(1, uid);
			
			ResultSet rs = pst.executeQuery();
			 if (rs.next()) {  // <-- Must check if a row exists
		           String mobileno= rs.getString("mobile_no");
		           return mobileno;
			 } 
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("error : to add the mobile no.");
		}
		return null;
	}


}
