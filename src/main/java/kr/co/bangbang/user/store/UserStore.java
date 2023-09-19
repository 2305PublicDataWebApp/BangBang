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
	 * 마이페이지
	 * @param session
	 * @param userId
	 * @return User
	 */
	User selectOneById(SqlSession session, String userId);

	/**
	 * 회원 정보 수정
	 * @param session
	 * @param user
	 * @return
	 */
	int updateUser(SqlSession session, User user);

	/**
	 * 회원 탈퇴
	 * @param session
	 * @param userId
	 * @return
	 */
	int deleteUser(SqlSession session, String userId);



}
