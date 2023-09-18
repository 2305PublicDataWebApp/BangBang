package kr.co.bangbang.trip.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.bangbang.trip.domain.TPageInfo;
import kr.co.bangbang.trip.domain.Trip;
import kr.co.bangbang.trip.store.TripStore;
@Repository
public class TripStoreLogic implements TripStore{

	@Override
	public int insertTrip(SqlSession sqlSession, Trip trip) {
		int result = sqlSession.insert("TripMapper.insertTrip", trip);
		return result;
	}

	@Override
	public int updateTrip(SqlSession sqlSession, Trip trip) {
		int result = sqlSession.update("TripMapper.updateTrip", trip);
		return result;
	}

	@Override
	public int selectListCount(SqlSession sqlSession) {
		int result = sqlSession.selectOne("TripMapper.selectListCount");
		return result;
	}

	@Override
	public List<Trip> selectTripList(SqlSession sqlSession, TPageInfo tPInfo) {
		int limit = tPInfo.gettRecordCountPerPage(); // 가져오는 행의 갯수
		int offset = (tPInfo.gettCurrentPage() -1) * limit;
		RowBounds tRowBounds = new RowBounds(offset, limit);
		List<Trip> tList = sqlSession.selectList("TripMapper.selectTripList", null, tRowBounds);
		return tList;
	}

	@Override
	public Trip selectTripByNo(SqlSession sqlSession, Integer tripNo) {
		Trip trip = sqlSession.selectOne("TripMapper.selectTripByNo", tripNo);
		return trip;
	}

	@Override
	public int deleteTrip(SqlSession sqlSession, Trip trip) {
		int result = sqlSession.delete("TripMapper.deleteTrip", trip);
		return result;
	}

	@Override
	public int selectListCount(SqlSession sqlSession, Map<String, String> tParamMap) {
		int result = sqlSession.selectOne("TripMapper.selectListByKeywordCount", tParamMap);
		return result;
	}

	@Override
	public List<Trip> searchTripByKeyword(SqlSession sqlSession, TPageInfo tPInfo, Map<String, String> tParamMap) {
		int limit = tPInfo.gettRecordCountPerPage();
		int offset = (tPInfo.gettCurrentPage() -1) * limit;
		RowBounds tRowBounds = new RowBounds(offset, limit);
		List<Trip> searchList = sqlSession.selectList("TripMapper.selectTripsByKeyword", tParamMap, tRowBounds);
		return searchList;
	}

}
