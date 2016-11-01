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

		// ����û��Ѿ���¼
		if (request.getSession().getAttribute("username") != null) {
			String bId = request.getParameter("bId");
			String price = request.getParameter("price");
//			String count = request.getParameter("bId");
			
			System.out.println("���ﳵҳ���ȡ�����id=" + bId);
//			Book book = commonService.getGoodsbyId(Integer.valueOf(bId));
			Book book =new Book();
			book.setbId(Integer.valueOf(bId));
			book.setPrice(Double.valueOf(price));
			int count = 1;// ������Ʒ������Ĭ��ֵΪ1
			
			User user=commonService.doLogin(request.getSession().getAttribute("username").toString());
			
			
			ShoppingCart e = new ShoppingCart(count, count*Double.valueOf(price), book, user);
			commonService.addToCart(e);
		} else {
			// ����û�δ��¼
			String bId = request.getParameter("bId");
			String price =  request.getParameter("price");
			Book book = commonService.getGoodsbyId(Integer.valueOf(bId));
//			Book book =new Book();
//			book.setbId(Integer.valueOf(bId));
//			book.setPrice(Double.valueOf(price));
//			System.out.println("ͨ�����ﳵҳ���ȡ�����id=" + bId + "    ����ȡ��=" + book.getImage());
			Set<ShoppingCart> gwc = (Set<ShoppingCart>) request.getSession()
					.getAttribute("gwc");
			ShoppingCart e = null;
			int count = 1; 
			if (gwc == null) { 
				gwc = new HashSet<ShoppingCart>();
				System.out.println("-----------Ϊ�ÿ��û���һ�ι��ﴴ����һ�����ﳵ-----------");

				e = new ShoppingCart(count, book);
				gwc.add(e);

				System.out.println("Ŀǰ���ﳵ������Ʒ��Ϊ��" + gwc.size());
				for (ShoppingCart cart : gwc) {
					System.out.println(cart);
				}
			} else {
				System.out.println("-----------�����ˣ��ÿ��Ѿ����˹��ﳵ-----------");
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
				System.out.println("Ŀǰ���ﳵ������Ʒ��Ϊ��" + gwc.size());
				for (ShoppingCart cart : gwc) {
					System.out.println(cart);
				}
			}
			request.getSession().setAttribute("gwc", gwc);  
		}
		return "��ӵ����ﳵ�ɹ�";// ���ظ� ajax ��data
	}
	
	@RequestMapping("queryCart")
	public String doQueryCart(){
		
		String acc = request.getParameter("acc");
		if(acc!=null && acc.equals("100")){
			request.setAttribute("acc", acc);
		}
		
//		�û�δ��¼    
		if (request.getSession().getAttribute("username") == null) {
			Set<ShoppingCart> gwc = (Set<ShoppingCart>) request.getSession()
					.getAttribute("gwc");
		request.getSession().setAttribute("gwc7", gwc);
		}else {
//		�û���¼ 	��ѯ���ݿ�����Ĺ��ﳵ
			User user=commonService.doLogin(request.getSession().getAttribute("username").toString());
			List<ShoppingCart> gwc=commonService.queryCartByUser(user.getUid());
			request.getSession().setAttribute("gwc7", gwc);
		}
		return "/common/shopping-cart.jsp";
	}
	
	
	@RequestMapping("delete")
	public String doDeleteBook() {
		String bId= request.getParameter("bId");
		System.out.println("----------------------------��ɾ�������� ��ȡ��bookId="+bId);
		// �û�δ��¼
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
			System.out.println("-------׼��ɾ��������� Ԫ��");
			while (it.hasNext()) {
					if (it.next().getBook().getbId()==Integer.valueOf(bId)) {
						it.remove();
					}
			}
		 
			//ͨ��book ID ���Set<ShoppingCart> gwc �����д��ڵ� cart	ShoppingCart cart =commonService.getShoppingCart(bId);  ����������������
//			if(gwc.contains(cart)){
//				gwc.remove(cart);
//			}
		request.getSession().setAttribute("gwc7", gwc);
		} else {
			// �û���¼ ����book id ɾ�� ���ݿ�����Ĺ��ﳵ
			User user=commonService.doLogin(request.getSession().getAttribute("username").toString());
			commonService.deleteCart(user.getUid(),Integer.valueOf(bId));
		}
		return "/queryCart.htm";
	}
	
	
	@RequestMapping("order")
	public String  orderBooks() {
		
		System.out.println("�¶���");
//		String books[]=request.getParameterValues("books");
		String bId = request.getParameter("bId");
//		String uid = request.getParameter("uid");
//		System.out.println("ҳ��ѡ�����Ʒ-------------------------"+books);
		System.out.println("bId-------" +bId);
		String[] s=bId.split(",");
		
		User user=commonService.doLogin(request.getSession().getAttribute("username").toString());
		request.getSession().setAttribute("user", user);
		List<ShoppingCart> gwc=new ArrayList<ShoppingCart>();
		System.out.println("=======1============================================================");
		for(int i=0;i<s.length-1;i++){
			System.out.println("========2==============================================================="+s[i]+"s�ĳ���="+s.length);
		ShoppingCart sh=commonService.orderCart(user.getUid(),Integer.parseInt(s[i]));
		System.out.println("========3===============================================================");
		System.out.println("���book������bId"+sh);		
		gwc.add(sh);
		}
		
		//�� ��ѡ����Ʒ���� �µ� ������ ����gwc ���Թ�ѡ�����Ʒɾ��
		request.getSession().setAttribute("gwc7", gwc);
		return "/common/confirmorder.jsp";
		
	}
	
	
	//���ɶ��������浽���ݿ� 
	//						������   ���湴ѡ��Ʒ��gwc ��shoppingcart��  ��carId       �û��ĵ�ַ   ���ϼ�    �Ѹ���/δ���
	@RequestMapping("generateOrder")
	public String generateOrder(){
		
		List<ShoppingCart> gwc7=(List<ShoppingCart>) request.getSession().getAttribute("gwc7");
		User user=commonService.doLogin(request.getSession().getAttribute("username").toString());
		Date date=new Date();
		if (gwc7!=null) {
			for(ShoppingCart selected:gwc7){
				Order th=new Order(date,user,selected.getBook(), selected.getCount(), selected.getTotalMoney(), "������", "������");
				commonService.saveSelectedGoods(th); 
				//���ɶ�����ɾ��
				commonService.deleteCart(user.getUid(), selected.getBook().getbId());
			}
			//�����ɾ��
			request.getSession().removeAttribute("gwc7");
		}
		return "/payon-line/zhifubao.jsp"; 
	}
	
	//֧�� ����  
	//       ������һ�� �����Ľ��ϼ�   �� ��Ҫ��¼֧�����û�   ȷ��֧�� ��Ҫһ�� ֧������  ���û�����ж� �Ƿ��㹻֧�� �㹻�Ļ� ����Ա��Ǯ �û���Ǯ
	
	@RequestMapping("pay")//����ɵ��������й���
	public String payOrder(){
//		��ȡĳ���û��Ķ������ ���м�Ǯ�ܺ�
//		�ж��û��Ƿ�֧����֧���ɹ�  �û���Ǯ  ֧������Ǯ
		return null;
	}
	
	//1.���� order���󵽵�¼ҳ�� 2.��̨����  ��Ʒ��Ƭ�ϴ� 3.��֤��  4.�����Ƽ�
	
	//    �û�������Ϣά�� �����޸� �ҵĶ�����
}
