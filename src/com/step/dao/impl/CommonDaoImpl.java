package com.step.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.step.dao.CommonDao;
import com.step.entity.Book;
import com.step.entity.Order;
import com.step.entity.Pager;
import com.step.entity.ShoppingCart;
import com.step.entity.User;

@Repository
public class CommonDaoImpl implements CommonDao{
	
	private static final int[] Object = null;
	private static final String ShoppingCart = null;
	@Resource
	private HibernateTemplate hibernateTemplate;
	

	@Override
	public int adduser(User user) {
		
		SessionFactory sfFactory = hibernateTemplate.getSessionFactory();
		Session session = sfFactory.openSession();
		org.hibernate.Transaction tx = session.beginTransaction();
		session.save(user);
		session.flush();
//		session.
		tx.commit();
//		hibernateTemplate.save(user);
//		
	return 1;
		
//		BeanFactory bf = new ClassPathXmlApplicationContext("applicationContext.xml"); 
//		SessionFactory sessionFactory = (SessionFactory) bf.getBean("sessionFactory",LocalSessionFactoryBean.class);
//		Session session = sessionFactory.openSession();
//		Transaction tx = session.beginTransaction();
//		System.out.println("执行doregister");
//		try{
//		session.save(user);
//		tx.commit();
//		}catch (Exception e) {
//			tx.rollback();
//		} finally {
//			session.close();
//		}
	}
	/**
	 * hibernate中通过count函数查询返回值为long
	 */
	@Override
	public Pager<Book> getPagerByHql(int currentNum, int pageSize,
			String described, Double priceS,Double priceE,int type_tId) {
		
		 Session session=hibernateTemplate.getSessionFactory().openSession();
		
		StringBuffer hqlWhere = new StringBuffer("");
		
		if(described!=null&&described!=""){
			hqlWhere.append(" and described like '%"+described+"%'");
		}
		
		if(priceS>0 && priceE>0){
			hqlWhere.append(" and price between "+priceS+" and "+priceE);
		}
		if(type_tId>0){
			hqlWhere.append(" and type_tId="+type_tId);
		} 
		
		
		//1从数据库 拿到 总记录数
		long totalCount = 0;	//总记录数
		String hqlCount = "select count(bId) from Book where 1=1 " + hqlWhere.toString();
		Query query = session.createQuery(hqlCount);

		if(query.list()!=null){
			totalCount =   (long) query.list().get(0);//从数据库中 得  总记录数
		}
		if(totalCount <= 0){
			return null;
		}
		
		//2计算【总页数】
		int totalPage = (int) (totalCount/pageSize);	//总页数
		if(totalCount%pageSize != 0){
			totalPage ++;
		}
		
		//3对【当前页】进行判断
		int currentPage = currentNum>totalPage ? totalPage : currentNum; //当前页
		
		// 根据（ 当前页  页的记录数   ）  得到的   list         这边加入了  根据搜索查询 符合条件的所有员工  返回  List
		StringBuffer hql = new StringBuffer("from Book where 1=1 "+ hqlWhere.toString());
		
		int limitStart = (currentPage-1)*pageSize;
		int limitNum = pageSize;
		
		Pager<Book> pager = new Pager<Book>(pageSize,currentPage,totalPage,totalCount,session.createQuery(hql.toString()).setFirstResult(limitStart).setMaxResults(limitNum).list());
		
		session.close();
		return pager;
	}
	
	
	@Override
	public Book getGoodsbyId(int bId) {
		 Session session=hibernateTemplate.getSessionFactory().openSession();
		
		String hql = "from Book where bId= " + bId;
		Query query = session.createQuery(hql);
		List<Book> books = query.list();
		for (Book book : books){
			if (book!=null) {
				System.out.println("返回根据id查询到的"+book+'\n');
				return book;
			}
		}
		System.out.println("返回了book=null");
		return null;
	}
	
	
	@Override
	public void addToCart(ShoppingCart e) {
		Session session=hibernateTemplate.getSessionFactory().openSession();
		session.save(e);
		session.close();
	}
	
	
	@Override
	public User doLogin(String username) {
		Session session=hibernateTemplate.getSessionFactory().openSession();
		
		String hql="from User where username=?";
		Query query = session.createQuery(hql).setMaxResults(1);

		query.setString(0, username);
		User user = (User)query.uniqueResult();
 		session.close();
		return user;
	}
	@Override
	public List<ShoppingCart> queryCartByUser(int uid) {
		Session session = hibernateTemplate.getSessionFactory().openSession();

		String hql = "select sc.book,SUM(sc.count) ,SUM(sc.totalMoney) from ShoppingCart sc where sc.user = ? GROUP BY sc.book";
		Query query = session.createQuery(hql);
		// session.createSQLQuery(hql);
		query.setInteger(0, uid);
		List<Object[]> list = query.list();
		session.clear();

		String hql1 = "from User where uid=? ";
		Query query1 = session.createQuery(hql1).setMaxResults(1);
		query1.setInteger(0, uid);
		User user = (User) query1.uniqueResult();

		List<ShoppingCart> oCarts = new ArrayList<ShoppingCart>();
		for (Object[] objArr : list) {
			System.out.println("准备放入购物车：" + (Book) objArr[0]
					+ "--------&&--------"
					+ Integer.valueOf(String.valueOf(objArr[1]))
					+ "--------&&--------" + (double) objArr[2]
					+ "--------&&用户的id为--------" + user.getUid());

			ShoppingCart e = new ShoppingCart(Integer.valueOf(String
					.valueOf(objArr[1])), (double) objArr[2], (Book) objArr[0],
					user);
			oCarts.add(e);
		}

		return oCarts;
	}
	@Override
	public void deleteCart(int uid, int bId) {
		Session session = hibernateTemplate.getSessionFactory().openSession();

		String sql = "delete  from shoppingcart  where user_id = ? and book_id= ?";
		Query query = session.createSQLQuery(sql);
		query.setInteger(0, uid);
		query.setInteger(1, bId);
		query.executeUpdate();
		System.out.println("删除-----uid="+uid+"--------bId="+bId+"成功----");
		
	}
	@Override
	public ShoppingCart orderCart(int uid, int bId) {
		Session session = hibernateTemplate.getSessionFactory().openSession();

		String hql = "select sc.book,SUM(sc.count) ,SUM(sc.totalMoney) from ShoppingCart sc where sc.book = ? and sc.user= ? GROUP BY sc.book";
		Query query = session.createQuery(hql);
		query.setInteger(0, bId);
		query.setInteger(1, uid);
		List<Object[]>  o =  query.list();
		ShoppingCart cart = new ShoppingCart();
		
		for (Object[] objects : o) {
			cart.setBook((Book) objects[0]);
			cart.setCount(Integer.valueOf(objects[1].toString()));
			cart.setTotalMoney((double) objects[2]);
		}
		
		
		return cart;
	}
	@Override
	public void ssaveSelectedGoods(Order th) {
		Session session = hibernateTemplate.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.save(th);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		}finally{
			session.close();
		}
		
	}
	@Override
	public void addbook(String image, Double price, String described,
			int type_tId, int stock) {
		Session session = hibernateTemplate.getSessionFactory().openSession();

		String sql = "INSERT INTO book(image,price,described,type_tId,stock) VALUES (?,?,?,?,?)";
		Query query = session.createSQLQuery(sql);
		query.setString(0, image);
		query.setDouble(1, price);
		query.setString(2, described);
		query.setInteger(3, type_tId);
		query.setInteger(4, stock);
		query.executeUpdate();
		System.out.println("----------------------书本添加成功:"+described);
	}
}
