package kr.co.bangbang.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.bangbang.review.service.RReplyService;

@Controller
@RequestMapping("/rreply")
public class RReplyController {
	@Autowired
	private RReplyService rrSerivce;
}
