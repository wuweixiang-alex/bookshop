package com.step.entity;

import java.io.Serializable;

public class BookType implements Serializable{
	private static final long serialVersionUID = -7814268999110236537L;
	
	private int tId;
	private String type;
	private String display;
	
	public BookType(){
	}

	public int gettId() {
		return tId;
	}

	public void settId(int tId) {
		this.tId = tId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDisplay() {
		return display;
	}

	public void setDisplay(String display) {
		this.display = display;
	}
	
}
