package kr.co.bangbang.review.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.bangbang.review.domain.RReply;
import kr.co.bangbang.review.store.RReplyStore;

@Repository
public class RReplyStoreLogic implements RReplyStore{

	@Override
	public int deleterreply(SqlSession sqlSession, RReply rreply) {
		// TODO Auto-generated method stub
		return 0;
	}

}
