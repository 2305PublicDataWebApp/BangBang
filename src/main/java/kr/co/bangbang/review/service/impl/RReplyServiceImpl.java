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
	public List<RReply> selectReplyList(Integer reviewNo) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int insertRReply(RReply rreply) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int modifyRReply(RReply rreply) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int deleteRReply(RReply rreply) {
		// TODO Auto-generated method stub
		return 0;
	}
	

}
