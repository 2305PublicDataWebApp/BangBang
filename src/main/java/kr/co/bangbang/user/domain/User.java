package kr.co.bangbang.user.domain;

import java.sql.Date;

import oracle.sql.TIMESTAMP;

public class User {
	
	// 필드
	private String userId;
	private String userPw;
	private String userPwRe;
	private String userName;
	private String userNickname;
	private String userEmail;
	private String userPhone;
	private Date userBirth;
	private Date userRegDate;
	private String userYn;
	
	// 기본 생성자
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	// 매개변수 생성자
	public User(String userId, String userPw, String userPwRe, String userName, String userNickname, String userEmail,
			String userPhone, Date userBirth) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userPwRe = userPwRe;
		this.userName = userName;
		this.userNickname = userNickname;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
		this.userBirth = userBirth;
	}
	
	public User(String userName, String userEmail) {
		super();
		this.userName = userName;
		this.userEmail = userEmail;
	}

	// getter, setter 메소드
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserPwRe() {
		return userPwRe;
	}
	public void setUserPwRe(String userPwRe) {
		this.userPwRe = userPwRe;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public Date getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(Date userBirth) {
		this.userBirth = userBirth;
	}
	public Date getUserRegDate() {
		return userRegDate;
	}
	public void setUserRegDate(Date userRegDate) {
		this.userRegDate = userRegDate;
	}
	public String getUserYn() {
		return userYn;
	}
	public void setUserYn(String userYn) {
		this.userYn = userYn;
	}
	
	// toString() 메소드 - 데이터 확인용
	@Override
	public String toString() {
		return "회원 [아이디=" + userId + ", 비밀번호=" + userPw + ", 비밀번호 확인=" + userPwRe + ", 이름=" + userName
				+ ", 닉네임=" + userNickname + ", 이메일=" + userEmail + ", 휴대폰=" + userPhone
				+ ", 생년월일=" + userBirth + ", 가입일=" + userRegDate + ", 회원여부=" + userYn + "]";
	}
	
	
	
}
