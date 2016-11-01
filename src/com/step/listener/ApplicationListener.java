package com.step.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ApplicationListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {

	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		//获取    该项目在 web容器中的绝对路径 ，并保存在application的属性中:获取当前根目录
		sce.getServletContext().setAttribute("ctx", sce.getServletContext().getContextPath());
	}

}
