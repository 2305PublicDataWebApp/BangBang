package kr.co.bangbang.banner.service;

import java.util.List;

import kr.co.bangbang.banner.domain.BPageInfo;
import kr.co.bangbang.banner.domain.Banner;

public interface BannerService {

	/**
	 * 배너등록
	 * @param banner
	 * @return
	 */
	int insertBanner(Banner banner);

	/**
	 * 배너선택삭제
	 * @param string
	 * @return
	 */
	int delete(String string);



	/**
	 * 전체배너갯수
	 * @return
	 */
	Integer getListCount();

	/**
	 * 배너전체조회
	 * @param bInfo
	 * @return
	 */
	List<Banner> selectBannerList(BPageInfo bInfo);

	/**
	 * 트립배너 select
	 * @param bInfo
	 * @return
	 */
	List<Banner> selecttBannerList(BPageInfo bInfo);

	/**
	 * 메인배너 select
	 * @param bInfo
	 * @return
	 */
	List<Banner> selectbBannerList(BPageInfo bInfo);

	

	

	
	

}
