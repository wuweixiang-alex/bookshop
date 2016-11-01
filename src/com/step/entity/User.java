package com.step.entity;

import java.io.Serializable;



import org.springframework.stereotype.Repository;
@Repository
public class User implements Serializable{
	private static final long serialVersionUID = 3888333611895422543L;
	
	private int uid;
	private String username;
	private String password;
	private String sex;
	private String email;
	private String tel;
	private String realname;
	private String idcard;
	private String address;
	
	public User(){}
	
	public User(int uid, String username, String password, String sex,
			String email, String tel, String realname, String idcard) {
		this.uid = uid;
		this.username = username;
		this.password = password;
		this.sex = sex;
		this.email = email;
		this.tel = tel;
		this.realname = realname;
		this.idcard = idcard;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getIdcard() {
		return idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

 

	@Override
	public String toString() {
		return "User [uid=" + uid + ", username=" + username + ", password="
				+ password + ", sex=" + sex + ", email=" + email + ", tel="
				+ tel + ", realname=" + realname + ", idcard=" + idcard
				+ ", address=" + address + "]";
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	


	
}
