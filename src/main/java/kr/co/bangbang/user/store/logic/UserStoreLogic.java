package kr.co.bangbang.user.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.bangbang.user.domain.User;
import kr.co.bangbang.user.store.UserStore;

@Repository
public class UserStoreLogic implements UserStore{

	// 회원가입
	@Override
	public int userRegister(SqlSession session, User user) {
		int result = session.insert("UserMapper.userRegister", user);
		return result;
	}

}
