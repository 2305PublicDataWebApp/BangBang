package kr.co.bangbang;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import kr.co.bangbang.banner.domain.BPageInfo;
import kr.co.bangbang.banner.domain.Banner;
import kr.co.bangbang.banner.service.BannerService;
import kr.co.bangbang.notice.domain.Notice;
import kr.co.bangbang.notice.service.NoticeService;
import kr.co.bangbang.review.domain.Review;
import kr.co.bangbang.review.service.ReviewService;
import kr.co.bangbang.trip.domain.Trip;
import kr.co.bangbang.trip.service.TripService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	public TripService tService;
	
	@Autowired
	public ReviewService rService;
	
	@Autowired
	public NoticeService nService;
	
	@Autowired
	public BannerService bService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public ModelAndView Home(ModelAndView mv) {
		try {
			List<Trip> tList = tService.selectTripList();
			List<Review> rList = rService.selectReviewList();
			List<Notice> nList = nService.selectNoticeList();
			BPageInfo bInfo = new BPageInfo();
			bInfo.setRecordCountPerPage(3);
			bInfo.setCurrentPage(1);
			List<Banner> bList = bService.selectbBannerList(bInfo);
			List<Banner> tbList = bService.selecttBannerList(bInfo);
			mv.addObject("tList", tList);
			mv.addObject("rList", rList);
			mv.addObject("nList", nList);
			mv.addObject("bList", bList);
			mv.addObject("tbList", tbList);
			mv.setViewName("home");
		} catch (Exception e) {
			mv.addObject("msg", "게시글 조회에 실패했습니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/index.jsp");
			mv.setViewName("common/error_page");
		}
		return mv;
	}
}
