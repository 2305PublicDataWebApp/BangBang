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
	
	@RequestMapping(value = "insert.do", method = RequestMethod.GET)
	public ModelAndView bannerInsertForm(
			ModelAndView mv) {
		mv.setViewName("banner/b_insert");
		return mv;
	}
	
	 
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
					mv.addObject("msg", "諛곕꼫�벑濡� �궡�슜�씠 議댁옱�븯吏� �븡�뒿�땲�떎");
					mv.addObject("error", "諛곕꼫�벑濡앹씠 �븘�슂�빀�땲�떎.");
					mv.addObject("url", "/index.jsp");
					mv.setViewName("common/error_page");	
				}	
			} else {
				mv.addObject("msg", "濡쒓렇�씤�씠 �솗�씤�릺吏� �븡�뒿�땲�떎");
				mv.addObject("error", "濡쒓렇�씤�씠 �븘�슂�빀�땲�떎.");
				mv.addObject("url", "/index.jsp");
				mv.setViewName("common/error_page");				
			}
		} catch (Exception e) {
			mv.addObject("msg", "諛곕꼫 �벑濡� �떎�뙣");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/banner/insert.do");
			mv.setViewName("common/error_page");
		}
		return mv;
	}



	private Map<String, Object> saveFile(HttpServletRequest request, MultipartFile uploadFile) throws Exception, Exception {
		
		Map<String, Object> fileMap = new HashMap<String, Object>();
		
		//resources 寃쎈줈 援ы븯湲�
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		//�뙆�씪 ���옣 寃쎈줈 援ы븯湲�
		String savePath = root + "\\buploadFiles";
		
		//�뙆�씪 �씠由� 援ы븯湲�
		String fileName = uploadFile.getOriginalFilename();
		
		//�뙆�씪 �솗�옣�옄 援ы븯湲�
		String extension 
		= fileName.substring(fileName.lastIndexOf(".")+1);
		
		//�떆媛꾩쑝濡� �뙆�씪 由щ꽕�엫�븯湲�
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileRename = sdf.format(new Date(System.currentTimeMillis()));
		
		//�뙆�씪 ���옣 �쟾 �뤃�뜑 留뚮뱾湲�
		File saveFolder = new File(savePath);
		if(!saveFolder.exists()) {
			saveFolder.mkdir();
		}
		
		//�뙆�씪���옣
		File saveFile = new File(savePath + "\\" + fileRename + "." + extension);
		uploadFile.transferTo(saveFile);
		long fileLength = uploadFile.getSize();
		
		//�뙆�씪�젙蹂� 由ы꽩
		fileMap.put("fileName", fileName);
		fileMap.put("fileRename", fileRename);
		fileMap.put("filePath", "../resources/buploadFiles/" + fileRename + "." + extension);
		fileMap.put("fileLength", fileLength);
		
		return fileMap;
	}
	
		
	
	
	
	
		
	
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

	
	
	
	@ResponseBody
	@RequestMapping(value = "/delete.do", method = RequestMethod.GET)
    public String ajaxTest(
    		HttpServletRequest request) throws Exception {

        String[] ajaxMsg = request.getParameterValues("valueArr");
        int size = ajaxMsg.length;
        int result = 0;
        for(int i=0; i<size; i++) {
        	result += bService.delete(ajaxMsg[i]);
        	
//        	if(result > 0) {
//        		mv.setViewName("redirect:/banner/bList.do");
//        	} else {
//        		mv.addObject("msg", "諛곕꼫�궘�젣 �궡�슜�씠 議댁옱�븯吏� �븡�뒿�땲�떎");
//				mv.addObject("error", "諛곕꼫�궘�젣媛� �븘�슂�빀�땲�떎.");
//				mv.addObject("url", "/index.jsp");
//				mv.setViewName("common/error_page");	
//        	}
        }
        return result+"";
    }
	
	
	
}
