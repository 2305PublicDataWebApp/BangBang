package kr.co.bangbang.user.controller;

import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bangbang.user.domain.User;
import kr.co.bangbang.user.service.UserService;

@Controller
@RequestMapping(value="/user/")
public class UserController {
	
	@Autowired
	private UserService uService;
	
	/**
	 * 회원가입 구현
	 * @param mv
	 * @param userId
	 * @param userPw
	 * @param userPwRe
	 * @param userName
	 * @param userNickname
	 * @param userEmail
	 * @param userPhone
	 * @param uBirth
	 * @return ModelAndView
	 */
	@RequestMapping(value="join.do", method=RequestMethod.POST)
	public ModelAndView userRegister(
			ModelAndView mv
			, @RequestParam("userId") String userId
			, @RequestParam("userPw") String userPw
			, @RequestParam("userPwRe") String userPwRe
			, @RequestParam("userName") String userName
			, @RequestParam("userNickname") String userNickname
			, @RequestParam("userEmail") String userEmail
			, @RequestParam("userPhone") String userPhone
			, @RequestParam(value="userBirth", required=false) String uBirth
			) {
		try {
			// date 형변환
			DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDate birthdDte = LocalDate.parse(uBirth, format);
			Date userBirth = Date.valueOf(birthdDte);
			User user = new User(userId, userPw, userPwRe, userName, userNickname, userEmail, userPhone, userBirth);
			
			int result = uService.userRegister(user);
			if(result > 0) {
				mv.setViewName("user/login"); // 성공 시 로그인 페이지
			} else {  // 실패
				mv.addObject("msg", "회원가입에 실패하였습니다.");
				mv.addObject("url", "/user/join.do");
				mv.setViewName("common/error_page");
			}
		} catch (Exception e) { // 예외처리
			mv.addObject("msg", "회원가입 실패");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/user/join.do");
			mv.setViewName("common/error_page");
		}
		return mv;
	}
	
	/**
	 * 로그인 구현
	 * @param mv
	 * @param user
	 * @param session
	 * @return ModelAndView
	 */
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public ModelAndView userLogin(
			ModelAndView mv
			, @ModelAttribute User user
			, HttpSession session) {
		try {
			User uOne = uService.userLoginCheck(user);
			if(uOne != null) {	// 성공 시 아이디, 비밀번호 세션에 저장
				session.setAttribute("userId", uOne.getUserId());
				session.setAttribute("userPw", uOne.getUserPw());
				mv.setViewName("redirect:/index.jsp");
			} else { // 실패
				mv.addObject("msg", "로그인에 실패하였습니다.");
				mv.addObject("url", "/user/login.do");
				mv.setViewName("common/error_page");
			}
		} catch (Exception e) { // 예외처리
			mv.addObject("msg", "회원가입 실패");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/user/join.do");
			mv.setViewName("common/error_page");
		}
		return mv;
	}
	
	/**
	 * 로그아웃 구현
	 * @param mv
	 * @param session
	 * @return ModelAndView
	 */
	@RequestMapping(value="logout.do", method=RequestMethod.GET)
	public ModelAndView userLogout(
			ModelAndView mv
			, HttpSession session) {
		if(session != null) {
			session.invalidate();
			mv.setViewName("redirect:/index.jsp");
		} else {
			mv.addObject("msg", "로그아웃에 실패하였습니다.");
			mv.addObject("url", "/index.jsp");
			mv.setViewName("common/error_page");
		}
		return mv;
	}
	
	/**
	 * 로그인 페이지 이동
	 * @param mv 
	 * @return ModelAndView
	 */
	@RequestMapping(value="login.do", method=RequestMethod.GET)
	public ModelAndView showLoginFrom(ModelAndView mv) {
		mv.setViewName("user/login");
		return mv;
	}
	
	/**
	 * 아이디 찾기 페이지 이동
	 * @param mv
	 * @return ModelAndView
	 */
	@RequestMapping(value="find_id.do", method=RequestMethod.GET)
	public ModelAndView showFindIdForm(ModelAndView mv) {
		mv.setViewName("user/find_id");
		return mv;
		
	}
	
	/**
	 * 비밀번호 찾기 페이지 이동
	 * @param mv
	 * @return ModelAndView
	 */
	@RequestMapping(value="find_pw.do", method=RequestMethod.GET)
	public ModelAndView showFindPwForm(ModelAndView mv) {
		mv.setViewName("user/find_pw");
		return mv;
	}
	
	/**
	 * 마이페이지 이동
	 * @param mv
	 * @param userId
	 * @param session
	 * @return ModelAndView
	 */
	@RequestMapping(value="mypage.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView selectOneById(
			ModelAndView mv
			, @RequestParam("userId") String userId
			, HttpSession session) {
		try {
			String sessionId = (String)session.getAttribute("userId"); // 세션에 저장된 아이디
			if(userId.equals(sessionId) && sessionId != "" && sessionId != null) {
				User user = uService.selectOneById(userId);
				if(user != null) {
					mv.addObject("user", user);
					mv.setViewName("user/mypage");
				} else {
					mv.addObject("msg", "정보 조회에 실패하였습니다.");
					mv.addObject("url", "redirect:/index.jsp");
					mv.setViewName("common/error_page");
				}
			} else { // 세션에 저장된 아이디가 없을 경우
				mv.addObject("msg", "로그인 후 이용바랍니다.");
				mv.addObject("url", "/user/login.do");
				mv.setViewName("common/error_page");
			}
		} catch (Exception e) {
		mv.addObject("msg", "서비스 실패");
		mv.addObject("error", e.getMessage());
		mv.addObject("url", "redirect:/index.jsp");
		mv.setViewName("common/error_page");
		}
		return mv;
	}
	
	/**
	 * 개인 정보 조회 페이지 이동
	 * @param mv
	 * @param userId
	 * @param session
	 * @return ModelAndView
	 */
	@RequestMapping(value="info.do", method=RequestMethod.GET)
	public ModelAndView showUserInfo(
			ModelAndView mv
			, @RequestParam("userId") String userId
			, HttpSession session) {
		try {
			String sessionId = (String)session.getAttribute("userId"); // 세션에 저장된 아이디
			
			if(userId.equals(sessionId) && sessionId != "" && sessionId != null) {
				User user = uService.selectOneById(userId);
				
				if(user != null) { // 성공 시
					mv.addObject("user", user);
					mv.setViewName("user/info");
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
	
	/**
	 * 비밀번호 체크 페이지로 이동
	 * @param mv
	 * @param user
	 * @param session
	 * @return ModelAndView
	 */
	@RequestMapping(value="check_pw.do", method=RequestMethod.GET)
	public ModelAndView CheckPwForm(
			ModelAndView mv
			, @ModelAttribute User user
			, HttpSession session) {
		String sessionId = (String)session.getAttribute("userId");
		if(sessionId != null && !sessionId.isEmpty()) {
			mv.setViewName("user/check_pw"); // 비밀번호 확인 페이지로 이동
		} else {
			mv.addObject("msg", "로그인 후 이용바랍니다.");
			mv.addObject("url", "/user/login.do");
			mv.setViewName("errorPage"); // 오류 페이지로 이동
		}
		return mv;
	}
	
	/**
	 * 회원 정보 수정 비밀번호 검증
	 * @param mv
	 * @param userPw
	 * @param session
	 * @return ModelAndView
	 */
	@RequestMapping(value="check_pw.do", method=RequestMethod.POST)
	public ModelAndView checkPassword(
			ModelAndView mv
			, @RequestParam("userPw") String userPw
			, HttpSession session) {
		String userId = (String)session.getAttribute("userId"); // 세션 아이디
		
		User uUser = new User();
		uUser.setUserId(userId);
		uUser.setUserPw(userPw);
		User user = uService.userLoginCheck(uUser);
		
		if(user != null) {
			User uOne = uService.selectOneById(userId);
			mv.addObject("user", uOne);
			mv.setViewName("redirect:/user/modify.do?userId=" + userId);
		} else {
			mv.addObject("msg", "비밀번호가 일치하지 않습니다.");
			mv.addObject("url", "/user/check_pw");
			mv.setViewName("error_page"); // 오류 페이지로 이동
		}
		return mv;
	}
	
	/**
	 * 회원 탈퇴 비밀번호 검증 페이지 이동
	 * @param mv
	 * @param user
	 * @param session
	 * @return ModelAndView
	 */
	@RequestMapping(value="remove_check.do", method=RequestMethod.GET)
	public ModelAndView removeCheckForm(
			ModelAndView mv
			, @ModelAttribute User user
			, HttpSession session) {
		
		String sessionId = (String)session.getAttribute("userId"); // 세션 아이디
		
		if(sessionId != null && !sessionId.isEmpty()) {
			mv.setViewName("user/remove_check"); // 비밀번호 확인 페이지로 이동
		} else {
			mv.addObject("msg", "로그인 후 이용바랍니다.");
			mv.addObject("url", "/user/login.do");
			mv.setViewName("errorPage"); // 오류 페이지로 이동
		}
		return mv;
	}
	
	/**
	 * 회원 탈퇴 비밀번호 검증
	 * @param mv
	 * @param userPw
	 * @param session
	 * @return ModelAndView
	 */
	@RequestMapping(value="remove_check.do", method=RequestMethod.POST)
	public ModelAndView removeCheck(
			ModelAndView mv
			, @RequestParam("userPw") String userPw
			, HttpSession session) {
		String userId = (String)session.getAttribute("userId"); // 세션 아이디
		
		User uUser = new User();
		uUser.setUserId(userId);
		uUser.setUserPw(userPw);
		User user = uService.userLoginCheck(uUser);
		
		if(user != null) {
			User uOne = uService.selectOneById(userId);
			mv.addObject("user", uOne);
			mv.setViewName("redirect:/user/remove.do?userId=" + userId);
		} else {
			mv.addObject("msg", "비밀번호가 일치하지 않습니다.");
			mv.addObject("url", "/user/check_pw");
			mv.setViewName("error_page"); // 오류 페이지로 이동
		}
		return mv;
	}
	
	/**
	 * 회원 정보 수정
	 * @param mv
	 * @param user
	 * @param userId
	 * @param session
	 * @return ModelAndView
	 */
	@RequestMapping(value="modify.do", method=RequestMethod.POST)
	public ModelAndView userModify(
			ModelAndView mv
			, @ModelAttribute User user
			, String userId
			, HttpSession session) {
		try {
			String sessionId = (String)session.getAttribute("userId"); // 세션 아이디
			
			if(userId.equals(sessionId) && sessionId !=null && sessionId != "") {
				int result = uService.updateUser(user);
				if(result > 0) { // 수정 성공 
					mv.setViewName("redirect:/user/mypage.do?userId=" + sessionId);
				} else { // 수정 실패
					mv.addObject("msg", "회원 정보 수정에 실패하였습니다.");
					mv.addObject("url", "redirect:/user/modify.do?userId=" + sessionId);
					mv.setViewName("common/error_page");
				}
			} else {
				mv.addObject("msg", "로그인 후 이용바랍니다.");
				mv.addObject("url", "/user/login.do");
				mv.setViewName("common/error_page");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의해주세요");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/user/login.do");
			mv.setViewName("common/error_page");
		}
		return mv;
	}
	
	/**
	 * 회원 탈퇴
	 * @param mv
	 * @param userId
	 * @param session
	 * @return ModelAndView
	 */ 
	@RequestMapping(value="remove.do", method=RequestMethod.POST)
	public ModelAndView removeUser(
			ModelAndView mv
			, String userId
			, HttpSession session) {
		try {
			String sessionId = (String)session.getAttribute("userId"); // 세션 아이디
			if(userId.equals(sessionId) && sessionId != "" && sessionId != null) {
				int result = uService.deleteUser(userId);
				if(result > 0) {
					mv.addObject("msg", "회원 탈퇴되었습니다.");
					mv.addObject("url", "/user/logout.do");
					mv.setViewName("common/inform");
				} else { // 탈퇴 실패
					mv.addObject("msg", "회원 정보 수정에 실패하였습니다.");
					mv.addObject("url", "redirect:/user/modify.do?userId=" + sessionId);
					mv.setViewName("common/error_page");
				}
			} else { // 로그인 세션 정보 없을 경우
				mv.addObject("msg", "로그인 후 이용바랍니다.");
				mv.addObject("url", "/user/login.do");
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
	
	/**
	 * 회원가입 페이지 이동
	 * @param mv
	 * @return ModelAndView
	 */
	@RequestMapping(value="join.do", method=RequestMethod.GET)
	public ModelAndView showRegisterForm(ModelAndView mv) {
		mv.setViewName("user/join");
		return mv;
	}
	
	/**
	 * 개인 정보 수정 페이지 이동
	 * @param mv
	 * @return ModelAndView
	 */
	@RequestMapping(value="modify.do", method=RequestMethod.GET)
	public ModelAndView showModifyInfo(
			ModelAndView mv
			, @RequestParam("userId") String userId) {
		User user = uService.selectOneById(userId);
		mv.addObject("user", user);
		mv.setViewName("user/modify");
		return mv;
	}
	
	// 내가 쓴 게시글 검색 페이지 이동
	@RequestMapping(value="my_board_search.do", method=RequestMethod.GET)
	public ModelAndView showMyBoardSearch(
			ModelAndView mv
			, String userId) {
		User user = uService.selectOneById(userId);
		mv.addObject("user", user);
		mv.setViewName("user/my_board_search");
		return mv;
	}
	
	// 내가 쓴 게시글 페이지 이동
	@RequestMapping(value="my_board.do", method=RequestMethod.GET)
	public ModelAndView showMyBoard(ModelAndView mv) {
		mv.setViewName("user/my_board");
		return mv;
	}
	
	// 댓글 쓴 게시글 검색 페이지 이동
	@RequestMapping(value="my_reply_search.do", method=RequestMethod.GET)
	public ModelAndView showMyReplySearch(ModelAndView mv) {
		mv.setViewName("user/my_reply_search");
		return mv;
	}
	
	// 댓글 쓴 게시글 페이지 이동
	@RequestMapping(value="my_reply.do", method=RequestMethod.GET)
	public ModelAndView showMyReply(ModelAndView mv) {
		mv.setViewName("user/my_reply");
		return mv;
	}
	
	// 회원 탈퇴 페이지 이동
	@RequestMapping(value="remove.do", method=RequestMethod.GET)
	public ModelAndView showRemoveForm(ModelAndView mv) {
		mv.setViewName("user/remove");
		return mv;
	}
}
