package kr.co.bangbang.review.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bangbang.review.domain.RReply;
import kr.co.bangbang.review.service.RReplyService;
import kr.co.bangbang.review.store.RReplyStore;

@Service
public class RReplyServiceImpl implements RReplyService{
	
	@Autowired
	private RReplyStore rrStore;
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<RReply> selectReplyList(int rReviewNo) {
		List<RReply> rrList = rrStore.selectReplyList(sqlSession, rReviewNo);
		return rrList;
	}
	@Override
	public int insertRReply(RReply rreply) {
		int result = rrStore.insertRReply(sqlSession, rreply);
		return result;
	}
	@Override
	public int modifyRReply(RReply rreply) {
		int result = rrStore.modifyRReply(sqlSession, rreply);
		return result;
	}
	@Override
	public int deleteRReply(RReply rreply) {
		int result = rrStore.deleteRReply(sqlSession, rreply);
		return result;
	}
	@Override
	public int selectRReplyTotalCount(int rReviewNo) {
		int rReplyCount = rrStore.selectRReplyTotalCount(sqlSession, rReviewNo);
		return rReplyCount;
	}
	

}
