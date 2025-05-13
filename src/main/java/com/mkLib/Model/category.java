package com.mkLib.Model;

public class category {
		
	int id;
	String Category_name;
	
	public category(int id, String category_name) {
		super();
		this.id = id;
		Category_name = category_name;
	}
	
	public category() {
		
	}

	public category(String category) {
		// TODO Auto-generated constructor stub
		this.Category_name=category;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCategory_name() {
		return Category_name;
	}
	public void setCategory_name(String category_name) {
		Category_name = category_name;
	}
	

	
	@Override
	public String toString() {
		return "category [id=" + id + ", Category_name=" + Category_name + "]";
	}
	
	
}
