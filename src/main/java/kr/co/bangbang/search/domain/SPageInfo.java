package kr.co.bangbang.search.domain;

public class SPageInfo {
	private int sCurrentPage;
	private int sRecordCountPerPage;
	private int sNaviCountPerPage;
	private int sStartNavi;
	private int sEndNavi;
	private int sTotalCount;
	private int sNaviTotalCount;
	
	public SPageInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SPageInfo(int sCurrentPage, int sRecordCountPerPage, int sNaviCountPerPage, int sStartNavi, int sEndNavi,
			int sTotalCount, int sNaviTotalCount) {
		super();
		this.sCurrentPage = sCurrentPage;
		this.sRecordCountPerPage = sRecordCountPerPage;
		this.sNaviCountPerPage = sNaviCountPerPage;
		this.sStartNavi = sStartNavi;
		this.sEndNavi = sEndNavi;
		this.sTotalCount = sTotalCount;
		this.sNaviTotalCount = sNaviTotalCount;
	}
	
	public int getsCurrentPage() {
		return sCurrentPage;
	}
	public void setsCurrentPage(int sCurrentPage) {
		this.sCurrentPage = sCurrentPage;
	}
	public int getsRecordCountPerPage() {
		return sRecordCountPerPage;
	}
	public void setsRecordCountPerPage(int sRecordCountPerPage) {
		this.sRecordCountPerPage = sRecordCountPerPage;
	}
	public int getsNaviCountPerPage() {
		return sNaviCountPerPage;
	}
	public void setsNaviCountPerPage(int sNaviCountPerPage) {
		this.sNaviCountPerPage = sNaviCountPerPage;
	}
	public int getsStartNavi() {
		return sStartNavi;
	}
	public void setsStartNavi(int sStartNavi) {
		this.sStartNavi = sStartNavi;
	}
	public int getsEndNavi() {
		return sEndNavi;
	}
	public void setsEndNavi(int sEndNavi) {
		this.sEndNavi = sEndNavi;
	}
	public int getsTotalCount() {
		return sTotalCount;
	}
	public void setsTotalCount(int sTotalCount) {
		this.sTotalCount = sTotalCount;
	}
	public int getsNaviTotalCount() {
		return sNaviTotalCount;
	}
	public void setsNaviTotalCount(int sNaviTotalCount) {
		this.sNaviTotalCount = sNaviTotalCount;
	}
	
	@Override
	public String toString() {
		return "SPageInfo [sCurrentPage=" + sCurrentPage + ", sRecordCountPerPage=" + sRecordCountPerPage
				+ ", sNaviCountPerPage=" + sNaviCountPerPage + ", sStartNavi=" + sStartNavi + ", sEndNavi=" + sEndNavi
				+ ", sTotalCount=" + sTotalCount + ", sNaviTotalCount=" + sNaviTotalCount + "]";
	}
	
}
