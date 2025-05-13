package com.mkLib.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mkLib.DB.Query;
import com.mkLib.Model.Book;
import com.mkLib.Model.category;
import com.mkLib.Util.DBUtils;

public class bookDaoImp implements bookDao {

	@Override
	public boolean addBook(Book book) {
		// TODO Auto-generated method stub
		String query = Query.addBook;

		try (Connection conn = DBUtils.getConnection(); PreparedStatement pst = conn.prepareStatement(query);) {

			pst.setString(1, book.getTitle());
			pst.setString(2, book.getAuthor());
			pst.setDouble(3, book.getPrice());
			pst.setInt(4, book.getCategoryId());
			pst.setString(5, book.getStatus());
			pst.setString(6, book.getPhotoName());
			pst.setInt(7, book.getQuantity());
			pst.setInt(8, book.getPages());
			pst.setString(9, book.getPublisher());
			pst.setString(10, book.getLanguage());

			int row = pst.executeUpdate();
			System.out.println("Book is Added>");
			return row > 0;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	@Override
	public List<Book> showAllBook() {
		// TODO Auto-generated method stub
		String query = "SELECT b.*, c.category_name FROM book b JOIN category c ON b.category_id = c.category_id";
		List<Book> list = new ArrayList<Book>();
		
		Book book = null;

		try (Connection conn = DBUtils.getConnection(); 
				PreparedStatement pst = conn.prepareStatement(query);) {

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				book = new Book();
				book.setId(rs.getInt(1));
				book.setTitle(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getInt(4));
				book.setStatus(rs.getString(5));
				book.setPhotoName(rs.getString(6));
				book.setQuantity(rs.getInt(7));
				book.setCategoryId(rs.getInt(8));
				book.setCategoryName(rs.getString("category_name"));
				book.setPages(rs.getInt("pages"));
				book.setLanguage(rs.getString("language"));
				book.setPublisher(rs.getString("publisher"));
				list.add(book);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public Book getBookDelails(int id) {

		String query = "SELECT b.*, c.category_name FROM book b JOIN category c ON b.category_id = c.category_id WHERE b.Book_id = ?";
		Book book = null;
		try (Connection conn = DBUtils.getConnection(); 
				PreparedStatement pst = conn.prepareStatement(query);) {

			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				book= new Book();
				book.setId(rs.getInt(1));
				book.setTitle(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getInt(4));
				book.setStatus(rs.getString(5));
				book.setPhotoName(rs.getString(6));
				book.setQuantity(rs.getInt(7));
				book.setCategoryId(rs.getInt(8));
				book.setCategoryName(rs.getString("category_name"));
				book.setPages(rs.getInt("pages"));
				book.setLanguage(rs.getString("language"));
				book.setPublisher(rs.getString("publisher"));
				return book;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return book;
	}

	@Override
	public boolean UpdateEditBookDtl(Book b) {
		
		String query = "update book set book_name =?, author=?, price=?, category_id=?, status=?, quantity=?, pages=?, publisher=?, language=? where Book_id=?";
		
		try(Connection conn = DBUtils.getConnection();
				PreparedStatement pst = conn.prepareStatement(query);){
			
			pst.setString(1,b.getTitle());
			pst.setString(2,b.getAuthor());
			pst.setInt(3,(int)b.getPrice());
			pst.setInt(4, b.getCategoryId());
			pst.setString(5, b.getStatus());
			pst.setInt(6, b.getQuantity());
			pst.setInt(7, b.getPages());
			pst.setString(8, b.getPublisher());
			pst.setString(9, b.getLanguage());
			pst.setInt(10, b.getId());
			
			
			int row = pst.executeUpdate();
			if(row>0) {
				return true;
			}
		}catch(Exception e) {
			
			e.printStackTrace();
			return false;
		}		
		
		return false;		
	}

	@Override
	public boolean deleteBook(int id) {
		
		String query = "delete from book where book_id=?";
		
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

	@Override
	public List<Book> getNewBook() {
		List<Book> list = new ArrayList<Book>();
		
		Book book = null;
		
		String query = "select * from book where status =? order by Book_id DESC";
		
		try(Connection conn = DBUtils.getConnection();
				PreparedStatement pst = conn.prepareStatement(query)){
			
			
			pst.setString(1, "active");
			ResultSet rs = pst.executeQuery();
			
			int i =1;
			while(rs.next() && i<=4) {
				
				book= new Book();
				book.setId(rs.getInt(1));
				book.setTitle(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getInt(4));
				book.setStatus(rs.getString(5));
				book.setPhotoName(rs.getString(6));
				book.setQuantity(rs.getInt(7));
				book.setCategoryId(rs.getInt(8));
				list.add(book);
				i++;
				System.out.println(i);
			}
			
		
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<category> showAllCategory() {
		
		String query = "select * from category";
		List<category> list = new ArrayList<category>();
		
		category c = null;
		
		try (Connection conn = DBUtils.getConnection();
				PreparedStatement pst = conn.prepareStatement(query)){
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				
				c = new category();
				c.setId(rs.getInt(1));
				c.setCategory_name(rs.getString(2));
				list.add(c);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Book> showCategoryBook(int categoryId) {
		
		String query ="select * from book where category_id =?";
		List<Book> ls = new ArrayList<Book>();
		
		Book book = null;
		
		try(Connection conn = DBUtils.getConnection();
				PreparedStatement pst = conn.prepareStatement(query)) {
			pst.setInt(1, categoryId);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				book= new Book();
				book.setId(rs.getInt(1));
				book.setTitle(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getInt(4));
				book.setStatus(rs.getString(5));
				book.setPhotoName(rs.getString(6));
				book.setQuantity(rs.getInt(7));
				book.setCategoryId(rs.getInt(8));
				ls.add(book);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return ls;
	}

	@Override
	public List<Book> getBookBySearch(String ch) {
		// TODO Auto-generated method stub
		List<Book> list = new ArrayList<Book>();
		
		Book book = null;
		
		String query ="SELECT b.* FROM book b JOIN category c ON b.category_id = c.category_id " +
	               "WHERE (b.book_name LIKE ? OR b.author LIKE ? OR c.category_name LIKE ?) AND b.status = ?";

		
		try(Connection conn = DBUtils.getConnection();
				PreparedStatement pst = conn.prepareStatement(query)){
			
			
			pst.setString(1, "%"+ch+"%");
			pst.setString(2, "%"+ch+"%");
			pst.setString(3, "%"+ch+"%");
			pst.setString(4, "active");
			ResultSet rs = pst.executeQuery();
			
			int i =1;
			while(rs.next()) {
				
				book= new Book();
				book.setId(rs.getInt(1));
				book.setTitle(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getInt(4));
				book.setStatus(rs.getString(5));
				book.setPhotoName(rs.getString(6));
				book.setQuantity(rs.getInt(7));
				book.setCategoryId(rs.getInt(8));
				list.add(book);
			
				System.out.println(i);
			}
			
		
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
