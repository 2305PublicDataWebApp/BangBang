package kr.co.bangbang.user.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.bangbang.review.domain.Review;
import kr.co.bangbang.user.domain.UPageInfo;
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

	// 마이페이지
	@Override
	public User selectOneById(SqlSession session, String userId) {
		User user = session.selectOne("UserMapper.selectOneById", userId);
		return user;
	}

	// 회원 정보 수정
	@Override
	public int updateUser(SqlSession session, User user) {
		int result  = session.update("UserMapper.updateUser", user);
		return result;
	}

	// 회원 탈퇴
	@Override
	public int deleteUser(SqlSession session, String userId) {
		int result = session.update("UserMapper.deleteUser", userId);
		return result;
	}

}
