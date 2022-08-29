package com.kh.pop.service.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pop.common.PageInfo;
import com.kh.pop.common.Pagination;
import com.kh.pop.service.model.service.coService;
import com.kh.pop.service.model.vo.CoFileInfo;
import com.kh.pop.service.model.vo.SearchCondition2;
import com.kh.pop.service.model.vo.coBoard;


@Controller
public class CoController {

		@Autowired
		private coService coService;
		
		
		@RequestMapping(value="/cost/excel", method=RequestMethod.GET)
		public ModelAndView excelpopup(Integer page, ModelAndView mv,HttpSession session) throws Exception {
				int currentPage = 1;
				if(page != null) {
					currentPage = page;
				}
				// 게시물 총 개수
				int listCount = coService.getListCount();
				
				PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
				List<coBoard> colist=  coService.selectList(pi);
				System.out.println(colist);
				 // 게시글이 null이 아니라면 jsp로 전송 
				  if(colist != null) 
				  { mv.addObject("colist",colist).addObject("pi", pi).setViewName("main");
	
				} else {
					throw new Exception(".");
				}
			
				mv.setViewName("cost/excel");
				return mv;
			}
		
		// Main화면
		@RequestMapping("main.co" ) 
		public ModelAndView Main(@RequestParam(value="page",  required=false) Integer page, ModelAndView mv,HttpSession session) throws Exception  {
			int currentPage = 1;
			if(page != null) {
				currentPage = page;
			}
			// 게시물 총 개수
			int listCount = coService.getListCount();
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			List<coBoard> colist=  coService.selectList(pi);
			System.out.println(colist);
			 // 게시글이 null이 아니라면 jsp로 전송 
			  if(colist != null) 
			  { mv.addObject("colist",colist).addObject("pi", pi).setViewName("main");

			} else {
				throw new Exception(".");
			}
			return mv;
		}
	
		
		
		
		@RequestMapping(value="/cost/excellDown.co", method=RequestMethod.POST)
		public void excelDownload(coBoard b, ModelAndView mv,HttpServletResponse response) throws Exception{
			XSSFWorkbook wb=new XSSFWorkbook();
			Sheet sheet=null;
			Row row=null;
			Cell cell=null; 
			sheet = wb.createSheet("coBoard");
			int listCount = coService.getListCount();
			System.out.println(b);
			System.out.println(b.getBNo());
			int currentPage = 1;
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			List<coBoard> colist=  coService.selectList(pi);
			System.out.println(colist);
			 // 게시글이 null이 아니라면 jsp로 전송 
			mv.addObject("colist",colist).addObject("pi", pi).setViewName("main");

			
			//첫행   열 이름 표기 
			int cellCount=0;
			row = sheet.createRow(0); //0번째 행
			cell=row.createCell(cellCount++);
			cell.setCellValue("순번");
			cell=row.createCell(cellCount++);
			cell.setCellValue("사용일");
			cell=row.createCell(cellCount++);
			cell.setCellValue("사용내역");
			cell=row.createCell(cellCount++);
			cell.setCellValue("사용금액");
			cell=row.createCell(cellCount++);
			cell.setCellValue("승인금액");
			cell=row.createCell(cellCount++);
			cell.setCellValue("처리상태");
			cell=row.createCell(cellCount++);
			cell.setCellValue("등록일");
			cell=row.createCell(cellCount++);
			cell.setCellValue("비고");
			
			
//			coBoard bc = colist.get(0);
//			System.out.println(colist.get(0));
//			System.out.println(bc);
			for(int i=0; i < listCount; i++  ) {
				row=sheet.createRow(i+1);  // '열 이름 표기'로 0번째 행 만들었으니까 1번째행부터
				coBoard bc = colist.get(i);
				cellCount=0; //열 번호 초기화
				cell=row.createCell(cellCount++);
				cell.setCellValue(bc.getBNo());
				cell=row.createCell(cellCount++);
				cell.setCellValue(bc.getBDate());
				cell=row.createCell(cellCount++);
				cell.setCellValue(bc.getBHistory());
				cell=row.createCell(cellCount++);
				cell.setCellValue(bc.getBAmount());
				cell=row.createCell(cellCount++);
				cell.setCellValue(bc.getBRecognize());
				cell=row.createCell(cellCount++);
				cell.setCellValue(bc.getBState());
				cell=row.createCell(cellCount++);
				cell.setCellValue(bc.getBRegistration());
				cell=row.createCell(cellCount++);
				cell.setCellValue(bc.getNote());
				cell=row.createCell(cellCount++);
					
				}
				
				// 컨텐츠 타입과 파일명 지정
				response.setContentType("ms-vnd/excel");
				response.setHeader("Content-Disposition", "attachment;filename=freeBoard.xlsx");  //파일이름지정.
				//response OutputStream에 엑셀 작성
				wb.write(response.getOutputStream());
			}
		
//	public void excelDownload(HttpServletResponse response) throws IOException {
////    Workbook wb = new HSSFWorkbook();
//    Workbook wb = new XSSFWorkbook();
//    Sheet sheet = wb.createSheet("첫번째 시트");
//    Row row = null;
//    Cell cell = null;
//    int rowNum = 0;
//
//    // Header
//    row = sheet.createRow(rowNum++);
//    cell = row.createCell(0);
//    cell.setCellValue("번호");
//    cell = row.createCell(1);
//    cell.setCellValue("이름");
//    cell = row.createCell(2);
//    cell.setCellValue("제목");
//
//    // Body
//    for (int i=0; i<3; i++) {
//        row = sheet.createRow(rowNum++);
//        cell = row.createCell(0);
//        cell.setCellValue(i);
//        cell = row.createCell(1);
//        cell.setCellValue(i+"_name");
//        cell = row.createCell(2);
//        cell.setCellValue(i+"_title");
//    }
//
//    // 컨텐츠 타입과 파일명 지정
//    response.setContentType("ms-vnd/excel");
////    response.setHeader("Content-Disposition", "attachment;filename=example.xls");
//    response.setHeader("Content-Disposition", "attachment;filename=example.xlsx");
//
//    // Excel File Output
//    wb.write(response.getOutputStream());
//    wb.close();
//}
		

		
		

		// 팝업창 상세화면 삭제버튼  
		@RequestMapping(value="/delete", method = RequestMethod.GET)
		public String boardDelete(@RequestParam("bId")int bNo) {
			coService.delete(bNo);
					
		return "redirect:popupdetail";
		
		}
	  
		// 팝업창 게시물 상세보기
		@RequestMapping("codetail.co")
		public String coDetail(@RequestParam("bId")int bId, Model model, HttpServletRequest request) throws Exception{
	
				coBoard coboard = coService.selectBoard(bId);
				System.out.println(bId);
				System.out.println(coboard);
				
				if(coboard != null) {
					CoFileInfo fi = coService.scdetailFile(bId);
					model.addAttribute("board", coboard).addAttribute("fi", fi);
					System.out.println(coboard);
					System.out.println(fi);
					return "popupdetail";
				}else {
					throw new Exception("게시글 상세 조회에 실패하였습니다.");
				}
		}
		 
		// 팝업창 게시물 상세화면 수정
		@RequestMapping(value="update.co", method=RequestMethod.POST) 
		public String CoUpdate(@ModelAttribute coBoard b, Model model,HttpServletRequest request,HttpSession session) throws Exception {
			CoFileInfo fi = new CoFileInfo();
				  
				
			int coboard = coService.updatecoBoard(b, fi);
			System.out.println(fi);
			System.out.println(b);
				
				
				
			if (coboard > 0) {
				model.addAttribute("board", coboard).addAttribute("fi", fi);
				System.out.println(model);
				return "popupclose";
			} else {
				throw new Exception("저장에 실패하였습니다.");
			} 
			  
		}
		
	 	// 팝업창 띄우기
		@RequestMapping(value="cost/popup", method=RequestMethod.GET)
		public ModelAndView popup(Model model) throws Exception {
				ModelAndView mv = new ModelAndView();
				mv.setViewName("cost/popup");
				return mv;
			}
	  
		// 팝업창 게시물 등록하기    
		@RequestMapping(value="cost/insert.co",method=RequestMethod.POST)
		public String CoInsert(@ModelAttribute coBoard b, 
				@RequestParam("uploadFile") MultipartFile uploadFile,
											HttpServletRequest request,
											HttpSession session) throws Exception {

			CoFileInfo fi = new CoFileInfo();
			  if(uploadFile != null && !uploadFile.isEmpty()) { 
				  CoFileInfo finfo = saveFile(uploadFile, request);
				  if(finfo.getChangeName() != null) 
				  {
					  fi.setFileName(uploadFile.getOriginalFilename());
					  fi.setChangeName(finfo.getChangeName()); fi.setFilePath(finfo.getFilePath());
				  } 
			  }
			  
				int result = coService.insertcoBoard(b, fi);
				if(result > 0) { 
					return "popupclose";
				} else { 
					throw new Exception("저장에 실패하였습니다."); 
				}

		}
	  
		// insert할떄 저장한 파일 넣기
		public CoFileInfo saveFile(MultipartFile uploadFile, HttpServletRequest request) {
			CoFileInfo scfi = new CoFileInfo();

			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "/couploadFiles";
			
			File folder = new File(savePath);
			if(!folder.exists()) {
				folder.mkdirs();
			}

			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");

			String originFileName = uploadFile.getOriginalFilename();
			String renameFileName = sdf.format(new Date(System.currentTimeMillis())) +
					"." + originFileName.substring(originFileName.lastIndexOf(".") + 1);

			String renamePath = folder + "/" + renameFileName;

			try {
				uploadFile.transferTo(new File(renamePath));
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("에러는 : " + e.getMessage());

			}

			scfi.setChangeName(renameFileName);
			scfi.setFilePath(savePath);
			return scfi	;

		}
	  
		// 게시판 검색
		@RequestMapping("search.co")
		public ModelAndView searchBoard
		(@RequestParam("searchCondition2")	String searchCondition2,
		@RequestParam("searchCondition3")	String searchCondition3,
		@RequestParam("datetype") 			String datetype,
		ModelAndView mv, HttpServletRequest request) throws Exception {
			
			SearchCondition2 sc2 = new SearchCondition2();
			
			// 식대(야근)
			if(searchCondition2.equals("mealns") && searchCondition3.equals("receipt")) { 
				sc2.setMealns("식대(야근)");
				sc2.setReceipt("접수");
			}else if(searchCondition2.equals("mealns") && searchCondition3.equals("recognize")) { 
				sc2.setMealns("식대(야근)");
				sc2.setReceipt("승인"); 
			}else if(searchCondition2.equals("mealns") && searchCondition3.equals("all")) { 
				sc2.setMealns("식대(야근)");
				sc2.setReceipt(""); 
			}else if(searchCondition2.equals("mealns") && searchCondition3.equals("payment")) { 
				sc2.setMealns("식대(야근)");
				sc2.setReceipt("지급완료"); 
			}else if(searchCondition2.equals("mealns") && searchCondition3.equals("companion")) { 
				sc2.setMealns("식대(야근)");
				sc2.setReceipt("반려"); 
			}
			
			else if((searchCondition2.equals("all") && searchCondition3.equals("all"))) { 
				sc2.setMealns("");
				sc2.setReceipt(""); 
			}
			
			
			
			
			
			
			
			
			// 택시비(야근)
			else if(searchCondition2.equals("taxins") && searchCondition3.equals("all")) { 
				sc2.setMealns("택시비(야근)");
				sc2.setReceipt(""); 
			}else if(searchCondition2.equals("taxins") && searchCondition3.equals("receipt")) { 
				sc2.setMealns("택시비(야근)");
				sc2.setReceipt("접수"); 
			}else if(searchCondition2.equals("taxins") && searchCondition3.equals("recognize")) { 
				sc2.setMealns("택시비(야근)");
				sc2.setReceipt("승인"); 
			}else if(searchCondition2.equals("taxins") && searchCondition3.equals("payment")) { 
				sc2.setMealns("택시비(야근)");
				sc2.setReceipt("지급완료"); 
			}else if(searchCondition2.equals("taxins") && searchCondition3.equals("companion")) { 
				sc2.setMealns("택시비(야근)");
				sc2.setReceipt("반려"); 
			}
			
			
			
			
			
			// 택시비(회식)
			else if(searchCondition2.equals("taxidt") && searchCondition3.equals("receipt")) { 
				sc2.setMealns("택시비(회식)");
				sc2.setReceipt("접수"); 
			}else if(searchCondition2.equals("taxidt") && searchCondition3.equals("all")) { 
				sc2.setMealns("택시비(회식)");
				sc2.setReceipt(""); 
			}else if(searchCondition2.equals("taxidt") && searchCondition3.equals("recognize")) { 
				sc2.setMealns("택시비(회식)");
				sc2.setReceipt("승인"); 
			}else if(searchCondition2.equals("taxidt") && searchCondition3.equals("payment")) { 
				sc2.setMealns("택시비(회식)");
				sc2.setReceipt("지급완료"); 
			}else if(searchCondition2.equals("taxidt") && searchCondition3.equals("companion")) { 
				sc2.setMealns("택시비(회식)");
				sc2.setReceipt("반려"); 
			}
			
			
			
			
			
			
			// 사무용품 구매
			else if(searchCondition2.equals("office") && searchCondition3.equals("all")) { 
				sc2.setMealns("사무용품");
				sc2.setReceipt(""); 
			}else if(searchCondition2.equals("office") && searchCondition3.equals("receipt")) { 
				sc2.setMealns("사무용품");
				sc2.setReceipt("접수"); 
			}else if(searchCondition2.equals("office") && searchCondition3.equals("recognize")) { 
				sc2.setMealns("사무용품");
				sc2.setReceipt("승인"); 
			}else if(searchCondition2.equals("office") && searchCondition3.equals("payment")) { 
				sc2.setMealns("사무용품");
				sc2.setReceipt("지급완료"); 
			}else if(searchCondition2.equals("office") && searchCondition3.equals("companion")) { 
				sc2.setMealns("사무용품");
				sc2.setReceipt("반려"); 
			}
			
			
			
			
			
			
			// 교육비
			else if(searchCondition2.equals("edu") && searchCondition3.equals("all")) { 
				sc2.setMealns("교육비");
				sc2.setReceipt(""); 
			}else if(searchCondition2.equals("edu") && searchCondition3.equals("receipt")) { 
				sc2.setMealns("교육비");
				sc2.setReceipt("접수"); 
			}else if(searchCondition2.equals("edu") && searchCondition3.equals("recognize")) { 
				sc2.setMealns("교육비");
				sc2.setReceipt("승인"); 
			}else if(searchCondition2.equals("edu") && searchCondition3.equals("payment")) { 
				sc2.setMealns("교육비");
				sc2.setReceipt("지급완료"); 
			}else if(searchCondition2.equals("edu") && searchCondition3.equals("companion")) { 
				sc2.setMealns("교육비");
				sc2.setReceipt("반려"); 
			}
			
			
			
			
			
			
			
			
			// 접대비
			else if(searchCondition2.equals("enter") && searchCondition3.equals("all")) { 
				sc2.setMealns("접대비");
				sc2.setReceipt(""); 
			}else if(searchCondition2.equals("enter") && searchCondition3.equals("receipt")) { 
				sc2.setMealns("접대비");
				sc2.setReceipt("접수"); 
			}else if(searchCondition2.equals("enter") && searchCondition3.equals("recognize")) { 
				sc2.setMealns("접대비");
				sc2.setReceipt("승인"); 
			}else if(searchCondition2.equals("enter") && searchCondition3.equals("payment")) { 
				sc2.setMealns("접대비");
				sc2.setReceipt("지급완료"); 
			}else if(searchCondition2.equals("enter") && searchCondition3.equals("companion")) { 
				sc2.setMealns("접대비");
				sc2.setReceipt("반려"); 
			}
			
			
			
			// 접수
			else if(searchCondition2.equals("all") && searchCondition3.equals("receipt")) { 
				sc2.setMealns("");
				sc2.setReceipt("접수"); 
			}else if(searchCondition2.equals("mealns") && searchCondition3.equals("receipt")) { 
				sc2.setMealns("식대(야근)");
				sc2.setReceipt("접수"); 
			}else if(searchCondition2.equals("taxins") && searchCondition3.equals("receipt")) { 
				sc2.setMealns("택시비(야근)");
				sc2.setReceipt("접수"); 
			}else if(searchCondition2.equals("taxidt") && searchCondition3.equals("receipt")) { 
				sc2.setMealns("택시비(회식)");
				sc2.setReceipt("접수"); 
			}else if(searchCondition2.equals("office") && searchCondition3.equals("receipt")) { 
				sc2.setMealns("사무용품");
				sc2.setReceipt("접수"); 
			}else if(searchCondition2.equals("edu") && searchCondition3.equals("receipt")) { 
				sc2.setMealns("교육비");
				sc2.setReceipt("접수"); 
			}else if(searchCondition2.equals("enter") && searchCondition3.equals("receipt")) { 
				sc2.setMealns("접대비");
				sc2.setReceipt("접수"); 
			}
			
			// 승인
			else if(searchCondition2.equals("all") && searchCondition3.equals("recognize")) { 
				sc2.setMealns("");
				sc2.setReceipt("승인"); 
			}else if(searchCondition2.equals("mealns") && searchCondition3.equals("recognize")) { 
				sc2.setMealns("식대(야근)");
				sc2.setReceipt("승인"); 
			}else if(searchCondition2.equals("taxins") && searchCondition3.equals("recognize")) { 
				sc2.setMealns("택시비(야근)");
				sc2.setReceipt("승인"); 
			}else if(searchCondition2.equals("taxidt") && searchCondition3.equals("recognize")) { 
				sc2.setMealns("택시비(회식)");
				sc2.setReceipt("승인"); 
			}else if(searchCondition2.equals("office") && searchCondition3.equals("recognize")) { 
				sc2.setMealns("사무용품");
				sc2.setReceipt("승인"); 
			}else if(searchCondition2.equals("edu") && searchCondition3.equals("recognize")) { 
				sc2.setMealns("교육비");
				sc2.setReceipt("승인"); 
			}else if(searchCondition2.equals("enter") && searchCondition3.equals("recognize")) { 
				sc2.setMealns("접대비");
				sc2.setReceipt("승인"); 
			}
			// 지급완료
			else if(searchCondition2.equals("all") && searchCondition3.equals("payment")) { 
				sc2.setMealns("");
				sc2.setReceipt("지급완료"); 
			}else if(searchCondition2.equals("mealns") && searchCondition3.equals("payment")) { 
				sc2.setMealns("식대(야근)");
				sc2.setReceipt("지급완료"); 
			}else if(searchCondition2.equals("taxins") && searchCondition3.equals("payment")) { 
				sc2.setMealns("택시비(야근)");
				sc2.setReceipt("지급완료"); 
			}else if(searchCondition2.equals("taxidt") && searchCondition3.equals("payment")) { 
				sc2.setMealns("택시비(회식)");
				sc2.setReceipt("지급완료"); 
			}else if(searchCondition2.equals("office") && searchCondition3.equals("payment")) { 
				sc2.setMealns("사무용품");
				sc2.setReceipt("지급완료"); 
			}else if(searchCondition2.equals("edu") && searchCondition3.equals("payment")) { 
				sc2.setMealns("교육비");
				sc2.setReceipt("지급완료"); 
			}else if(searchCondition2.equals("enter") && searchCondition3.equals("payment")) { 
				sc2.setMealns("접대비");
				sc2.setReceipt("지급완료"); 
			}
			// 승인
			else if(searchCondition2.equals("all") && searchCondition3.equals("companion")) { 
				sc2.setMealns("");
				sc2.setReceipt("반려"); 
			}else if(searchCondition2.equals("mealns") && searchCondition3.equals("companion")) { 
				sc2.setMealns("식대(야근)");
				sc2.setReceipt("반려"); 
			}else if(searchCondition2.equals("taxins") && searchCondition3.equals("companion")) { 
				sc2.setMealns("택시비(야근)");
				sc2.setReceipt("반려"); 
			}else if(searchCondition2.equals("taxidt") && searchCondition3.equals("companion")) { 
				sc2.setMealns("택시비(회식)");
				sc2.setReceipt("반려"); 
			}else if(searchCondition2.equals("office") && searchCondition3.equals("companion")) { 
				sc2.setMealns("사무용품");
				sc2.setReceipt("반려"); 
			}else if(searchCondition2.equals("edu") && searchCondition3.equals("companion")) { 
				sc2.setMealns("교육비");
				sc2.setReceipt("반려"); 
			}else if(searchCondition2.equals("enter") && searchCondition3.equals("companion")) { 
				sc2.setMealns("접대비");
				sc2.setReceipt("반려"); 
			}
			
			
			
			
			
			
			int currentPage = 1;
			if(request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			int listCount = coService.getSearchListCount(sc2);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			ArrayList<coBoard> colist = coService.selectSearchList(sc2, pi);
			
			if(colist != null) {
				mv.addObject("colist", colist).addObject("pi", pi).addObject("datetype", datetype).
				addObject("searchCondition2", searchCondition2).setViewName("main");
			} else {
				throw new Exception("게시글 검색 조회에 실패하였습니다.");
			}
			System.out.println(searchCondition3);	// all
			System.out.println(sc2);				// mealns = 식대야근
			System.out.println(searchCondition2);	// mealns
			System.out.println(datetype);			// null
			System.out.println(listCount);			// 0
			System.out.println(colist);				// []
			System.out.println(pi);					// listcount가 0이라서 의미 없음
					
			
			return mv;
			
		}
}
