package com.mkLib.Model;

public class Book {
	
	private int Id;
	private String title;
	private String author;
	private double price;
	private int categoryId;
	private String categoryName;
	private String photoName;
	private String status;
	private String email;
	private int quantity;
	private int pages;
	private String language;
	private String publisher;
	
	
	public Book(String title, String author, double price, int categoryId, String photoName, String status,
			int quantity, int pages, String publisher, String language) {
		super();
		this.title = title;
		this.author = author;
		this.price = price;
		this.categoryId = categoryId;
		this.photoName = photoName;
		this.status = status;
		this.quantity = quantity;
		this.pages = pages;
		this.language = language;
		this.publisher = publisher;
	}




	

	
	
	
	public int getPages() {
		return pages;
	}
	public void setPages(int pages) {
		this.pages = pages;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public Book() {
		// TODO Auto-generated constructor stub
	}
	


	
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPhotoName() {
		return photoName;
	}
	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}



	@Override
	public String toString() {
		return "Book [Id=" + Id + ", title=" + title + ", author=" + author + ", price=" + price + ", categoryId="
				+ categoryId + ", categoryName=" + categoryName + ", photoName=" + photoName + ", status=" + status
				+ ", email=" + email + ", quantity=" + quantity + ", pages=" + pages + ", language=" + language
				+ ", publisher=" + publisher + "]";
	}
	
	
	
	
	
	
	

	
}
