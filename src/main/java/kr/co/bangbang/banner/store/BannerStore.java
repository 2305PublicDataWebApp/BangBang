package kr.co.bangbang.banner.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.bangbang.banner.domain.BPageInfo;
import kr.co.bangbang.banner.domain.Banner;

public interface BannerStore {

	/**
	 * 배너등록
	 * @param session
	 * @param banner
	 * @return
	 */
	int insertBanner(SqlSession session, Banner banner);

	/**
	 * 전체 배너 갯수 store
	 * @param session
	 * @return
	 */
	int selectListCount(SqlSession session);

	/**
	 * 배너 전체 조회
	 * @param session
	 * @param bInfo
	 * @return
	 */
	List<Banner> selectBannerList(SqlSession session, BPageInfo bInfo);

}
