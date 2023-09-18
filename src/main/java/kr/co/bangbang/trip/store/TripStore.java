package kr.co.bangbang.trip.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.co.bangbang.trip.domain.TPageInfo;
import kr.co.bangbang.trip.domain.Trip;

public interface TripStore {

	/**
	 * 전체 게시글 갯수 조회
	 * @param session
	 * @return
	 */
	int selectListCount(SqlSession sqlSession);

	/**
	 * 전체 게시글 조회
	 * @param session
	 * @param tPInfo
	 * @return
	 */
	List<Trip> selectTripList(SqlSession sqlSession, TPageInfo tPInfo);

	/**
	 * 게시글 작성 Store
	 * @param sqlSession
	 * @param trip
	 * @return
	 */
	int insertTrip(SqlSession sqlSession, Trip trip);

	/**
	 * 게시글 상세 조회
	 * @param sqlSession
	 * @param tripNo
	 * @return
	 */
	Trip selectTripByNo(SqlSession sqlSession, Integer tripNo);

	/**
	 * 게시글 수정 Store
	 * @param sqlSession
	 * @param trip
	 * @return
	 */
	int updateTrip(SqlSession sqlSession, Trip trip);

	/**
	 * 게시글 삭제 Store
	 * @param sqlSession
	 * @param trip
	 * @return
	 */
	int deleteTrip(SqlSession sqlSession, Trip trip);

	/**
	 * 여행지 검색 게시글 전체 갯수 Store
	 * @param sqlSession
	 * @param tParamMap
	 * @return
	 */
	int selectListCount(SqlSession sqlSession, Map<String, String> tParamMap);

	/**
	 * 여행지 게시글 조건에 따라 키워드로 조회 Store
	 * @param sqlSession
	 * @param tPInfo
	 * @param tParamMap
	 * @return
	 */
	List<Trip> searchTripByKeyword(SqlSession sqlSession, TPageInfo tPInfo, Map<String, String> tParamMap);

}
