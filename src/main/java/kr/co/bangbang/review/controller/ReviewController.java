package kr.co.bangbang.review.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
				int rreplyCount = rrService.selectRReplyTotalCount(reviewNo);
				
				if(rreplyList.size() > 0) {
					mv.addObject("rrList", rreplyList);
					mv.addObject("rreplyCount", rreplyCount);
				}
				mv.addObject("review", reviewOne);
				mv.setViewName("review/r_detail");
			}else {
				mv.addObject("msg", "게시글 조회 실패");
				mv.addObject("error","게시글 조회 실패");
				mv.addObject("url","/review/r_list.do");
				mv.setViewName("common/error_page");
			}
		} catch (Exception e) {
			mv.addObject("msg","관리자에게 문의바랍니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url","/review/r_list.do");
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
		mv.addObject("msg", "관리자에게 문의바랍니다.");
		mv.addObject("error", e.getMessage());
		mv.addObject("url", "/index.jsp");
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
			, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
			, HttpSession session
			, HttpServletRequest request) {
		try {
			String rUserId = (String)session.getAttribute("userId");
			if(rUserId != null && !rUserId.equals("")) {
				review.setrUserId(rUserId);
				if(uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
					Map<String, Object>rMap = this.saveFile(request, uploadFile);
					review.setReviewFilename((String)rMap.get("rfileName"));
					review.setReviewFileRename((String)rMap.get("rfileRename"));
					review.setReviewFilepath((String)rMap.get("rfilePath"));
					review.setReviewFileLength((long)rMap.get("rfileLength"));
					
				}
				int result = rService.insertReview(review);
				if(result > 0) {
					mv.setViewName("redirect:/review/r_list.do");
				}
				mv.setViewName("redirect:/review/r_list.do");
			}else {
				mv.addObject("msg", "로그인 후 이용 가능");
				mv.addObject("url", "/index.jsp");
				mv.setViewName("common/error_page");
			}
		} catch (Exception e) {
			mv.addObject("msg","관리자에게 문의바랍니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/review/r_list.do");
			mv.setViewName("common/error_page");
		}
		return mv;
	}
	
	private Map<String, Object> saveFile(HttpServletRequest request, MultipartFile uploadFile) throws Exception{
		Map<String, Object> fileMap = new HashMap<String, Object>();
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\ruploadFiles";
		String rfileName = uploadFile.getOriginalFilename();
		String extension
		= rfileName.substring(rfileName.lastIndexOf(".")+1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String rfileRename = sdf.format(new Date(System.currentTimeMillis()))+"."+extension;
		File saveFolder = new File(savePath);
		if(!saveFolder.exists()) {
			saveFolder.mkdir();
		}
		File saveFile = new File(savePath+"\\"+rfileRename);
		uploadFile.transferTo(saveFile);
		long rfileLength = uploadFile.getSize();
		fileMap.put("rfileName", rfileName);
		fileMap.put("rfileRename", rfileRename);
		fileMap.put("rfilePath", "/resources/ruploadFiles/"+rfileRename);
		fileMap.put("rfileLength", rfileLength);
		return fileMap;
	}

	@RequestMapping(value="r_modify.do", method=RequestMethod.POST)
	public ModelAndView modifyReview(ModelAndView mv
			, @ModelAttribute Review review
			, HttpSession session
			, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
			, HttpServletRequest request) {
		try {
			String userId = (String)session.getAttribute("userId");
			String rUserId = review.getrUserId();
			if(rUserId != null && rUserId.equals(userId)) {
				if(uploadFile != null && rUserId.equals(userId)) {
					String rfileRename = review.getReviewFileRename();
					if(rfileRename != null) {
						this.deleteFile(rfileRename, request);
					}
					Map<String, Object> rFileMap = this.saveFile(request, uploadFile);
					review.setReviewFilename((String)rFileMap.get("rfileName"));
					review.setReviewFileRename((String)rFileMap.get("rfileRename"));
					review.setReviewFilepath((String)rFileMap.get("rfilePath"));
					review.setReviewFileLength((long)rFileMap.get("rfileLength"));
				}
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
				mv.addObject("msg", "게시글 수정 권한 없음");
				mv.addObject("error", "게시글 수정 불가");
				mv.addObject("url", "/review/r_detail.do?reviewNo="+review.getReviewNo());
				mv.setViewName("common/error_page");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의바랍니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/review/r_detail.do?reviewNo="+review.getReviewNo());
			mv.setViewName("common/error_page");
		}
		return mv;
	}

	private void deleteFile(String rfileRename, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String delPath = root + "\\ruploadFiles\\" + rfileRename;
		File delFile = new File(delPath);
		if(delFile.exists()) {
			delFile.delete();
		}
		
	}

	@RequestMapping(value="r_delete.do", method=RequestMethod.GET)
	public ModelAndView deleteReview(ModelAndView mv
			, @ModelAttribute Review review
			, HttpSession session) {
		try {
			String userId = (String)session.getAttribute("userId");
			String rAdminId = (String)session.getAttribute("adminId");
			String rUserId = review.getrUserId();
			if((rUserId != null && rUserId.equals(userId)) || rAdminId.contains("admin")) {
				int result = rService.deleteReview(review);
				if(result > 0) {
					mv.setViewName("redirect:/review/r_list.do");
				}else {
					mv.addObject("msg", "게시글 삭제 실패");
					mv.addObject("error", "게시글 삭제 실패");
					mv.addObject("url", "/review/r_list.do");
				}
			}else {
				mv.addObject("msg", "게시글 삭제 권한 없음");
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
			mv.addObject("msg","관리자에게 문의바랍니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/review/r_list.do");
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
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchKeyword", searchKeyword);
		int rTotalCount = rService.getRListCount(paramMap);
		RPageInfo rInfo = this.getRPageInfo(rCurrentPage, rTotalCount);
		List<Review> searchRList = new ArrayList<Review>();
		searchRList = rService.searchReviewByKeyword(rInfo, paramMap);
		if(!searchRList.isEmpty()) {
			mv.addObject("searchCondition", searchCondition);
			mv.addObject("searchKeyword", searchKeyword);
			mv.addObject("rInfo", rInfo);
			mv.addObject("rList", searchRList);
			mv.setViewName("review/r_search");
		}else {
			mv.addObject("msg","데이터 조회 실패");
			mv.addObject("error","공지사항 제목으로 목록 조회 실패");
			mv.addObject("url","/index.jsp");
			mv.setViewName("common/error_page");		
		}
		return mv;
	}

}
