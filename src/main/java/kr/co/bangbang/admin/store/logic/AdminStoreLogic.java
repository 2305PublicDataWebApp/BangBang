package kr.co.bangbang.admin.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.bangbang.admin.domain.APageInfo;
import kr.co.bangbang.admin.domain.Admin;
import kr.co.bangbang.admin.store.AdminStore;
import kr.co.bangbang.user.domain.User;

@Repository
public class AdminStoreLogic implements AdminStore{

	// 관리자 회원가입
	@Override
	public int adminRegister(SqlSession session, Admin admin) {
		int result = session.insert("AdminMapper.adminRegister", admin);
		return result;
	}

	// 관리자 로그인
	@Override
	public Admin adminLogin(SqlSession session, Admin admin) {
		Admin aOne = session.selectOne("AdminMapper.adminLogin", admin);
		return aOne;
	}
	
	//관리자 회원정보수정
	@Override
	public int updateUser(SqlSession session, User user) {
		int result  = session.update("AdminMapper.updateUser", user);
		return result;
	}

	//관리자 회원탈퇴
	@Override
	public int deleteUser(SqlSession session, String userId) {
		int result = session.update("AdminMapper.deleteUser", userId);
		return result;
	}

	//관리자 전체회원수
	@Override
	public int selectListCount(SqlSession session) {
		int result = session.selectOne("AdminMapper.selectListCount");
		return result;
	}

	//관리자 전체회원조회
	@Override
	public List<User> selectUserList(SqlSession session, APageInfo aInfo) {
		
		int limit = aInfo.getRecordCountPerPage();
		int offset = (aInfo.getCurrentPage()-1)*limit;
		
		RowBounds rowbounds = new RowBounds(offset, limit);
		
		List<User> uList = session.selectList("AdminMapper.selectUserList", null, rowbounds);
		return uList;
	}

	//관리자 검색회원수
	@Override
	public int selectListCount(SqlSession session, Map<String, String> paramMap) {
		int result = session.selectOne("AdminMapper.selectListByKeywordCount", paramMap);
		return result;
	}

	//관리자 회원검색
	@Override
	public List<User> searchUserByKeyword(SqlSession session, APageInfo aInfo, Map<String, String> paramMap) {
		
		int limit = aInfo.getRecordCountPerPage();
		int offset = (aInfo.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<User> searchList = session.selectList("AdminMapper.searchUserByKeyword", paramMap, rowBounds);
		return searchList;
	}

	//관리자 회원상세조회
	@Override
	public User selectOneById(SqlSession session, String userId) {
		User user = session.selectOne("AdminMapper.selectOneById", userId);
		return user;
	}
	
	
}
