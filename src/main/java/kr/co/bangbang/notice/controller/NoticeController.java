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
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeService nService;
	
	@RequestMapping(value="/ninsert.do", method=RequestMethod.GET)
	public ModelAndView showInsertForm(ModelAndView mv) {
		mv.setViewName("/n_insert");
		return mv;
	}
	
	@RequestMapping(value="/ninsert.do", method=RequestMethod.POST)
	public ModelAndView insertNotice(
			ModelAndView mv
			, @ModelAttribute Notice notice
			,HttpSession session
			,HttpServletRequest request) {
		try {
			String rAdminId = (String)session.getAttribute("adminId");
			if(rAdminId != null && !rAdminId.equals("")) {
				notice.setrAdminId(rAdminId);
				int result = nService.insertNotice(notice);
				if(result > 0) {
					mv.setViewName("redirect:/nlist.do");
				}
				mv.setViewName("redirect:/nlist.do");
			}else {
				mv.addObject("msg","로그인 정보가 존재하지 않습니다.");
				mv.addObject("url","/nlist.do");
				mv.setViewName("common/error_page");
			}
		}catch(Exception e) {
			mv.addObject("msg","관리자에게 문의하세요.");
			mv.addObject("url","/nlist.do");
			mv.setViewName("common/error_page");
		}
		return mv;
	}
	
	@RequestMapping(value="/nlist.do", method=RequestMethod.GET)
	public ModelAndView showNoticeList(
			@RequestParam(value="page", required=false, defaultValue="1") Integer nCurrentPage, ModelAndView mv) {
		try {
			Integer nTotalCount = nService.getNListCount();
			NPageInfo nInfo = this.getNPageInfo(nCurrentPage, nTotalCount);
			List<Notice> nList = nService.selectNoticeList(nInfo);
			mv.addObject("nList", nList).addObject("nInfo", nInfo).setViewName("/n_list");
		} catch (Exception e) {
			mv.addObject("msg", "목록 조회 오류");
			mv.addObject("url", "ninsert.do");
			mv.setViewName("common/error_page");
		}
		return mv;
	}

	private NPageInfo getNPageInfo(Integer nCurrentPage, Integer nTotalCount) {
		int nRecordCountPerPage = 10;
		int nNaviCountPerPage = 5;
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
	
	@RequestMapping(value="/ndetail.do", method=RequestMethod.GET)
	public ModelAndView showNoticeDetail(ModelAndView mv
			, @RequestParam("noticeNo") Integer noticeNo){
		try {
			Notice noticeOne = nService.selectNoticeByNo(noticeNo);
			mv.addObject("notice", noticeOne);
			mv.setViewName("/ndetail");
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의하세용");
			mv.addObject("url", "nlist.do");
			mv.setViewName("common/error_page");
		}
		return mv;
	}
	
	@RequestMapping(value="/nmodify.do", method=RequestMethod.GET)
	public ModelAndView showModifyForm(ModelAndView mv
			, @RequestParam("noticeNo") Integer noticeNo) {
		try {
			Notice notice = nService.selectNoticeByNo(noticeNo);
			mv.addObject("notice", notice);
			mv.setViewName("/n_modify");
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의하세용");
			mv.addObject("url", "/ndetail.do");
			mv.setViewName("common/error_page");
		}
		return mv;
	}
	
	@RequestMapping(value="/ndelete.do", method=RequestMethod.GET)
	public ModelAndView noticeDelete(ModelAndView mv
			, @RequestParam("noticeNo") Integer noticeNo
			, @RequestParam("noticeWriter") String rAdminId
			, HttpSession session) {
		try {
			String adminId = (String)session.getAttribute("adminId");
			Notice notice = new Notice();
			notice.setNoticeNo(noticeNo);
			notice.setrAdminId(adminId);
			if(rAdminId != null && adminId.equals("admin")) {
				int result = nService.deleteNotice(notice);
				if(result > 0) {
					mv.setViewName("redirect:/nlist.do");
				}else {
					mv.addObject("msg", "삭제가 실패하였습니다.");
					mv.addObject("url", "/nlist.do");
					mv.setViewName("common/error_page");
				}
			}else {
				mv.addObject("msg", "삭제가 실패하였습니다.");
				mv.addObject("url", "/nlist.do");
				mv.setViewName("common/error_page");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의하세영.");
			mv.addObject("url", "/nlist.do");
			mv.setViewName("common/error_page");
		}
		return mv;
	}
	
	@RequestMapping(value="/nmodify.do", method=RequestMethod.POST)
	public ModelAndView noticeModify(ModelAndView mv
			, @ModelAttribute Notice notice
			, HttpSession session) {
		try {
			String adminId = (String)session.getAttribute("adminId");
			String rAdminId = notice.getrAdminId();
			if(rAdminId != null && adminId.equals("admin")) {
				int result = nService.modifyNotice(notice);
				if(result > 0) {
					mv.setViewName("redirect:/ndetail.kh?noticeNo="+notice.getNoticeNo());
				}else {
					mv.addObject("msg", "수정에 실패하였습니다.");
					mv.addObject("url", "/nlist.do");
					mv.setViewName("common/error_page");
				}
			}else {
				mv.addObject("msg", "수정에 실패하였습니다.");
				mv.addObject("url", "/nlist.do");
				mv.setViewName("common/error_page");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의하세영.");
			mv.addObject("url", "/nlist.do");
			mv.setViewName("common/error_page");
		}
		return mv;
	}
	
}
