package kr.co.bangbang.admin.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.bangbang.admin.domain.Admin;
import kr.co.bangbang.admin.store.AdminStore;

@Repository
public class AdminStoreLogic implements AdminStore{

	// 관리자 회원가입
	@Override
	public int adminRegister(SqlSession session, Admin admin) {
		int result = session.insert("AdminMapper.adminRegister", admin);
		return result;
	}
	
}
