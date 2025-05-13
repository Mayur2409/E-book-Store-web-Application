package com.mkLib.dao;

import com.mkLib.Model.Address;
import com.mkLib.Model.User;

public interface userDao {

	boolean adduser(String username, String email, String password);

	boolean isValid(String username, String password);

	User getUser(String username, String password);

	boolean addAddress(Address address);
	
	Address getAddress(int uid);

	boolean addMobileNo(int uid, String mobileno);
	
	String getMobileNo(int uid);

	

}
