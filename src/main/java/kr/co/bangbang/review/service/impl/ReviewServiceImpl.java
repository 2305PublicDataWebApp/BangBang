package kr.co.bangbang.review.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bangbang.review.domain.RPageInfo;
import kr.co.bangbang.review.domain.Review;
import kr.co.bangbang.review.service.ReviewService;
import kr.co.bangbang.review.store.ReviewStore;
import kr.co.bangbang.user.domain.UPageInfo;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewStore rStore;
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertReview(Review review) {
		int result = rStore.insertReview(sqlSession, review);
		return result;
	}
	@Override
	public int modifyReview(Review review) {
		int result = rStore.modifyReview(sqlSession, review);
		return result;
	}
	@Override
	public int deleteReview(Review review) {
		int result = rStore.deleteReview(sqlSession, review);
		return result;
	}
	@Override
	public int getRListCount() {
		int result = rStore.selectListCount(sqlSession);
		return result;
	}
	@Override
	public Review selectReviewByNo(Integer reviewNo) {
		Review review = rStore.selectReviewByNo(sqlSession, reviewNo);
		return review;
	}
	@Override
	public List<Review> selectReviewList(RPageInfo rInfo) {
		List<Review> rList = rStore.selectReviewByList(sqlSession, rInfo);
		return rList;
	}
	@Override
	public List<Review> searchReviewByKeyword(RPageInfo rInfo, Map<String, String> rParamMap) {
		List<Review> searchList = rStore.selectReviewByKeyword(sqlSession, rInfo, rParamMap);
		return searchList;
	}
	@Override
	public int getRListCount(Map<String, String> rParamMap) {
		int result = rStore.selectListCount(sqlSession, rParamMap);
		return result;
	}
	
	// 마이페이지 - 게시글 목록 조회
	@Override
	public List<Review> selectReviewList(UPageInfo pInfo, String userId) {
		List<Review> rList = rStore.selectReviewList(sqlSession, pInfo, userId);
		return rList;
	}
	
	// 마이페이지 - 게시글 전체 갯수 조회
	@Override
	public int getListCount(String userId) {
		int result = rStore.selectBoardCount(sqlSession, userId);
		return result;
	}
}
