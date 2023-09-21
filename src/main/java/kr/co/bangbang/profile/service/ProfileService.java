package kr.co.bangbang.profile.service;

import kr.co.bangbang.profile.domain.Profile;

public interface ProfileService {

	/**
	 * 프로필 등록
	 * @param profile
	 * @return int
	 */
	int insertProfile(Profile profile);

	Profile selectOneProfile(String sessionId);

	int updateProfile(Profile profile);

}
