package kr.co.bangbang.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bangbang.admin.domain.APageInfo;
import kr.co.bangbang.admin.domain.Admin;
import kr.co.bangbang.admin.service.AdminService;
import kr.co.bangbang.user.domain.UPageInfo;
import kr.co.bangbang.user.domain.User;

@Controller
@RequestMapping(value="/admin/")
public class AdminController {
	
	@Autowired
	private AdminService aService;
	
	// 관리자 회원가입 페이지 이동
	@RequestMapping(value="a_join.do", method=RequestMethod.GET)
	public ModelAndView showAdminRegister(ModelAndView mv) {
		mv.setViewName("admin/a_join");
		return mv;
	}
	
	// 관리자 회원가입
	@RequestMapping(value="a_join.do", method=RequestMethod.POST)
	public ModelAndView adminRegister(
			ModelAndView mv
			, @ModelAttribute Admin admin) {
		try {
			int result = aService.adminRegister(admin);
			if(result > 0) {
				mv.setViewName("admin/a_login.do"); // 성공시 로그인 페이지
			} else {
				mv.addObject("msg", "회원가입에 실패하였습니다.");
				mv.addObject("url", "/user/join.do");
				mv.setViewName("common/error_page");
			}
		} catch (Exception e) {
			mv.addObject("msg", "서비스 실패");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/user/join.do");
			mv.setViewName("common/error_page");
		}
		return mv;
	}
	
	
	@RequestMapping(value = "list.do", method = RequestMethod.GET)
	public ModelAndView showUserList(
			ModelAndView mv
			,@RequestParam(value = "page", required=false, defaultValue = "1") Integer currentPage) {
		
	
		Integer totalCount = aService.getListCount();
		APageInfo aInfo = this.getPageInfo(currentPage, totalCount);
		List<User> uList = aService.selectUserList(aInfo);
		
		mv.addObject("user", uList).addObject("aInfo", aInfo).setViewName("admin/user_list");
		
		return mv;
	}

	private APageInfo getPageInfo(Integer currentPage, Integer totalCount) {
		int recordCountPerPage = 10;
		int naviCountPerPage = 1;
		
		int naviTotalCount;
		naviTotalCount 
			= (int)Math.ceil((double)totalCount/recordCountPerPage);   //6.2 -> 7 올림해주는 식
		
		int startNavi = ((int)((double)currentPage/naviCountPerPage+0.9)-1)*naviCountPerPage+1;  //이거뭐냐...
		
		int endNavi = startNavi + naviCountPerPage - 1;
		
		if(endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}
			
		APageInfo aInfo = new APageInfo(currentPage, totalCount, naviTotalCount, recordCountPerPage, naviCountPerPage, startNavi, endNavi);
		
		return aInfo;
	}
	
	
	
	
	
	@RequestMapping(value = "/admin/searchUserList.do", method = RequestMethod.GET)
	public String searchUserList(
			@RequestParam("searchCondition") String searchCondition
			, @ RequestParam("searchKeyword") String searchKeyword
			, @ RequestParam(value="page", required=false, defaultValue="1") Integer currentPage
			, Model model) {
		
		//두가지 값을 하나의 변수로 사용하는법 (searchCondition, searchKeyword)
		//1.VO클래스 만들기(이미해봄)
		//2. HashMap 사용(안해봄)
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchKeyword", searchKeyword);
		
		int totalCount = aService.getListCount(paramMap);
		APageInfo aInfo = this.getPageInfo(currentPage, totalCount);
		
		List<User> uList = aService.searchUserByKeyword(aInfo, paramMap);
		
		if(!uList.isEmpty()) {
//			model.addAttribute("searchCondition", searchCondition); paramMap으로 써도 됨
//			model.addAttribute("searchKeyword", searchKeyword);
			model.addAttribute("paramMap", paramMap);
			model.addAttribute("pInfo", aInfo);
			model.addAttribute("uList", uList);
			return "admin/search";
		} else {
			model.addAttribute("msg", "데이터 조회가 완료되지 않았습니다.");
			model.addAttribute("error", "데이터 조회 실패");
			model.addAttribute("url", "/admin/list.kh");
			return "common/error_page";
		}
	}
	
	
	
	
	
	
	
	
	
	
}
