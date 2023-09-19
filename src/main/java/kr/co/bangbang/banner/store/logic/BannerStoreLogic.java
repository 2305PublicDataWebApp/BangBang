package kr.co.bangbang.banner.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.bangbang.banner.domain.BPageInfo;
import kr.co.bangbang.banner.domain.Banner;
import kr.co.bangbang.banner.store.BannerStore;

@Repository
public class BannerStoreLogic implements BannerStore{

	@Override
	public int insertBanner(SqlSession session, Banner banner) {
		int result = session.insert("BannerMapper.insertBanner", banner);
		return result;
	}

	@Override
	public int selectListCount(SqlSession session) {
		int result = session.selectOne("BannerMapper.selectListCount");
		return result;
	}

	@Override
	public List<Banner> selectBannerList(SqlSession session, BPageInfo bInfo) {
		int limit = bInfo.getRecordCountPerPage();
		int offset = (bInfo.getCurrentPage()-1)*limit;
		
		RowBounds rowbounds = new RowBounds(offset, limit);
		
		List<Banner> bList = session.selectList("BannerMapper.selectBannerList", null, rowbounds);
		return bList;
	}

	@Override
	public int delete(SqlSession session, String string) {
		int result = session.delete("BannerMapper.deleteBanner", string);
		return result;
	}

}
