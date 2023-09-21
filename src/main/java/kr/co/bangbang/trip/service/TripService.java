package kr.co.bangbang.trip.service;

import java.util.List;
import java.util.Map;

import kr.co.bangbang.trip.domain.TPageInfo;
import kr.co.bangbang.trip.domain.Trip;

public interface TripService {

	/**
	 * 게시글 작성 Service
	 * @param trip
	 * @return
	 */
	int insertTrip(Trip trip);

	/**
	 * 게시글 수정
	 * @param trip
	 * @return
	 */
	int updateTrip(Trip trip);

	/**
	 * 게시글 삭제
	 * @param trip
	 * @return
	 */
	int deleteTrip(Trip trip);

	/**
	 * 전체 게시글 갯수 Service
	 * @return
	 */
	Integer getListCount();

	/**
	 * 게시글 리스트 조회(페이징 처리)
	 * @param tPInfo
	 * @return
	 */
	List<Trip> selectTripList(TPageInfo tPInfo);

	/**
	 * 메인페이지 - 게시글 리스트 조회
	 * @return
	 */
	List<Trip> selectTripList();

	/**
	 * 게시글 번호에 맞는 게시글 상세 조회
	 * @param tripNo
	 * @return
	 */
	Trip selectTripByNo(Integer tripNo);

	/**
	 * 게시글 검색 전체 갯수
	 * @param tParamMap
	 * @return
	 */
	int getListCount(Map<String, String> tParamMap);

	/**
	 * 여행지 게시글 조건에 따라 키워드로 검색
	 * @param tPInfo
	 * @param tParamMap
	 * @return
	 */
	List<Trip> searchTripByKeyword(TPageInfo tPInfo, Map<String, String> tParamMap);

}
