package com.kh.pop.service.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pop.common.PageInfo;
import com.kh.pop.service.model.vo.CoFileInfo;
import com.kh.pop.service.model.vo.SearchCondition2;
import com.kh.pop.service.model.vo.coBoard;

@Repository("coDAO")
public class coDAO {
	SqlSessionTemplate sqlSession;
	
	// 게시물 총 개수
	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("costMapper.getListCount");
	}

	// 게시물 목록
	public ArrayList<coBoard> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("costMapper.selectList", null, rowBounds);
	}
	
	// 상품 총 갯수
	public int scSearchListCount(SqlSessionTemplate sqlSession, SearchCondition2 sc) {
		return sqlSession.selectOne("costMapper.getSearchListCount", sc);
	}

	// 상품검색
	public ArrayList<coBoard> selectSearchList(SqlSessionTemplate sqlSession, SearchCondition2 sc, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("costMapper.selectSearchList", sc, rowBounds);
	}

	// 게시물 등록
	public int insertcoBoard(SqlSessionTemplate sqlSession, coBoard b) {
		return sqlSession.insert("costMapper.insertcoBoard", b);
	}
	
	// 게시물 파일 등록
	public int insertFile(SqlSessionTemplate sqlSession, CoFileInfo fi) {
		return sqlSession.insert("costMapper.insertFile", fi); 
		}

	public coBoard selectBoard(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("costMapper.selectBoard",bId);
	}
	
	
	public CoFileInfo scdetailFile(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("costMapper.detailFile",bId);
	}
	
	// 게시판 수정기능
	public int updatecoBoard(SqlSessionTemplate sqlSession, coBoard b) {
		System.out.println("DAO board값 " + b);
		return sqlSession.update("costMapper.updatecoBoard",b);
	}

	// 게시판 파일 수정기능
	public int updateFile(SqlSessionTemplate sqlSession, CoFileInfo fi) {
		return sqlSession.update("costMapper.updateFile",fi);
	}
	
	// 삭제 기능
	public int deleteBoard(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.delete("costMapper.deleteBoard",bNo);
	}

	public List<Map> selectRow() {
		return sqlSession.selectList("costMapper.selectList");
	}

	


}
