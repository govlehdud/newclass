package com.kh.pop.service.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pop.common.PageInfo;
import com.kh.pop.common.Pagination;
import com.kh.pop.service.model.service.ipService;
import com.kh.pop.service.model.vo.IpBoard;
import com.kh.pop.service.model.vo.Member;
import com.kh.pop.service.model.vo.ScBoard;
import com.kh.pop.service.model.vo.ScFileInfo;
import com.kh.pop.service.model.vo.SearchConditionMain;


@Controller
public class IpController {
	
		@Autowired
		private ipService ipService;
		
		// index page에서 login page로 이동
		@RequestMapping("login.ip")
		public String login() {
			return "/interpia/login";
		}
		
		// 상세조회
		@GetMapping("ipdetail.ip")
		public String ipdetail(@RequestParam("page")int page,@RequestParam("bId")int bId, Model model, HttpServlet request) throws Exception {
			IpBoard IpBoard = ipService.selectBoard(bId);
			System.out.println(IpBoard);
			if(IpBoard != null) {
				ScFileInfo fi = ipService.scdetailFile(bId);
				model.addAttribute("board", IpBoard).addAttribute("page", page).addAttribute("fi", fi);
				System.out.println("model" + model);
				System.out.println("page:" + page);
				return "ipDetail";
			}else {
				throw new Exception("게시글 상세 조회에 실패하였습니다.");
			}
			
		}
		
//		// 로그인버튼
//		@RequestMapping(value="/loginbtn", method=RequestMethod.POST)
//		public String loginBtn(@ModelAttribute Member vo,  HttpServletRequest request,HttpSession session) throws Exception {
//			session = request.getSession();
//			System.out.println(vo);
//			Member member = ipService.login(vo);
//			System.out.println(member);
//			if(member == null) {
//				throw new Exception("값이 비어있습니다.");
//					
//			}else {
//					session.setAttribute("login", member);
//					return "home2";
//				
//			}
//		}
		
		@RequestMapping("interpia.ip") 
		public ModelAndView Interpia(@RequestParam(value="page", required=false) Integer page, ModelAndView mv,HttpSession session) throws Exception  {
				// Mainpage 
				int currentPage = 1;
				if(page != null) {
					currentPage = page;
				}
				// 게시글 count : getListCount();
				int listCount = ipService.getListCount();
				
				PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
				System.out.println("listCount 나올값 : "+listCount);
				System.out.println("pi 나올값 : "+ pi);
				List<IpBoard> iplist=  ipService.selectList(pi);
				System.out.println(iplist);
				System.out.println("sclist 값:  "+ iplist);
	
				 // 게시글이 null이 아니라면 jsp로 전송 
				  if(iplist!=null) 
				  { mv.addObject("iplist",iplist).addObject("pi", pi).setViewName("interpia/mainBoard");
	
				} else {
					throw new Exception(".");
				}
				return mv;
		
			}
		
		
		
		@RequestMapping("search.ip")
		public ModelAndView search(@RequestParam ("searchConditionMain")String searchConditionMain, 
							@RequestParam("searchValue")String searchValue,
							ModelAndView mv, HttpServletRequest request) throws Exception {
			
			SearchConditionMain sc = new SearchConditionMain();
			
			if(searchConditionMain.equals("inumber1")) {
				sc.setInumber1(searchValue);
			} else if(searchConditionMain.equals("gender")){
				sc.setGender(searchValue);
			} else if(searchConditionMain.equals("kname")){
				sc.setKname(searchValue);
			} else if(searchConditionMain.equals("annual")){
				sc.setAnnual(searchValue);
			} else if(searchConditionMain.equals("address2")){
				sc.setAddress2(searchValue);
			}
			
			int listCount = ipService.getSearchListCount(sc);
			int currentPage = 1;
			if(request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			ArrayList<IpBoard> List = ipService.selectSearchList(sc, pi);
			
			if(List != null) {
				mv.addObject("list", List).addObject("pi", pi).addObject("searchCondition", searchConditionMain).addObject("searchValue", searchValue).setViewName("interpia/mainBoard");
			} else {
				throw new Exception("게시글 검색 조회에 실패하였습니다.");
			}
			System.out.println(sc);
			System.out.println(List);
			System.out.println(pi);
			
			return mv;
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
}
