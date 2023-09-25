package kr.co.bangbang.review.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bangbang.review.domain.RReply;
import kr.co.bangbang.review.service.RReplyService;

@Controller
@RequestMapping("/rreply/")
public class RReplyController {

	@Autowired
	private RReplyService rrSerivce;

	@RequestMapping(value = "rr_insert.do", method = RequestMethod.POST)
	public ModelAndView insertRReply(ModelAndView mv, @ModelAttribute RReply rreply, HttpSession session) {
		String url = "";
		try {
			String rrUserId = (String) session.getAttribute("userId");
			if (rrUserId != null && !rrUserId.equals("")) {
				rreply.setrrUserId(rrUserId);
				int result = rrSerivce.insertRReply(rreply);
				url = "/review/r_detail.do?reviewNo=" + rreply.getrReviewNo();
				if (result > 0) {
					mv.setViewName("redirect:" + url);
				} else {
					mv.addObject("msg", "댓글 등록 실패");
					mv.addObject("error", "댓글 등록 실패");
					mv.addObject("url", url);
					mv.setViewName("common/error_page");
				}
			} else {
				mv.addObject("msg", "댓글 작성 권한 없음");
				mv.addObject("error", "로그인 정보 조회 실패");
				mv.addObject("url", url);
				mv.setViewName("common/error_page");
			}

		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의바랍니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", url);
			mv.setViewName("common/error_page");
		}
		return mv;
	}

	@RequestMapping(value = "rr_modify.do", method = RequestMethod.POST)
	public ModelAndView modifyRReply(ModelAndView mv, @ModelAttribute RReply rreply, HttpSession session) {
		String url = "";
		try {
			String rrUserId = (String) session.getAttribute("userId");
			if (!rrUserId.equals("")) {
				rreply.setrrUserId(rrUserId);
				int result = rrSerivce.modifyRReply(rreply);
				url = "/review/r_detail.do?reviewNo=" + rreply.getrReviewNo();
				if (result > 0) {
					mv.setViewName("redirect:" + url);
				} else {
					mv.addObject("msg", "댓글 수정 실패");
					mv.addObject("error", "댓글 수정 실패");
					mv.addObject("url", url);
					mv.setViewName("common/error_page");
				}
			} else {
				mv.addObject("msg", "댓글 수정 권한 없음");
				mv.addObject("error", "로그인 정보확인 실패");
				mv.addObject("url", "/index.jsp");
				mv.setViewName("common/error_page");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의바랍니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", url);
			mv.setViewName("common/error_page");
		}
		return mv;
	}

	@RequestMapping(value = "rr_delete.do", method = RequestMethod.GET)
	public ModelAndView deleteRReply(ModelAndView mv, @ModelAttribute RReply rreply, HttpSession session) {
		String url = "";
		try {
			String userId = (String) session.getAttribute("userId");
			String rrAdminId = (String) session.getAttribute("adminId");
			String rrUserId = rreply.getrrUserId();
			url = "/review/r_detail.do?reviewNo=" + rreply.getrReviewNo();
			if ((rrUserId != null && rrUserId.equals(userId)) || rrAdminId.contains("admin")) {
				int result = rrSerivce.deleteRReply(rreply);
				if (result > 0) {
					mv.setViewName("redirect:" + url);
				} else {
					mv.addObject("msg", "댓글 삭제 실패");
					mv.addObject("error", "댓글 삭제 실패");
					mv.addObject("url", url);
					mv.setViewName("common/error_page");
				}
			} else {
				mv.addObject("msg", "댓글 수정 권한 없음");
				mv.addObject("error", "댓글 삭제 실패");
				mv.addObject("url", url);
				mv.setViewName("common/error_page");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의바랍니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/index.jsp");
			mv.setViewName("common/error_page");
		}
		return mv;
	}
}