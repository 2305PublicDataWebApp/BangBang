package kr.co.bangbang.review.domain;

import java.sql.Date;

public class RReply {
	private int rReplyNo;
	private int rReviewNo;
	private String rReplyContent;
	private String rrUserId;
	private Date rReplyDate;
	private Date rReplyUpdate;
	private char rRplyStatusYn;
	private String rrAdminId;
	
	public RReply() {
		// TODO Auto-generated constructor stub
	}

	public int getrReplyNo() {
		return rReplyNo;
	}

	public void setrReplyNo(int rReplyNo) {
		this.rReplyNo = rReplyNo;
	}

	public int getrReviewNo() {
		return rReviewNo;
	}

	public void setrReviewNo(int rReviewNo) {
		this.rReviewNo = rReviewNo;
	}

	public String getrReplyContent() {
		return rReplyContent;
	}

	public void setrReplyContent(String rReplyContent) {
		this.rReplyContent = rReplyContent;
	}

	public String getRrUserId() {
		return rrUserId;
	}

	public void setRrUserId(String rrUserId) {
		this.rrUserId = rrUserId;
	}

	public Date getrReplyDate() {
		return rReplyDate;
	}

	public void setrReplyDate(Date rReplyDate) {
		this.rReplyDate = rReplyDate;
	}

	public Date getrReplyUpdate() {
		return rReplyUpdate;
	}

	public void setrReplyUpdate(Date rReplyUpdate) {
		this.rReplyUpdate = rReplyUpdate;
	}

	public char getrRplyStatusYn() {
		return rRplyStatusYn;
	}

	public void setrRplyStatusYn(char rRplyStatusYn) {
		this.rRplyStatusYn = rRplyStatusYn;
	}

	public String getRrAdminId() {
		return rrAdminId;
	}

	public void setRrAdminId(String rrAdminId) {
		this.rrAdminId = rrAdminId;
	}

	@Override
	public String toString() {
		return "후기댓글 [댓글번호=" + rReplyNo + ", 글번호=" + rReviewNo + ", 댓글내용=" + rReplyContent
				+ ", 작성자=" + rrUserId + ", 작성일=" + rReplyDate + ", 수정일=" + rReplyUpdate
				+ ", 삭제여부=" + rRplyStatusYn + ", 관리자아이디=" + rrAdminId + "]";
	}
	
	
}
