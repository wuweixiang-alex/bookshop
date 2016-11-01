package com.step.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.step.dao.CommonDao;
import com.step.entity.Book;
import com.step.entity.Order;
import com.step.entity.Pager;
import com.step.entity.ShoppingCart;
import com.step.entity.User;
import com.step.service.CommonService;

@Service
@Transactional
public class CommonServiceImpl implements CommonService {

	@Resource
	CommonDao commonDao;
	
	@Override//未使用 ，注册方法
	public int adduser(User user) {
		commonDao.adduser(user);
		return 0;
	}

	@Override
	public Pager<Book> getPagerByHql(int currentNum, int pageSize,
			String described, Double priceS,Double priceE,int type_tId) {
		
		return commonDao.getPagerByHql(currentNum, pageSize, described, priceS, priceE,type_tId);
	}

	@Override
	public Book getGoodsbyId(int bId) {
	  return commonDao.getGoodsbyId(bId);
	}

	@Override
	public void addToCart(ShoppingCart e) {
		 commonDao.addToCart(e);
	}

	@Override
	public User doLogin(String username) {
		return  commonDao.doLogin(username);
	}

	@Override
	public List<ShoppingCart> queryCartByUser(int uid) {
		return commonDao.queryCartByUser(uid);
	}

	@Override
	public void deleteCart(int uid, int bId) {
		commonDao.deleteCart(uid,bId);
		
	}

	@Override
	public ShoppingCart orderCart(int uid, int bId) {
		return commonDao.orderCart(uid,bId);
	}

	@Override
	public void saveSelectedGoods(Order th) {
		commonDao.ssaveSelectedGoods(th);
	}

	@Override
	public void addbook(String image, Double price, String described,
			int type_tId, int stock) {
		commonDao.addbook(image,price,described,type_tId,stock);
		
	}




}
