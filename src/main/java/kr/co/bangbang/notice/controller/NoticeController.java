package kr.co.bangbang.notice.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bangbang.notice.domain.NPageInfo;
import kr.co.bangbang.notice.domain.Notice;
import kr.co.bangbang.notice.service.NoticeService;

@Controller
@RequestMapping("/notice/")
public class NoticeController {
	
	@Autowired
	private NoticeService nService;
	
	@RequestMapping(value="n_insert.do", method=RequestMethod.GET)
	public ModelAndView showInsertForm(ModelAndView mv) {
		mv.setViewName("notice/n_insert");
		return mv;
	}
	
	@RequestMapping(value="n_insert.do", method=RequestMethod.POST)
	public ModelAndView insertNotice(
			ModelAndView mv
			, @ModelAttribute Notice notice
			,HttpSession session
			,HttpServletRequest request) {
		try {
			String nAdminId = (String)session.getAttribute("adminId");
			if(nAdminId != null && !nAdminId.equals("")) {
				notice.setnAdminId(nAdminId);
				int result = nService.insertNotice(notice);
				if(result > 0) {
					mv.setViewName("redirect:/notice/n_list.do");
				}
				mv.setViewName("redirect:/notice/n_list.do");
			}else {
				mv.addObject("msg","관리자 정보가 존재하지 않습니다.");
				mv.addObject("error","로그인이 필요합니다");
				mv.addObject("url","/index.jsp");
				mv.setViewName("common/error_page");
			}
		}catch(Exception e) {
			mv.addObject("msg","게시글 등록 실패");
			mv.addObject("error",e.getMessage());			
			mv.addObject("url","/notice/n_list.do");
			mv.setViewName("common/error_page");
		}
		return mv;
	}
	
	@RequestMapping(value="n_modify.do", method=RequestMethod.GET)
	public ModelAndView showModifyForm(ModelAndView mv
			, @RequestParam("noticeNo") Integer noticeNo
			, @ModelAttribute Notice notice) {
		try {
			notice = nService.selectNoticeByNo(noticeNo);
			mv.addObject("notice", notice);
			mv.setViewName("notice/n_modify");
		} catch (Exception e) {
			mv.addObject("msg", "게시글 조회 실패");
			mv.addObject("error",e.getMessage());
			mv.addObject("url", "/notice/n_list.do");
			mv.setViewName("common/error_page");
		}
		return mv;
	}

	@RequestMapping(value="n_modify.do", method=RequestMethod.POST)
	public ModelAndView modifyNotice(ModelAndView mv
			, @ModelAttribute Notice notice
			, HttpSession session
			, HttpServletRequest request) {
		try {
			String adminId = (String)session.getAttribute("adminId");
			String nAdminId = notice.getnAdminId();
			if(nAdminId != null && nAdminId.contains("admin")) {
				int result = nService.modifyNotice(notice);
				if(result > 0) {
					mv.setViewName("redirect:/notice/n_detail.do?noticeNo="+notice.getNoticeNo());
				}else {
					mv.addObject("msg", "게시글 수정 실패");
					mv.addObject("error","게시글 수정 실패");
					mv.addObject("url", "/notice/n_detail.do?noticeNo="+notice.getNoticeNo());
					mv.setViewName("common/error_page");
				}
			}else {
				mv.addObject("msg", "게시글 수정 실.");
				mv.addObject("error","게시글 수정 실패");
				mv.addObject("url", "/notice/n_detail.do?noticeNo="+notice.getNoticeNo());
				mv.setViewName("common/error_page");
			}
		} catch (Exception e) {
			mv.addObject("msg", "게시글 수정 실패");
			mv.addObject("error",e.getMessage());
			mv.addObject("url", "/notice/n_detail.do?noticeNo="+notice.getNoticeNo());
			mv.setViewName("common/error_page");
		}
		return mv;
	}

	@RequestMapping(value="n_list.do", method=RequestMethod.GET)
	public ModelAndView showNoticeList(
			@RequestParam(value="page", required=false, defaultValue="1") Integer nCurrentPage, ModelAndView mv) {
		try {
			Integer nTotalCount = nService.getNListCount();
			NPageInfo nInfo = this.getNPageInfo(nCurrentPage, nTotalCount);
			List<Notice> nList = nService.selectNoticeList(nInfo);
			mv.addObject("nList", nList);
			mv.addObject("nInfo", nInfo);
			mv.setViewName("notice/n_list");
			mv.addObject("nList", nList).addObject("nInfo", nInfo).setViewName("notice/n_list");
		} catch (Exception e) {
			mv.addObject("msg", "목록 조회 오류");
			mv.addObject("error",e.getMessage());
			mv.addObject("url", "/index.jsp");
			mv.setViewName("common/error_page");
		}
		return mv;
	}

	@RequestMapping(value="n_detail.do", method=RequestMethod.GET)
	public ModelAndView showNoticeDetail(ModelAndView mv
			, @RequestParam("noticeNo") Integer noticeNo){
		try {
			Notice noticeOne = nService.selectNoticeByNo(noticeNo);
			mv.addObject("notice", noticeOne);
			mv.setViewName("notice/n_detail");
		} catch (Exception e) {
			mv.addObject("msg", "게시글 상세 조회 실패");
			mv.addObject("error",e.getMessage());
			mv.addObject("url", "/notice/n_list.do");
			mv.setViewName("common/error_page");
		}
		return mv;
	}

	private NPageInfo getNPageInfo(Integer nCurrentPage, Integer nTotalCount) {
		int nRecordCountPerPage = 10;
		int nNaviCountPerPage = 10;
		int nNaviTotalCount;
		nNaviTotalCount = (int)Math.ceil((double)nTotalCount/nRecordCountPerPage);
		
		int nStartNavi = ((int)((double)nCurrentPage/nNaviCountPerPage+0.9)-1)*nNaviCountPerPage+1;
		int nEndNavi = nStartNavi + nNaviCountPerPage - 1;
		if(nEndNavi > nNaviTotalCount) {
			nEndNavi = nNaviTotalCount;
		}
		NPageInfo nInfo = new NPageInfo(nCurrentPage, nTotalCount, nNaviTotalCount, nRecordCountPerPage, nNaviCountPerPage, nStartNavi, nEndNavi);
		return nInfo;
	}
	
}
