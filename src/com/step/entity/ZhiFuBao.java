package com.step.entity;

import java.io.Serializable;

public class ZhiFuBao implements Serializable {
	private static final long serialVersionUID = -5378403408863096925L;

	private String zId;
	private String accountId;
	private String password;
	private double balance;
	private String payPassword;//÷ß∏∂√‹¬Î
	
	private User user;

	public ZhiFuBao() {
	}


	public String getAccountId() {
		return accountId;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}


	public String getzId() {
		return zId;
	}


	public void setzId(String zId) {
		this.zId = zId;
	}


	public String getPayPassword() {
		return payPassword;
	}


	public void setPayPassword(String payPassword) {
		this.payPassword = payPassword;
	}

}
