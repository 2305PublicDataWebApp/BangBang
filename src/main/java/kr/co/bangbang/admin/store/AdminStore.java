package kr.co.bangbang.admin.store;

import org.apache.ibatis.session.SqlSession;

import kr.co.bangbang.admin.domain.Admin;

public interface AdminStore {

	/**
	 * 관리자 회원가입
	 * @param session
	 * @param admin
	 * @return int
	 */
	int adminRegister(SqlSession session, Admin admin);

}
