package com.step.filter参考;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;


public class LoginFilter implements Filter {
	String urlParam;
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) req;

		String path = request.getRequestURI(); // 获取请求的全路径
		
		// 有在 urlParam 里配置 的页面 才能访问
		if (urlParam!=null&&urlParam!="") { 
			String[] urlArray = urlParam.split(";");
			for (String u : urlArray) {
				if (path.indexOf(u) != -1) {  // 对请求的全路径 判断 参数里面是否 包含  
					chain.doFilter(req, resp);  //包含 ,让程序往下 执行
					return;
				}
			}

		}
		// 已经登陆成功的用户 可以访问
		if (request.getSession().getAttribute("username") != null) {
			chain.doFilter(req, resp);
			return;
		} else {
			request.getRequestDispatcher(request.getContextPath()+"/login.jsp").forward(req, resp);
		}
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		urlParam = config.getInitParameter("urlParam");
	}

}
