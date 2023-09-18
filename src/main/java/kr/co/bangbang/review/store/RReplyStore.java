package kr.co.bangbang.review.store;

import org.apache.ibatis.session.SqlSession;

import kr.co.bangbang.review.domain.RReply;

public interface RReplyStore {

	int deleterreply(SqlSession sqlSession, RReply rreply);

}
