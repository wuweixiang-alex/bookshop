package com.step.entity;

import java.io.Serializable;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.Set;

public class Order implements Serializable {
	private static final long serialVersionUID = 2824928282050476091L;

	private String orderNumber;//订单编号
	private Date date;
	private User user;
	private Book book;
	private int count;
	private Double totalMoney;
	// private Double total; //金额合计
	private String flag_pay; // 默认 未付款
	private String flay_send;// 默认 未发货

	public Order() {
	}
	
	 
 


	public Order(Date date, User user, Book book,
			int count, Double totalMoney, String flag_pay, String flay_send) {
		super();
		this.date = date;
		this.user = user;
		this.book = book;
		this.count = count;
		DecimalFormat df = new DecimalFormat( "0.00 "); //限制double类型的小数点位数
		this.totalMoney = Double.valueOf(df.format(totalMoney));
		this.flag_pay = flag_pay;
		this.flay_send = flay_send;
	}





	public String getOrderNumber() {
		return orderNumber;
	}


	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}


	public Date getDate() {
		return date;
	}


	public void setDate(Date date) {
		this.date = date;
	}


	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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

	public Double getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(Double totalMoney) {
		DecimalFormat df = new DecimalFormat( "0.00 "); //限制double类型的小数点位数
		this.totalMoney = Double.valueOf(df.format(totalMoney));
	}

	public String getFlag_pay() {
		return flag_pay;
	}

	public void setFlag_pay(String flag_pay) {
		this.flag_pay = flag_pay;
	}

	public String getFlay_send() {
		return flay_send;
	}

	public void setFlay_send(String flay_send) {
		this.flay_send = flay_send;
	}

}
