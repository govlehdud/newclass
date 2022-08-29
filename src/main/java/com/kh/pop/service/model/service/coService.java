package com.kh.pop.service.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.pop.common.PageInfo;
import com.kh.pop.service.model.vo.CoFileInfo;
import com.kh.pop.service.model.vo.SearchCondition2;
import com.kh.pop.service.model.vo.coBoard;

public interface coService {
	// 게시물 총 개수
	int getListCount();

	// 게시물 목록
	ArrayList<coBoard> selectList(PageInfo pi);
	
	
	
	// 게시물 검색 목록
	ArrayList<coBoard> selectSearchList(SearchCondition2 sc2, PageInfo pi);
	
	// 게시물 검색 수
	int getSearchListCount(SearchCondition2 sc2);

	// 게시물 등록
	int insertcoBoard(coBoard b, CoFileInfo fi);

	
	// popup을 이용한 게시물 상세보기
	coBoard selectBoard(int bId);
	CoFileInfo scdetailFile(int bId);

	int updatecoBoard(coBoard b, CoFileInfo fi);

	int delete(int bNo);

	List<Map> selectRow();

	
}
