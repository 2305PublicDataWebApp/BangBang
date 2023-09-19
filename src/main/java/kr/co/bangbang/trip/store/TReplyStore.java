package kr.co.bangbang.trip.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.bangbang.trip.domain.TReply;

public interface TReplyStore {

	List<TReply> selectTReplyList(SqlSession sqlSession, int tTripNo);

	/**
	 * 댓글 등록 Store
	 * @param sqlSession
	 * @param tReply
	 * @return
	 */
	int insertTReply(SqlSession sqlSession, TReply tReply);

	/**
	 * 댓글 수정 Store
	 * @param sqlSession
	 * @param tReply
	 * @return
	 */
	int updateTReply(SqlSession sqlSession, TReply tReply);

}
