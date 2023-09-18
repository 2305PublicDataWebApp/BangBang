package kr.co.bangbang.trip.domain;

public class TPageInfo {
	private int tCurrentPage;
	private int tRecordCountPerPage;
	private int tNaviCountPerPage;
	private int tStartNavi;
	private int tEndNavi;
	private int tTotalCount;
	private int tNaviTotalCount;
	
	
	public TPageInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TPageInfo(int tCurrentPage, int tRecordCountPerPage, int tNaviCountPerPage, int tStartNavi, int tEndNavi,
			int tTotalCount, int tNaviTotalCount) {
		super();
		this.tCurrentPage = tCurrentPage;
		this.tRecordCountPerPage = tRecordCountPerPage;
		this.tNaviCountPerPage = tNaviCountPerPage;
		this.tStartNavi = tStartNavi;
		this.tEndNavi = tEndNavi;
		this.tTotalCount = tTotalCount;
		this.tNaviTotalCount = tNaviTotalCount;
	}
	
	public int gettCurrentPage() {
		return tCurrentPage;
	}
	public void settCurrentPage(int tCurrentPage) {
		this.tCurrentPage = tCurrentPage;
	}
	public int gettRecordCountPerPage() {
		return tRecordCountPerPage;
	}
	public void settRecordCountPerPage(int tRecordCountPerPage) {
		this.tRecordCountPerPage = tRecordCountPerPage;
	}
	public int gettNaviCountPerPage() {
		return tNaviCountPerPage;
	}
	public void settNaviCountPerPage(int tNaviCountPerPage) {
		this.tNaviCountPerPage = tNaviCountPerPage;
	}
	public int gettStartNavi() {
		return tStartNavi;
	}
	public void settStartNavi(int tStartNavi) {
		this.tStartNavi = tStartNavi;
	}
	public int gettEndNavi() {
		return tEndNavi;
	}
	public void settEndNavi(int tEndNavi) {
		this.tEndNavi = tEndNavi;
	}
	public int gettTotalCount() {
		return tTotalCount;
	}
	public void settTotalCount(int tTotalCount) {
		this.tTotalCount = tTotalCount;
	}
	public int gettNaviTotalCount() {
		return tNaviTotalCount;
	}
	public void settNaviTotalCount(int tNaviTotalCount) {
		this.tNaviTotalCount = tNaviTotalCount;
	}
	
	@Override
	public String toString() {
		return "TPageInfo [tCurrentPage=" + tCurrentPage + ", tRecordCountPerPage=" + tRecordCountPerPage
				+ ", tNaviCountPerPage=" + tNaviCountPerPage + ", tStartNavi=" + tStartNavi + ", tEndNavi=" + tEndNavi
				+ ", tTotalCount=" + tTotalCount + ", tNaviTotalCount=" + tNaviTotalCount + "]";
	}
}
