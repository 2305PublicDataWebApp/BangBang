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
	 * 배너삭제
	 * @param session
	 * @param string
	 * @return
	 */
	int delete(SqlSession session, String string);

	/**
	 * 전체배너갯수
	 * @param session
	 * @return
	 */
	int selectListCount(SqlSession session);

	/**
	 * 배너전체조회
	 * @param session
	 * @param bInfo
	 * @return
	 */
	List<Banner> selectBannerList(SqlSession session, BPageInfo bInfo);

	/**
	 * 트립배너
	 * @param session
	 * @param bInfo
	 * @return
	 */
	List<Banner> selecttBannerList(SqlSession session, BPageInfo bInfo);

	/**
	 * 메인배너
	 * @param session
	 * @param bInfo
	 * @return
	 */
	List<Banner> selectbBannerList(SqlSession session, BPageInfo bInfo);



}
