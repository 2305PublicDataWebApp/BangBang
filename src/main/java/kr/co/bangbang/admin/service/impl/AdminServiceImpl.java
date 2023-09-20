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

	@Override
	public Integer getListCount() {
		int result = aStore.selectListCount(session);
		return result;
	}

	@Override
	public List<User> selectUserList(APageInfo aInfo) {
		List<User> uList = aStore.selectUserList(session,aInfo);
		return uList;
	}

	@Override
	public int getListCount(Map<String, String> paramMap) {
		int result = aStore.selectListCount(session,paramMap);
		return result;
	}

	@Override
	public List<User> searchUserByKeyword(APageInfo aInfo, Map<String, String> paramMap) {
		List<User> uList = aStore.searchUserByKeyword(session, aInfo, paramMap);
		return uList;
	}

	// 관리자 로그인
	@Override
	public Admin adminLogin(Admin admin) {
		Admin aOne = aStore.adminLogin(session, admin);
		return aOne;
	}

	


}
