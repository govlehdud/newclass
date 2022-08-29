package com.kh.pop.service.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.pop.common.PageInfo;
import com.kh.pop.service.model.vo.IpBoard;
import com.kh.pop.service.model.vo.Member;
import com.kh.pop.service.model.vo.ScBoard;
import com.kh.pop.service.model.vo.ScFileInfo;
import com.kh.pop.service.model.vo.SearchConditionMain;

public interface ipService {

	// loginPage id / pw 담아옴
	Member login(Member vo);

	// mainboard 게시물 수 구하는 count 담아옴
	int getListCount();

	// 게시물 목록 조회
	List<IpBoard> selectList(PageInfo pi);

	// 게시물 검색 목록 갯수
	int getSearchListCount(SearchConditionMain sc);

	// 게시물 검색 목록
	ArrayList<IpBoard> selectSearchList(SearchConditionMain sc, PageInfo pi);

	IpBoard selectBoard(int bId);

	ScFileInfo scdetailFile(int bId);


	
}
