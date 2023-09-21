package kr.co.bangbang.profile.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.bangbang.profile.domain.Profile;
import kr.co.bangbang.profile.store.ProfileStore;

@Repository
public class ProfileStoreLogic implements ProfileStore{

	// 프로필 등록
	@Override
	public int insertProfile(SqlSession session, Profile profile) {
		int result = session.insert("ProfileMapper.insertProfile", profile);
		return result;
	}

	@Override
	public Profile selectOneProfile(SqlSession session, String sessionId) {
		Profile profile = session.selectOne("ProfileMapper.selectOneProfileById", sessionId);
		return profile;
	}

	@Override
	public int updateProfile(SqlSession session, Profile profile) {
		int result = session.update("ProfileMapper.updateProfile", profile);
		return result;
	}

}
