package com.step.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ApplicationListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {

	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		//��ȡ    ����Ŀ�� web�����еľ���·�� ����������application��������:��ȡ��ǰ��Ŀ¼
		sce.getServletContext().setAttribute("ctx", sce.getServletContext().getContextPath());
	}

}
