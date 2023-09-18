package kr.co.bangbang.trip.domain;

import java.sql.Date;

public class TReply {
	private int tReplyNo;
	private int tTripNo;
	private String tReplyContent;
	private String tRUserId;
	private Date tReplyDate;
	private char tReplyYn;
	private char tRStatusYn;
	private String tRAdminId;
	private Date tReplyUpdate;
	
	
	public int gettReplyNo() {
		return tReplyNo;
	}
	public void settReplyNo(int tReplyNo) {
		this.tReplyNo = tReplyNo;
	}
	public int gettTripNo() {
		return tTripNo;
	}
	public void settTripNo(int tTripNo) {
		this.tTripNo = tTripNo;
	}
	public String gettReplyContent() {
		return tReplyContent;
	}
	public void settReplyContent(String tReplyContent) {
		this.tReplyContent = tReplyContent;
	}
	public String gettRUserId() {
		return tRUserId;
	}
	public void settRUserId(String tRUserId) {
		this.tRUserId = tRUserId;
	}
	public Date gettReplyDate() {
		return tReplyDate;
	}
	public void settReplyDate(Date tReplyDate) {
		this.tReplyDate = tReplyDate;
	}
	public char gettReplyYn() {
		return tReplyYn;
	}
	public void settReplyYn(char tReplyYn) {
		this.tReplyYn = tReplyYn;
	}
	public char gettRStatusYn() {
		return tRStatusYn;
	}
	public void settRStatusYn(char tRStatusYn) {
		this.tRStatusYn = tRStatusYn;
	}
	public String gettRAdminId() {
		return tRAdminId;
	}
	public void settRAdminId(String tRAdminId) {
		this.tRAdminId = tRAdminId;
	}
	public Date gettReplyUpdate() {
		return tReplyUpdate;
	}
	public void settReplyUpdate(Date tReplyUpdate) {
		this.tReplyUpdate = tReplyUpdate;
	}
	
	@Override
	public String toString() {
		return "여행지 댓글 [댓글번호=" + tReplyNo + ", 게시글번호=" + tTripNo + ", 댓글내용=" + tReplyContent
				+ ", 회원아이디=" + tRUserId + ", 작성일=" + tReplyDate + ", 삭제여부=" + tReplyYn + ", 수정여부="
				+ tRStatusYn + ", 관리자아이디=" + tRAdminId + ", 수정일=" + tReplyUpdate + "]";
	}
}
