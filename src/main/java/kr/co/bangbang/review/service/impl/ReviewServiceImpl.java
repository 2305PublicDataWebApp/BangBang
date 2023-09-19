package kr.co.bangbang.review.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bangbang.review.domain.RPageInfo;
import kr.co.bangbang.review.domain.Review;
import kr.co.bangbang.review.service.ReviewService;
import kr.co.bangbang.review.store.ReviewStore;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewStore rStore;
	@Autowired
	private SqlSession sqlSession;
	@Override
	public int insertReview(Review review) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int modifyReview(Review review) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int deleteReview(Review review) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int getRListCount() {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public Review selectReviewByNo(Integer reviewNo) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<Review> selectReviewList(RPageInfo rInfo) {
		// TODO Auto-generated method stub
		return null;
	}
}
