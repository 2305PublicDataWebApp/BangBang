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

	// 마이페이지
	@Override
	public User selectOneById(String userId) {
		User user = uStore.selectOneById(session, userId);
		return user;
	}

	// 회원 정보 수정
	@Override
	public int updateUser(User user) {
		int result = uStore.updateUser(session, user);
		return result;
	}

	// 회원 탈퇴
	@Override
	public int deleteUser(String userId) {
		int result = uStore.deleteUser(session, userId);
		return result;
	}

}
