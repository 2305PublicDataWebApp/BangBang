package kr.co.bangbang.trip.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;

import kr.co.bangbang.trip.domain.TPageInfo;
import kr.co.bangbang.trip.domain.TReply;
import kr.co.bangbang.trip.domain.Trip;
import kr.co.bangbang.trip.service.TReplyService;
import kr.co.bangbang.trip.service.TripService;

@Controller
@RequestMapping(value="/trip/")
public class TripController {
	
	@Autowired
	public TripService tService;
	@Autowired
	public TReplyService tRService;
	
	@RequestMapping(value="t_insert.do", method = RequestMethod.GET)
	public ModelAndView showInsertForm(ModelAndView mv, HttpSession session) {  // ModelAndView => 데이터도 넣고 페이지 이동도 할 수 있음
//		admin 로그인 여부 확인?
		String tAdminId = (String)session.getAttribute("adminId");
		if(tAdminId != null && !tAdminId.equals("")) {
			mv.setViewName("trip/t_insert");
		}
		else {
			mv.addObject("msg", "관리자 정보가 존재하지 않습니다.");
			mv.addObject("error", "관리자 로그인이 필요합니다.");
			mv.addObject("url", "/index.jsp");
			mv.setViewName("common/error_page");
		}
		return mv;
	}

	@RequestMapping(value = "t_insert.do", method = RequestMethod.POST)
	public ModelAndView insertTrip(
			ModelAndView mv
			, @ModelAttribute Trip trip
			, HttpSession session  // 글쓰기 할때 작성자 아이디 고정 시켜놨기 때문에 ModelAttribute사용 할때 작성자가 안들어가므로 세션에서 작성자를 가져온다.
			, HttpServletRequest request ) {
		
		try {
			String tAdminId = (String)session.getAttribute("adminId");
			if(tAdminId != null && !tAdminId.equals("")) {
				trip.settAdminId(tAdminId);
				int result = tService.insertTrip(trip);
				if(result > 0) {
					mv.setViewName("redirect:/trip/t_list.do");
				}
			}
			else {
				mv.addObject("msg", "관리자 정보가 존재하지 않습니다.");
				mv.addObject("error", "관리자 로그인이 필요합니다.");
				mv.addObject("url", "/index.jsp");
				mv.setViewName("common/error_page");
			}
		} catch (Exception e) {
			mv.addObject("msg", "게시글 등록이 완료되지 않았습니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/trip/t_insert.do");
			mv.setViewName("common/error_page");
		}
		return mv;
	}
	
	/**
	 * 썸대노트 ajax 매핑 메소드+1 에디터 업로드 이미지 저장 및 파일 경로 json반환
	 * 
	 * @param multipartFile
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/trip/uploadSummernoteImageFile", method = RequestMethod.POST)
	public JsonObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile,
			HttpServletRequest request) {
		JsonObject jsonObject = new JsonObject();
		try {
			//에디터에서 업로드한 file을 MultipartFile로 받았다.
			
			//1.파일 이름과 경로를 설정한다.
			String originalFileName = multipartFile.getOriginalFilename();
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\images\\trip\\summerImageFiles";
			
			//2.파일이름이 중복되지 않도록 재정의 해준다.
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String extension = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
			String tripFileRename = sdf.format(new Date(System.currentTimeMillis())) + "." + extension;
			
			//3.저장할 경로의 폴더(디렉토리)가 없으면 새로 만든다.
			File targetFile = new File(savePath);
			if (!targetFile.exists()) {
				targetFile.mkdir();
			}
			
			//4.설정한경로에 재정의한 이름으로 파일을 저장한다.
			multipartFile.transferTo(new File(savePath + "\\" + tripFileRename));
			
			//5.ajax의 success로 리턴해줄 json오브젝트에 프로퍼티를 저장해준다.
			// 1)썸머노트의 insertImage 설정값에 넣어줄 파일의 경로.
			// 2)원래 파일이름
			// 3)ajax 성공여부
			jsonObject.addProperty("url", "/resources/images/trip/summerImageFiles/" + tripFileRename);
			jsonObject.addProperty("originName", originalFileName);
			jsonObject.addProperty("responseCode", "success");
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return jsonObject;
	}

	@RequestMapping(value="t_modify.do", method = RequestMethod.GET)
	public ModelAndView showModifyForm(ModelAndView mv 
			, @RequestParam("tripNo") Integer tripNo) {
		try {
			Trip trip = tService.selectTripByNo(tripNo);
			mv.addObject("trip", trip);
			mv.setViewName("trip/t_modify");
		} catch (Exception e) {
			mv.addObject("msg", "게시글 조회에 실패했습니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/trip/t_insert.do");
			mv.setViewName("common/error_page");
		}
		return mv;
	}

	@RequestMapping(value="t_modify.do", method = RequestMethod.POST)
	public ModelAndView modifyTrip(ModelAndView mv
			, @ModelAttribute Trip trip
			, HttpSession session
			, HttpServletRequest request) {
		try {
			String adminId = (String)session.getAttribute("adminId");
			String tAdminId = trip.gettAdminId();
			if(tAdminId != null && tAdminId.contains("admin")) {
				// 수정이라는 과정은 대체하는 것, 대체하는 방법은 삭제 후 등록
				int result = tService.updateTrip(trip);
				if(result > 0) {
					mv.setViewName("redirect:/trip/t_detail.do?tripNo=" + trip.getTripNo());
				}
				else {
					mv.addObject("msg", "게시글 수정이 완료되지 않았습니다.");
					mv.addObject("error", "게시글 수정 실패");
					mv.addObject("url", "/trip/t_modify.do?tripNo=" + trip.getTripNo());
					mv.setViewName("common/error_page");
				}
			}
			else {
				mv.addObject("msg", "게시글 수정 권한이 없습니다.");
				mv.addObject("error", "게시글 수정 불가");
				mv.addObject("url", "/trip/t_modify.do?tripNo=" + trip.getTripNo());
				mv.setViewName("common/error_page");
			}
		} catch (Exception e) {
			mv.addObject("msg", "해당 ID는 관리자가 아닙니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/trip/t_list.kh");
			mv.setViewName("common/error_page");
		}
		return mv;
	}

	@RequestMapping(value="t_delete.do", method = RequestMethod.GET)
	public ModelAndView deleteTrip(ModelAndView mv
			,@ModelAttribute Trip trip, HttpSession session) {
		try {
			String adminId = (String)session.getAttribute("adminId");
			String tAdminId = trip.gettAdminId();
			if(tAdminId != null && "admin".equals(adminId)) {
				int result = tService.deleteTrip(trip);
				if(result > 0) {
					mv.setViewName("redirect:/trip/t_list.do");
				}
				else {
					mv.addObject("msg", "게시글 삭제를 실패하였습니다.");
					mv.addObject("error", "게시글 삭제 실패");
					mv.addObject("url", "/trip/t_list.do");
					mv.setViewName("common/error_page");
				}
			}
			else {
				mv.addObject("msg", "관리자만 삭제할 수 있습니다.");
				mv.addObject("error", "게시글 삭제 불가");
				mv.addObject("url", "/trip/t_list.do");
				mv.setViewName("common/error_page");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의바랍니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/trip/t_list.do");
			mv.setViewName("common/error_page");
		}
		return mv;
	}

	@RequestMapping(value="t_list.do", method = RequestMethod.GET)
	public ModelAndView showTripList(@RequestParam(value="page", required = false, defaultValue = "1") Integer tCurrentPage, ModelAndView mv) {
		try {
			Integer tTotalCount = tService.getListCount();
			TPageInfo tPInfo = this.getTPageInfo(tCurrentPage, tTotalCount);
			List<Trip> tList = tService.selectTripList(tPInfo);
			mv.addObject("tList", tList);
			mv.addObject("tPInfo", tPInfo);
			mv.setViewName("trip/t_list");
		} catch (Exception e) {
			mv.addObject("msg", "게시글 조회에 실패했습니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/index.jsp");
			mv.setViewName("common/error_page");
		}
		return mv;
	}
//	@RequestMapping(value="t_list.do", method = RequestMethod.GET)
//	public ModelAndView showList(ModelAndView mv) {
//		mv.setViewName("trip/t_list");
//		return mv;
//	}

	@RequestMapping(value = "t_detail.do", method = RequestMethod.GET)
	public ModelAndView showTripDetail(@RequestParam("tripNo") Integer tripNo , ModelAndView mv) {
		try {
			// 게시글 내용 가져오면서 댓글 창도 같이 가져오기
			Trip trip = tService.selectTripByNo(tripNo);
			if(trip != null) {
				List<TReply> tRList = tRService.selectTReplyList(tripNo);
				// 댓글 전체 갯수 가져오기
				int tReplyCount = tRService.selectTReplyTotalCount(tripNo);
				
				if(tRList.size() > 0) {
					mv.addObject("tRList", tRList);
					mv.addObject("tReplyCount", tReplyCount);
				}
				mv.addObject("trip", trip).setViewName("trip/t_detail");
			}else {
				mv.addObject("msg", "게시글 데이터 조회를 실패하였습니다.");
				mv.addObject("url", "/trip/t_list.do");
				mv.addObject("error", "게시글 조회 실패");
				mv.setViewName("common/error_page");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의해주세요.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/trip/t_list.do");
			mv.setViewName("common/error_page");
		}
		return mv;
	}
	
	@RequestMapping(value="t_search.do", method = RequestMethod.GET)
	public ModelAndView tripSearchList(@RequestParam("searchCondition") String searchCondition
			, @RequestParam("searchKeyword") String searchKeyword
			, @RequestParam(value = "page", required = false, defaultValue = "1") Integer tCurrentPage
			, ModelAndView mv) {
		// 동적 쿼리
		
		// 2개의 값을 하나의 변수로 다루는 방법
		// HashMap 사용하기
		Map<String, String> tParamMap = new HashMap<String, String>();
		// put()메소드를 사용해서 key-value 설정을 하는데 key값(파란색 글씨)이 mapper.xml에서 사용 됨
		tParamMap.put("searchCondition", searchCondition);
		tParamMap.put("searchKeyword", searchKeyword);
		int tTotalCount = tService.getListCount(tParamMap);
		TPageInfo tPInfo = this.getTPageInfo(tCurrentPage, tTotalCount);
		List<Trip> searchList = new ArrayList<Trip>();
		searchList = tService.searchTripByKeyword(tPInfo, tParamMap);
		if(!searchList.isEmpty()) {
			mv.addObject("sTList", searchList);
			mv.addObject("tPInfo", tPInfo);
			mv.addObject("searchCondition", searchCondition);
			mv.addObject("searchKeyword", searchKeyword);
			mv.setViewName("trip/t_search");
		}
		else {
			mv.addObject("msg", "데이터 조회가 완료되지 않았습니다.");
			mv.addObject("error", "공지사항 제목으로 조회 실패");
			mv.addObject("url", "/trip/t_list.do");
			mv.setViewName("common/error_page");
		}
		return mv;
	}

	//	@RequestMapping(value="t_list.do", method = RequestMethod.GET)
	//	public ModelAndView showList(ModelAndView mv) {
	//		mv.setViewName("trip/t_list");
	//		return mv;
	//	}
	
		public TPageInfo getTPageInfo(Integer tCurrentPage, Integer tTotalCount) {
			int tRecordCountPerPage = 10;
			int tNaviCountPerPage = 5;
			int tNaviTotalCount;
			
			tNaviTotalCount = (int)Math.ceil((double) tTotalCount/tRecordCountPerPage);
			int tStartNavi = (((int)((double) tCurrentPage/tNaviCountPerPage + 0.9)) -1) * tNaviCountPerPage +1;
			int tEndNavi = tStartNavi + tNaviCountPerPage -1;
			if(tEndNavi > tNaviTotalCount) {
				tEndNavi = tNaviTotalCount;
			}
			TPageInfo tPInfo = new TPageInfo(tCurrentPage, tRecordCountPerPage, tNaviCountPerPage, tStartNavi, tEndNavi, tTotalCount, tNaviTotalCount);
			return tPInfo;
		}
}
