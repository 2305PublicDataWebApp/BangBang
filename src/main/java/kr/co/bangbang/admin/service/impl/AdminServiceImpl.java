package kr.co.bangbang.admin.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bangbang.admin.domain.APageInfo;
import kr.co.bangbang.admin.domain.Admin;
import kr.co.bangbang.admin.service.AdminService;
import kr.co.bangbang.admin.store.AdminStore;
import kr.co.bangbang.user.domain.User;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminStore aStore;
	@Autowired
	private SqlSession session;

	// 관리자 회원가입
	@Override
	public int adminRegister(Admin admin) {
		int result = aStore.adminRegister(session, admin);
		return result;
	}

	// 관리자 로그인
	@Override
	public Admin adminLogin(Admin admin) {
		Admin aOne = aStore.adminLogin(session, admin);
		return aOne;
	}
	
	//관리자 회원정보수정
	@Override
	public int updateUser(User user) {
		int result = aStore.updateUser(session, user);
		return result;
	}

	//관리자 회원탈퇴
	@Override
	public int deleteUser(String userId) {
		int result = aStore.deleteUser(session, userId);
		return result;
	}

	//관리자 전체회원수
	@Override
	public Integer getListCount() {
		int result = aStore.selectListCount(session);
		return result;
	}

	//관리자 회원검색
	@Override
	public List<User> selectUserList(APageInfo aInfo) {
		List<User> uList = aStore.selectUserList(session,aInfo);
		return uList;
	}

	//관리자 검색회원 전체 개수
	@Override
	public int getListCount(Map<String, String> paramMap) {
		int result = aStore.selectListCount(session,paramMap);
		return result;
	}

	//관리자 조건에 따라 키워드로 회원 검색
	@Override
	public List<User> searchUserByKeyword(APageInfo aInfo, Map<String, String> paramMap) {
		List<User> uList = aStore.searchUserByKeyword(session, aInfo, paramMap);
		return uList;
	}

	//관리자 회원상세조회
	@Override
	public User selectOneById(String userId) {
		User user = aStore.selectOneById(session, userId);
		return user;
	}


}
