package kr.co.bangbang.user.domain;

public class UPageInfo {

	// 필드
	private int currentPage;
	private int recordCountPerPage;
	private int naviCountPerPage;
	private int startNavi;
	private int endNavi;
	private int totalCount;
	private int naviTotalCount;

	// 기본 생성자
	public UPageInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	// 매개변수 생성자
	public UPageInfo(int currentPage, int recordCoutnPerPage, int naviCountPerPage, int startNavi, int endNavi,
			int totalCount, int naviTotalCount) {
		super();
		this.currentPage = currentPage;
		this.recordCountPerPage = recordCoutnPerPage;
		this.naviCountPerPage = naviCountPerPage;
		this.startNavi = startNavi;
		this.endNavi = endNavi;
		this.totalCount = totalCount;
		this.naviTotalCount = naviTotalCount;
	}

	// getter, setter 메소드
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}
	public void setRecordCountPerPage(int recordCoutnPerPage) {
		this.recordCountPerPage = recordCoutnPerPage;
	}
	public int getNaviCountPerPage() {
		return naviCountPerPage;
	}
	public void setNaviCountPerPage(int naviCountPerPage) {
		this.naviCountPerPage = naviCountPerPage;
	}
	public int getStartNavi() {
		return startNavi;
	}
	public void setStartNavi(int startNavi) {
		this.startNavi = startNavi;
	}
	public int getEndNavi() {
		return endNavi;
	}
	public void setEndNavi(int endNavi) {
		this.endNavi = endNavi;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getNaviTotalCount() {
		return naviTotalCount;
	}
	public void setNaviTotalCount(int naviTotalCount) {
		this.naviTotalCount = naviTotalCount;
	}
	
	// toString() - 데이터 확인용
	@Override
	public String toString() {
		return "PageInfo [currentPage=" + currentPage + ", recordCoutnPerPage=" + recordCountPerPage
				+ ", naviCountPerPage=" + naviCountPerPage + ", startNavi=" + startNavi + ", endNavi=" + endNavi
				+ ", totalCount=" + totalCount + ", naviTotalCount=" + naviTotalCount + "]";
	}
}
