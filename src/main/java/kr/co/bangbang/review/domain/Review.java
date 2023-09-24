package kr.co.bangbang.review.domain;

import java.sql.Date;

public class Review {
	private int reviewNo;
	private String reviewType;
	private String reviewTitle;
	private String reviewContent;
	private String rUserId;
	private String reviewFilename;
	private String reviewFileRename;
	private String reviewFilepath;
	private long reviewFileLength;
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

	public String getReviewType() {
		return reviewType;
	}

	public void setReviewType(String reviewType) {
		this.reviewType = reviewType;
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

	public String getReviewFilename() {
		return reviewFilename;
	}

	public void setReviewFilename(String reviewFilename) {
		this.reviewFilename = reviewFilename;
	}

	public String getReviewFileRename() {
		return reviewFileRename;
	}

	public void setReviewFileRename(String reviewFileRename) {
		this.reviewFileRename = reviewFileRename;
	}

	public String getReviewFilepath() {
		return reviewFilepath;
	}

	public void setReviewFilepath(String reviewFilepath) {
		this.reviewFilepath = reviewFilepath;
	}

	public long getReviewFileLength() {
		return reviewFileLength;
	}

	public void setReviewFileLength(long reviewFileLength) {
		this.reviewFileLength = reviewFileLength;
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
		return "Review [reviewNo=" + reviewNo + ", reviewType=" + reviewType + ", reviewTitle=" + reviewTitle
				+ ", reviewContent=" + reviewContent + ", rUserId=" + rUserId + ", reviewFilename=" + reviewFilename
				+ ", reviewFileRename=" + reviewFileRename + ", reviewFilepath=" + reviewFilepath
				+ ", reviewFileLength=" + reviewFileLength + ", reviewDate=" + reviewDate + ", reviewViewcount="
				+ reviewViewcount + ", rStatusYn=" + rStatusYn + ", rAdminId=" + rAdminId + "]";
	}


	
}
