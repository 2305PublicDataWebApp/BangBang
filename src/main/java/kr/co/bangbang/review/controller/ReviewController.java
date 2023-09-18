package kr.co.bangbang.review.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bangbang.review.domain.RReply;
import kr.co.bangbang.review.domain.Review;
import kr.co.bangbang.review.service.RReplyService;
import kr.co.bangbang.review.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private ReviewService rService;
	@Autowired
	private RReplyService rrService;
	
//	@RequestMapping(value="/rdetail.do", method=RequestMethod.GET)
//	public ModelAndView showReviewDetail(ModelAndView mv
//			, @RequestParam("noticeNo") Integer reviewNo) {
//		try {
//			Review reviewOne = rService.selectReviewByNo(reviewNo);
//			if(reviewOne != null) {
//				List<RReply> rreplyList = rService.selectReplyList(reviewNo);
//				if(reviewOne != null)
//			}
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
//	}
	
}
