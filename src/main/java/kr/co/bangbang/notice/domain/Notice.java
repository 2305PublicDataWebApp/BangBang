package kr.co.bangbang.notice.domain;

import java.sql.Date;

public class Notice {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String rAdminId;
	private Date noticeDate;
	
	public Notice() {
		// TODO Auto-generated constructor stub
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getrAdminId() {
		return rAdminId;
	}

	public void setrAdminId(String rAdminId) {
		this.rAdminId = rAdminId;
	}

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	@Override
	public String toString() {
		return "공지게시판 [글번호=" + noticeNo + ", 글제목=" + noticeTitle + ", 글내용=" + noticeContent
				+ ", 작성자아이디=" + rAdminId + ", 작성일=" + noticeDate + "]";
	}
	
	
	
}
