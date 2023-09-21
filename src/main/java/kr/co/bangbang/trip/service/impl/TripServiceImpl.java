package kr.co.bangbang.trip.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bangbang.trip.domain.TPageInfo;
import kr.co.bangbang.trip.domain.Trip;
import kr.co.bangbang.trip.service.TripService;
import kr.co.bangbang.trip.store.TripStore;
@Service
public class TripServiceImpl implements TripService{

	@Autowired
	private TripStore tStore;
	@Autowired 
	private SqlSession sqlSession;
	
	@Override
	public int insertTrip(Trip trip) {
		int result = tStore.insertTrip(sqlSession, trip);
		return result;
	}

	@Override
	public int updateTrip(Trip trip) {
		int result = tStore.updateTrip(sqlSession, trip);
		return result;
	}

	@Override
	public int deleteTrip(Trip trip) {
		int result = tStore.deleteTrip(sqlSession, trip);
		return result;
	}

	@Override
	public List<Trip> selectTripList(TPageInfo tPInfo) {
		List<Trip> tList = tStore.selectTripList(sqlSession, tPInfo);
		return tList;
	}

	@Override
	public List<Trip> selectTripList() {
		List<Trip> tList = tStore.selectTripList(sqlSession);
		return tList;
	}

	@Override
	public Trip selectTripByNo(Integer tripNo) {
		Trip tripOne = tStore.selectTripByNo(sqlSession, tripNo);
		return tripOne;
	}

	@Override
	public Integer getListCount() {
		int result = tStore.selectListCount(sqlSession);
		return result;
	}

	@Override
	public int getListCount(Map<String, String> tParamMap) {
		int result = tStore.selectListCount(sqlSession, tParamMap);
		return result;
	}

	@Override
	public List<Trip> searchTripByKeyword(TPageInfo tPInfo, Map<String, String> tParamMap) {
		List<Trip> searchList = tStore.searchTripByKeyword(sqlSession, tPInfo, tParamMap);
		return searchList;
	}

}
