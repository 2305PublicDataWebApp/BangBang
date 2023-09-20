package kr.co.bangbang.user.service;

import java.util.List;

import kr.co.bangbang.review.domain.Review;
import kr.co.bangbang.user.domain.UPageInfo;
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

	/**
	 * 마이페이지
	 * @param userId
	 * @return User
	 */
	User selectOneById(String userId);

	/**
	 * 회원 정보 수정
	 * @param user
	 * @return
	 */
	int updateUser(User user);

	/**
	 * 회원 탈퇴
	 * @param userId
	 * @return
	 */
	int deleteUser(String userId);

	/**
	 * 개시글 전체 갯수 조회
	 * @return
	 */
	int getListCount();


}
