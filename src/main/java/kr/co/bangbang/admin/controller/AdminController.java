package kr.co.bangbang.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
	
	/**
	 * 관리자 회원가입 페이지 이동
	 * @param mv
	 * @return ModelAndView
	 */
	@RequestMapping(value="a_join.do", method=RequestMethod.GET)
	public ModelAndView showAdminRegister(ModelAndView mv) {
		mv.setViewName("admin/a_join");
		return mv;
	}
	
	/**
	 * 관리자 회원가입
	 * @param mv
	 * @param adminId
	 * @param adminPw
	 * @param amdinPwRe
	 * @param adminEmail
	 * @return ModelAndView
	 */
	@RequestMapping(value="a_join.do", method=RequestMethod.POST)
	public ModelAndView adminRegister(
			ModelAndView mv
			, String adminId
			, String adminPw
			, String amdinPwRe
			, String adminEmail) {
		try {
			
			Admin admin = new Admin(adminId, adminPw, adminPw, adminEmail);
			int result = aService.adminRegister(admin);
			if(result > 0) {
				mv.addObject("msg", "관리자 회원가입에 성공하였습니다.");
				mv.addObject("url", "/admin/a_login.do");
				mv.setViewName("common/inform");
			} else {
				mv.addObject("msg", "회원가입에 실패하였습니다.");
				mv.addObject("url", "/admin/join.do");
				mv.setViewName("common/error_page");
			}
		} catch (Exception e) {
			mv.addObject("msg", "서비스 실패");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/admin/join.do");
			mv.setViewName("common/error_page");
		}
		return mv;
	}
	
	/**
	 * 관리자 로그인 페이지 이동
	 * @param mv
	 * @return ModelAndView
	 */
	@RequestMapping(value = "a_login.do", method = RequestMethod.GET)
	public ModelAndView showLoginForm(ModelAndView mv) {
		mv.setViewName("admin/a_login");
		return mv;
	}
	
	/**
	 * 관리자 로그인
	 * @param mv
	 * @param admin
	 * @param session
	 * @return ModelAndView
	 */
	@RequestMapping(value = "a_login.do", method = RequestMethod.POST)
	public ModelAndView adminLogin(
			ModelAndView mv
			, @ModelAttribute Admin admin
			, HttpSession session) {
		try {
			Admin aOne = aService.adminLogin(admin);
			if(aOne != null) { // 로그인 성공
				session.setAttribute("adminId", aOne.getAdminId());
				session.setAttribute("adminPw", aOne.getAdminPw());
				mv.setViewName("redirect:/index.jsp");
			} else { // 로그인 실패
				mv.addObject("msg", "로그인에 실패하였습니다.");
				mv.addObject("url", "/admin/a_login.do");
				mv.setViewName("common/error_page");
			}
		} catch (Exception e) { // 예외처리
			mv.addObject("msg", "서비스 실패");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/user/a_join.do");
			mv.setViewName("common/error_page");
		}
		return mv;
	}
	
	// 관리자 로그아웃
	@RequestMapping(value = "a_logout.do", method = RequestMethod.GET)
	public ModelAndView adminLogout(
			ModelAndView mv
			, HttpSession session) {
		if(session != null) {
			session.invalidate();
			mv.setViewName("redirect:/index.jsp");
		} else {
			mv.addObject("msg", "로그아웃에 실패하였습니다.");
			mv.addObject("url", "redirect:/index.jsp");
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
		int naviCountPerPage = 5;
		
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
	
	
	
	
	
	@RequestMapping(value = "searchUserList.do", method = RequestMethod.GET)
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
			model.addAttribute("aInfo", aInfo);
			model.addAttribute("uList", uList);
			return "admin/user_list_search";
		} else {
			model.addAttribute("msg", "데이터 조회가 완료되지 않았습니다.");
			model.addAttribute("error", "데이터 조회 실패");
			model.addAttribute("url", "/admin/list.kh");
			return "common/error_page";
		}
	}
	
	
	
	
	@RequestMapping(value="aInfo.do", method=RequestMethod.GET)
	public ModelAndView showUserInfo(
			ModelAndView mv
			, @RequestParam("userId") String userId
			, HttpSession session) {
		try {
			//String sessionId = (String)session.getAttribute("userId"); // 세션에 저장된 아이디
			String sessionId = "admin";
			if(sessionId != "" && sessionId != null) {
				User user = aService.selectOneById(userId);
				
				if(user != null) { // 성공 시
					mv.addObject("user", user);
					mv.setViewName("admin/user_info");
				} else { // 실패 시
					mv.addObject("msg", "정보 조회에 실패하였습니다.");
					mv.addObject("url", "redirect:/index.jsp");
					mv.setViewName("common/error_page");
				}
			} else { // 세션에 저장된 아이디가 없을 경우
				mv.addObject("msg", "로그인 후 이용바랍니다.");
				mv.addObject("url", "/user/login.do");
				mv.setViewName("common/error_page");
			}
		} catch (Exception e) { // 예외처리
			mv.addObject("msg", "서비스 실패");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "redirect:/index.jsp");
			mv.setViewName("common/error_page");
		}
		return mv;
	}	
	
	
	
	
	//관리자-회원정보수정 페이지 이동
	@RequestMapping(value="uModify.do", method=RequestMethod.GET)
	public ModelAndView showModifyInfo(
			ModelAndView mv
			, @RequestParam("userId") String userId) {
		User user = aService.selectOneById(userId);
		mv.addObject("user", user);
		mv.setViewName("admin/user_modify");
		return mv;
	}
	
	
	//관리자-회원정보수정
	@RequestMapping(value="uModify.do", method=RequestMethod.POST)
	public ModelAndView userModify(
			ModelAndView mv
			, @ModelAttribute User user
			, String userId
			, HttpSession session) {
		try {
//			String sessionId = (String)session.getAttribute("userId"); // 세션 아이디
			String sessionId = "admin";
			
			if(sessionId !=null && sessionId != "") {
				int result = aService.updateUser(user);
				if(result > 0) { // 수정 성공 
					mv.setViewName("redirect:/admin/aInfo.do?userId=" + userId);
				} else { // 수정 실패
					mv.addObject("msg", "회원 정보 수정에 실패하였습니다.");
					mv.addObject("url", "redirect:/admin/uModify.do?userId=" + userId);
					mv.setViewName("common/error_page");
				}
			} else {
				mv.addObject("msg", "로그인 후 이용바랍니다.");
				mv.addObject("url", "/admin/a_login.do");
				mv.setViewName("common/error_page");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의해주세요");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/admin/a_login.do");
			mv.setViewName("common/error_page");
		}
		return mv;
	}
	
	
	
	//관리자-회원탈퇴
	@RequestMapping(value="uRemove.do", method=RequestMethod.GET)
	public ModelAndView removeUser(
			ModelAndView mv
			, String userId
			, HttpSession session) {
		try {
			String sessionId = (String)session.getAttribute("userId"); // 세션 아이디
			
			if(sessionId != "" && sessionId != null) {
				int result = aService.deleteUser(userId);
				if(result > 0) {
					mv.addObject("msg", "회원 탈퇴되었습니다.");
					mv.addObject("url", "/admin/list.do");
					mv.setViewName("admin/user_list");
				} else { // 탈퇴 실패
					mv.addObject("msg", "회원 정보 수정에 실패하였습니다.");
					mv.addObject("url", "redirect:/admin/uModify.do?userId=" + sessionId);
					mv.setViewName("common/error_page");
				}
			} else { // 로그인 세션 정보 없을 경우
				mv.addObject("msg", "로그인 후 이용바랍니다.");
				mv.addObject("url", "/admin/login.do");
				mv.setViewName("common/error_page");
			}
		} catch (Exception e) { // 예외처리
			mv.addObject("msg", "관리자에게 문의해주세요");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/user/login.do");
			mv.setViewName("common/error_page");
		}
		return mv;
	}
	
	
}
