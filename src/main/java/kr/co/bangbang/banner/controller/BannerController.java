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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bangbang.banner.domain.BPageInfo;
import kr.co.bangbang.banner.domain.Banner;
import kr.co.bangbang.banner.service.BannerService;

@Controller
public class BannerController {
	
	@Autowired
	private BannerService bService;
	
	@RequestMapping(value = "/banner/insert.do", method = RequestMethod.GET)
	public ModelAndView bannerInsertForm(
			ModelAndView mv) {
		mv.setViewName("banner/b_insert");
		return mv;
	}
	
	 
	@RequestMapping(value = "/banner/insert.do", method = RequestMethod.POST)
	public ModelAndView bannerInsert(
			ModelAndView mv
			,HttpSession session
			, @ModelAttribute Banner banner
			,@RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile
			,HttpServletRequest request) {
		
		try {
//			String bAdminId = (String)session.getAttribute("adminId");
			String bAdminId = "admin";
			if(bAdminId != null && !bAdminId.equals("")) {
				
				banner.setbAdminId(bAdminId);
				
				if(uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
					Map<String, Object> bMap = this.saveFile(request, uploadFile);
					
					banner.setBannerFileName((String)bMap.get("fileName"));
					banner.setBannerFilePath((String)bMap.get("filePath"));
					banner.setBannerFileLength((long)bMap.get("fileLength"));
				}
				
				int result = bService.insertBanner(banner);
				mv.setViewName("redirect:/banner/bList.do");
				
			} else {
				mv.addObject("msg", "배너등록 내용이 존재하지 않습니다");
				mv.addObject("error", "배너등록이 필요합니다.");
				mv.addObject("url", "/index.jsp");
				mv.setViewName("common/error_page");				
			}
		} catch (Exception e) {
			mv.addObject("msg", "배너 등록 실패");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/banner/insert.do");
			mv.setViewName("common/error_page");
		}
		return mv;
	}



	private Map<String, Object> saveFile(HttpServletRequest request, MultipartFile uploadFile) throws Exception, Exception {
		
		Map<String, Object> fileMap = new HashMap<String, Object>();
		
		//resources 경로 구하기
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		//파일 저장 경로 구하기
		String savePath = root + "\\buploadFile";
		
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
		File saveFile = new File(savePath + "\\" + fileRename);
		uploadFile.transferTo(saveFile);
		long fileLength = uploadFile.getSize();
		
		//파일정보 리턴
		fileMap.put("fileName", fileName);
		fileMap.put("fileRename", fileRename);
		fileMap.put("filePath", "../resources/buploadFiles/" + fileRename);
		fileMap.put("fileLength", fileLength);
		
		return fileMap;
	}
	
	
	
	@RequestMapping(value = "/banner/bList.do", method = RequestMethod.GET)
	public ModelAndView showBannerList(
			ModelAndView mv
			,@RequestParam(value = "page", required=false, defaultValue = "1") Integer currentPage) {
		
		Integer totalCount = bService.getListCount();
		BPageInfo bInfo = this.getPageInfo(currentPage, totalCount);
		List<Banner> bList = bService.selectBannerList(bInfo);
		
		mv.addObject("bList", bList).addObject("bInfo", bInfo).setViewName("/banner/b_list");
		return mv;
	}


	private BPageInfo getPageInfo(Integer currentPage, Integer totalCount) {
		
		int recordCountPerPage = 10;
		int naviCountPerPage = 10;
		
		int naviTotalCount;
		naviTotalCount 
			= (int)Math.ceil((double)totalCount/recordCountPerPage);   //6.2 -> 7 올림해주는 식
		
		int startNavi = ((int)((double)currentPage/naviCountPerPage+0.9)-1)*naviCountPerPage+1;  //이거뭐냐...
		
		int endNavi = startNavi + naviCountPerPage - 1;
		
		if(endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}
		
		
		
		BPageInfo bInfo = new BPageInfo(currentPage, totalCount, naviTotalCount, recordCountPerPage, naviCountPerPage, startNavi, endNavi);
		
		return bInfo;
	}	

}
