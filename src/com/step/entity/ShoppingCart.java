package com.step.entity;

import java.io.Serializable;
import java.text.DecimalFormat;

public class ShoppingCart implements Serializable {
	private static final long serialVersionUID = 5993915472436117336L;
	
	
	private int carId;
	private int count;
	private double totalMoney;
	
	private Book book;          
	
	private User user; 

	
	public ShoppingCart() {
	}


	public ShoppingCart(int count, Book book) {
		super();
		this.count = count;
		this.book = book;
	}


	public ShoppingCart(int count, double totalMoney, Book book, User user) {
		super();
		this.count = count;
		DecimalFormat df = new DecimalFormat( "0.00 "); //限制double类型的小数点位数
		this.totalMoney = Double.valueOf(df.format(totalMoney));
		this.book = book;
		this.user = user;
	}


	public int getCarId() {
		return carId;
	}


	public void setCarId(int carId) {
		this.carId = carId;
	}


	public Book getBook() {
		return book;
	}


	public void setBook(Book book) {
		this.book = book;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public double getTotalMoney() {
		return totalMoney;
	}


	public void setTotalMoney(double totalMoney) {
		DecimalFormat df = new DecimalFormat( "0.00 "); //限制double类型的小数点位数
		this.totalMoney = Double.valueOf(df.format(totalMoney));
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	@Override
	public String toString() {
		return "ShoppingCart [count=" + count + ", totalMoney=" + totalMoney
				+ ", book=" + book + "]";
	}


 

	 
	
	
}
