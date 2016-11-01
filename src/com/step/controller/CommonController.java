package com.step.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.step.entity.ShoppingCart;
import com.step.entity.User;
import com.step.service.CommonService;
import com.step.util.Constants;
import com.step.util.RandomValidateCode;

@Controller
public class CommonController {

	@Resource
	HttpServletRequest request;
	
	@Resource
	HttpServletResponse response;

	@Resource
	private CommonService commonService;
	
//	public void setCommonService(CommonService commonService){
//		this.commonService = commonService;
//	}
//	
//	public void res(){
//		CommonService commonService = new CommonServiceImpl();
//		setCommonService(commonService);
//	}

	@Resource
	RandomValidateCode code;
	
	@RequestMapping("/vcode")
	public void vcode(HttpServletRequest request, HttpServletResponse response){
		code.getRandcode(request, response);
	}	
//	
//	@RequestMapping("/doRegister")
//	public String doLogin(HttpServletRequest request, HttpServletResponse response, @RequestParam String vcode){
//		
//		
//		
//	}	

	@RequestMapping("doRegister")
	public String doRegister(@RequestParam String vcode) {
		String sessionCode = (String)request.getSession().getAttribute(Constants.RANDOM_CODE_KEY);
		if (vcode.equals(sessionCode)) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
//			String sex = request.getParameter("sex");
			String email = request.getParameter("email");
//			String tel = request.getParameter("tel");
			String address = request.getParameter("ADRESS");
//			String idcard = request.getParameter("idcard");

			User user = new User();

			user.setEmail(email);
			user.setPassword(password);
			user.setUsername(username);
			user.setAddress(address);
			int cunt = commonService.adduser(user);
			System.out.println("ע��ɹ�");
			request.setAttribute("tipsreg", "��ϲ��"+username+"  �û�ע��ɹ����볢�Ե�¼:");
			return "/common/loginandregister.jsp";
		}else {
			request.setAttribute("error", "��֤�����");
			return "common/loginandregister.jsp";
		}
		
	}

	@RequestMapping("/Login")
	public String doLogin() throws UnsupportedEncodingException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String flag = request.getParameter("flag");
		
		
		String[] REMEMBER = request.getParameterValues("REMEMBER");
	// ͨ��Cookie ʵ�� ���� ����              		     	 
		Cookie passCookie = new Cookie("password", password);
		if (REMEMBER != null) {  //��� �� �� ���ͱ���
			passCookie.setMaxAge(3600 * 240);
			response.addCookie(passCookie);
		} else {
			passCookie.setMaxAge(0);
			response.addCookie(passCookie);
		}
												
		System.out.print("�����¼��flag="+flag);
		
		User user=null;
		if ("1".equals(flag)) {
			System.out.println("��ͨ�û���½,username="+username);
			user = commonService.doLogin(username);
			System.out.println("111user="+user);


			if (user==null) {
				request.setAttribute("tips", "�û����Ҳ���");
				return "/common/loginandregister.jsp";
			} else {
				if (password.equals(user.getPassword())) {
					System.out.println("��ϲ������½�ɹ�����");
					Set<ShoppingCart> gwc = (Set<ShoppingCart>) request.getSession()
							.getAttribute("gwc");
					
					if(gwc!=null){
						for (ShoppingCart e : gwc) {
							e.setUser(user);
							e.setTotalMoney(e.getBook().getPrice()*e.getCount());
							commonService.addToCart(e);
//							gwc.remove(e);
						}
					}
					request.getSession().removeAttribute("gwc");
					request.getSession().setAttribute("username", username); // Ϊ��½�ɹ����û�����һ��session����,�ڵ�¼�Ĺ��ﳵ(������)���õ�
					request.setAttribute("user", user); // Ϊ��½�ɹ����û�����һ��user �鿴����
					
					
					return "/query.htm";
				} else {
					request.setAttribute("tips", "���벻ƥ��");
					return "/common/loginandregister.jsp";
				}
			}
			
			
			
			
		
			

		}
		if (flag == "2") {
			// ����Ա��½
			
			
			
		}

		

		return null;

	}
	
	@RequestMapping("/logout")
	public String logout() {
		request.getSession().removeAttribute("username");
		return "/homePage.jsp";
	}
	
	@RequestMapping("/oneUpload")
	public String oneUpload(@RequestParam("imageFile") MultipartFile imageFile, HttpServletRequest request){
		 //�õ��ϴ��ļ��ı���Ŀ¼�����ϴ����ļ������WEB-INFĿ¼�£����������ֱ�ӷ��ʣ���֤�ϴ��ļ��İ�ȫ
//		String uploadUrl = request.getSession().getServletContext().getRealPath("/WEB-INF/upload");
		String uploadUrl = "E:\\bookShop\\WebContent\\upload\\";
		String filename = imageFile.getOriginalFilename();
		
		File dir = new File(uploadUrl);
		if (!dir.exists()) {     //�ж��ϴ��ļ��ı���Ŀ¼�Ƿ����
			dir.mkdirs();
		}
		
		File targetFile = new File(uploadUrl + filename);
		if (!targetFile.exists()) {
			try {
				targetFile.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		try {
			imageFile.transferTo(targetFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
//		String filename = imageFile.getOriginalFilename();
		String image=filename;
		String type_tId=request.getParameter("type_tId");
		String price=request.getParameter("price");
		String stock=request.getParameter("stock");
		String described=request.getParameter("described");
//		Book book=new Book(image,Double.valueOf(price), described, type_tId, stock);
		commonService.addbook(image,Double.valueOf(price), described,Integer.parseInt(type_tId), Integer.parseInt(stock));
		
		return "common/shop.jsp";
	}




	
}
