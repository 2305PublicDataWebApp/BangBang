package kr.co.bangbang.banner.controller;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
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

import kr.co.bangbang.banner.domain.BPageInfo;
import kr.co.bangbang.banner.domain.Banner;
import kr.co.bangbang.banner.service.BannerService;

@Controller
@RequestMapping(value="/banner/")
public class BannerController {
	
	@Autowired
	private BannerService bService;
	
	/**
	 * 배너등록 페이지이동
	 * @param mv
	 * @return
	 */
	@RequestMapping(value = "insert.do", method = RequestMethod.GET)
	public ModelAndView bannerInsertForm(
			ModelAndView mv) {
		mv.setViewName("banner/b_insert");
		return mv;
	}
	
	 /**
	  * 배너등록
	  * @param mv
	  * @param session
	  * @param banner
	  * @param uploadFile
	  * @param request
	  * @return
	  */
	@RequestMapping(value = "insert.do", method = RequestMethod.POST)
	public ModelAndView bannerInsert(
			ModelAndView mv
			,HttpSession session
			, @ModelAttribute Banner banner
			,@RequestParam(value = "fileUpload", required = false) MultipartFile uploadFile
			,HttpServletRequest request) {
		
		try {
//			String bannerNo = (String)session.getAttribute("bannerNo");
			String bAdminId = (String)session.getAttribute("adminId");
//			String bAdminId = "admin";
			if(bAdminId != null && !bAdminId.equals("")) {
				
				banner.setbAdminId(bAdminId);
				
				if(uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
					Map<String, Object> bMap = this.saveFile(request, uploadFile);
					
					banner.setBannerFileName((String)bMap.get("fileName"));
					banner.setBannerFilePath((String)bMap.get("filePath"));
					banner.setBannerFileLength((long)bMap.get("fileLength"));
				}
				
				int result = bService.insertBanner(banner);
				if(result > 0) {
					mv.setViewName("redirect:/banner/bList.do");
				} else {
					mv.addObject("msg", "관리자 배너등록 실패");
					mv.addObject("url", "/index.jsp");
					mv.setViewName("common/error_page");	
				}	
			} else {
				mv.addObject("msg", "관리자 로그인 후 이용가능");
				mv.addObject("url", "admin/a_login.do");
				mv.setViewName("common/error_page");				
			}
		} catch (Exception e) {
			mv.addObject("msg", "서비스 실패");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/banner/insert.do");
			mv.setViewName("common/error_page");
		}
		return mv;
	}



	/**
	 * 배너다중삭제
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/delete.do", method = RequestMethod.GET)
    public String ajaxTest(
    		HttpServletRequest request) throws Exception {

        String[] ajaxMsg = request.getParameterValues("valueArr");
        int size = ajaxMsg.length;
        int result = 0;
        for(int i=0; i<size; i++) {
        	result += bService.delete(ajaxMsg[i]);
        }
        return result+"";
    }

	/**
	 * 배너리스트
	 * @param mv
	 * @param currentPage
	 * @return
	 */
	@RequestMapping(value = "bList.do", method = RequestMethod.GET)
	public ModelAndView showBannerList(
			ModelAndView mv
			,@RequestParam(value = "page", required=false, defaultValue = "1") Integer currentPage) {
		
		Integer totalCount = bService.getListCount();
		BPageInfo bInfo = this.getPageInfo(currentPage, totalCount);
		List<Banner> bList = bService.selectBannerList(bInfo);
		
		mv.addObject("bList", bList).addObject("bInfo", bInfo).setViewName("/banner/b_list");
		return mv;
	}

	/**
	 * 파일저장
	 * @param request
	 * @param uploadFile
	 * @return
	 * @throws Exception
	 * @throws Exception
	 */
	private Map<String, Object> saveFile(HttpServletRequest request, MultipartFile uploadFile) throws Exception, Exception {
		
		Map<String, Object> fileMap = new HashMap<String, Object>();
		
		//resources 경로 구하기
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		//파일 저장 경로 구하기
		String savePath = root + "\\buploadFiles";
		
		//파일 이름 구하기
		String fileName = uploadFile.getOriginalFilename();
		
		//파일 확장자 구하기
		String extension 
		= fileName.substring(fileName.lastIndexOf(".")+1);
		
		//시간으로 파일 리네임하기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileRename = sdf.format(new Date(System.currentTimeMillis()));
		
		//파일 저장 전 폴더 만들기
		File saveFolder = new File(savePath);
		if(!saveFolder.exists()) {
			saveFolder.mkdir();
		}
		
		//파일저장
		File saveFile = new File(savePath + "\\" + fileRename + "." + extension);
		uploadFile.transferTo(saveFile);
		long fileLength = uploadFile.getSize();
		
		//파일정보 리턴
		fileMap.put("fileName", fileName);
		fileMap.put("fileRename", fileRename);
		fileMap.put("filePath", "../resources/buploadFiles/" + fileRename + "." + extension);
		fileMap.put("fileLength", fileLength);
		
		return fileMap;
	}

	/**
	 * 배너리스트 페이징
	 * @param currentPage
	 * @param totalCount
	 * @return
	 */
	private BPageInfo getPageInfo(Integer currentPage, Integer totalCount) {
		
		int recordCountPerPage = 10;
		int naviCountPerPage = 10;
		
		int naviTotalCount;
		naviTotalCount 
			= (int)Math.ceil((double)totalCount/recordCountPerPage);   //6.2 -> 7 �삱由쇳빐二쇰뒗 �떇
		
		int startNavi = ((int)((double)currentPage/naviCountPerPage+0.9)-1)*naviCountPerPage+1;  //�씠嫄곕춴�깘...
		
		int endNavi = startNavi + naviCountPerPage - 1;
		
		if(endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}
	
		BPageInfo bInfo = new BPageInfo(currentPage, totalCount, naviTotalCount, recordCountPerPage, naviCountPerPage, startNavi, endNavi);
		
		return bInfo;
	}
	
	
	
}
