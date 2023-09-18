package kr.co.bangbang.admin.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bangbang.admin.domain.Admin;
import kr.co.bangbang.admin.service.AdminService;
import kr.co.bangbang.admin.store.AdminStore;

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

}
