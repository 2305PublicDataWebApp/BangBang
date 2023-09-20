package kr.co.bangbang.search.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bangbang.search.domain.SPageInfo;
import kr.co.bangbang.search.service.SearchService;

@Controller
public class SearchController {

//	@Autowired
//	private SearchService sService;
	
//	@RequestMapping(value="/search/i_total_search.do", method = RequestMethod.GET)
//	public ModelAndView showSearchList(
//			@RequestParam(value = "page", required = false, defaultValue = "1") Integer sCurrentPage,
//			ModelAndView mv) {
//		
//		try {
//			Integer sTotalCount = sService.getListCount();
//			SPageInfo sPInfo = this.getSPageInfo(sCurrentPage, sTotalCount);
//			List<E>
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
//		return mv;
//	}
//
//	private SPageInfo getSPageInfo(Integer sCurrentPage, Integer sTotalCount) {
//		// TODO Auto-generated method stub
//		return null;
//	}
}
