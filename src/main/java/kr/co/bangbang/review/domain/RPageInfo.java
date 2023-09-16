package kr.co.bangbang.review.domain;

public class RPageInfo {
	private int rCurrentPage;
	private int rTotalCount;
	private int rNaviTotalCount;
	private int rRecordCountPerPage;
	private int rNaviCountPerPage;
	private int rStartNavi;
	private int rEndNavi;
	
	public RPageInfo() {
		// TODO Auto-generated constructor stub
	}

	public int getrCurrentPage() {
		return rCurrentPage;
	}

	public void setrCurrentPage(int rCurrentPage) {
		this.rCurrentPage = rCurrentPage;
	}

	public int getrTotalCount() {
		return rTotalCount;
	}

	public void setrTotalCount(int rTotalCount) {
		this.rTotalCount = rTotalCount;
	}

	public int getrNaviTotalCount() {
		return rNaviTotalCount;
	}

	public void setrNaviTotalCount(int rNaviTotalCount) {
		this.rNaviTotalCount = rNaviTotalCount;
	}

	public int getrRecordCountPerPage() {
		return rRecordCountPerPage;
	}

	public void setrRecordCountPerPage(int rRecordCountPerPage) {
		this.rRecordCountPerPage = rRecordCountPerPage;
	}

	public int getrNaviCountPerPage() {
		return rNaviCountPerPage;
	}

	public void setrNaviCountPerPage(int rNaviCountPerPage) {
		this.rNaviCountPerPage = rNaviCountPerPage;
	}

	public int getrStartNavi() {
		return rStartNavi;
	}

	public void setrStartNavi(int rStartNavi) {
		this.rStartNavi = rStartNavi;
	}

	public int getrEndNavi() {
		return rEndNavi;
	}

	public void setrEndNavi(int rEndNavi) {
		this.rEndNavi = rEndNavi;
	}

	@Override
	public String toString() {
		return "리뷰페이징 [현재페이지=" + rCurrentPage + ", 총게시물갯수=" + rTotalCount + ", 네비총갯수="
				+ rNaviTotalCount + ", 한페이지당 게시물갯수=" + rRecordCountPerPage + ", 한페이지당 네비갯수="
				+ rNaviCountPerPage + ", 시작네비=" + rStartNavi + ", 종료네비=" + rEndNavi + "]";
	}
	
}
