package com.step.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		System.out.println("...afterCompletion");
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		System.out.println("...postHandle");
	}

	@Override
	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2) throws Exception {

		// 已经登陆成功的用户 可以访问
		if (arg0.getSession().getAttribute("username") == null) {
//			javax.swing.JOptionPane.showConfirmDialog(null, "请先登陆");
			arg1.sendRedirect(arg0.getContextPath()+"/queryCart.htm?acc=100");
		 
			return false;
		}
		return true;
	}
}
