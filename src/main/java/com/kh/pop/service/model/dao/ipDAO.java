package com.kh.pop.service.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pop.common.PageInfo;
import com.kh.pop.service.model.vo.IpBoard;
import com.kh.pop.service.model.vo.Member;
import com.kh.pop.service.model.vo.ScBoard;
import com.kh.pop.service.model.vo.ScFileInfo;
import com.kh.pop.service.model.vo.SearchConditionMain;

@Repository("ipDAO")
public class ipDAO {
	SqlSessionTemplate sqlSession;
	
	public Member getloginBtn(SqlSessionTemplate sqlSession, Member vo) {
		System.out.println("dao값: "+vo);
		return sqlSession.selectOne("interpiaMapper.getloginBtn",vo);
	}
	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("interpiaMapper.getListCount");
	}
	public List<IpBoard> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("interpiaMapper.selectList",null,rowBounds);
	}
	public ArrayList<IpBoard> selectSearchList(SqlSessionTemplate sqlSession, SearchConditionMain sc, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("interpiaMapper.selectSearchList",sc,rowBounds);
	}
	public int ipSearchListCount(SqlSessionTemplate sqlSession, SearchConditionMain sc) {
		return sqlSession.selectOne("interpiaMapper.getSearchListCount",sc);
	}
	public IpBoard selectBoard(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("interpiaMapper.selectBoard",bId);
	}
	public ScFileInfo scDetailFile(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("interpiaMapper.scDetailFile",bId);
	}

	


}
