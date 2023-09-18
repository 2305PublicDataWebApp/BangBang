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

	@Override
	public int insertBanner(Banner banner) {
		int result = bStore.insertBanner(session, banner);
		return result;
	}

	@Override
	public Integer getListCount() {
		int result = bStore.selectListCount(session);
		return result;
	}

	@Override
	public List<Banner> selectBannerList(BPageInfo bInfo) {
		List<Banner> bList = bStore.selectBannerList(session, bInfo);
		return bList;
	}


	
	
}
