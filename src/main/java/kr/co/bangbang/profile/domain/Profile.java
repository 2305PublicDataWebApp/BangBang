package kr.co.bangbang.profile.domain;

public class Profile {
	
	// 필드
	private String pUserId;
	private String profileImgName;
	private String profileImgRename;
	private String profileImgPath;
	private long profileImgLength;
	
	
	// 기본 생성자
	public Profile() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	// 매개변수 생성자
	public Profile(String pUserId, String profileImgName, String profileImgRename, String profileImgPath, long profileImgLength) {
		super();
		this.pUserId = pUserId;
		this.profileImgName = profileImgName;
		this.profileImgRename = profileImgRename;
		this.profileImgPath = profileImgPath;
		this.profileImgLength = profileImgLength;
	}

	// getter, setter 메소드
	public String getpUserId() {
		return pUserId;
	}
	public void setpUserId(String pUserId) {
		this.pUserId = pUserId;
	}
	public String getProfileImgName() {
		return profileImgName;
	}
	public void setProfileImgName(String profileImgName) {
		this.profileImgName = profileImgName;
	}
	public String getProfileImgRename() {
		return profileImgRename;
	}
	public void setProfileImgRename(String profileImgRename) {
		this.profileImgRename = profileImgRename;
	}
	public String getProfileImgPath() {
		return profileImgPath;
	}
	public void setProfileImgPath(String profileImgPath) {
		this.profileImgPath = profileImgPath;
	}
	public long getProfileImgLength() {
		return profileImgLength;
	}
	public void setProfileImgLength(long profileImgLength) {
		this.profileImgLength = profileImgLength;
	}

	// toString() 메소드 - 데이터 확인용
	@Override
	public String toString() {
		return "프로필 [아이디=" + pUserId + ", 이미지명=" + profileImgName + ", 수정 이미지명="
				+ profileImgRename + ", 이미지 주소=" + profileImgPath + ", 이미지 길이=" + profileImgLength
				+ "]";
	}
}
