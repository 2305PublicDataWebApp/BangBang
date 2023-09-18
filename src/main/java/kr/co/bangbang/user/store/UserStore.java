package kr.co.bangbang.user.store;

import org.apache.ibatis.session.SqlSession;

import kr.co.bangbang.user.domain.User;

public interface UserStore {

	/**
	 * 회원 회원가입
	 * @param session
	 * @param user
	 * @return int
	 */
	int userRegister(SqlSession session, User user);

	/**
	 * 회원 로그인
	 * @param session
	 * @param user
	 * @return User
	 */
	User userLoginCheck(SqlSession session, User user);

	/**
	 * 개인 정보 조회
	 * @param session
	 * @param user
	 * @return User
	 */
	User getUserById(SqlSession session, String sessionId);

}
