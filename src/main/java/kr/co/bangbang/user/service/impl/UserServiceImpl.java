package kr.co.bangbang.user.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bangbang.user.domain.User;
import kr.co.bangbang.user.service.UserService;
import kr.co.bangbang.user.store.UserStore;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserStore uStore;
	@Autowired
	private SqlSession session;

	// 회원 회원가입
	@Override
	public int userRegister(User user) {
		int result = uStore.userRegister(session, user);
		return result;
	}

	// 회원 로그인
	@Override
	public User userLoginCheck(User user) {
		User uOne = uStore.userLoginCheck(session, user);
		return uOne;
	}

}
