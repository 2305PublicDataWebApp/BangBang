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
@RequestMapping("/rreply")
public class RReplyController {
	@Autowired
	private RReplyService rrSerivce;
	
	@RequestMapping(value="/insertrReply.do", method=RequestMethod.POST)
	public ModelAndView insertrReply(ModelAndView mv
			, @ModelAttribute RReply rreply
			, HttpSession session) {
		String url ="";
		try {
			String rrUserId = (String)session.getAttribute("userId");
			rreply.setRrUserId(rrUserId);
			int result = rrSerivce.insertrReply(rreply);
			url="/rdetail.do?reviewNo="+rreply.getrReviewNo();
			if(result > 0) {
				mv.setViewName("redirect"+url);
			}else {
				mv.addObject("msg","댓글 등록 실패");
				mv.addObject("url", url);
				mv.setViewName("common/error_page");
			}
			
		} catch (Exception e) {
			mv.addObject("msg","관리자에게 문의하세용");
			mv.addObject("url", url);
			mv.setViewName("common/error_page");
		}
		return mv;
	}
	
	@RequestMapping(value="/rmodify.do", method=RequestMethod.POST)
	public ModelAndView modifyRReply(ModelAndView mv
			,@ModelAttribute RReply rreply
			, HttpSession session) {
		String url = "";
		try {
			String rrUserId = (String)session.getAttribute("userId");
			if(!rrUserId.equals("")) {
				rreply.setRrUserId(rrUserId);
				int result = rrSerivce.modifyrreply(rreply);
				url = "/rdetail.do?reviewNo="+rreply.getrReviewNo();
				if(result > 0) {
					mv.setViewName("redirect:"+url);
				}else {
					mv.addObject("msg", "댓글등록완료실패");
					mv.addObject("url", url);
					mv.setViewName("common/error_page");
				}
			}else {
				mv.addObject("msg", "로그인이 되지 않았음");
				mv.addObject("url", "/index.jsp");
				mv.setViewName("common/error_page");
			}
		} catch (Exception e) {
			mv.addObject("msg","관리자에게 문의");
			mv.addObject("url",url);
			mv.setViewName("common/error_page");
		}
		return mv;
	}
	
	@RequestMapping(value="/rdelete.do", method=RequestMethod.GET)
	public ModelAndView deleterreply(ModelAndView mv
			, @ModelAttribute RReply rreply
			, HttpSession session) {
		String url="";
		try {
			String userId = (String)session.getAttribute("userId");
			String rrUserId = rreply.getRrUserId();
			url = "/ndetail.do?reviewNo="+rreply.getrReviewNo();
			if(rrUserId != null && rrUserId.equals(userId)) {
				int result = rrSerivce.deleterreply(rreply);
				if(result > 0) {
					mv.setViewName("redirect:"+url);
				}else {
					mv.addObject("msg", "댓글삭제실패");
					mv.addObject("url", url);
					mv.setViewName("common/error_page");
				}
			}else {
				mv.addObject("msg", "자신의 댓글만 삭제 가능");
				mv.addObject("url", url);
				mv.setViewName("common/error_page");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의ㄱㄱ");
			mv.addObject("url",url);
			mv.setViewName("common/error_page");
		}
		return mv;
	}
}