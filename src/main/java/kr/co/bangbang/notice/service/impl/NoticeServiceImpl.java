package kr.co.bangbang.notice.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bangbang.notice.domain.NPageInfo;
import kr.co.bangbang.notice.domain.Notice;
import kr.co.bangbang.notice.service.NoticeService;
import kr.co.bangbang.notice.store.NoticeStore;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private NoticeStore nStore;
	
	@Override
	public int insertNotice(Notice notice) {
		int result = nStore.insertNotice(sqlSession, notice);
		return result;
	}
	@Override
	public int modifyNotice(Notice notice) {
		int result = nStore.modifyNotice(sqlSession, notice);
		return result;
	}
	@Override
	public int getNListCount() {
		int result = nStore.selectNListCount(sqlSession);
		return result;
	}
	@Override
	public Notice selectNoticeByNo(Integer noticeNo) {
		Notice noticeOne = nStore.selectNoticeByNo(sqlSession, noticeNo);
		return noticeOne;
	}
	@Override
	public List<Notice> selectNoticeList(NPageInfo nInfo) {
		List<Notice> nList = nStore.selectNoticeList(sqlSession, nInfo);
		return nList;
	}
}
