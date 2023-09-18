package kr.co.bangbang.admin.service;

import kr.co.bangbang.admin.domain.Admin;

public interface AdminService {

	/**
	 * 관리자 회원가입
	 * @param admin
	 * @return int
	 */
	int adminRegister(Admin admin);

}
