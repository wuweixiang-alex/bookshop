package com.step.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.step.entity.Book;
import com.step.entity.Order;
import com.step.entity.Pager;
import com.step.entity.ShoppingCart;
import com.step.entity.User;
import com.step.service.CommonService;

@Controller
public class GoodsController {

	@Resource
	private CommonService commonService;

	@Resource
	HttpServletRequest request;

	@RequestMapping("query")
	public String doQuery() {
		String described = request.getParameter("described") == null
				|| request.getParameter("described") == "" ? "" : request
				.getParameter("described");
		String priceS = request.getParameter("priceS") == null
				|| request.getParameter("priceS") == "" ? "-1" : request
				.getParameter("priceS");
		String priceE = request.getParameter("priceE") == null
				|| request.getParameter("priceE") == "" ? "-1" : request
				.getParameter("priceE");
		String type_tId = request.getParameter("type_tId") == null
				|| request.getParameter("type_tId") == "" ? "-1" : request
				.getParameter("type_tId");

		int currentPage = 1;
		int pageSize = 16;
		if (request.getParameter("pageNum") != null
				&& request.getParameter("pageNum") != "") {
			currentPage = Integer.valueOf(request.getParameter("pageNum"));
		}

		Pager<Book> pager = new Pager<Book>();

		pager = commonService.getPagerByHql(currentPage, pageSize, described,
				Double.valueOf(priceS), Double.valueOf(priceE),
				Integer.valueOf(type_tId));

		request.setAttribute("pager", pager);
		request.setAttribute("described2", described);
		return "common/shop.jsp";
	}

	@ResponseBody
	@RequestMapping("toCart")
	public String toCart() {

		// 如果用户已经登录
		if (request.getSession().getAttribute("username") != null) {
			String bId = request.getParameter("bId");
			String price = request.getParameter("price");
//			String count = request.getParameter("bId");
			
			System.out.println("购物车页面获取到书的id=" + bId);
//			Book book = commonService.getGoodsbyId(Integer.valueOf(bId));
			Book book =new Book();
			book.setbId(Integer.valueOf(bId));
			book.setPrice(Double.valueOf(price));
			int count = 1;// 设置商品的数量默认值为1
			
			User user=commonService.doLogin(request.getSession().getAttribute("username").toString());
			
			
			ShoppingCart e = new ShoppingCart(count, count*Double.valueOf(price), book, user);
			commonService.addToCart(e);
		} else {
			// 如果用户未登录
			String bId = request.getParameter("bId");
			String price =  request.getParameter("price");
			Book book = commonService.getGoodsbyId(Integer.valueOf(bId));
//			Book book =new Book();
//			book.setbId(Integer.valueOf(bId));
//			book.setPrice(Double.valueOf(price));
//			System.out.println("通过购物车页面获取到书的id=" + bId + "    来获取到=" + book.getImage());
			Set<ShoppingCart> gwc = (Set<ShoppingCart>) request.getSession()
					.getAttribute("gwc");
			ShoppingCart e = null;
			int count = 1; 
			if (gwc == null) { 
				gwc = new HashSet<ShoppingCart>();
				System.out.println("-----------为访客用户第一次购物创建了一辆购物车-----------");

				e = new ShoppingCart(count, book);
				gwc.add(e);

				System.out.println("目前购物车里面商品数为：" + gwc.size());
				for (ShoppingCart cart : gwc) {
					System.out.println(cart);
				}
			} else {
				System.out.println("-----------进入了，访客已经有了购物车-----------");
				int cc = 0;
				for (ShoppingCart cart : gwc) {
					if (cart.getBook().getbId() == book.getbId()) {
						cart.setCount(cart.getCount() + 1);
						cc++;
					}
				}
				if (cc == 0) {
					e = new ShoppingCart(count, book);
					gwc.add(e);
				}
				System.out.println("目前购物车里面商品数为：" + gwc.size());
				for (ShoppingCart cart : gwc) {
					System.out.println(cart);
				}
			}
			request.getSession().setAttribute("gwc", gwc);  
		}
		return "添加到购物车成功";// 返回给 ajax 的data
	}
	
	@RequestMapping("queryCart")
	public String doQueryCart(){
		
		String acc = request.getParameter("acc");
		if(acc!=null && acc.equals("100")){
			request.setAttribute("acc", acc);
		}
		
//		用户未登录    
		if (request.getSession().getAttribute("username") == null) {
			Set<ShoppingCart> gwc = (Set<ShoppingCart>) request.getSession()
					.getAttribute("gwc");
		request.getSession().setAttribute("gwc7", gwc);
		}else {
//		用户登录 	查询数据库里面的购物车
			User user=commonService.doLogin(request.getSession().getAttribute("username").toString());
			List<ShoppingCart> gwc=commonService.queryCartByUser(user.getUid());
			request.getSession().setAttribute("gwc7", gwc);
		}
		return "/common/shopping-cart.jsp";
	}
	
	
	@RequestMapping("delete")
	public String doDeleteBook() {
		String bId= request.getParameter("bId");
		System.out.println("----------------------------在删除方法里 获取到bookId="+bId);
		// 用户未登录
		if (request.getSession().getAttribute("username") == null) {
			Set<ShoppingCart> gwc = (Set<ShoppingCart>) request.getSession()
					.getAttribute("gwc");
//			Book book = commonService.getGoodsbyId(Integer.valueOf(bId));
			/*for (ShoppingCart cart : gwc) {
				if (cart.getBook().getbId() == book.getbId()) {
					gwc.remove(cart);
				}
			}*/
			Iterator<ShoppingCart> it = gwc.iterator();
			System.out.println("-------准备删除集合里的 元素");
			while (it.hasNext()) {
					if (it.next().getBook().getbId()==Integer.valueOf(bId)) {
						it.remove();
					}
			}
		 
			//通过book ID 获得Set<ShoppingCart> gwc 对象中存在的 cart	ShoppingCart cart =commonService.getShoppingCart(bId);  ？？？？？？？？
//			if(gwc.contains(cart)){
//				gwc.remove(cart);
//			}
		request.getSession().setAttribute("gwc7", gwc);
		} else {
			// 用户登录 根据book id 删除 数据库里面的购物车
			User user=commonService.doLogin(request.getSession().getAttribute("username").toString());
			commonService.deleteCart(user.getUid(),Integer.valueOf(bId));
		}
		return "/queryCart.htm";
	}
	
	
	@RequestMapping("order")
	public String  orderBooks() {
		
		System.out.println("下订单");
//		String books[]=request.getParameterValues("books");
		String bId = request.getParameter("bId");
//		String uid = request.getParameter("uid");
//		System.out.println("页面选择的商品-------------------------"+books);
		System.out.println("bId-------" +bId);
		String[] s=bId.split(",");
		
		User user=commonService.doLogin(request.getSession().getAttribute("username").toString());
		request.getSession().setAttribute("user", user);
		List<ShoppingCart> gwc=new ArrayList<ShoppingCart>();
		System.out.println("=======1============================================================");
		for(int i=0;i<s.length-1;i++){
			System.out.println("========2==============================================================="+s[i]+"s的长度="+s.length);
		ShoppingCart sh=commonService.orderCart(user.getUid(),Integer.parseInt(s[i]));
		System.out.println("========3===============================================================");
		System.out.println("输出book订单的bId"+sh);		
		gwc.add(sh);
		}
		
		//对 勾选的商品进行 下单 ，重新 设置gwc 并对勾选后的商品删除
		request.getSession().setAttribute("gwc7", gwc);
		return "/common/confirmorder.jsp";
		
	}
	
	
	//生成订单，保存到数据库 
	//						订单表（   保存勾选商品的gwc （shoppingcart）  传carId       用户的地址   金额合计    已付款/未付款）
	@RequestMapping("generateOrder")
	public String generateOrder(){
		
		List<ShoppingCart> gwc7=(List<ShoppingCart>) request.getSession().getAttribute("gwc7");
		User user=commonService.doLogin(request.getSession().getAttribute("username").toString());
		Date date=new Date();
		if (gwc7!=null) {
			for(ShoppingCart selected:gwc7){
				Order th=new Order(date,user,selected.getBook(), selected.getCount(), selected.getTotalMoney(), "待付款", "待发货");
				commonService.saveSelectedGoods(th); 
				//生成订单后，删除
				commonService.deleteCart(user.getUid(), selected.getBook().getbId());
			}
			//保存后删除
			request.getSession().removeAttribute("gwc7");
		}
		return "/payon-line/zhifubao.jsp"; 
	}
	
	//支付 详情  
	//       传过来一个 订单的金额合计   。 需要登录支付宝用户   确认支付 需要一个 支付密码  对用户余额判断 是否足够支付 足够的话 管理员加钱 用户扣钱
	
	@RequestMapping("pay")//这边由第三方进行管理
	public String payOrder(){
//		获取某个用户的订单表的 所有价钱总和
//		判断用户是否支付：支付成功  用户扣钱  支付宝加钱
		return null;
	}
	
	//1.拦截 order请求到登录页面 2.后台管理  商品照片上传 3.验证码  4.热门推荐
	
	//    用户个人信息维护 密码修改 我的订单等
}
