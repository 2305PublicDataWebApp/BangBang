package kr.co.bangbang.profile.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bangbang.profile.domain.Profile;
import kr.co.bangbang.profile.service.ProfileService;
import kr.co.bangbang.profile.store.ProfileStore;

@Service
public class ProfileServiceImpl implements ProfileService{
	
	@Autowired
	private ProfileStore pStore;
	@Autowired
	private SqlSession session;

	// 프로필 등록
	@Override
	public int insertProfile(Profile profile) {
		int result = pStore.insertProfile(session, profile);
		return result;
	}

}
