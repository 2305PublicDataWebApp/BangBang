package kr.co.bangbang.banner.domain;

public class Banner {
	private int bannerNo;
	private String bannerName;
	private String bannerArea;
	private String bannerSize;
	private String bannerFileName;
	private String bannerFilePath;
	private long bannerFileLength;
	private String linkUrl;
	private char bStatusYn;
	private String bAdminId;
	public int getBannerNo() {
		return bannerNo;
	}
	public void setBannerNo(int bannerNo) {
		this.bannerNo = bannerNo;
	}
	public String getBannerName() {
		return bannerName;
	}
	public void setBannerName(String bannerName) {
		this.bannerName = bannerName;
	}
	public String getBannerArea() {
		return bannerArea;
	}
	public void setBannerArea(String bannerArea) {
		this.bannerArea = bannerArea;
	}
	public String getBannerSize() {
		return bannerSize;
	}
	public void setBannerSize(String bannerSize) {
		this.bannerSize = bannerSize;
	}
	public String getBannerFileName() {
		return bannerFileName;
	}
	public void setBannerFileName(String bannerFileName) {
		this.bannerFileName = bannerFileName;
	}
	public String getBannerFilePath() {
		return bannerFilePath;
	}
	public void setBannerFilePath(String bannerFilePath) {
		this.bannerFilePath = bannerFilePath;
	}
	public long getBannerFileLength() {
		return bannerFileLength;
	}
	public void setBannerFileLength(long bannerFileLength) {
		this.bannerFileLength = bannerFileLength;
	}
	public String getLinkUrl() {
		return linkUrl;
	}
	public void setLinkUrl(String linkUrl) {
		this.linkUrl = linkUrl;
	}
	public char getbStatusYn() {
		return bStatusYn;
	}
	public void setbStatusYn(char bStatusYn) {
		this.bStatusYn = bStatusYn;
	}
	public String getbAdminId() {
		return bAdminId;
	}
	public void setbAdminId(String bAdminId) {
		this.bAdminId = bAdminId;
	}
	@Override
	public String toString() {
		return "Banner [bannerNo=" + bannerNo + ", bannerName=" + bannerName + ", bannerArea=" + bannerArea
				+ ", bannerSize=" + bannerSize + ", bannerFileName=" + bannerFileName + ", bannerFilePath="
				+ bannerFilePath + ", bannerFileLength=" + bannerFileLength + ", linkUrl=" + linkUrl + ", bStatusYn="
				+ bStatusYn + ", bAdminId=" + bAdminId + "]";
	}
	
	
	
	
	
	
	
	
	
}
