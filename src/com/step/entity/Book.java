package com.step.entity;

import java.io.Serializable;

public class Book implements Serializable{
	private static final long serialVersionUID = -6204043201667956091L;
	
	private int bId;
	private String	image;
	private double price;
	private String described;
	
	private BookType type_tId;
	
	private int stock;
	
	public Book(){
		
	}
	

	public int getbId() {
		return bId;
	}
	public void setbId(int bId) {
		this.bId = bId;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getDescribed() {
		return described;
	}
	public void setDescribed(String described) {
		this.described = described;
	}
	public BookType getType_tId() {
		return type_tId;
	}
	public void setType_tId(BookType type_tId) {
		this.type_tId = type_tId;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	@Override
	public String toString() {
		return "Book [bId=" + bId + ", image=" + image + ", price=" + price
				+ ", described=" + described + ", type_tId=" + type_tId
				+ ", stock=" + stock + "]";
	}
	
	
}
