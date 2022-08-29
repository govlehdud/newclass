package com.kh.pop.common;

public class Pagination {
	public static PageInfo getPageInfo(int currentPage, int listCount) {
		
		PageInfo pi = null;
		
		int pageLimit = 10;		// 한 페이지에서 보여질 페이지 수
		int boardLimit = 5;		// 한 페이지에서 보여줄 게시글 수 
		
		int maxPage = (int)Math.ceil((double)listCount/boardLimit);		// 전체 페이지 중 가장 마지막 페이지
		
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;	// 현제 페이지에서 보여질 페이징 버튼의 시작 페이지
		
		int endPage = startPage + pageLimit - 1;						// 현재 페이지에서 보여질 페이징 버튼의 끝 페이지
		
		
		if(endPage > maxPage) {											// 만약 페이징이 13까지 있다면 , 20까지 표시되는것이아니라
			endPage = maxPage;											// 13까지 표시되는 것 이다.
		}
		
		// PageInfo 생성자를 이용하여 새로운 인스턴스를 생성한다.
		pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		
		return pi;
		
		
	} 

}