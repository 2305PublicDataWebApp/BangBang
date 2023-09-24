package kr.co.bangbang.banner.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bangbang.banner.domain.BPageInfo;
import kr.co.bangbang.banner.domain.Banner;
import kr.co.bangbang.banner.service.BannerService;
import kr.co.bangbang.banner.store.BannerStore;

@Service
public class BannerServiceImpl implements BannerService{

	@Autowired
	private SqlSession session;
	
	@Autowired
	private BannerStore bStore;

	/**
	 * 배너등록
	 */
	@Override
	public int insertBanner(Banner banner) {
		int result = bStore.insertBanner(session, banner);
		return result;
	}

	/**
	 * 배너선택삭제
	 */
	@Override
	public int delete(String string) {
		int result = bStore.delete(session, string);
		return result;
	}

	/**
	 * 전체배너갯수
	 */
	@Override
	public Integer getListCount() {
		int result = bStore.selectListCount(session);
		return result;
	}

	/**
	 * 배너전체조회
	 */
	@Override
	public List<Banner> selectBannerList(BPageInfo bInfo) {
		List<Banner> bList = bStore.selectBannerList(session, bInfo);
		return bList;
	}

	/**
	 * 트립배너 select
	 */
	@Override
	public List<Banner> selecttBannerList(BPageInfo bInfo) {
		List<Banner> tList = bStore.selecttBannerList(session, bInfo);
		return tList;
	}

	/**
	 * 메인배너 select
	 */
	@Override
	public List<Banner> selectbBannerList(BPageInfo bInfo) {
		List<Banner> bList = bStore.selectbBannerList(session, bInfo);
		return bList;
	}




	
	
}
