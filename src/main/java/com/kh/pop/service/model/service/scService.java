package com.kh.pop.service.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.pop.common.PageInfo;
import com.kh.pop.service.model.vo.EduBoard;
import com.kh.pop.service.model.vo.LicenseBoard;
import com.kh.pop.service.model.vo.Member;
import com.kh.pop.service.model.vo.ScBoard;
import com.kh.pop.service.model.vo.ScFileInfo;
import com.kh.pop.service.model.vo.SearchClient;
import com.kh.pop.service.model.vo.SearchCondition;
import com.kh.pop.service.model.vo.clientBoard;
import com.kh.pop.service.model.vo.companyBoard;
import com.kh.pop.service.model.vo.projectBoard;
import com.kh.pop.service.model.vo.workBoard;

public interface scService {
	
	int getListCount();

	// 게시물 목록
	ArrayList<ScBoard> selectList(PageInfo pi);
	
	// 게시물 작성
	 int insertscBoard(ScBoard b, ScFileInfo fi);
	
	 // 게시물 수정
	 int updatescBoard(ScBoard b, ScFileInfo fi);
	 
	 // 게시물 삭제
	 int deleteBoard(Integer code);
	 
	ScBoard selectBoard(int bId);

	ScFileInfo scdetailFile(int bId);



	ArrayList<ScBoard> selectSearchList(SearchCondition sc, PageInfo pi);

	Member login(Member vo);

//	int updateEduBoard(ScBoard scb);
	
	int updateEduBoard(EduBoard b);

	LicenseBoard selectlicBoard(int bId);
	
	EduBoard selecteduBoard(int bId);

	int updateLicenseBoard(LicenseBoard b);


	int updateProjectBoard(projectBoard b);

	projectBoard selectproBoard(int bId);

	int updateCompanyBoard(companyBoard b);

	companyBoard selectcomBoard(int bId);

	int updateWorkBoard(workBoard b);

	workBoard selectworkBoard(int bId);

	int getListCount2();

	ArrayList<clientBoard> selectcblist(PageInfo pi);

	int insertClientBoard(clientBoard b);

	int getSearchListCount(SearchCondition sc);

//	int getSearchClientCount(SearchClient sc);
	
	int getClientSearchListCount(SearchClient sc);

	ArrayList<clientBoard> selectClientSearchList(SearchClient sc, PageInfo pi);

	int deleteclientBoard(Integer code);

	int updateClient(clientBoard b);

	clientBoard selectClient(Integer code);

	clientBoard selectnewClient(int val);

	int getList2Count();

	ArrayList<ScBoard> selectList2(PageInfo pi);

	int getSearchOutListCount(SearchCondition sc);

	ArrayList<ScBoard> selectSearchOutList(SearchCondition sc, PageInfo pi);

	int getRListCount();

	List<ScBoard> selectreserveList(PageInfo pi);

	int getSearchreserveListCount(SearchCondition sc);

	ArrayList<ScBoard> selectSearchreserveList(SearchCondition sc, PageInfo pi);

	LicenseBoard selectlicBoardget(EduBoard b);


	int updateLicenseTechBoard(LicenseBoard licenseBoard);

	int updateProjectBoardGet(projectBoard projectBoard);

	int updateEduBoard(int bId);

	LicenseBoard selectLicenseBoard(int bId);

	projectBoard selectProjectBoard(int bId);

	companyBoard selectCompanyBoard(int bId);

	ScBoard selectSceduBoard(int bId);

//	select 시도
//	EduBoard selectEduBoard();

	

}
