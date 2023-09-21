package kr.co.bangbang.trip.domain;

import java.sql.Date;

public class Trip {
	private int tripNo;
	private String tripType;
	private String tripTitle;
	private String tripAddr;
	private String tripSummary;
	private String tripContent;
	private String tripInfoAddr;
	private String tripHomePage;
	private String tripTime;
	private String tripPrice;
	private int viewCount;
	private char tStatusYn;
	private String tAdminId;
	private Date tripDate;
	private String tripFilename;
	private String tripFilerename;
	private String tripFilepath;
	private long tripFilelength;
	
	
	public int getTripNo() {
		return tripNo;
	}
	public void setTripNo(int tripNo) {
		this.tripNo = tripNo;
	}
	public String getTripType() {
		return tripType;
	}
	public void setTripType(String tripType) {
		this.tripType = tripType;
	}
	public String getTripTitle() {
		return tripTitle;
	}
	public void setTripTitle(String tripTitle) {
		this.tripTitle = tripTitle;
	}
	public String getTripAddr() {
		return tripAddr;
	}
	public void setTripAddr(String tripAddr) {
		this.tripAddr = tripAddr;
	}
	public String getTripSummary() {
		return tripSummary;
	}
	public void setTripSummary(String tripSummary) {
		this.tripSummary = tripSummary;
	}
	public String getTripContent() {
		return tripContent;
	}
	public void setTripContent(String tripContent) {
		this.tripContent = tripContent;
	}
	public String getTripInfoAddr() {
		return tripInfoAddr;
	}
	public void setTripInfoAddr(String tripInfoAddr) {
		this.tripInfoAddr = tripInfoAddr;
	}
	public String getTripHomePage() {
		return tripHomePage;
	}
	public void setTripHomePage(String tripHomePage) {
		this.tripHomePage = tripHomePage;
	}
	public String getTripTime() {
		return tripTime;
	}
	public void setTripTime(String tripTime) {
		this.tripTime = tripTime;
	}
	public String getTripPrice() {
		return tripPrice;
	}
	public void setTripPrice(String tripPrice) {
		this.tripPrice = tripPrice;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public char gettStatusYn() {
		return tStatusYn;
	}
	public void settStatusYn(char tStatusYn) {
		this.tStatusYn = tStatusYn;
	}
	public String gettAdminId() {
		return tAdminId;
	}
	public void settAdminId(String tAdminId) {
		this.tAdminId = tAdminId;
	}
	public Date getTripDate() {
		return tripDate;
	}
	public void setTripDate(Date tripDate) {
		this.tripDate = tripDate;
	}
	public String getTripFilename() {
		return tripFilename;
	}
	public void setTripFilename(String tripFilename) {
		this.tripFilename = tripFilename;
	}
	public String getTripFilerename() {
		return tripFilerename;
	}
	public void setTripFilerename(String tripFilerename) {
		this.tripFilerename = tripFilerename;
	}
	public String getTripFilepath() {
		return tripFilepath;
	}
	public void setTripFilepath(String tripFilepath) {
		this.tripFilepath = tripFilepath;
	}
	public long getTripFilelength() {
		return tripFilelength;
	}
	public void setTripFilelength(long tripFilelength) {
		this.tripFilelength = tripFilelength;
	}
	@Override
	public String toString() {
		return "여행지추천게시판 [글 번호=" + tripNo + ", 글 타입=" + tripType + ", 여행지 이름=" + tripTitle + ", 여행지 주소="
				+ tripAddr + ", 한줄소개=" + tripSummary + ", 상세내용=" + tripContent + ", 상세주소="
				+ tripInfoAddr + ", 홈페이지=" + tripHomePage + ", 이용시간=" + tripTime + ", 이용금액="
				+ tripPrice + ", 조회수=" + viewCount + ", 삭제여부=" + tStatusYn + ", 관리자 아이디=" + tAdminId
				+ ", 등록일=" + tripDate + ", 파일이름=" + tripFilename + ", 파일새이름=" + tripFilerename
				+ ", 파일주소=" + tripFilepath + ", 파일길이=" + tripFilelength + "]";
	}
	
}
