package kr.co.bangbang.notice.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.bangbang.notice.domain.NPageInfo;
import kr.co.bangbang.notice.domain.Notice;

public interface NoticeStore {

	int insertNotice(SqlSession sqlSession, Notice notice);

	int selectNListCount(SqlSession sqlSession);

	List<Notice> selectNoticeList(SqlSession sqlSession, NPageInfo nInfo);

	Notice selectNoticeByNo(SqlSession sqlSession, Integer noticeNo);

	int modifyNotice(SqlSession sqlSession, Notice notice);

	int deleteNotice(SqlSession sqlSession, Notice notice);

}
