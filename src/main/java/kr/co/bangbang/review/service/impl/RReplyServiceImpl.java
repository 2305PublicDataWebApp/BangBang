package kr.co.bangbang.review.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bangbang.review.service.RReplyService;
import kr.co.bangbang.review.store.RReplyStore;

@Service
public class RReplyServiceImpl implements RReplyService{
	@Autowired
	private RReplyStore rrStore;
	@Autowired
	private SqlSession sqlSession;
}
