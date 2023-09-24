package kr.co.bangbang.admin.service;

import java.util.List;
import java.util.Map;

import kr.co.bangbang.admin.domain.APageInfo;
import kr.co.bangbang.admin.domain.Admin;
import kr.co.bangbang.user.domain.User;

public interface AdminService {

	/**
	 * 관리자 회원가입
	 * @param admin
	 * @return int
	 */
	int adminRegister(Admin admin);

	/**
	 * 관리자 로그인
	 * @param admin
	 * @return Admin
	 */
	Admin adminLogin(Admin admin);
	
	/**
	 * 관리자 회원정보수정
	 * @param user
	 * @return
	 */
	int updateUser(User user);

	/**
	 * 관리자 회원탈퇴
	 * @param userId
	 * @return
	 */
	int deleteUser(String userId);

	/**
	 * 관리자 전체 회원수
	 * @return
	 */
	Integer getListCount();

	/**
	 * 관리자 전체 회원조회
	 * @param aInfo
	 * @return
	 */
	List<User> selectUserList(APageInfo aInfo);

	/**
	 * 관리자 검색회원 전체 개수
	 * @param paramMap
	 * @return
	 */
	int getListCount(Map<String, String> paramMap);

	/**
	 * 관리자 조건에 따라 키워드로 회원 검색
	 * @param aInfo
	 * @param paramMap
	 * @return
	 */
	List<User> searchUserByKeyword(APageInfo aInfo, Map<String, String> paramMap);

	/**
	 * 관리자 회원정보조회
	 * @param userId
	 * @return
	 */
	User selectOneById(String userId);

}
