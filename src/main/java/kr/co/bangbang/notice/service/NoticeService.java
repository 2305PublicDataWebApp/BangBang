package kr.co.bangbang.notice.service;

import java.util.List;

import kr.co.bangbang.notice.domain.NPageInfo;
import kr.co.bangbang.notice.domain.Notice;

public interface NoticeService {
	/**
	 * 공지사항 등록 Service
	 * @param notice
	 * @return
	 */
	int insertNotice(Notice notice);
	/**
	 * 공지사항 수정 Service
	 * @param notice
	 * @return
	 */
	int modifyNotice(Notice notice);
	/**
	 * 공지사항 전체 갯수 조회 Service
	 * @return
	 */
	int getNListCount();
	/**
	 * 공지사항 상세 조회 Service
	 * @param noticeNo
	 * @return
	 */
	Notice selectNoticeByNo(Integer noticeNo);
	/**
	 * 공지사항 목록 조회 Service
	 * @param nInfo
	 * @return
	 */
	List<Notice> selectNoticeList(NPageInfo nInfo);

}
