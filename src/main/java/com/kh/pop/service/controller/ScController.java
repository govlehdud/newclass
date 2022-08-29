package com.kh.pop.service.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pop.common.PageInfo;
import com.kh.pop.common.Pagination;
import com.kh.pop.service.model.service.scService;
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

import oracle.jdbc.proxy.annotation.Post;

@Controller
public class ScController {

	
	
	@Autowired
	private scService scService;

	// 로그인버튼
	@RequestMapping(value = "/loginbtn", method = RequestMethod.POST)
	public String loginBtn(@ModelAttribute Member vo, HttpServletRequest request, HttpSession session)
			throws Exception {
		session = request.getSession();
		System.out.println(vo);
		Member member = scService.login(vo);
		System.out.println(member);
		if (member == null) {
			throw new Exception("값이 비어있습니다.");

		} else {
			session.setAttribute("login", member);
			return "home2";

		}
	}
	
	
	// Main Page
	@RequestMapping("interpia.sc")
	public ModelAndView Interpia(@RequestParam(value = "page",		// 태그의 name값
									required = false)				// 파라미터 필수 입력 여부
									Integer page, ModelAndView mv,
			HttpSession session) throws Exception {
		int currentPage = 1; // null 값 대신 1값을 주기위해
		if (page != null) {
			currentPage = page;
		}
		
		// 게시글 총 갯수 
		int listCount = scService.getListCount();

		// 클릭한 페이지, 총 게시글 수 전달
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		List<ScBoard> sclist = scService.selectList(pi);

		// 게시글이 null이 아니라면 jsp로 전송
		if (sclist != null) {
			mv.addObject("sclist", sclist).addObject("pi", pi).setViewName("interpia");

		} else {
			throw new Exception(".");
		}
		return mv;
	}
	// 퇴직자 명단
	@RequestMapping("interpia2.sc")
	public ModelAndView Interpia2(@RequestParam(value = "page", required = false) Integer page, ModelAndView mv,
			HttpSession session) throws Exception {
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		int listCount = scService.getList2Count();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		List<ScBoard> sclist = scService.selectList2(pi);
		
		// 게시글이 null이 아니라면 jsp로 전송
		if (sclist != null) {
			mv.addObject("sclist", sclist).addObject("pi", pi).setViewName("interpia2");
			
		} else {
			throw new Exception(".");
		}
		return mv;
	}

	// 게시판 검색
	@RequestMapping("search.sc")
	public ModelAndView searchBoard2(@RequestParam("searchCondition") String searchCondition,
			@RequestParam("searchValue") String searchValue, ModelAndView mv, HttpServletRequest request)
			throws Exception {
		SearchCondition sc = new SearchCondition();

		if (searchCondition.equals("inumber1")) {
			sc.setInumber1(searchValue);
		} else if (searchCondition.equals("gender")) {
			sc.setGender(searchValue);
		} else if (searchCondition.equals("kname")) {
			sc.setKname(searchValue);
		} else if (searchCondition.equals("annual")) {
			sc.setAnnual(searchValue);
		} else if (searchCondition.equals("address2")) {
			sc.setAddress2(searchValue);
		}

		int currentPage = 1;
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		int listCount = scService.getSearchListCount(sc);

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<ScBoard> List = scService.selectSearchList(sc, pi);

		if (List != null) {
			mv.addObject("list", List).addObject("pi", pi).addObject("searchCondition", searchCondition)
					.addObject("searchValue", searchValue).setViewName("interpia");
		} else {
			throw new Exception("게시글 검색 조회에 실패하였습니다.");
		}

		return mv;

	}
	
	
	// 퇴직자 게시판 검색
	@RequestMapping("outsearch.sc")
	public ModelAndView outsearchBoard2(@RequestParam("searchCondition") String searchCondition,
			@RequestParam("searchValue") String searchValue, ModelAndView mv, HttpServletRequest request)
					throws Exception {
		SearchCondition sc = new SearchCondition();
		
		if (searchCondition.equals("inumber1")) {
			sc.setInumber1(searchValue);
		} else if (searchCondition.equals("gender")) {
			sc.setGender(searchValue);
		} else if (searchCondition.equals("kname")) {
			sc.setKname(searchValue);
		} else if (searchCondition.equals("annual")) {
			sc.setAnnual(searchValue);
		} else if (searchCondition.equals("address2")) {
			sc.setAddress2(searchValue);
		}
		
		int currentPage = 1;
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = scService.getSearchOutListCount(sc);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<ScBoard> List = scService.selectSearchOutList(sc, pi);
		
		if (List != null) {
			mv.addObject("list", List).addObject("pi", pi).addObject("searchCondition", searchCondition)
			.addObject("searchValue", searchValue).setViewName("interpia2");
		} else {
			throw new Exception("게시글 검색 조회에 실패하였습니다.");
		}
		
		return mv;
		
	}

	// 게시물 상세보기
	@RequestMapping("scBoard.sc")
	// public String scBoard(@RequestParam("page") int page,@RequestParam("bId")int
	// bId, ModelAndView mv, HttpServletRequest request) throws Exception{
	public ModelAndView scBoard(@RequestParam("page") int page, @RequestParam("bId") int bId, ModelAndView mv)
			throws Exception {

		ScBoard scboard = scService.selectBoard(bId);

		if (scboard != null) {

			mv.addObject("page", page).addObject("board", scboard).setViewName("scBoard");

		} else {
			throw new Exception(".");
		}
		System.out.println("상세보기mv 값 : " + mv);
		return mv;
		// return "eduinfoupdate";

	}

	// File 저장 공식
	public ScFileInfo saveFile(MultipartFile uploadFile, HttpServletRequest request) {
		ScFileInfo scfi = new ScFileInfo();

		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/scuploadFiles";

		File folder = new File(savePath);

		if (!folder.exists()) {
			folder.mkdirs();
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		
		String originFileName = uploadFile.getOriginalFilename();
		String renameFileName = 
				sdf.format(new Date(System.currentTimeMillis())) 
				+ "."
				+ originFileName.substring(originFileName.lastIndexOf(".") + 1);

		String renamePath = folder + "/" + renameFileName;

		try {
			uploadFile.transferTo(new File(renamePath));
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("에러는 : " + e.getMessage());

		}

		scfi.setChangeName(renameFileName);
		scfi.setFilePath(savePath);

		System.out.println("scController scfi 값 : " + scfi);
		return scfi;

	}

	// 게시판 등록 form
	@RequestMapping("insertform.sc")
	public String NoInsertForm(HttpSession session) {
		return "insertform";
	}

	// 게시판 등록
	@RequestMapping(value = "insert.sc", method = RequestMethod.POST)
	public String NoInsert(@ModelAttribute ScBoard b, @RequestParam("uploadFile") MultipartFile uploadFile,
			HttpServletRequest request, HttpSession session) throws Exception {

		ScFileInfo fi = new ScFileInfo();
		System.out.println("insert.sc fi의 대한 값 : " + fi);

		if (uploadFile != null && !uploadFile.isEmpty()) {
			ScFileInfo finfo = saveFile(uploadFile, request);

			if (finfo.getChangeName() != null) {
				fi.setFileName(uploadFile.getOriginalFilename());
				fi.setChangeName(finfo.getChangeName());
				fi.setFilePath(finfo.getFilePath());
			}
		}

		int result = scService.insertscBoard(b, fi);
		System.out.println("result에 대한 값 : " + result);
		if (result > 0) {
			return "redirect:interpia.sc";
		} else {
			throw new Exception(".");
		}

	}

	// 게시물 삭제
	@ResponseBody
	@RequestMapping("nodelete.sc")
	public String deleteBoard(@RequestParam(required = false, value = "checkbox[]") List<Integer> code) {
		// view에서 체크된 값 Integer List로 가져오기
		// vo에 code라고 설정했으므로 code로 해주어야 한다.
		for (int i = 0; i < code.size(); i++) {
			scService.deleteBoard(code.get(i));
		}
		// vo에 code는 int로 선언되어 있고, script에서 Ajax를 통해 키 값이 checkArr인 배열로 보냈으니까
		// @RequestParam(value="checkArr[]")로 받고
		// 타입은 배열이니까 꼭 List<Integer> 로 받아옴.

		return "redirect:interpia.sc";
	}

	// 게시물 수정화면
	@RequestMapping("scdetail.sc")
	public String scDetail(@RequestParam("page") int page, @RequestParam("bId") int bId, Model model) throws Exception {
		ScBoard scboard = scService.selectBoard(bId);
		if (scboard != null) {
			ScFileInfo fi = scService.scdetailFile(bId);
			model.addAttribute("ScBoard", scboard).addAttribute("page", page).addAttribute("fi", fi);
			System.out.println("model" + model);
			System.out.println("page:" + page);
			return "scDetail";
		} else {
			throw new Exception("게시글 상세 조회에 실패하였습니다.");
		}

	}

	// 게시물 수정화면 처리
	@RequestMapping(value = "scupdate.sc", method = RequestMethod.POST)
	public ModelAndView ScUpdate(@ModelAttribute ScBoard b, @RequestParam("eId") int bId, ModelAndView mv)
			throws Exception {
		ScFileInfo fi = scService.scdetailFile(bId);
		System.out.println("변하기전 fi : " + fi);
		int scboard = scService.updatescBoard(b, fi);
		System.out.println("변한후 fi : " + fi);
		EduBoard eduboard = scService.selecteduBoard(bId);
		if (scboard > 0) {
//				model.addAttribute("board", scboard).addAttribute("fi", fi);
			mv.addObject("ScBoard", b).addObject("eduboard", eduboard).setViewName("eduinfoupdate");
			System.out.println("mv : " + mv.addObject(fi));
			System.out.println("fi : " + fi);
			return mv;
		} else {
			throw new Exception("저장에 실패하였습니다.");
		}

	}

	@PostMapping("edupdate.sc")
	public ModelAndView EdUpdate(@ModelAttribute ScBoard scb, @ModelAttribute EduBoard b, @RequestParam("eId") int bId,
			ModelAndView mv) throws Exception {
		int eduBoard = scService.updateEduBoard(b);
		LicenseBoard licenseboard = scService.selectlicBoard(bId);
		if (eduBoard > 0) {
			mv.addObject("LicenseBoard", licenseboard).addObject("ScBoard", scb).setViewName("license");
			System.out.println("mv : " + mv);
			System.out.println("lcb : " + licenseboard);
			return mv;
		} else {
			throw new Exception("EduUpdate에 실패하였습니다"); 
		}

	}
	
	
	
	@PostMapping("License.sc") 
	public ModelAndView Tech(	@ModelAttribute ScBoard scb,
			  					@ModelAttribute LicenseBoard b, ModelAndView mv,
			  					@RequestParam("eId") int bId) throws Exception { 
		int licenseBoard = scService.updateLicenseBoard(b); 
		projectBoard projectboard = scService.selectproBoard(bId);
	  
		if (licenseBoard > 0) 
		{	 
		mv.addObject("projectBoard",projectboard).addObject("ScBoard" + scb).setViewName("ProjectInfo");
		System.out.println("mv : " + mv);
	  
		return mv; 
		} 
		else { throw new Exception("License 접근에 실패하였습니다"); 
		} 
	}

	 
	
	@PostMapping("project.sc") 
	public ModelAndView Project(	@ModelAttribute ScBoard scb, 
			  						@ModelAttribute projectBoard b, ModelAndView mv,
			  						@RequestParam("eId") int bId) throws Exception { 
	int projectBoard = scService.updateProjectBoard(b); 
	companyBoard companyboard = scService.selectcomBoard(bId);
	  
	if (projectBoard > 0) { 
		mv.addObject("companyboard",companyboard).addObject("ScBoard" + scb).setViewName("companyInfo");
		System.out.println("mv : " + mv);
	  
		return mv; 
	} else { 
		throw new Exception("projectBoard 접근에 실패하였습니다"); 
	}	
}
	 
	
	
	
	
	
	

	@PostMapping("company.sc")
	public ModelAndView Company(@ModelAttribute ScBoard scb, @ModelAttribute companyBoard b, ModelAndView mv,
			@RequestParam("eId") int bId) throws Exception {
		int companyBoard = scService.updateCompanyBoard(b);
		workBoard workboard = scService.selectworkBoard(bId);

		if (companyBoard > 0) {
			mv.addObject("workBoard", workboard).addObject("ScBoard" + scb).setViewName("work");
			System.out.println("mv : " + mv);

			return mv;
		} else {
			throw new Exception("companyBoard 접근에 실패하였습니다");
		}
	}

	@PostMapping("work.sc")
	public String Work(@ModelAttribute ScBoard scb, @ModelAttribute workBoard b, ModelAndView mv,
			@RequestParam("eId") int bId) throws Exception {
		int workBoard = scService.updateWorkBoard(b);
		System.out.println(workBoard);

		if (workBoard > 0) {
//				mv.addObject("workBoard",workBoard).addObject("ScBoard"+scb).setViewName("redirect:interpia.sc");
//				mv.setViewName("redirect:interpia.sc"); 
//				redirect를 사용하지 않으면 viewresolver가 사용되서 interpia.sc.jsp가 적용된다.
			mv.setViewName("clientInfo");

			return "redirect:clientInfo.sc";
		} else {
			throw new Exception("workBoard 접근에 실패하였습니다");
		}
	}
	
	
//	--------------------------------- 네비게이션바 --------------------------------------
	@PostMapping("scEDU.sc")
	public ModelAndView scEDU(@ModelAttribute ScBoard scb, @ModelAttribute EduBoard b, @RequestParam("eId") int bId,
			ModelAndView mv) throws Exception {
//		int eduBoard = scService.updateEduBoard(b);
		EduBoard eduBoard = scService.selecteduBoard(bId);
		ScBoard ScBoard = scService.selectSceduBoard(bId);
//		LicenseBoard licenseboard = scService.selectlicBoard(bId);
		
		if (eduBoard != null) {
			 mv.addObject("ScBoard", ScBoard).addObject("eduboard", eduBoard).setViewName("eduinfoupdate");
			return mv;
		} else {
			throw new Exception("EduUpdate에 실패하였습니다"); 
		}
	}
	
	
	@PostMapping("EDUupdate.sc")
	public ModelAndView EDUupdate(@ModelAttribute ScBoard scb, @ModelAttribute EduBoard b, @RequestParam("eId") int bId,
			ModelAndView mv) throws Exception {
//		int eduBoard = scService.updateEduBoard(b);
		EduBoard eduBoard = scService.selecteduBoard(bId);
		LicenseBoard licenseboard = scService.selectlicBoard(bId);
		
		if (eduBoard != null) {
			mv.addObject("LicenseBoard", licenseboard).addObject("ScBoard", scb).setViewName("license");
			System.out.println("mv : " + mv);
			System.out.println("lcb : " + licenseboard);
			return mv;
		} else {
			throw new Exception("EduUpdate에 실패하였습니다"); 
		}
		
	}
	@PostMapping("LicenseBoard.sc") 
	public ModelAndView LicenseBoard(	@ModelAttribute ScBoard scb,
			@ModelAttribute LicenseBoard b, ModelAndView mv,
			@RequestParam("eId") int bId) throws Exception { 
//		int licenseBoard = scService.updateLicenseBoard(b); 
		LicenseBoard licenseBoard = scService.selectLicenseBoard(bId); 
		
		projectBoard projectboard = scService.selectproBoard(bId);
		System.out.println("licenseBoard : " + licenseBoard);
		System.out.println("projectboard : " + projectboard);
		if (licenseBoard != null) 
		{	 
			mv.addObject("projectBoard",projectboard).addObject("ScBoard" + scb).setViewName("ProjectInfo");
			System.out.println("mv : " + mv);
			
			return mv; 
		} 
		else { throw new Exception("License 접근에 실패하였습니다"); 
		} 
	}
	
	@PostMapping("projectBoard.sc") 
	public ModelAndView ProjectBoard(	@ModelAttribute ScBoard scb, 
			  						@ModelAttribute projectBoard b, ModelAndView mv,
			  						@RequestParam("eId") int bId) throws Exception { 
//	int projectBoard = scService.updateProjectBoard(b); 
	projectBoard projectBoard = scService.selectProjectBoard(bId); 
	companyBoard companyboard = scService.selectcomBoard(bId);
	  
	if (projectBoard != null) { 
		mv.addObject("companyboard",companyboard).addObject("ScBoard" + scb).setViewName("companyInfo");
		System.out.println("mv : " + mv);
	  
		return mv; 
	} else { 
		throw new Exception("projectBoard 접근에 실패하였습니다"); 
	}	
}
	
	@PostMapping("companyBoard.sc")
	public ModelAndView CompanyBoard(@ModelAttribute ScBoard scb, @ModelAttribute companyBoard b, ModelAndView mv,
			@RequestParam("eId") int bId) throws Exception {
//		int companyBoard = scService.updateCompanyBoard(b);
		companyBoard companyBoard = scService.selectCompanyBoard(bId);
		workBoard workboard = scService.selectworkBoard(bId);

		if (companyBoard != null) {
			mv.addObject("workBoard", workboard).addObject("ScBoard" + scb).setViewName("work");
			System.out.println("mv : " + mv);

			return mv;
		} else {
			throw new Exception("companyBoard 접근에 실패하였습니다");
		}
	}

// -------------------------------------------------------거래처 Controller -----------------------------------------------------------

//거래처BOARD 메인화면
	@RequestMapping("clientInfo.sc")
	public ModelAndView clientInfo(@RequestParam(value = "page", required = false) Integer page, ModelAndView mv,
			HttpSession session) throws Exception {
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		int listCount = scService.getListCount2();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		List<clientBoard> cbList = scService.selectcblist(pi);
		if (cbList != null) {
			mv.addObject("cbList", cbList).addObject("pi", pi).setViewName("clientInfo");
		} else {
			throw new Exception("clientInfo 조회에 실패하였습니다.");
		}
		return mv;
	}

	// 거래처 등록 mapping
	@RequestMapping("clientinsert.sc")
	public String Clientinsert() {

		return "client";
//		return "clientEdit";
	}

	// 거래처 등록 insert
	@PostMapping("client.sc")
	public String Client(@ModelAttribute clientBoard b, ModelAndView mv) throws Exception {
		int result = scService.insertClientBoard(b);
		System.out.println("result에 대한 값 : " + result);

		if (result > 0) {
			return "redirect:clientInfo.sc";
		} else {
			throw new Exception(".");
		}
	}

	// 전화번호 // pax번호 // 핸드폰번호 통합해서 만들기
	@GetMapping("clientsearch.sc")
	public ModelAndView clientsearch(@RequestParam("clientsearch") String clientsearch,
			@RequestParam("searchValue") String searchValue, HttpServletRequest request, ModelAndView mv)
			throws Exception {
		SearchClient sc = new SearchClient();

		if (clientsearch.equals("companyName")) {
			sc.setCompanyName(searchValue);
		} else if (clientsearch.equals("category")) {
			sc.setCategory(searchValue);
		} else if (clientsearch.equals("state")) {
			sc.setState(searchValue);
		} else if (clientsearch.equals("tel")) {
			sc.setTel(searchValue);
		} else if (clientsearch.equals("manager")) {
			sc.setManager(searchValue);
		} else if (clientsearch.equals("phone")) {
			sc.setPhone(searchValue);
		}

		int currentPage = 1;
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		int listCount = scService.getClientSearchListCount(sc);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<clientBoard> clientList = scService.selectClientSearchList(sc, pi);
		if (clientList != null) {
			mv.addObject("clientList", clientList).addObject("pi", pi).addObject("clientsearch", clientsearch)
					.addObject("searchValue", searchValue).setViewName("clientInfo");
		} else {
			throw new Exception("게시글 검색 조회에 실패하였습니다.");
		}
		return mv;
	}

	// 거래처 Board 게시물 삭제
	@ResponseBody
	@RequestMapping("clientdelete.sc")
	public String deleteClientBoard(@RequestParam(required = false, value = "checkbox[]") List<Integer> code) {
		// view에서 체크된 값 Integer List로 가져오기
		// vo에 code라고 설정했으므로 code로 해주어야 한다.
		for (int i = 0; i < code.size(); i++) {
			scService.deleteclientBoard(code.get(i));
		}
		// vo에 code는 int로 선언되어 있고, script에서 Ajax를 통해 키 값이 checkArr인 배열로 보냈으니까
		// @RequestParam(value="checkArr[]")로 받고
		// 타입은 배열이니까 꼭 List<Integer> 로 받아옴.

		return "redirect:clientInfo.sc";
	}

	@PostMapping("clientupdateBoard.sc")
	public ModelAndView clienUpdateBoard(@ModelAttribute clientBoard b,@RequestParam("cId") int bId,ModelAndView mv) throws Exception {
		int success = scService.updateClient(b);
		
		if(success > 0) {
			
			mv.addObject("clientBoard", b).setViewName("redirect:clientInfo.sc");
			return mv;
		}else{
			throw new Exception("거래처 수정 실패");
		}
		
	}
	
	@GetMapping("clientupdate.sc")
	public ModelAndView clienUpdate(@RequestParam("checkbox")Integer val,ModelAndView mv) throws Exception {
		clientBoard clientboard = scService.selectnewClient(val);
		if (clientboard != null) {
			mv.addObject(clientboard).setViewName("clientEdit");
			return mv;
		} else {
			throw new Exception("거래처 상세보기 실패");
		}
	}

	// 거래처 Board 수정    ajax통신은 받아도 다시 돌아가려는 성질떄문에 안됨
	/* @ResponseBody */ 
//	@PostMapping("clientupdate.sc")
//	public ModelAndView clienUpdate(@RequestParam(required = false, value = "checkbox[]") List<Integer> code, ModelAndView mv)
//			throws Exception {
//		clientBoard clientboard = scService.selectClient(code.get(0));
//		if (clientboard != null) {
//
//			mv.addObject(clientboard).setViewName("clientEdit");
//			System.out.println(mv);
//			return mv;
//
//		} else {
//			throw new Exception("거래처 상세보기 실패");
//		}
//	}
	
	// 예비인력 ----------------------------------------------------------------------------------------------------------------------------------------
	
	
	// 예비인력 Board
			@RequestMapping("reserve.sc")
			public ModelAndView reserve(@RequestParam(value="page", required = false)Integer page, ModelAndView mv, HttpSession session) throws Exception {
				int currentPage = 1;
				if(page!= null) {
					currentPage = page;
				}
				int listCount = scService.getRListCount();
				System.out.println("LISTCOUNT : " + listCount);
				PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
				List<ScBoard> reserveList = scService.selectreserveList(pi);
				
				if (reserveList != null) {
					mv.addObject("reserveList", reserveList).addObject("pi", pi).setViewName("reserve");

				} else {
					throw new Exception(".");
				}
				return mv;
			}
		// 예비인력정보 게시판 검색
		@RequestMapping("reservesearch.sc")
		public ModelAndView reservesearch(@RequestParam("searchCondition") String searchCondition,
										  @RequestParam("searchValue") String searchValue, ModelAndView mv, 
										  HttpServletRequest request) throws Exception {
			SearchCondition sc = new SearchCondition();
			
			if (searchCondition.equals("inumber1")) {
				sc.setInumber1(searchValue);
			} else if (searchCondition.equals("kname")) {
				sc.setKname(searchValue);
			}
			
			int currentPage = 1;
			if (request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			int listCount = scService.getSearchreserveListCount(sc);
			System.out.println("listcount : " + listCount);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			ArrayList<ScBoard> reserveList = scService.selectSearchreserveList(sc, pi);
			
			if (reserveList != null) {
				mv.addObject("reserveList", reserveList).addObject("pi", pi).addObject("searchCondition", searchCondition)
				.addObject("searchValue", searchValue).setViewName("reserve");
			} else {
				throw new Exception("게시글 검색 조회에 실패하였습니다.");
			}
			
			return mv;
			
		}

}
