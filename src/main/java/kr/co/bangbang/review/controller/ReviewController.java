package kr.co.bangbang.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.bangbang.review.service.RReplyService;
import kr.co.bangbang.review.service.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService rService;
	@Autowired
	private RReplyService rrService;
	
	
}
