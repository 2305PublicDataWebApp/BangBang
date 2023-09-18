package kr.co.bangbang.review.domain;

import java.sql.Date;

public class Review {
	private int reviewNo;
	private int reiviewType;
	private String reviewTitle;
	private String reviewContent;
	private String rUserId;
	private Date reviewDate;
	private int reviewViewcount;
	private char rStatusYn;
	private String rAdminId;
	
	public Review() {
		// TODO Auto-generated constructor stub
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getReiviewType() {
		return reiviewType;
	}

	public void setReiviewType(int reiviewType) {
		this.reiviewType = reiviewType;
	}

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public String getrUserId() {
		return rUserId;
	}

	public void setrUserId(String rUserId) {
		this.rUserId = rUserId;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	public int getReviewViewcount() {
		return reviewViewcount;
	}

	public void setReviewViewcount(int reviewViewcount) {
		this.reviewViewcount = reviewViewcount;
	}

	public char getrStatusYn() {
		return rStatusYn;
	}

	public void setrStatusYn(char rStatusYn) {
		this.rStatusYn = rStatusYn;
	}

	public String getrAdminId() {
		return rAdminId;
	}

	public void setrAdminId(String rAdminId) {
		this.rAdminId = rAdminId;
	}

	@Override
	public String toString() {
		return "후기게시판 [글번호=" + reviewNo + ", 글유형=" + reiviewType + ", 글제목=" + reviewTitle
				+ ", 글내용=" + reviewContent + ", 작성자아이디=" + rUserId + ", 작성일=" + reviewDate
				+ ", 조회수=" + reviewViewcount + ", 상태여부=" + rStatusYn + ", 관리자아이디=" + rAdminId + "]";
	}
	
	
}
