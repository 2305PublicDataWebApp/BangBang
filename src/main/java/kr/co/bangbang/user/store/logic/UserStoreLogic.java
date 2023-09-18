package kr.co.bangbang.user.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.bangbang.user.domain.User;
import kr.co.bangbang.user.store.UserStore;

@Repository
public class UserStoreLogic implements UserStore{

	// 회원 회원가입
	@Override
	public int userRegister(SqlSession session, User user) {
		int result = session.insert("UserMapper.userRegister", user);
		return result;
	}

	// 회원 로그인
	@Override
	public User userLoginCheck(SqlSession session, User user) {
		User uOne = session.selectOne("UserMapper.userLoginCheck", user);
		return uOne;
	}

	// 개인 정보 조회
	@Override
	public User getUserById(SqlSession session, String sessionId) {
		User user = session.selectOne("UserMapper.getUserById", sessionId);
		return user;
	}

	// 마이페이지
	@Override
	public User selectOneById(SqlSession session, String userId) {
		User user = session.selectOne("UserMapper.selectOneById", userId);
		return user;
	}


}
