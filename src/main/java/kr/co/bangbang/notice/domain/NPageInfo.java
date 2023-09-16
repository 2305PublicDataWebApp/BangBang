package kr.co.bangbang.notice.domain;

public class NPageInfo {
	private int nCurrentPage;
	private int nTotalCount;
	private int nNaviTotalCount;
	private int nRecordCountPerPage;
	private int nNaviCountPerPage;
	private int nStartNavi;
	private int nEndNavi;
	
	public NPageInfo() {
		// TODO Auto-generated constructor stub
	}

	public int getnCurrentPage() {
		return nCurrentPage;
	}

	public void setnCurrentPage(int nCurrentPage) {
		this.nCurrentPage = nCurrentPage;
	}

	public int getnTotalCount() {
		return nTotalCount;
	}

	public void setnTotalCount(int nTotalCount) {
		this.nTotalCount = nTotalCount;
	}

	public int getnNaviTotalCount() {
		return nNaviTotalCount;
	}

	public void setnNaviTotalCount(int nNaviTotalCount) {
		this.nNaviTotalCount = nNaviTotalCount;
	}

	public int getnRecordCountPerPage() {
		return nRecordCountPerPage;
	}

	public void setnRecordCountPerPage(int nRecordCountPerPage) {
		this.nRecordCountPerPage = nRecordCountPerPage;
	}

	public int getnNaviCountPerPage() {
		return nNaviCountPerPage;
	}

	public void setnNaviCountPerPage(int nNaviCountPerPage) {
		this.nNaviCountPerPage = nNaviCountPerPage;
	}

	public int getnStartNavi() {
		return nStartNavi;
	}

	public void setnStartNavi(int nStartNavi) {
		this.nStartNavi = nStartNavi;
	}

	public int getnEndNavi() {
		return nEndNavi;
	}

	public void setnEndNavi(int nEndNavi) {
		this.nEndNavi = nEndNavi;
	}

	@Override
	public String toString() {
		return "공지페이징 [현재페이지=" + nCurrentPage + ", 총게시물갯수=" + nTotalCount + ", 총네비갯수="
				+ nNaviTotalCount + ", 한페이지당 게시물갯수=" + nRecordCountPerPage + ", 한페이지당 네비갯수="
				+ nNaviCountPerPage + ", 시작네비=" + nStartNavi + ", 종료네비=" + nEndNavi + "]";
	}
	
}
