package kr.co.bangbang.review.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.bangbang.review.domain.RReply;

public interface RReplyStore {

	List<RReply> selectReplyList(SqlSession sqlSession, int rReviewNo);

	int insertRReply(SqlSession sqlSession, RReply rreply);

	int modifyRReply(SqlSession sqlSession, RReply rreply);

	int deleteRReply(SqlSession sqlSession, RReply rreply);

}
