package com.mkLib.Model;

public class Address {
		
	private int Address_id;
	private int user_id;
	private String street;
	private String landmark;
	private String city;
	private String state;
	private String country;
	
	
	public Address(int uid, String street2, String landmark2, String state2, String city2, String country2) {
		// TODO Auto-generated constructor stub
		this.user_id=uid;
		this.street= street2;
		this.landmark = landmark2;
		this.state = state2;
		this.city = city2;
		this.country = country2;	
	}

	public Address() {
		// TODO Auto-generated constructor stub
	}

	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	public int getAddress_id() {
		return Address_id;
	}
	public void setAddress_id(int address_id) {
		Address_id = address_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getLandmark() {
		return landmark;
	}
	public void setLandmark(String landmark) {
		this.landmark = landmark;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	@Override
	public String toString() {
		return "" + street + ", "
				+ landmark + ", " + city + ", " + country + ".";
	}
	
	
	
}
