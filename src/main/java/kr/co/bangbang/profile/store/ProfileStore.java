package kr.co.bangbang.profile.store;

import org.apache.ibatis.session.SqlSession;

import kr.co.bangbang.profile.domain.Profile;

public interface ProfileStore {

	/**
	 * 프로필 등록
	 * @param session
	 * @param profile
	 * @return int
	 */
	int insertProfile(SqlSession session, Profile profile);

}
