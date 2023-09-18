package kr.co.bangbang.review.service.impl;

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
	public int deleterreply(RReply rreply) {
		int result = rrStore.deleterreply(sqlSession, rreply);
		return result;
	}
	@Override
	public int modifyrreply(RReply rreply) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int insertrReply(RReply rreply) {
		// TODO Auto-generated method stub
		return 0;
	}
}
