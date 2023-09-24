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
	

	
	// 마이페이지 - 게시글 전체 갯수 조회
	@Override
	public int getListCount(String sessionId) {
		int result = rStore.selectBoardCount(sqlSession, sessionId);
		return result;
	}
	
	// 마이페이지 - 게시글 목록 조회
	@Override
	public List<Review> selectReviewList(UPageInfo pInfo, String sessionId) {
		List<Review> rList = rStore.selectReviewList(sqlSession, pInfo, sessionId);
		return rList;
	}
	
	// 메인페이지 - 게시글 목록 조회
	@Override
	public List<Review> selectReviewList() {
		List<Review> rList = rStore.selectReviewList(sqlSession);
		return rList;
	}
	
	// 게시글 번호에 맞는 게시글 상세 조회
	@Override
	public Review selectReviewByNo(Integer reviewNo) {
		Review review = rStore.selectReviewByNo(sqlSession, reviewNo);
		return review;
	}

	// 전체 게시글 갯수
	@Override
	public Integer getRListCount() {
		int result = rStore.selectListCount(sqlSession);
		return result;
	}
	
	// 게시글 리스트 조회(페이징 처리)
	@Override
	public List<Review> selectReviewList(RPageInfo rInfo) {
		List<Review> rList = rStore.selectReviewByList(sqlSession, rInfo);
		return rList;
	}

	// 게시글 작성
	@Override
	public int insertReview(Review review) {
		int result = rStore.insertReview(sqlSession, review);
		return result;
	}

	// 게시글 삭제
	@Override
	public int deleteReview(Review review) {
		int result = rStore.deleteReview(sqlSession, review);
		return result;
	}

	// 게시글 수정
	@Override
	public int modifyReview(Review review) {
		int result = rStore.modifyReview(sqlSession, review);
		return result;
	}

	
	// 키워드 검색
	@Override
	public List<Review> searchReviewByKeyword(RPageInfo rInfo, Map<String, String> paramMap) {
		List<Review> searchRList = rStore.searchReviewByKeyword(sqlSession, rInfo, paramMap);
		return searchRList;
	}

	// 검색 게시글 전체 갯수
	@Override
	public int getRListCount(Map<String, String> paramMap) {
		int result = rStore.selectListCount(sqlSession, paramMap);
		return result;
	}
}
