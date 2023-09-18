package kr.co.bangbang.notice.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.bangbang.notice.domain.NPageInfo;
import kr.co.bangbang.notice.domain.Notice;
import kr.co.bangbang.notice.store.NoticeStore;

@Repository
public class NoticeStoreLgoic implements NoticeStore{

	@Override
	public int insertNotice(SqlSession sqlSession, Notice notice) {
		int result = sqlSession.insert("NoticeMapper.insertNotice", notice);
		return result;
	}

	@Override
	public int selectNListCount(SqlSession sqlSession) {
		int result = sqlSession.selectOne("NoticeMapper.selectNListCount");
		return result;
	}

	@Override
	public List<Notice> selectNoticeList(SqlSession sqlSession, NPageInfo nInfo) {
		int limit = nInfo.getnRecordCountPerPage();
		int offset = (nInfo.getnCurrentPage()-1)*limit;
		RowBounds nrowBounds = new RowBounds(offset, limit);
		List<Notice> nList = sqlSession.selectList("NoticeMapper.selectNoticeList", null, nrowBounds);
		return nList;
	}

	@Override
	public Notice selectNoticeByNo(SqlSession sqlSession, Integer noticeNo) {
		Notice notice = sqlSession.selectOne("NoticeMapper.selectNoticeNo", noticeNo);
		return notice;
	}

	@Override
	public int modifyNotice(SqlSession sqlSession, Notice notice) {
		int result = sqlSession.update("NoticeMapper.modifyNotice", notice);
		return result;
	}

	@Override
	public int deleteNotice(SqlSession sqlSession, Notice notice) {
		int result = sqlSession.update("NoticeMapper.deleteNotice", notice);
		return result;
	}
	

}
