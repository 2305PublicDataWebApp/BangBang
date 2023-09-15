package kr.co.bangbang.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/user/")
public class UserController {
	
	@RequestMapping(value="login.do", method=RequestMethod.GET)
	public String showLoginFrom(Model model) {
		return "user/login";
	}
	
}
