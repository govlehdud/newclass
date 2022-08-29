package com.kh.pop.common;

public class PageInfo {
	
	
	private int currentPage;// 현재 페이지      pageNum == currentPage
	private int listCount;	// 페이지에 들어갈 갯수 구하는변수 
	private int pageLimit;	// 한 페이지당 갯수    amount와 같다
	private int maxPage;	// 최대 페이지
	private int startPage;	// 시작페이지
	private int endPage;	// 끝페이지
	
	private int boardLimit;	// 한 페이지당 게시글 얼마나 들어갈지
	
	
	
	public PageInfo(int currentPage, int listCount, int pageLimit, int maxPage, int startPage, int endPage,
			int boardLimit) {
		super();
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.pageLimit = pageLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.boardLimit = boardLimit;
	}




	public int getListCount() {
		return listCount;
	}




	public void setListCount(int listCount) {
		this.listCount = listCount;
	}




	public int getPageLimit() {
		return pageLimit;
	}




	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}




	public int getMaxPage() {
		return maxPage;
	}




	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}




	public int getStartPage() {
		return startPage;
	}




	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}




	public int getEndPage() {
		return endPage;
	}




	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}




	public int getBoardLimit() {
		return boardLimit;
	}




	public void setBoardLimit(int boardLimit) {
		this.boardLimit = boardLimit;
	}




	public int getCurrentPage() {
		return currentPage;
	}




	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}




	@Override
	public String toString() {
		return "PageInfo [listCount=" + listCount + ", pageLimit=" + pageLimit + ", maxPage=" + maxPage + ", startPage="
				+ startPage + ", endPage=" + endPage + ", boardLimit=" + boardLimit + ", currentPage=" + currentPage
				+ "]";
	}





	
	
	
}
