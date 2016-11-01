package com.step.filter�ο�;

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

		String path = request.getRequestURI(); // ��ȡ�����ȫ·��
		
		// ���� urlParam ������ ��ҳ�� ���ܷ���
		if (urlParam!=null&&urlParam!="") { 
			String[] urlArray = urlParam.split(";");
			for (String u : urlArray) {
				if (path.indexOf(u) != -1) {  // �������ȫ·�� �ж� ���������Ƿ� ����  
					chain.doFilter(req, resp);  //���� ,�ó������� ִ��
					return;
				}
			}

		}
		// �Ѿ���½�ɹ����û� ���Է���
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
