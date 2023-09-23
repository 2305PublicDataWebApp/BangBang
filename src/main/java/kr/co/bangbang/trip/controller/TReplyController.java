package kr.co.bangbang.trip.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bangbang.trip.domain.TReply;
import kr.co.bangbang.trip.service.TReplyService;
import kr.co.bangbang.trip.service.TripService;

@Controller
@RequestMapping("/tReply")
public class TReplyController {
	@Autowired
	private TReplyService tRService;
	@Autowired
	private TripService tService;
	
	@RequestMapping(value="/add.do", method = RequestMethod.POST)
	public ModelAndView insertTReply(ModelAndView mv
			, @ModelAttribute TReply tReply
			, HttpSession session) {
		String url="";
		try {
			String tReplyWriter = (String)session.getAttribute("userId");
			if(tReplyWriter != null && !tReplyWriter.equals("")) {
				tReply.settRUserId(tReplyWriter);
				int result = tRService.insertTReply(tReply);
				url = "/trip/t_detail.do?tripNo=" + tReply.gettTripNo();
				if(result > 0) {
					mv.setViewName("redirect:" + url);
				}
				else {
					mv.addObject("msg", "댓글등록이 완료 되지 않았습니다.");
					mv.addObject("error", "댓글 등록 실패");
					mv.addObject("url", url);
					mv.setViewName("common/error_page");
				}
			}
			else {
				mv.addObject("msg", "로그인이 필요한 서비스 입니다.");
				mv.addObject("error", "로그인 정보 조회 실패");
				mv.addObject("url", "/user/join.do" );
				mv.setViewName("common/error_page");
			}
		} catch (Exception e) {
			mv.addObject("msg", "서비스 실패");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", url);
			mv.setViewName("common/error_page");
		}
		return mv;
	}
	
	@RequestMapping(value="/update.do", method = RequestMethod.POST)
	public ModelAndView updateTReply(ModelAndView mv, @ModelAttribute TReply tReply, HttpSession session) {
		// 세션은 서버가 올라갈 때 자동으로 생성 됨
		String url = "";
		try {
			String userId = (String)session.getAttribute("userId");
			String tRAdminId = (String)session.getAttribute("adminId");
			String replyWriter = tReply.gettRUserId();
			url = "/trip/t_detail.do?tripNo="+tReply.gettTripNo();
			if(!replyWriter.equals("") && replyWriter.equals(userId)|| tRAdminId.contains("amdin")) {
				tReply.settRUserId(userId);
				int result = tRService.updateTReply(tReply);
				if(result > 0) {
					mv.setViewName("redirect:" + url);
				}
			}
			else {
				mv.addObject("msg", "로그인이 되지 않았습니다.");
				mv.addObject("error", "로그인 정보 확인 실패");
				mv.addObject("url", "/index.jsp");
				mv.setViewName("common/error_page");
			}
			
		} catch (Exception e) {
			mv.addObject("msg", "서비스 실패.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", url);
			mv.setViewName("common/error_page");
		}
		return mv;
	}
	
	@RequestMapping(value="/delete.do", method = RequestMethod.GET)
	public ModelAndView deleteTReply(ModelAndView mv
			,@ModelAttribute TReply tReply
//			, @RequestParam("replyNo") Integer replyNo
//			, @RequestParam("replyWriter") String replyWriter
			, HttpSession session) {// Integer 쓰는 이유 => Null 체크가 가능 함
		// DELETE FROM REPLY_TBL WHERE REPLY_NO = 샵{replyNo} AND R_STATUS = 'Y'  // 주석이지만 샾 때문에 실행 안돼서 한글로 적음
		// UPDATE REPLY_TBL SET R_STATUS = 'N' WHERE REPLY_NO = 샵{replyNo}
		String url = "";
		try {
			// 세션에서 아이디 가져오는거 많이 쓰임
			String userId = (String)session.getAttribute("userId");  // 세션에서 getAttribute로 값을 가져오면 오브젝트인가 암튼 그런식으로 가져와기 때문에 형변환 해줘야 함
			String tRAdminId = (String)session.getAttribute("adminId");
			String replyWriter = tReply.gettRUserId();
			url = "/trip/t_detail.do?tripNo="+tReply.gettTripNo();
			if((replyWriter != null && replyWriter.equals(userId)) || tRAdminId.contains("admin")) {  // null이 아니면 진행해라
//				Reply reply = new Reply();
//				reply.setReplyNo(replyNo);
//				reply.setReplyWriter(replyWriter);  // 값이 많아져서 ModelAttribute로 받아옴
				int result = tRService.deleteTReply(tReply);
				if(result > 0) {
					// 성공
					mv.setViewName("redirect:" + url);
				}
				else {
					// 실패
					mv.addObject("msg", "댓글 삭제가 완료되지 않았습니다.");
					mv.addObject("error", "댓글 삭제 실패");
					mv.addObject("url", url);
					mv.setViewName("common/error_page");
				}
			}
			else {
				mv.addObject("msg", "자신의 댓글만 삭제할 수 있습니다.");
				mv.addObject("error", "댓글 삭제 불가");
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
}
