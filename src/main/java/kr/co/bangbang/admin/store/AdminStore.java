package kr.co.bangbang.admin.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.co.bangbang.admin.domain.APageInfo;
import kr.co.bangbang.admin.domain.Admin;
import kr.co.bangbang.user.domain.User;

public interface AdminStore {

	/**
	 * 관리자 회원가입
	 * @param session
	 * @param admin
	 * @return int
	 */
	int adminRegister(SqlSession session, Admin admin);

	/**
	 * 관리자-전체 회원수
	 * @param session
	 * @return
	 */
	int selectListCount(SqlSession session);

	/**
	 * 관리자-전체 회원조회
	 * @param session
	 * @param aInfo
	 * @return
	 */
	List<User> selectUserList(SqlSession session, APageInfo aInfo);

	/**
	 * 관리자-검색회원 전체 갯수
	 * @param session
	 * @param paramMap
	 * @return
	 */
	int selectListCount(SqlSession session, Map<String, String> paramMap);

	/**
	 * 관리자-조건에 따라 키워드로 회원 검색
	 * @param session
	 * @param aInfo
	 * @param paramMap
	 * @return
	 */
	List<User> searchUserByKeyword(SqlSession session, APageInfo aInfo, Map<String, String> paramMap);

	/**
	 * 어드민 로그인
	 * @param session
	 * @param admin
	 * @return Admin
	 */
	Admin adminLogin(SqlSession session, Admin admin);
	
	/**
	* 관리자-회원정보조회
	 * @param session
	 * @param userId
	 * @return
	 */
	User selectOneById(SqlSession session, String userId);

	/**
	 * 관리자-회원정보수정
	 * @param session
	 * @param user
	 * @return
	 */
	int updateUser(SqlSession session, User user);

}
