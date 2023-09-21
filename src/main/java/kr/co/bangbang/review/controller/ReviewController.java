package kr.co.bangbang.review.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bangbang.notice.domain.Notice;
import kr.co.bangbang.review.domain.RPageInfo;
import kr.co.bangbang.review.domain.RReply;
import kr.co.bangbang.review.domain.Review;
import kr.co.bangbang.review.service.RReplyService;
import kr.co.bangbang.review.service.ReviewService;
import kr.co.bangbang.trip.domain.Trip;

@Controller
@RequestMapping("/review/")
public class ReviewController {

	@Autowired
	private ReviewService rService;
	@Autowired
	private RReplyService rrService;
	
	@RequestMapping(value="r_insert.do", method=RequestMethod.GET)
	public ModelAndView showInsertForm(ModelAndView mv) {
		mv.setViewName("review/r_insert");
		return mv;
	}

	@RequestMapping(value="r_insert.do", method=RequestMethod.POST)
	public ModelAndView insertReview(ModelAndView mv
			, @ModelAttribute Review review
			, HttpServletRequest request
			, HttpSession session) {
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
				mv.addObject("msg","게시글 등록 실패");
				mv.addObject("error","로그인 필요");
				mv.addObject("url", "/review/r_list.do");
				mv.setViewName("common/error_page");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의 바람");
			mv.addObject("error",e.getMessage());
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
			mv.addObject("msg", "게시글 수정 실패");
			mv.addObject("error",e.getMessage());
			mv.addObject("url", "/notice/r_insert.do");
			mv.setViewName("common_error_page");
		}
		return mv;
	}

	@RequestMapping(value="r_modify.do",method=RequestMethod.POST)
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
					mv.addObject("error","게시글 수정 실패");
					mv.addObject("url", "/review/r_detail.do?reviewNo="+review.getReviewNo());
					mv.setViewName("common/error_page");					
				}
			}else {
				mv.addObject("msg", "게시글 수정 권한 없음");
				mv.addObject("error","권한이 없음");
				mv.addObject("url", "/review/r_detail.do?reviewNo="+review.getReviewNo());
				mv.setViewName("common/error_page");				
			}
		} catch (Exception e) {
			mv.addObject("msg", "게시글 수정 실패");
			mv.addObject("error",e.getMessage());
			mv.addObject("url", "/review/r_detail.do?reviewNo="+review.getReviewNo());
			mv.setViewName("common/error_page");
		}
		return mv;
	}

	@RequestMapping(value="r_delete.do", method=RequestMethod.GET)
	public ModelAndView deleteReview(ModelAndView mv
			, @ModelAttribute Review review
			, HttpSession session) {
		try {
			String userId = (String)session.getAttribute("userId");
			String rUserId = review.getrUserId();
			if(rUserId != null && rUserId.equals(userId)) {
				int result = rService.deleteReview(review);
				if(result > 0) {
					mv.setViewName("redirect:/review/r_list.do");
				}else {
					mv.addObject("msg", "게시글 삭제 실패");
					mv.addObject("url", "/review/r_detail.do?reviewNo="+review.getReviewNo());
					mv.setViewName("common/error_page");					
				}
			}else {
				mv.addObject("msg", "본인글만 삭제 가능");
				mv.addObject("error", "권한없음");
				mv.addObject("url", "/review/r_detail.do?reviewNo="+review.getReviewNo());
				mv.setViewName("common/error_page");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의해주세요.");
			mv.addObject("error",e.getMessage());
			mv.addObject("url", "/review/r_list.do");
			mv.setViewName("common/error_page");
		}
		return mv;
	}
	
	@RequestMapping(value="r_list.do", method=RequestMethod.GET)
	public ModelAndView showReviewList(
			@RequestParam(value="page", required=false, defaultValue="1") Integer rCurrentPage, ModelAndView mv) {
		try {
			Integer rTotalCount = rService.getRListCount();
			RPageInfo rInfo = this.getRPageInfo(rCurrentPage, rTotalCount);
			List<Review> rList = rService.selectReviewList(rInfo);
			mv.addObject("rList", rList).addObject("rInfo", rInfo).setViewName("review/r_list");
		} catch (Exception e) {
			mv.addObject("msg", "게시글 목록 조회 실패");
			mv.addObject("error",e.getMessage());
			mv.addObject("url", "/index.jsp");
			mv.setViewName("common/error_page");
		}
		return mv;
	}

	@RequestMapping(value="r_detail.do", method=RequestMethod.GET)
	public ModelAndView showReviewDetail(ModelAndView mv
			, @RequestParam("reviewNo") Integer reviewNo) {
		try {
			Review review = rService.selectReviewByNo(reviewNo);
			if(review != null) {
				List<RReply> rrList = rrService.selectReplyList(reviewNo);
				int rReplyCount = rrService.selectRReplyTotalCount(reviewNo);
				if(rrList.size()>0) {
					mv.addObject("rrList", rrList);
					mv.addObject("rReplyCount", rReplyCount);
				}
				mv.addObject("review", review);
				mv.setViewName("review/r_detail");
			}else {
				mv.addObject("msg","개시글 조회 실패");
				mv.addObject("url","/review/r_list.do");
				mv.setViewName("common/error_page");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의하세요.");
			mv.addObject("error",e.getMessage());
			mv.addObject("url", "/review/r_list.do");
			mv.setViewName("common/error_page");
		}
		return mv;
	}
	
	private RPageInfo getRPageInfo(Integer rCurrentPage, int rTotalCount) {
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
	
	@RequestMapping(value="r_search.do", method=RequestMethod.GET)
	public ModelAndView searchReviewList(ModelAndView mv
			, @RequestParam("seachCondition") String searchCondition
			, @RequestParam("searchKeyword") String searchKeyword
			, @RequestParam(value="page", required=false, defaultValue="1") Integer rCurrentPage) {
		Map<String, String> rParamMap = new HashMap<String, String>();
		rParamMap.put("searchCondition", searchCondition);
		rParamMap.put("searchKeyword", searchKeyword);
		int rTotalCount = rService.getRListCount(rParamMap);
		RPageInfo rInfo = this.getRPageInfo(rCurrentPage, rTotalCount);
		List<Review> searchList = new ArrayList<Review>();
		searchList = rService.searchReviewByKeyword(rInfo, rParamMap);
		if(!searchList.isEmpty()) {
			mv.addObject("searchCondition", searchCondition);
			mv.addObject("searchKeyword", searchKeyword);
			mv.addObject("rInfo", rInfo);
			mv.addObject("rList", searchList);
			mv.setViewName("review/r_search");
		}else {
			mv.addObject("msg", "데이터 조회 실패");
			mv.addObject("url", "/review/r_list.do");
			mv.setViewName("common/error_page");
		}
		return mv;
	}
	
	
}
