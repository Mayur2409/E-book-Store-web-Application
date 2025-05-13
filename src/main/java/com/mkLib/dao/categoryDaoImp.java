package com.mkLib.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.mkLib.Util.DBUtils;

public class categoryDaoImp implements categoryDao {

	@Override
	public boolean addCategory(String category) {
		// TODO Auto-generated method stub
		String query = "insert into category(category_Name) values(?)";

		try (Connection conn = DBUtils.getConnection(); 
				PreparedStatement pst = conn.prepareStatement(query);) {

			pst.setString(1, category);


			int row = pst.executeUpdate();
			System.out.println("Category  is Added>");
			return row > 0;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	
	}

	@Override
	public boolean editCategory(int id, String category) {
		// TODO Auto-generated method stub
		
		String query = "UPDATE category SET category_name=? WHERE category_id=?";

		
		try (Connection conn = DBUtils.getConnection(); 
				PreparedStatement pst = conn.prepareStatement(query);) {

			pst.setString(1, category);
			pst.setInt(2, id);
			
			int row = pst.executeUpdate();
			
			return row>0;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
		
	}

	@Override
	public boolean deleteCategory(int id) {
		String query = "delete from category where category_id=?";
		
		try(Connection conn = DBUtils.getConnection();
				PreparedStatement pst = conn.prepareStatement(query)){
			pst.setInt(1, id);
			int row = pst.executeUpdate();
			return row>0;
			
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
