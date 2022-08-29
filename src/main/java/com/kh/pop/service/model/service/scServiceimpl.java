package com.kh.pop.service.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pop.common.PageInfo;
import com.kh.pop.service.model.dao.scDAO;
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

@Service("scService")
public class scServiceimpl implements scService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private scDAO scDAO;
	
	@Override
	public int getListCount() {
		return scDAO.getListCount(sqlSession);
	}

	// 로그인
	@Override
	public Member login(Member vo) {
		return scDAO.getloginBtn(sqlSession,vo);
	}
	
	// 게시물 목록
	@Override
	public ArrayList<ScBoard> selectList(PageInfo pi) {
		return scDAO.selectList(sqlSession, pi);
	}
	
	// 게시물 작성
	@Override 
	public int insertscBoard(ScBoard b, ScFileInfo fi) 
	  { 
		  int result =scDAO.insertscBoard(sqlSession,b);
		  System.out.println(b);
		  if(result > 0){ 
		  
			return scDAO.insertFile(sqlSession, fi); }
		  
		  	return result;
	  }
	
	// 게시물 삭제
	@Override 
	public int deleteBoard(Integer code) { 
		  return scDAO.deleteBoard(sqlSession, code); 
	  }

	@Override
	public ScBoard selectBoard(int bId) {
		return scDAO.selectBoard(sqlSession, bId);
	}

	@Override
	public ScFileInfo scdetailFile(int bId) {
		return scDAO.scdetailFile(sqlSession, bId);
	}


	
	// 게시물 수정
		@Override
		public int updatescBoard(ScBoard b, ScFileInfo fi) {
			
			int result = scDAO.updatescBoard(sqlSession,b);
			System.out.println("serviceimpl file 성공여부 : " + fi);
			System.out.println("serviceimpl scboard 값 : " + b);
			if(result > 0 ) {
				return scDAO.updateFile(sqlSession,fi);
			}
			return scDAO.updatescBoard(sqlSession,b);
		}

		//검색 2종 세트
		@Override
		public int getSearchListCount(SearchCondition sc) {
			return scDAO.scSearchListCount(sqlSession, sc);
		}

		@Override
		public ArrayList<ScBoard> selectSearchList(SearchCondition sc, PageInfo pi) {
			return scDAO.selectSearchList(sqlSession,sc,pi);
		}

	@Override
	public EduBoard selecteduBoard(int bId) {
		return scDAO.selecteduBoard(sqlSession, bId);
	}
	
	// 교육 정보
	@Override
	public int updateEduBoard(EduBoard b) {
		return scDAO.updateEduBoard(sqlSession,b);
	}

	// 자격증 정보
	@Override
	public int updateLicenseBoard(LicenseBoard b) {
		return scDAO.updateLicenseBoard(sqlSession, b);
	}

	@Override
	public LicenseBoard selectlicBoard(int bId) {
		return scDAO.selectlicBoard(sqlSession,bId);	
	}
	
	// 프로젝트 정보
	@Override
	public int updateProjectBoard(projectBoard b) {
		return scDAO.updateProjectBoard(sqlSession,b);
	}

	@Override
	public projectBoard selectproBoard(int bId) {
		return scDAO.selectproBoard(sqlSession,bId);
	}

	@Override
	public int updateCompanyBoard(companyBoard b) {
		return scDAO.updateCompanyBoard(sqlSession,b);
	}

	@Override
	public companyBoard selectcomBoard(int bId) {
		return scDAO.selectcomBoard(sqlSession, bId);
	}

	@Override
	public int updateWorkBoard(workBoard b) {
		return scDAO.updateWorkBoard(sqlSession,b);
	}

	@Override
	public workBoard selectworkBoard(int bId) {
		return scDAO.selectworkBoard(sqlSession,bId);
	}

	@Override
	public int getListCount2() {
		return scDAO.getListCount2(sqlSession);
	}

	@Override
	public ArrayList<clientBoard> selectcblist(PageInfo pi) {
		return scDAO.selectcblist(sqlSession, pi);
	}

	@Override
	public int insertClientBoard(clientBoard b) {
		return scDAO.selectClientBoard(sqlSession, b);
	}


	@Override
	public int getClientSearchListCount(SearchClient sc) {
		return scDAO.getClientSearchListCount(sqlSession, sc);
	}

	@Override
	public ArrayList<clientBoard> selectClientSearchList(SearchClient sc, PageInfo pi) {
		return scDAO.selectClientSearchList(sqlSession,sc,pi);
	}

	@Override
	public int deleteclientBoard(Integer code) {
		return scDAO.deleteclientBoard(sqlSession,code);
	}

	@Override
	public int updateClient(clientBoard b) {
		return scDAO.updateClient(sqlSession,b);
	}

	@Override
	public clientBoard selectClient(Integer code) {
		return scDAO.selectClient(sqlSession,code);
	}

	@Override
	public clientBoard selectnewClient(int val) {
		return scDAO.selectnewClient(sqlSession,val);
	}

	@Override
	public int getList2Count() {
		return scDAO.getList2Count(sqlSession);
	}

	@Override
	public ArrayList<ScBoard> selectList2(PageInfo pi) {
		return scDAO.selectList2(sqlSession,pi);
	}

	@Override
	public int getSearchOutListCount(SearchCondition sc) {
		return scDAO.getSearchOutListCount(sqlSession,sc);
	}

	@Override
	public ArrayList<ScBoard> selectSearchOutList(SearchCondition sc, PageInfo pi) {
		return scDAO.selectSearchOutList(sqlSession,sc,pi);
	}

	@Override
	public int getRListCount() {
		return scDAO.getRListCount(sqlSession);
	}

	@Override
	public List<ScBoard> selectreserveList(PageInfo pi) {
		return scDAO.selectreserveList(sqlSession,pi);
	}

	@Override
	public int getSearchreserveListCount(SearchCondition sc) {
		return scDAO.getSearchreserveListCount(sqlSession,sc);
	}

	@Override
	public ArrayList<ScBoard> selectSearchreserveList(SearchCondition sc, PageInfo pi) {
		return scDAO.selectSearchreserveList(sqlSession,sc,pi);
	}

	@Override
	public LicenseBoard selectlicBoardget(EduBoard b) {
		return scDAO.selectlicBoardget(sqlSession,b);
	}

	@Override
	public int updateLicenseTechBoard(LicenseBoard licenseBoard) {
		return scDAO.updateLicenseTechBoard(sqlSession,licenseBoard);
	}

	@Override
	public int updateProjectBoardGet(projectBoard projectBoard) {
		return scDAO.updateProjectBoardGet(sqlSession,projectBoard);
	}

	@Override
	public int updateEduBoard(int bId) {
		return scDAO.updateEduBoard(sqlSession, bId);
	}

	@Override
	public LicenseBoard selectLicenseBoard(int bId) {
		return scDAO.selectLicenseBoard(sqlSession,bId);
	}

	@Override
	public projectBoard selectProjectBoard(int bId) {
		return scDAO.selectProjectBoard(sqlSession,bId);
	}

	@Override
	public companyBoard selectCompanyBoard(int bId) {
		return scDAO.selectCompanyBoard(sqlSession,bId);
	}

	@Override
	public ScBoard selectSceduBoard(int bId) {
		return scDAO.selectSceduBoard(sqlSession,bId);
	}

	

}
