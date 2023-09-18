package kr.co.bangbang.trip.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.bangbang.trip.domain.TReply;

public interface TReplyStore {

	List<TReply> selectTReplyList(SqlSession sqlSession, int tTripNo);

}
