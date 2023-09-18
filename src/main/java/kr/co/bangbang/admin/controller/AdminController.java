package kr.co.bangbang.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bangbang.admin.domain.Admin;
import kr.co.bangbang.admin.service.AdminService;

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
}
