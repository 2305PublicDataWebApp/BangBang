package kr.co.bangbang.notice.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.bangbang.notice.domain.NPageInfo;
import kr.co.bangbang.notice.domain.Notice;

public interface NoticeStore {
	/**
	 * 공지사항 등록 Store
	 * @param sqlSession
	 * @param notice
	 * @return
	 */
	int insertNotice(SqlSession sqlSession, Notice notice);
	/**
	 * 공지사항 수정 Store
	 * @param sqlSession
	 * @param notice
	 * @return
	 */
	int modifyNotice(SqlSession sqlSession, Notice notice);
	/**
	 * 공지사항 갯수 조회 Store
	 * @param sqlSession
	 * @return
	 */
	int selectNListCount(SqlSession sqlSession);
	/**
	 * 공지사항 번호로 조회 Store
	 * @param sqlSession
	 * @param noticeNo
	 * @return
	 */
	Notice selectNoticeByNo(SqlSession sqlSession, Integer noticeNo);

	/**
	 * 공지사항 갯수 조회 Store
	 * @param sqlSession
	 * @param nInfo
	 * @return
	 */
	List<Notice> selectNoticeList(SqlSession sqlSession, NPageInfo nInfo);

}
