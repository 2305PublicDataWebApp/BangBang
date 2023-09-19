package kr.co.bangbang.trip.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bangbang.trip.domain.TReply;
import kr.co.bangbang.trip.service.TReplyService;
import kr.co.bangbang.trip.store.TReplyStore;
@Service
public class TReplyServiceImpl implements TReplyService{

	@Autowired
	private TReplyStore tRStore;
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<TReply> selectTReplyList(int tTripNo) {
		List<TReply> tRList = tRStore.selectTReplyList(sqlSession, tTripNo);
		return tRList;
	}

	@Override
	public int insertTReply(TReply tReply) {
		int result = tRStore.insertTReply(sqlSession, tReply);
		return result;
	}

	@Override
	public int updateTReply(TReply tReply) {
		int result = tRStore.updateTReply(sqlSession, tReply);
		return result;
	}

}
