package kr.co.bangbang.notice.service;

import java.util.List;

import kr.co.bangbang.notice.domain.NPageInfo;
import kr.co.bangbang.notice.domain.Notice;

public interface NoticeService {

	int insertNotice(Notice notice);

	int getNListCount();

	List<Notice> selectNoticeList(NPageInfo nInfo);

	Notice selectNoticeByNo(Integer noticeNo);

	int modifyNotice(Notice notice);

	int deleteNotice(Notice notice);

}
