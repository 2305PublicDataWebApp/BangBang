package kr.co.bangbang.review.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bangbang.review.domain.RPageInfo;
import kr.co.bangbang.review.domain.RReply;
import kr.co.bangbang.review.domain.Review;
import kr.co.bangbang.review.service.RReplyService;
import kr.co.bangbang.review.service.ReviewService;

@Controller
@RequestMapping("/review/")
public class ReviewController {

	@Autowired
	private ReviewService rService;
	@Autowired
	private RReplyService rrService;
	
	@RequestMapping(value="r_detail.do", method=RequestMethod.GET)
	public ModelAndView showReviewDetail(ModelAndView mv
			, @RequestParam("reviewNo") Integer reviewNo) {
		try {
			Review reviewOne = rService.selectReviewByNo(reviewNo);
			if(reviewOne != null) {
				List<RReply> rreplyList = rrService.selectReplyList(reviewNo);
				if(rreplyList.size() > 0) {
					mv.addObject("rrList", rreplyList);
				}
				mv.addObject("review", reviewOne);
				mv.setViewName("review/r_detail");
			}else {
				mv.addObject("msg", "게시글 데이터 조회 실패");
				mv.addObject("error","게시글 조회 실패");
				mv.addObject("url","r_list.do");
				mv.setViewName("common/error_page");
			}
		} catch (Exception e) {
			mv.addObject("msg","관리자에게 문의해주세요.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url","r_insert.do");
			mv.setViewName("common/error_page");
		}
		return mv;
	}
	
	@RequestMapping(value="r_list.do", method=RequestMethod.GET)
	public ModelAndView showReviewList(
			@RequestParam(value="page", required=false, defaultValue="1") Integer rCurrentPage
			, ModelAndView mv) {
		try {
			Integer rTotalCount = rService.getRListCount();
			RPageInfo rInfo = this.getRPageInfo(rCurrentPage, rTotalCount);
			List<Review> rList = rService.selectReviewList(rInfo);
			mv.addObject("rList", rList);
			mv.addObject("rInfo", rInfo);
			mv.setViewName("review/r_list");
		} catch (Exception e) {
		mv.addObject("msg", "게시글 조회에 실패했습니다.");
		mv.addObject("error", e.getMessage());
		mv.addObject("url", "r_insert.do");
		mv.setViewName("common/error_page");
		}
		return mv;
	}

	private RPageInfo getRPageInfo(Integer rCurrentPage, Integer rTotalCount) {
		int rRecordCountPerPage = 10;
		int rNaviCountPerPage = 10;
		int rNaviTotalCount;
		rNaviTotalCount = (int)Math.ceil((double)rTotalCount/rRecordCountPerPage);
		
		int rStartNavi = ((int)((double)rCurrentPage/rNaviCountPerPage+0.9)-1)*rNaviCountPerPage+1;
		int rEndNavi = rStartNavi + rNaviCountPerPage -1;
		if(rEndNavi > rNaviTotalCount) {
			rEndNavi = rNaviTotalCount;
		}
		RPageInfo rInfo = new RPageInfo(rCurrentPage, rTotalCount, rNaviTotalCount, rRecordCountPerPage, rNaviCountPerPage, rStartNavi, rEndNavi);
		
		return rInfo;
	}
	
	@RequestMapping(value="r_insert.do", method=RequestMethod.GET)
	public ModelAndView showReviewForm(ModelAndView mv) {
		mv.setViewName("review/r_insert");
		return mv;
	}
	
	@RequestMapping(value="r_insert.do", method=RequestMethod.POST)
	public ModelAndView insertReview(
			ModelAndView mv
			, @ModelAttribute Review review
			, HttpSession session
			, HttpServletRequest request) {
		try {
			String rUserId = (String)session.getAttribute("userId");
			if(rUserId != null && !rUserId.equals("")) {
				review.setrUserId(rUserId);
				int result = rService.insertReview(review);
				if(result > 0) {
					mv.setViewName("redirect:/review/r_list.do");
				}
				mv.setViewName("redirect:/review/r_list.do");
			}else {
				mv.addObject("msg", "정보가 존재하지 않습니다.");
				mv.addObject("error", "로그인 해주세요");
				mv.addObject("url", "/index.jsp");
				mv.setViewName("common/error_page");
			}
		} catch (Exception e) {
			mv.addObject("msg","게시글 등록 실패");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/review/r_list.do");
			mv.setViewName("common/error_page");
		}
		return mv;
	}
	
	@RequestMapping(value="r_modify.do", method=RequestMethod.POST)
	public ModelAndView modifyReview(ModelAndView mv
			, @ModelAttribute Review review
			, HttpSession session
			, HttpServletRequest request) {
		try {
			String userId = (String)session.getAttribute("userId");
			String rUserId = review.getrUserId();
			if(rUserId != null && rUserId.equals(userId)) {
				int result = rService.modifyReview(review);
				if(result > 0) {
					mv.setViewName("redirect:/review/r_detail.do?reviewNo="+review.getReviewNo());
				}else {
					mv.addObject("msg", "게시글 수정 실패");
					mv.addObject("error", "게시글 수정 실패");
					mv.addObject("url", "/review/r_detail.do?reviewNo="+review.getReviewNo());
					mv.setViewName("common/error_page");
				}
			}else {
				mv.addObject("msg", "권한이 없음");
				mv.addObject("error", "게시글 수정 불가");
				mv.addObject("url", "/review/r_detail.do?reviewNo="+review.getReviewNo());
				mv.setViewName("common/error_page");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/review/r_detail.do?reviewNo="+review.getReviewNo());
			mv.setViewName("common/error_page");
		}
		return mv;
	}

	@RequestMapping(value="r_delete.do", method=RequestMethod.GET)
	public ModelAndView deleteReview(ModelAndView mv
			, @RequestParam("reviewNo") Integer reviewNo
			, @RequestParam("rUserId") String rUserId
			, HttpSession session) {
		try {
			String userId = (String)session.getAttribute("userId");
			Review review = new Review();
			review.setReviewNo(reviewNo);
			review.setrUserId(userId);
			if(rUserId != null && rUserId.equals(userId)) {
				int result = rService.deleteReview(review);
				if(result > 0) {
					mv.setViewName("redirect:/review/r_list.do");
				}else {
					mv.addObject("msg", "게시글 삭제 실패");
					mv.addObject("error", "게시글 삭제 실패");
					mv.addObject("url", "/review/r_list.do");
				}
			}else {
				mv.addObject("msg", "권한 부족");
				mv.addObject("error","게시글 삭제 불가");
				mv.addObject("url" ,"/review/r_list.do");
				mv.setViewName("common/error_page");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의바랍니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/review/r_list.do");
			mv.setViewName("common/error_page");
		}
		return mv;
	}
	
	@RequestMapping(value="r_modify.do", method=RequestMethod.GET)
	public ModelAndView showModifyForm(ModelAndView mv
			, @RequestParam("reviewNo") Integer reviewNo) {
		try {
			Review review = rService.selectReviewByNo(reviewNo);
			mv.addObject("review", review);
			mv.setViewName("review/r_modify");
		} catch (Exception e) {
			mv.addObject("msg","게시글 조회 실패");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/review/r_inser.do");
			mv.setViewName("common/error_page");
		}
		return mv;
	}
	
	@RequestMapping(value="r_search.do", method=RequestMethod.GET)
	public ModelAndView searchReviewList(
			@RequestParam("searchCondition") String searchCondition
			, @RequestParam("searchKeyword") String searchKeyword
			, @RequestParam(value="page", required=false, defaultValue="1") Integer rCurrentPage
			, ModelAndView mv) {
		Map<String, String> rparamMap = new HashMap<String, String>();
		rparamMap.put("searchCondition", searchCondition);
		rparamMap.put("searchKeyword", searchKeyword);
		int rTotalCount = rService.getRListCount(rparamMap);
		RPageInfo rInfo = this.getRPageInfo(rCurrentPage, rTotalCount);
		List<Review> searchRList = new ArrayList<Review>();
		searchRList = rService.searchReviewByKeyword(rInfo, rparamMap);
		if(!searchRList.isEmpty()) {
			mv.addObject("searchCondition", searchCondition);
			mv.addObject("searchKeyword", searchKeyword);
			mv.addObject("rInfo", rInfo);
			mv.addObject("rList", searchRList);
			mv.setViewName("review/r_search");
		}else {
			mv.addObject("msg","데이터 조회가 완료되지 않았습니다.");
			mv.addObject("error","공지사항 제목으로 목록 조회 실패");
			mv.addObject("url","/review/r_list.do");
			mv.setViewName("common/error_page");		
		}
		return mv;
	}
}
