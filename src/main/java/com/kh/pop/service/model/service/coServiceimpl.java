package com.kh.pop.service.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pop.common.PageInfo;
import com.kh.pop.service.model.dao.coDAO;
import com.kh.pop.service.model.vo.CoFileInfo;
import com.kh.pop.service.model.vo.SearchCondition2;
import com.kh.pop.service.model.vo.coBoard;

@Service("coService")
public class coServiceimpl implements coService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private coDAO coDAO;
	
	// 게시물 총 갯수
	@Override
	public int getListCount() {
		return coDAO.getListCount(sqlSession);
	}
	
	// 게시물 목록
	@Override
	public ArrayList<coBoard> selectList(PageInfo pi) {
		return coDAO.selectList(sqlSession, pi);
	}

	// 게시물 검색 총 갯수
	@Override
	public int getSearchListCount(SearchCondition2 sc2) {
		return coDAO.scSearchListCount(sqlSession, sc2);
	}

	@Override
	public ArrayList<coBoard> selectSearchList(SearchCondition2 sc2, PageInfo pi) {
		return coDAO.selectSearchList(sqlSession,sc2,pi);
	}

	@Override
	public int insertcoBoard(coBoard b, CoFileInfo fi) {
		int result = coDAO.insertcoBoard(sqlSession,b);
		  if(result > 0){ 
			return coDAO.insertFile(sqlSession, fi);
			}
		  	return result;
	}

	@Override
	public coBoard selectBoard(int bId) {
		return coDAO.selectBoard(sqlSession, bId);
	}

	@Override
	public CoFileInfo scdetailFile(int bId) {
		return coDAO.scdetailFile(sqlSession,bId);
	}

	// 수정기능
	@Override
	public int updatecoBoard(coBoard b, CoFileInfo fi) {
		int result = coDAO.updatecoBoard(sqlSession,b);
		System.out.println("serviceimpl 성공여부 : " + result);
		System.out.println("serviceimpl coboard 값 : " + b);
		if(result > 0 ) {
			return coDAO.updateFile(sqlSession,fi);
		}
		return result;
	}

	// 삭제 기능
	@Override
	public int delete(int bNo) {
		return coDAO.deleteBoard(sqlSession, bNo);
	}


	@Override
	public List<Map> selectRow() {
		return coDAO.selectRow();
	}


	
	
	
}
