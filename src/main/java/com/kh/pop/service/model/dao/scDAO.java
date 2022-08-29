package com.kh.pop.service.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

@Repository("scDAO")
public class scDAO {
	SqlSessionTemplate sqlSession;
	
	// login 
	public Member getloginBtn(SqlSessionTemplate sqlSession, Member vo) {
		return sqlSession.selectOne("serviceMapper.getloginBtn",vo);
	}
	
	
	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("serviceMapper.getListCount");
	}

	
	// 게시물 목록
	public ArrayList<ScBoard> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		// ex) 현재페이지 5, 한 페이지에 보여질 게시글 수 10개		
		// 5 - 1 = 4,
		// 4 * 10 = 40
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		
//		sqlSession.selectList()의 return 값이 List<t>이기 때문에
//		(ArrayList)로 다운 캐스팅의 형변환을 해주어야한다.
		return (ArrayList)sqlSession.selectList("serviceMapper.selectList", null, rowBounds);
	}

	  // 게시물 파일 등록
	  public int insertFile(SqlSessionTemplate sqlSession, ScFileInfo fi) {
	  return sqlSession.insert("serviceMapper.insertFile", fi); }
	  
	  // 게시물 등록
	  public int insertscBoard(SqlSessionTemplate sqlSession, ScBoard b) { 
		  return sqlSession.insert("serviceMapper.insertscBoard",b); 
	  }
	  
	  
	  // 게시물 삭제
	  public int deleteBoard(SqlSessionTemplate sqlSession, int code){ 
		  return sqlSession.update("serviceMapper.deleteBoard", code); 
	  }

	public ScBoard selectBoard(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("serviceMapper.selectBoard",bId);
	}
	

	public ScFileInfo scdetailFile(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("serviceMapper.detailFile",bId);
	}

	public int scSearchListCount(SqlSessionTemplate sqlSession, SearchCondition sc) {
		return sqlSession.selectOne("serviceMapper.getSearchListCount", sc);
	}

	public ArrayList<ScBoard> selectSearchList(SqlSessionTemplate sqlSession, SearchCondition sc, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("serviceMapper.selectSearchList", sc, rowBounds);
	}

	
	
	
	
	// 게시판 파일 수정기능
	public int updateFile(SqlSessionTemplate sqlSession, ScFileInfo fi) {
		return sqlSession.update("serviceMapper.updateFile",fi);
	}
	
	// 게시판 수정기능
			public int updatescBoard(SqlSessionTemplate sqlSession, ScBoard b) {
				return  sqlSession.update("serviceMapper.updatescBoard",b);
	}


	public int updateEduBoard(SqlSessionTemplate sqlSession, EduBoard b) {
		return sqlSession.update("serviceMapper.updateEduBoard",b);
	}


	public EduBoard selecteduBoard(SqlSessionTemplate sqlSession,int bId) {
		return sqlSession.selectOne("serviceMapper.selecteduBoard",bId);	
		}


	public int updateLicenseBoard(SqlSessionTemplate sqlSession, LicenseBoard b) {
		return sqlSession.update("serviceMapper.updateLicenseBoard",b);
	}


	public LicenseBoard selectlicBoard(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("serviceMapper.selectlicBoard",bId);
	}

	
	// ProjectBoard -> UPDATE
	public int updateProjectBoard(SqlSessionTemplate sqlSession, projectBoard b) {
		return sqlSession.update("serviceMapper.updateProjectBoard",b);
	}


	public projectBoard selectproBoard(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("serviceMapper.selectproBoard",bId);
	}


	public int updateCompanyBoard(SqlSessionTemplate sqlSession, companyBoard b) {
	return sqlSession.update("serviceMapper.updateCompanyBoard",b);
	}


	public companyBoard selectcomBoard(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("serviceMapper.selectcomBoard",bId);
	}


	public int updateWorkBoard(SqlSessionTemplate sqlSession, workBoard b) {
		return sqlSession.update("serviceMapper.updateWorkBoard", b);
	}


	public workBoard selectworkBoard(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("serviceMapper.selectworkBoard",bId);
	}

	public int selectClientBoard(SqlSessionTemplate sqlSession, clientBoard b) {
		return sqlSession.insert("serviceMapper.selectClientBoard",b);
	}

	public int getListCount2(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("serviceMapper.selectListCount2");
	}


	public ArrayList<clientBoard> selectcblist(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("serviceMapper.selectcblist", null, rowBounds);
	}




	public int getClientSearchListCount(SqlSessionTemplate sqlSession, SearchClient sc) {
		return sqlSession.selectOne("serviceMapper.getClientSearchListCount",sc);
	}


	public ArrayList<clientBoard> selectClientSearchList(SqlSessionTemplate sqlSession, SearchClient sc, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("serviceMapper.selectClientSearchList", sc, rowBounds);
	}


	public int deleteclientBoard(SqlSessionTemplate sqlSession, int code) {
		return sqlSession.update("serviceMapper.deleteclientBoard",code);
	}


	public int updateClient(SqlSessionTemplate sqlSession, clientBoard b) {
		return sqlSession.update("serviceMapper.updateClient",b);
	}


	public clientBoard selectClient(SqlSessionTemplate sqlSession, int code) {
		return sqlSession.selectOne("serviceMapper.selectClient",code);
	}


	public clientBoard selectnewClient(SqlSessionTemplate sqlSession, int val) {
		return sqlSession.selectOne("serviceMapper.selectnewClient",val);
	}


	public int getList2Count(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("serviceMapper.getList2Count");
	}


	public ArrayList<ScBoard> selectList2(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("serviceMapper.selectList2", null, rowBounds);
	}


	public int getSearchOutListCount(SqlSessionTemplate sqlSession, SearchCondition sc) {
		return sqlSession.selectOne("serviceMapper.getSearchOutListCount",sc);
	}


	public ArrayList<ScBoard> selectSearchOutList(SqlSessionTemplate sqlSession, SearchCondition sc, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("serviceMapper.selectSearchOutList", sc, rowBounds);
	}


	public int getRListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("serviceMapper.getRListCount");
	}


	public List<ScBoard> selectreserveList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("serviceMapper.selectreserveList",null,rowBounds);
	}


	public int getSearchreserveListCount(SqlSessionTemplate sqlSession, SearchCondition sc) {
		return sqlSession.selectOne("serviceMapper.getSearchreserveListCount",sc);
	}


	public ArrayList<ScBoard> selectSearchreserveList(SqlSessionTemplate sqlSession, SearchCondition sc, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("serviceMapper.selectSearchreserveList", sc, rowBounds);

	}


	public LicenseBoard selectlicBoardget(SqlSessionTemplate sqlSession, EduBoard b) {
		return sqlSession.selectOne("serviceMapper.selectlicBoardget",b);
	}


	public int updateLicenseTechBoard(SqlSessionTemplate sqlSession, LicenseBoard licenseBoard) {
		return sqlSession.update("serviceMapper.updateLicenseTechBoard",licenseBoard);
	}


	public int updateProjectBoardGet(SqlSessionTemplate sqlSession, projectBoard projectBoard) {
		return sqlSession.update("serviceMapper.updateProjectBoardGet",projectBoard);
	}


	public int updateEduBoard(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("serviceMapper.updateEduBoard",bId);
	}


	public LicenseBoard selectLicenseBoard(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("serviceMapper.selectLicenseBoard", bId);
	}


	public projectBoard selectProjectBoard(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("serviceMapper.selectProjectBoard",bId);
	}


	public companyBoard selectCompanyBoard(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("serviceMapper.selectCompanyBoard",bId);
	}


	public ScBoard selectSceduBoard(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("serviceMapper.selectSceduBoard",bId);
	}
	


	

}
