package kr.co.bangbang.trip.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.bangbang.trip.domain.TReply;
import kr.co.bangbang.trip.store.TReplyStore;
@Repository
public class TReplyStoreLogic implements TReplyStore{

	@Override
	public int insertTReply(SqlSession sqlSession, TReply tReply) {
		int result = sqlSession.insert("TReplyMapper.insertTReply", tReply);
		return result;
	}

	@Override
	public int updateTReply(SqlSession sqlSession, TReply tReply) {
		int result = sqlSession.update("TReplyMapper.updateTReply", tReply);
		return result;
	}

	@Override
	public int deleteTReply(SqlSession sqlSession, TReply tReply) {
		int result = sqlSession.update("TReplyMapper.deleteTReply", tReply);
		return result;
	}

	@Override
	public List<TReply> selectTReplyList(SqlSession sqlSession, int tTripNo) {
		List<TReply> tRList = sqlSession.selectList("TReplyMapper.selectTReplyList", tTripNo);
		return tRList;
	}

	@Override
	public int selectTReplyTotalCount(SqlSession sqlSession, int tTripNo) {
		int tReplyCount = sqlSession.selectOne("TReplyMapper.selectTReplyTotalCount", tTripNo);
		return tReplyCount;
	}

}
