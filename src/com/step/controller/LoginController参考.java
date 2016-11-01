package com.step.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.step.entity.ShoppingCart;
import com.step.entity.User;


@Controller
@RequestMapping("user")
public class LoginController参考 {
	
	@Resource
	HttpServletRequest request;

	
	@ResponseBody
//	@RequestMapping("login")
	public ModelAndView login(String username){
		
		System.out.println("login...."+username);
		
		return new ModelAndView("/success.jsp");
	}
	
//	@RequestMapping("register")
	public String register(){
		
		System.out.println("register....");
		
		return "/register.jsp";
	}
	
//	@RequestMapping("doRegister1")
	public String doRegister1(){
		
		String username = request.getParameter("username");
		
		String password = request.getParameter("password");
		
		System.out.println("username="+username+"password="+password);
		
		request.setAttribute("tips", "恭喜你啊,终于成功了！");
		request.setAttribute("username", username);
		
		return "/registerSuccess.jsp";
		
	}
	
//	@RequestMapping("doRegister")
	public ModelAndView doRegister2(String username,String password){
		
		System.out.println("username="+username+"\n"+"password="+password);
		
		Map<String,String> map = new HashMap<String,String>();
		
		map.put("username", username);
		map.put("tips", "呵呵呵,终于成功了！");
		
		return new ModelAndView("/registerSuccess.jsp","maps", map);
	}
	
//	@RequestMapping(value="doRegister",method=RequestMethod.GET,params="param1=2")
	public ModelAndView doRegister1(User user){
		
		System.out.println("username="+user.getUsername()+"\n"+"password="+user.getPassword());
		
		Map<String,String> map = new HashMap<String,String>();
		
		map.put("username", user.getUsername());
		map.put("tips", "呵呵呵,终于成功了！");
		
		return new ModelAndView("/registerSuccess.jsp","maps", map);
	}
	
}
