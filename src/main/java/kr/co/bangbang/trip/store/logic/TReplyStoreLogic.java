package kr.co.bangbang.trip.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.bangbang.trip.domain.TReply;
import kr.co.bangbang.trip.store.TReplyStore;
@Repository
public class TReplyStoreLogic implements TReplyStore{

	@Override
	public List<TReply> selectTReplyList(SqlSession sqlSession, int tTripNo) {
		List<TReply> tRList = sqlSession.selectList("TReplyMapper.selectTReplyList", tTripNo);
		return tRList;
	}

}
