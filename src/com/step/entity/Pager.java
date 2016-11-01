package com.step.entity;

import java.util.List;
public class Pager<T> {
	//��ҳ   ��Ҫ�õ���Щ���ԣ�  	
	private int pageSize;		//��ǰ��������¼
	private int currentPage;	//��ǰ����ҳ
	private int totalPage;		//��ҳ��
	private long totalCount;		//�ܼ�¼��
	private List<T> dataList;
	
//	��һ�ַ�ҳ  ֻҪ ������   ��Ҫ�ڼ�ҳ��  ��ҳ�ļ�¼���� ����Ҫ��ѯ���ݿ��ŵ� ���ϡ�  �Ϳ��Է���   ��ҳ����������
	public Pager(int pageSize, int currentPage, List<T> list){
		this.totalCount  = list.size();
		this.pageSize =  pageSize;
		this.totalPage = (int) (totalCount/pageSize);
		if(this.totalCount%this.pageSize!=0){
			this.totalPage ++;
		}
		this.currentPage = currentPage>this.totalPage ? this.totalPage : currentPage;
		//�ڼ�ҳ����ʼ�У�������
		int fromIndex = (currentPage-1)*this.pageSize;
		int toIndex = (int) (pageSize*currentPage>totalCount?totalCount:pageSize*currentPage);
		//��Ҫ��ҳ�ļ��� ��ȡ  �� ��ʼ�� �� ������   ������ ����
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
