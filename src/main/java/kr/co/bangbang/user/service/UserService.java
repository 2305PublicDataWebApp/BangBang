package kr.co.bangbang.user.service;

import kr.co.bangbang.user.domain.User;

public interface UserService {

	/**
	 * 회원 회원가입
	 * @param user
	 * @return int
	 */
	int userRegister(User user);

	/**
	 * 회원 로그인
	 * @param user
	 * @return User
	 */
	User userLoginCheck(User user);

}
