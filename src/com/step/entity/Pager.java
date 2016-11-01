package com.step.entity;

import java.util.List;
public class Pager<T> {
	//分页   需要得到这些属性：  	
	private int pageSize;		//当前多少条记录
	private int currentPage;	//当前多少页
	private int totalPage;		//总页数
	private long totalCount;		//总记录数
	private List<T> dataList;
	
//	第一种分页  只要 传过来   【要第几页】  【页的记录数】 【对要查询数据库表放的 集合】  就可以返回   分页的所有属性
	public Pager(int pageSize, int currentPage, List<T> list){
		this.totalCount  = list.size();
		this.pageSize =  pageSize;
		this.totalPage = (int) (totalCount/pageSize);
		if(this.totalCount%this.pageSize!=0){
			this.totalPage ++;
		}
		this.currentPage = currentPage>this.totalPage ? this.totalPage : currentPage;
		//第几页的起始行，结束行
		int fromIndex = (currentPage-1)*this.pageSize;
		int toIndex = (int) (pageSize*currentPage>totalCount?totalCount:pageSize*currentPage);
		//对要分页的集合 截取  从 起始行 到 结束行   并放入 集合
		this.dataList = (List<T>) list.subList(fromIndex, toIndex);
	}

	public Pager(int pageSize, int currentPage, int totalPage, long totalCount, List<T> list){
		this.pageSize = pageSize;
		this.currentPage = currentPage;
		this.totalPage = totalPage;
		this.totalCount = totalCount;
		this.dataList = list;
	}
	
	public Pager(){
		
	}
	
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public List<T> getDataList() {
		return dataList;
	}
	public void setDataList(List<T> dataList) {
		this.dataList = dataList;
	}

	public long getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(long totalCount) {
		this.totalCount = totalCount;
	}
	
}
