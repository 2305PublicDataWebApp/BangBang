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

	/**
	 * 배너등록
	 */
	@Override
	public int insertBanner(SqlSession session, Banner banner) {
		int result = session.insert("BannerMapper.insertBanner", banner);
		return result;
	}

	/**
	 * 배너삭제
	 */
	@Override
	public int delete(SqlSession session, String string) {
		int result = session.delete("BannerMapper.deleteBanner", string);
		return result;
	}

	/**
	 * 전체배너갯수
	 */
	@Override
	public int selectListCount(SqlSession session) {
		int result = session.selectOne("BannerMapper.selectListCount");
		return result;
	}

	/**
	 * 배너전체조회
	 */
	@Override
	public List<Banner> selectBannerList(SqlSession session, BPageInfo bInfo) {
		int limit = bInfo.getRecordCountPerPage();
		int offset = (bInfo.getCurrentPage()-1)*limit;
		
		RowBounds rowbounds = new RowBounds(offset, limit);
		
		List<Banner> bList = session.selectList("BannerMapper.selectBannerList", null, rowbounds);
		return bList;
	}

	/**
	 * 트립배너
	 */
	@Override
	public List<Banner> selecttBannerList(SqlSession session, BPageInfo bInfo) {
		int limit = bInfo.getRecordCountPerPage();
		int offset = (bInfo.getCurrentPage()-1)*limit;
		
		RowBounds rowbounds = new RowBounds(offset, limit);
		
		List<Banner> tList = session.selectList("BannerMapper.selecttBannerList", null, rowbounds);
		return tList;
	}

	/**
	 * 메인배너
	 */
	@Override
	public List<Banner> selectbBannerList(SqlSession session, BPageInfo bInfo) {
		int limit = bInfo.getRecordCountPerPage();
		int offset = (bInfo.getCurrentPage()-1)*limit;
		
		RowBounds rowbounds = new RowBounds(offset, limit);
		
		List<Banner> bList = session.selectList("BannerMapper.selectbBannerList", null, rowbounds);
		return bList;
	}



}
