package com.mkLib.Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtils {
	private static final String url="jdbc:mysql://localhost:3307/mklib";
	private static final String username="root";
	private static final String password="Mayur@1234";
	
	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() throws SQLException {
		System.out.println("Connection is done");
		return DriverManager.getConnection(url, username, password);
	}
}
