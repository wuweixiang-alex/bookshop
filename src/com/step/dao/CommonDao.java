package com.step.dao;

import java.util.List;

import com.step.entity.Book;
import com.step.entity.Order;
import com.step.entity.Pager;
import com.step.entity.ShoppingCart;
import com.step.entity.User;

public interface CommonDao {
	
		
	public int adduser(User user);
	

	public Pager<Book> getPagerByHql(int currentNum, int pageSize,String described,Double priceS,Double priceE,int type_tId);


	public Book getGoodsbyId(int bId);


	public void addToCart(ShoppingCart e);


	public User doLogin(String username);


	public List<ShoppingCart> queryCartByUser(int uid);


	public void deleteCart(int uid, int bId);


	public ShoppingCart orderCart(int uid, int bId);


	public void ssaveSelectedGoods(Order th);


	public void addbook(String image, Double price, String described,
			int type_tId, int stock);


}
