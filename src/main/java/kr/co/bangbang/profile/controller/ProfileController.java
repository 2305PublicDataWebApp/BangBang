package kr.co.bangbang.profile.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
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

import kr.co.bangbang.profile.domain.Profile;
import kr.co.bangbang.profile.service.ProfileService;

@Controller
@RequestMapping(value="/profile/")
public class ProfileController {
	
	@Autowired
	private ProfileService pService;

	/**
	 * 프로필 이미지 등록
	 * @param mv
	 * @param profile
	 * @param uploadFile
	 * @param request
	 * @param sessoin
	 * @return ModelAndView
	 */
	@RequestMapping(value="upload.do", method=RequestMethod.POST)
	public ModelAndView profileRegister(
			ModelAndView mv
			, @ModelAttribute Profile profile
			, @RequestParam(value="profile-image", required=false) MultipartFile uploadFile
			, HttpServletRequest request
			, HttpSession sessoin) {
		try {
			// 세션 아이디로 유효성 검사
			String pUserId = (String)sessoin.getAttribute("userId");
			int result = 0;
			Profile searchProfile = null;
			if(pUserId != null && !pUserId.equals("")) {
				// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 파일 첨부 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
				// 파일이 있는지 여부 유효성 검사 후 파일 첨부 진행
				if(uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
					Map<String, Object> pMap = this.saveFile(uploadFile, request);
					String imgName = (String)pMap.get("imgName");
					String imgRename = (String)pMap.get("imgRename");
					String imgPath = (String)pMap.get("imgPath");
					long imgLength = (long)pMap.get("imgLength");
					
					// DB에 저장하기 위해 profile에 데이터를 Set 하는 부분
					profile.setProfileImgName(imgName);
					profile.setProfileImgRename(imgRename);
					profile.setProfileImgPath(imgPath);
					profile.setProfileImgLength(imgLength);
					searchProfile = pService.selectOneProfile(pUserId);
					if(searchProfile != null) {
						// 기존 프로필 이미지 파일 삭제 후 update
						profile.setpUserId(pUserId);
						result = pService.updateProfile(profile);
					}else {
						// 이미지 파일 저장 후 insert
						result = pService.insertProfile(profile);
					}
					if(result > 0) { // 프로필 등록 성공
//						sessoin.setAttribute("profile", profile);
						mv.setViewName("redirect:/user/mypage.do?userId="+pUserId);
					} else { // 프로필 등록 실패
						mv.addObject("msg", "프로필 사진 등록에 실패하였습니다.");
						mv.addObject("url", "/user/mypage.do");
						mv.setViewName("common/error_page");
					}
				} else { // 파일이 없을 경우
					mv.addObject("msg", "서비스에 실패하였습니다.");
					mv.addObject("url", "/user/mypage.do");
					mv.setViewName("common/error_page");
				}
			} else { // 아이디 세션 저장 안되어있을 경우
				mv.addObject("msg", "로그인을 해주세요");
				mv.addObject("url", "/user/login.do");
				mv.setViewName("common/error_page");
			}
		} catch (Exception e) { // 예외처리
			mv.addObject("msg", "고객센터로 문의해주세요");
			mv.addObject("url", "/user/mypage.do");
			mv.addObject("error", e.getMessage());
			mv.setViewName("common/error_page");
		}
		return mv;
	}

	/**
	 * 파일 이름/경로/크기 가져오는 메소드
	 * @param uploadFile
	 * @param request
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	private Map<String, Object> saveFile(MultipartFile uploadFile, HttpServletRequest request) throws Exception {
		// 이름/경로/크기 총 3개를 넘겨야 하기 때문에 Hashmap 사용함
		Map<String, Object> infoMap = new HashMap<String, Object>();
		
		// ============================== 파일 이름 ==============================
		// ImgRename
		String imgName = uploadFile.getOriginalFilename();
		String root = request.getSession().getServletContext().getRealPath("resources");
		String saveFolder = root + "\\puploadFiles";
		File folder = new File(saveFolder);
		if(!folder.exists()) { // 경로에 폴더 있는지 여부 확인
			folder.mkdir();	   // 없열 경우 폴더 생성
		}
		
		// ============================== 파일 경로 ==============================
		// ImgRename 으로 저장되게끔 함!
		SimpleDateFormat date = new SimpleDateFormat("yyyyMMddHHss");
		String strResult = date.format(new Date(System.currentTimeMillis()));
		
		// 파일 이름에서 확장자명 추출
		String ext = imgName.substring(imgName.lastIndexOf(".")+1);
		String imgRename = "P" + strResult + "." + ext;
		
		String savePath = saveFolder + "\\" + imgRename;
		File file = new File(savePath);
		
		// ****************************** 파일 저장 ******************************
		uploadFile.transferTo(file);
		
		// ============================== 파일 크기 ==============================
		long imgLength = uploadFile.getSize();
		
		// DB에 저장하기 위해 Profile에 데이터를 Set 하는 부분
		infoMap.put("imgName", imgName);
		infoMap.put("imgRename", imgRename);
		infoMap.put("imgPath", savePath);
		infoMap.put("imgLength", imgLength);
		return infoMap;
	}
}
