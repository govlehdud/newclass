package com.kh.pop.service.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pop.common.PageInfo;
import com.kh.pop.service.model.dao.ipDAO;
import com.kh.pop.service.model.vo.IpBoard;
import com.kh.pop.service.model.vo.Member;
import com.kh.pop.service.model.vo.ScBoard;
import com.kh.pop.service.model.vo.ScFileInfo;
import com.kh.pop.service.model.vo.SearchCondition;
import com.kh.pop.service.model.vo.SearchConditionMain;

@Service("ipService")
public class ipServiceimpl implements ipService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ipDAO ipDAO;

	@Override
	public Member login(Member vo) {
		return ipDAO.getloginBtn(sqlSession,vo);
	}

	@Override
	public int getListCount() {
		return ipDAO.getListCount(sqlSession);
	}

	@Override
	public List<IpBoard> selectList(PageInfo pi) {
		return ipDAO.selectList(sqlSession,pi);
	}

	@Override
	public int getSearchListCount(SearchConditionMain sc) {
		return ipDAO.ipSearchListCount(sqlSession, sc);
	}

	@Override
	public ArrayList<IpBoard> selectSearchList(SearchConditionMain sc, PageInfo pi) {
		return ipDAO.selectSearchList(sqlSession,sc,pi);
	}

	@Override
	public IpBoard selectBoard(int bId) {
		return ipDAO.selectBoard(sqlSession,bId);
	}

	@Override
	public ScFileInfo scdetailFile(int bId) {
		return ipDAO.scDetailFile(sqlSession,bId);
	}


	
	
	
}
