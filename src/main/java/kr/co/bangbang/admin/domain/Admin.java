package kr.co.bangbang.admin.domain;

public class Admin {
	
	// 필드
	private String adminId;
	private String adminPw;
	private String adminPwRe;
	private String adminEmail;
	
	
	// getter, setter 메소드
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getAdminPw() {
		return adminPw;
	}
	public void setAdminPw(String adminPw) {
		this.adminPw = adminPw;
	}
	public String getAdminPwRe() {
		return adminPwRe;
	}
	public void setAdminPwRe(String adminPwRe) {
		this.adminPwRe = adminPwRe;
	}
	public String getAdminEmail() {
		return adminEmail;
	}
	public void setAdminEmail(String adminEmail) {
		this.adminEmail = adminEmail;
	}
	
	// 기본 생성자
	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}

	// 매개변수 생성자
	public Admin(String adminId, String adminPw, String adminPwRe, String adminEmail) {
		super();
		this.adminId = adminId;
		this.adminPw = adminPw;
		this.adminPwRe = adminPwRe;
		this.adminEmail = adminEmail;
	}

	// toString() 메소드 - 정보 확인용
	@Override
	public String toString() {
		return "관리자 [아이디=" + adminId + ", 비밀번호=" + adminPw + ", 비밀번호 확인=" + adminPwRe + ", 이메일="
				+ adminEmail + "]";
	}
	
	
}
