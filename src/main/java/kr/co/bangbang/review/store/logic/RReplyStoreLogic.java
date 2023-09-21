package kr.co.bangbang.review.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.bangbang.review.domain.RReply;
import kr.co.bangbang.review.store.RReplyStore;

@Repository
public class RReplyStoreLogic implements RReplyStore{

	@Override
	public List<RReply> selectReplyList(SqlSession sqlSession, int rReviewNo) {
		List<RReply> rrList = sqlSession.selectList("RReplyMapper.selectReplyList", rReviewNo);
		return rrList;
	}

	@Override
	public int insertRReply(SqlSession sqlSession, RReply rreply) {
		int result = sqlSession.insert("RReplyMapper.insertRReply", rreply);
		return result;
	}

	@Override
	public int modifyRReply(SqlSession sqlSession, RReply rreply) {
		int result = sqlSession.update("RReplyMapper.modifyRReply", rreply);
		return result;
	}

	@Override
	public int deleteRReply(SqlSession sqlSession, RReply rreply) {
		int result = sqlSession.update("RReplyMapper.deleteRReply", rreply);
		return result;
	}

	@Override
	public int selectRReplyTotalCount(SqlSession sqlSession, int rReviewNo) {
		int rReplyCount = sqlSession.selectOne("RReplyMapper.selectRReplyTotalCount",rReviewNo);
		return rReplyCount;
	}


}
